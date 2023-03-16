# renovate: datasource=github-tags depName=acorn-io/acorn
ACORN_VERSION ?= v0.6.0

.PHONY: install
install:
	curl https://get.acorn.io | INSTALL_ACORN_VERSION=$(ACORN_VERSION) sh -
	acorn install

.PHONY: deploy-app
deploy-app:
	acorn run --target-namespace podtato-acorn -n podtato-head app

.PHONY: uninstall
uninstall:
	acorn uninstall -a -f

.PHONY: test
test: install deploy-app
	kubectl kuttl test --start-kind=false ./kuttl --config=./kuttl/kuttl-test.yaml
	make uninstall