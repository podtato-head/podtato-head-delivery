.PHONY: install
install:
	# Install KubeVela CLI
	curl -fsSl https://kubevela.net/script/install.sh | bash
	vela install --yes
	vela env init podtato-vela --namespace podtato-vela
	vela up -f app/application.yaml

.PHONY: deploy-app
deploy-app:
	vela up -f app/application.yaml

.PHONY: uninstall
uninstall:
	kubectl delete ns podtato-vela | true
	sleep 30
	vela uninstall --force --yes

.PHONY: test
test: install deploy-app
	kubectl kuttl test --start-kind=false ./kuttl --config=./kuttl/kuttl-test.yaml