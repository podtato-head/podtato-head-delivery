PODTATO_HEAD_VERSION ?= v0.3.0

.PHONY: install
install:
	kubectl apply -f https://github.com/vmware-tanzu/carvel-kapp-controller/releases/latest/download/release.yml

.PHONY: uninstall
uninstall:
	kubectl delete -f app/app.yaml --ignore-not-found=true
	kubectl delete -f app/rbac.yaml --ignore-not-found=true
	kubectl delete ns podtato-kappctl --ignore-not-found=true
	kubectl delete -f https://github.com/carvel-dev/kapp-controller/releases/latest/download/release.yml --force --ignore-not-found=true

.PHONY: deploy-app
deploy-app:
	kubectl create ns podtato-kappctl
	kubectl apply -f app/rbac.yaml
	kubectl apply -f app/app.yaml

.PHONY: test
test: install deploy-app
	kubectl kuttl test --start-kind=false ./kuttl --config=./kuttl/kuttl-test.yaml
	make uninstall
