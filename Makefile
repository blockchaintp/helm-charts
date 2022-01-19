MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(MAKEFILE_DIR)/standard_defs.mk

CHART_BASE=charts

CHARTS := $(shell find . -mindepth 3 -maxdepth 3 -name Chart.yaml \
	-exec dirname {} \; | awk -F/ '{print $$NF}')

DIAGRAMS := $(shell find docs -name *.plantuml -or -name *.puml | awk -F. '{print $$1}')

.PHONY: build
build: $(MARKERS)/build_toolchain_docker tmpl-dep-build

.PHONY: package
package: tmpl-pkg correct_ownership

.PHONY: test
test: tmpl-lint tmpl-unit tmpl-kubescape

.PHONY: clean
clean: correct_ownership clean_kubescape clean_markers
	find $(CHART_BASE) -mindepth 2 -name charts -type d -exec rm -rf {} \; || true
	docker rm $$(docker ps --all -q -f status=exited) 2>/dev/null|| true
	docker volume rm root_${ISOLATION_ID} > /dev/null || true
	rm -rf dist

.PHONY: distclean
distclean: clean_toolchain_docker clean

$(MARKERS)/repos.helm:
#		name=$$(echo $$repo | cksum | awk '{print $$1}') ;
	for repo in $$(find $(CHART_BASE) -name Chart.yaml -exec grep -i repository {} \; |\
		sort -u | awk '{print $$NF}' | sed -e 's/\"//g'); do \
		url=$$repo ; \
		name=$$repo ; \
		$(TOOLCHAIN) helm repo add $$name $$url ; \
	done
	$(TOOLCHAIN) helm repo update
	@touch $@

.PHONY: setup_dist
setup_dist:
	$(BUSYBOX) mkdir -p /project/dist


define helm_tmpl =
tmpl-dep-update: $(MARKERS)/helmdep-update-$(1)
tmpl-dep-build: $(MARKERS)/helmdep-build-$(1)
tmpl-lint: $(MARKERS)/helmlint-$(1)
tmpl-unit: $(MARKERS)/helmunit-$(1)
tmpl-docs: $(MARKERS)/helmdoc-$(1)
tmpl-test: $(MARKERS)/helmtest-$(1)
tmpl-pkg: $(MARKERS)/helmpkg-$(1)
tmpl-kubescape: $(MARKERS)/kubescape-$(1)

$(MARKERS)/helmdep-build-$(1): $(MARKERS)/repos.helm
	@mkdir -p $(MARKERS)
	@echo "$(1) --> Building dependencies"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  helm dependency build --skip-refresh ./$(CHART_BASE)/$(1)
	@touch $(MARKERS)/helmdep-build-$(1)

$(MARKERS)/helmdep-update-$(1): $(MARKERS)/repos.helm
	@mkdir -p $(MARKERS)
	@echo "$(1) --> Updating dependencies"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
		helm dependency update --skip-refresh ./$(CHART_BASE)/$(1)
	@touch $(MARKERS)/helmdep-update-$(1)

$(MARKERS)/helmlint-$(1): $(MARKERS)/helmdep-build-$(1)
	@mkdir -p $(MARKERS)
	@echo "$(1) --> linting"
	helm lint ./$(CHART_BASE)/$(1);
	@touch $(MARKERS)/helmlint-$(1)

$(MARKERS)/helmunit-$(1): $(MARKERS)/helmdep-build-$(1)
	@mkdir -p $(MARKERS)
	@mkdir -p build/unittest
	@echo "$(1) --> Unit Testing"
	@docker run --rm -v $(PWD)/$(CHART_BASE):/apps \
		-v $(PWD)/build:/build \
		quintush/helm-unittest --helm3 $(1) -o /build/unittest/$(1).xml \
		  -t JUnit
	@touch $(MARKERS)/helmunit-$(1)

$(MARKERS)/helmdoc-$(1):
	@mkdir -p $(MARKERS)
	@cd charts/$(1); \
	if [ ! -r README.md ] || [ values.yaml -nt README.md ]; then \
	  echo "Generating README.md for $(1)"; \
	  mddoc values.yaml > README.md ; \
	fi
	@touch $(MARKERS)/helmdoc-$(1)

$(MARKERS)/helmtest-$(1): $(MARKERS)/helmdep-build-$(1)
	@mkdir -p $(MARKERS)
	@echo "$(1) --> Testing"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  helm test ./$(CHART_BASE)/$(1)
	@touch $(MARKERS)/helmtest-$(1)

$(MARKERS)/helmpkg-$(1): setup_dist $(MARKERS)/helmdep-build-$(1)
	@mkdir -p $(MARKERS)
	@echo "$(1) --> Packaging"
	@$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
	  helm package ./$(CHART_BASE)/$(1) --destination=/project/dist
	@touch $(MARKERS)/helmpkg-$(1)

$(MARKERS)/kubescape-$(1):
	@mkdir -p $(MARKERS)
	@mkdir -p build/kubescape
	@echo "$(1) --> kubescape"
	@mkdir -p build
	@if grep -qi "type: library" $(CHART_BASE)/$(1)/Chart.yaml; then \
		echo "Cannot scan library chart $(1)"; \
	else \
		$(TOOL_NOWORKDIR) -w /project $(TOOLCHAIN_IMAGE) \
			bash -c "helm template --generate-name --dry-run ./$(CHART_BASE)/$(1) \
				| kubescape scan framework nsa -f junit -o ./build/kubescape/$(1) \
					--use-from /project/kubescape.json -"; \
		sed -i -e 's/NSA/$(1)/g' ./build/kubescape/$(1).xml; \
		sed -i -e 's/Kubescape/$(1).Kubescape/g' ./build/kubescape/$(1).xml; \
	fi
	rm -f tmp-kubescape*.yaml
	@touch $(MARKERS)/kubescape-$(1)

$(1): $(MARKERS)/helmdep-build-$(1) $(MARKERS)/helmlint-$(1) $(MARKERS)/helmunit-$(1) $(MARKERS)/kubescape-$(1) $(MARKERS)/helmpkg-$(1)

clean-$(1):
	@rm -f $(MARKERS)/kubescape-$(1)
	@rm -f $(MARKERS)/helmpkg-$(1)
	@rm -f $(MARKERS)/helmtest-$(1)
	@rm -f $(MARKERS)/helmdoc-$(1)
	@rm -f $(MARKERS)/helmunit-$(1)
	@rm -f $(MARKERS)/helmlint-$(1)
	@rm -f $(MARKERS)/helmdep-build-$(1)
	@rm -f $(MARKERS)/helmdep-update-$(1)

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
	@for f in $$(find charts -name README.md| awk -F/ '{print $$2}' | sort); do \
		chart_name=$$f; echo \* \[$$chart_name\]\(charts/$$chart_name/README.md\); \
		done >> README.md

.PHONY: dependencies-update
dependencies-update: tmpl-dep-update

.PHONY: dependencies-build
dependencies-build: tmpl-dep-build

.PHONY: lint
lint: tmpl-lint

.PHONY: kubescape
kubescape: tmpl-kubescape

.PHONY: clean_kubescape
clean_kubescape:
	rm -f tmp-kubescape*.yaml
