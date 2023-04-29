PODTATO_HEAD_VERSION ?= v0.3.1

.PHONY: install
install:
	mkdir kapp-bin/
	curl -L https://carvel.dev/install.sh | K14SIO_INSTALL_BIN_DIR=kapp-bin bash
	export PATH=$PWD/local-bin/:$PATH
	kapp version

.PHONY: uninstall
uninstall:
	kubectl delete ns podtato-kapp --ignore-not-found=true
	rm -rf kapp-bin/

.PHONY: deploy-app
deploy-app:
	kubectl create ns podtato-kapp || true
	kustomize build ./app | kapp deploy -a podtato-head -n podtato-kapp --yes -f -

.PHONY: test
test: install deploy-app
	kubectl kuttl test --start-kind=false ./kuttl --config=./kuttl/kuttl-test.yaml
	make uninstall
