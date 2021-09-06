MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(MAKEFILE_DIR)/standard_defs.mk

CHART_BASE=charts

CHARTS := $(shell find . -mindepth 3 -maxdepth 3 -name Chart.yaml \
	-exec dirname {} \; | awk -F/ '{print $$NF}')

DIAGRAMS := $(shell find docs -name *.plantuml -or -name *.puml | awk -F. '{print $$1}')

.PHONY: build
build: tmpl-lint

.PHONY: package
package: tmpl-pkg correct_ownership

.PHONY: test
test: tmpl-unit

.PHONY: clean
clean: correct_ownership clean_toolchain_docker
	find $(CHART_BASE) -mindepth 2 -name charts -type d -exec rm -rf {} \; || true
	docker rm $$(docker ps --all -q -f status=exited) 2>/dev/null|| true
	docker volume rm root_${ISOLATION_ID} > /dev/null || true
	rm -rf dist

.PHONY: distclean
distclean: clean

.PHONY: repos.helm
repos.helm:
#		name=$$(echo $$repo | cksum | awk '{print $$1}') ;
	for repo in $$(find $(CHART_BASE) -name Chart.yaml -exec grep -i repository {} \; |\
		sort -u | awk '{print $$NF}' | sed -e 's/\"//g'); do \
		url=$$repo ; \
		name=$$repo ; \
		$(TOOLCHAIN) -c "helm repo add $$name $$url" ; \
	done
	$(TOOLCHAIN) -c "helm repo update"

.PHONY: setup_dist
setup_dist:
	$(BUSYBOX) mkdir -p /project/dist

define helm_tmpl =
.PHONY: helmlint-$(1) helmdep-build-$(1) helmdep-update-$(1) helmpkg-$(1) helmdoc-$(1) $(1)
tmpl-dep-update: helmdep-update-$(1)
tmpl-dep-build: helmdep-build-$(1)
tmpl-lint: helmlint-$(1)
tmpl-unit: helmunit-$(1)
tmpl-docs: helmdoc-$(1)
tmpl-test: helmtest-$(1)
tmpl-pkg: helmpkg-$(1)
tmpl-kubescape: kubescape-$(1)

helmdep-build-$(1): repos.helm
	@echo "$(1) --> Building dependencies"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  "helm dependency build --skip-refresh ./$(CHART_BASE)/$(1)"

helmdep-update-$(1): repos.helm
	@echo "$(1) --> Updating dependencies"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
		"helm dependency update --skip-refresh ./$(CHART_BASE)/$(1)"

helmlint-$(1): helmdep-build-$(1)
	@echo "$(1) --> linting"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  "helm lint ./$(CHART_BASE)/$(1)"

helmunit-$(1): helmlint-$(1)
	@echo "$(1) --> Unit Testing"
	@docker run --rm -v $(PWD)/$(CHART_BASE):/apps quintush/helm-unittest \
	  --helm3 $(1)

helmdoc-$(1):
	@cd charts/$(1); \
	if [ ! -r README.md ] || [ values.yaml -nt README.md ]; then \
	  echo "Generating README.md for $(1)"; \
	  mddoc values.yaml > README.md ; \
	fi

helmtest-$(1): helmunit-$(1)
	@echo "$(1) --> Testing"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  "helm test ./$(CHART_BASE)/$(1)"

helmpkg-$(1): setup_dist helmunit-$(1)
	@echo "$(1) --> Packaging"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  "helm package ./$(CHART_BASE)/$(1) --destination=/project/dist"

$(1): helmlint-$(1) helmdep-build-$(1) helmpkg-$(1)

.PHONY: kubescape-$(1)
kubescape-$(1):
	@echo "$(1) --> kubescape"
	@mkdir -p build
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  "helm template --generate-name --dry-run ./$(CHART_BASE)/$(1) | kubescape scan framework nsa -f junit -o ../../build/$(1).junit -"

endef

$(foreach chart,$(CHARTS),$(eval $(call helm_tmpl,$(chart))))
$(foreach chart,$(THIRD_PARTY_CHARTS),$(eval $(call helm_tmpl,$(chart))))

PLANTUML := $(shell locate plantuml.jar)
.PHONY: diagrams
diagrams:
	@echo Diagrams updated
.PHONY: clean_diags
clean_diags:
	@echo Removing diagram PNGs

define diagram_tmpl =
.PHONY: $(1).png
$(1).png:
	@if [ ! -r $(1).png ] || \
	  [ $(shell echo $(1).p*uml) -nt $(1).png ]; then \
	  echo "Generating PlantUML PNG for $(1): $(1).png" ; \
	  java -jar $(PLANTUML) -tpng $(shell echo $(1).p*uml) ; \
	fi
diagrams: $(1).png
.PHONY: clean_$(1)
clean_$(1):
	rm -f $(1).png
clean_diags: clean_$(1)
endef
$(foreach diag,$(DIAGRAMS),$(eval $(call diagram_tmpl,$(diag))))

.PHONY: correct_ownership
correct_ownership:
	$(BUSYBOX_ROOT) find /project -name dist -exec chown -R $(UID):$(GID) {} \;
	$(BUSYBOX_ROOT) find /project -name __snapshot__ -exec chown -R $(UID):$(GID) {} \;
	$(BUSYBOX_ROOT) find /project/$(CHART_BASE) -mindepth 2 -name charts -type d \
	  -exec chown -R $(UID):$(GID) {} \;
	$(BUSYBOX_ROOT) find /project/$(CHART_BASE) -name requirements.lock \
	  -exec chown -R $(UID):$(GID) {} \;
	$(BUSYBOX_ROOT) find /project/$(CHART_BASE) -name Chart.lock \
	  -exec chown -R $(UID):$(GID) {} \;

.PHONY: docs
docs: tmpl-docs
	@echo Generating top level README.md
	@echo > README.md
	@echo \# BTP charts >> README.md
	@echo >> README.md
	@for f in $$(find charts -name README.md| awk -F/ '{print $$2}' | sort); do  chart_name=$$f; echo \* \[$$chart_name\]\(charts/$$chart_name/README.md\); done >> README.md

.PHONY: dependencies-update
dependencies-update: tmpl-dep-update

.PHONY: dependencies-build
dependencies-build: tmpl-dep-build

.PHONY: lint
lint: tmpl-lint

.PHONY: kubescape
kubescape: tmpl-kubescape
