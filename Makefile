
ISOLATION_ID ?= local
PWD = $(shell pwd)
DOCKER_RUN ?= docker run --rm -v root_${ISOLATION_ID}:/root -v $(PWD):/project
TMPL_DOCKER_RUN ?= docker run --rm -v root_${ISOLATION_ID}:/root -v $(PWD):/project
TOOL_RUN ?= $(DOCKER_RUN) tool:$(ISOLATION_ID)
TMPL_TOOL_RUN ?= $(TMPL_DOCKER_RUN) tool:$(ISOLATION_ID)

CHART_BASE=charts

BRANCH_NAME ?= $(shell git symbolic-ref -q HEAD )

UID := $(shell id -u)
GID := $(shell id -g)

CHARTS := $(shell find . -mindepth 3 -maxdepth 3 -name Chart.yaml \
	-exec dirname {} \; | awk -F/ '{print $$NF}')

.PHONY: all
all: distclean charts

.PHONY: clean
clean: correct_ownership distclean
	find $(CHART_BASE) -mindepth 2 -name charts -type d -exec rm -rf {} \; || true
	find $(CHART_BASE) -type f -name requirements.lock -exec rm -rf {} \;
	find $(CHART_BASE) -type f -name Chart.lock -exec rm -rf {} \;
	docker rm $$(docker ps --all -q -f status=exited) 2>/dev/null|| true
	docker volume rm root_${ISOLATION_ID} > /dev/null

.PHONY: distclean
distclean: correct_ownership
	rm -rf dist

.PHONY: repos.helm
repos.helm: tool.docker
#		name=$$(echo $$repo | cksum | awk '{print $$1}') ;
	for repo in $$(find $(CHART_BASE) -name Chart.yaml -exec grep -i repository {} \; |\
		sort -u | awk '{print $$NF}' | sed -e 's/\"//g'); do \
		url=$$repo ; \
		name=$$repo ; \
		$(TOOL_RUN) -c "helm repo add $$name $$url" ; \
	done
	$(TOOL_RUN) -c "helm repo update"

.PHONY: tool.docker
tool.docker:
	docker build -q -t tool:${ISOLATION_ID} -f docker/tool.docker .

.PHONY: clean.docker
clean.docker:
	docker volume rm -f root_${ISOLATION_ID}
	docker rmi -f tool:${ISOLATION_ID}

.PHONY: setup_dist
setup_dist:
	$(TOOL_RUN) -c "mkdir -p /project/dist"

define helm_tmpl =
.PHONY: helmlint-$(1) helmdep-$(1) helmpkg-$(1) helmdoc-$(1) $(1)
tmpl-dep: helmdep-$(1)
helmdep-$(1): repos.helm
	$(TMPL_TOOL_RUN) -c "cd /project/$(CHART_BASE)/$(1); \
		helm dependency update --skip-refresh ./"
tmpl-lint: helmlint-$(1)
helmlint-$(1): helmdep-$(1) tool.docker
	$(TMPL_TOOL_RUN) -c "cd /project/$(CHART_BASE)/$(1); \
		helm lint ./"
tmpl-docs: helmdoc-$(1)
helmdoc-$(1):
	cd charts/$(1); mddoc values.yaml > README.md
tmpl-test: helmtest-$(1)
helmtest-$(1): helmlint-$(1)
	$(TMPL_TOOL_RUN) -c "cd /project/$(CHART_BASE)/$(1); \
		helm test ./"
tmpl-pkg: helmpkg-$(1) helmdoc-$(1)
helmpkg-$(1): setup_dist helmlint-$(1)
	$(TMPL_TOOL_RUN) -c "cd /project/$(CHART_BASE)/$(1); \
		helm package ./ --destination=/project/dist"
$(1): helmlint-$(1) helmdep-$(1) helmpkg-$(1)
endef

$(foreach chart,$(CHARTS),$(eval $(call helm_tmpl,$(chart))))
$(foreach chart,$(THIRD_PARTY_CHARTS),$(eval $(call helm_tmpl,$(chart))))

.PHONY: charts
charts: pkg post_correct_ownership

.PHONY: correct_ownership
correct_ownership: tool.docker
	$(TOOL_RUN) -c "find /project -name dist -exec chown -R $(UID):$(GID) {} \;"
	$(TOOL_RUN) -c "find /project/$(CHART_BASE) -mindepth 2 -name charts -type d \
		-exec chown -R $(UID):$(GID) {} \;"
	$(TOOL_RUN) -c "find /project/$(CHART_BASE) -name requirements.lock \
		-exec chown -R $(UID):$(GID) {} \;"
	$(TOOL_RUN) -c "find /project/$(CHART_BASE) -name Chart.lock \
		-exec chown -R $(UID):$(GID) {} \;"

.PHONY: post_correct_ownership
post_correct_ownership: tool.docker
	$(TOOL_RUN) -c "find /project -name dist -exec chown -R $(UID):$(GID) {} \;"
	$(TOOL_RUN) -c "find /project/$(CHART_BASE) -mindepth 2 -name charts -type d \
		-exec chown -R $(UID):$(GID) {} \;"
	$(TOOL_RUN) -c "find /project/$(CHART_BASE) -name requirements.lock \
		-exec chown -R $(UID):$(GID) {} \;"
	$(TOOL_RUN) -c "find /project/$(CHART_BASE) -name Chart.lock \
		-exec chown -R $(UID):$(GID) {} \;"

.PHONY: test
test:

.PHONY: pkg
pkg: tmpl-pkg

.PHONY: dep
dep: tmpl-dep

.PHONY: lint
lint: tmpl-lint
