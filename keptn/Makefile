# renovate: datasource=github-tags depName=keptn/lifecycle-toolkit
KEPTN_VERSION ?= v0.6.0

.PHONY: install
install:
	kubectl apply -f https://github.com/keptn/lifecycle-toolkit/releases/download/$(KEPTN_VERSION)/manifest.yaml

.PHONY: uninstall
uninstall:
	kubectl delete -f https://github.com/keptn/lifecycle-toolkit/releases/download/$(KEPTN_VERSION)/manifest.yaml

.PHONY: deploy-sample
deploy-sample:
	kustomize build ./app | kubectl apply -f -

.PHONY: test
test: install deploy-sample
	kubectl kuttl test --start-kind=false ./kuttl --config=./kuttl/kuttl-test.yaml



