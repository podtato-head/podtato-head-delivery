# Deliver with Kapp Controller
![kapp](https://img.shields.io/badge/kappcontroller-latest-blue)
![PodTatoHead](https://img.shields.io/badge/PodTatoHead-v0.3.1-orange)

Website: https://github.com/carvel-dev/kapp-controller <BR>
Repository: https://carvel.dev/kapp-controller

## Introduction
The Kapp Controller (Part of Carvel) deploys and view groups of Kubernetes resources as "applications". Apply changes safely and predictably, watching resources as they converge.

## Install 
Follow the [installation instructions](https://carvel.dev/kapp-controller/docs/latest/install/) to install the Kapp Controller.

## Deliver
1. Install some RBAC rules to get this working
   > kubectl apply -f app/rbac.yaml
1. Apply the provided application resource
   > kubectl apply -f app/app.yaml
2. Inspect the application
   > kubectl get app podtato-kappctl -o yaml
3. Inspect the deployed resources
   > kubectl get all -n podtato-kappctl
4. You can access the application via the ingress or port-forwarding
   > `kubectl port-forward -n podtato-kappctl svc/podtato-kappctl-podtato-head-frontend 8080`
5. Open http://localhost:8080 in your browser


## Uninstall
Delete the previously created resources
```
	kubectl delete -f app/app.yaml --ignore-not-found=true
	kubectl delete -f app/rbac.yaml --ignore-not-found=true
	kubectl delete ns podtato-kappctl --ignore-not-found=true
	kubectl delete -f https://github.com/vmware-tanzu/carvel-kapp-controller/releases/latest/download/release.yml --force --ignore-not-found=true
```