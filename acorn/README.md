# Deliver with Acorn
![Acorn](https://img.shields.io/badge/Acorn-v0.6.0-blue)
![PodTatoHead](https://img.shields.io/badge/PodTatoHead-v0.3.0-orange)


Website: https://acorn.io <BR>
Repository: https://github.com/acorn-io/acorn

## Deliver
Acorn delivers applications from source code or a container image in a kubernetes cluster. 

## Install Acorn
You can install acorn with the following commands:
```shell
$> curl https://get.acorn.io | INSTALL_ACORN_VERSION=$(ACORN_VERSION) sh -
$> acorn install
```

## Deliver PodTatoHead
1. Clone this repository
2. Install acorn as specified above
3. Apply the [Acornfile](app/Acornfile) to your cluster
   > `acorn apply --target-namespace podtato-acorn -f app/Acornfile`
4. After some time the application should be deployed in the podtato-acorn namespace
5. You can access the application via the ingress or port-forwarding
   > `kubectl port-forward -n podtato-acorn svc/frontend 8080`
6. Open http://localhost:8080 in your browser

## Uninstall Acorn
You can uninstall acorn with the following command: 
> `acorn uninstall -a -f`


