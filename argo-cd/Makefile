ARGO_NAMESPACE ?= argocd
# renovate: datasource=github-tags depName=argoproj/argo-cd
ARGO_VERSION ?= v2.6.7
# renovate: datasource=github-tags depName=cert-manager/cert-manager
ARGO_SECRET = $(shell kubectl -n ${ARGO_NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

.PHONY: install
install:
	@echo "-----------------------------------"
	@echo "Create Namespace and install ArgoCD"
	@echo "-----------------------------------"
	kubectl create namespace $(ARGO_NAMESPACE) | true
	kubectl apply -n $(ARGO_NAMESPACE) -f https://raw.githubusercontent.com/argoproj/argo-cd/$(ARGO_VERSION)/manifests/install.yaml

	@echo ""
	@echo "-------------------------------"
	@echo "Wait for Resources to get ready"
	@echo "-------------------------------"
	kubectl wait --for=condition=available deployment/argocd-dex-server -n "$(ARGO_NAMESPACE)" --timeout=120s
	kubectl wait --for=condition=available deployment/argocd-redis -n "$(ARGO_NAMESPACE)" --timeout=120s
	kubectl wait --for=condition=available deployment/argocd-repo-server -n "$(ARGO_NAMESPACE)" --timeout=120s
	kubectl wait --for=condition=available deployment/argocd-server  -n "$(ARGO_NAMESPACE)" --timeout=120s

	@echo ""
	@echo "#######################################################"
	@echo "ArgoCD installed"
	@echo "#######################################################"

.PHONY: deploy-app
deploy-app:
	kubectl apply -f app/app.yaml

.PHONY: uninstall
uninstall:
	kubectl delete -n $(ARGO_NAMESPACE) -f https://raw.githubusercontent.com/argoproj/argo-cd/$(ARGO_VERSION)/manifests/install.yaml --ignore-not-found=true
	kubectl delete namespace $(ARGO_NAMESPACE) --ignore-not-found=true
	@echo ""
	@echo "##########################"
	@echo "ArgoCD deleted"
	@echo "##########################"

.PHONY: test
test: install deploy-app
	kubectl kuttl test --start-kind=false ./kuttl --config=./kuttl/kuttl-test.yaml