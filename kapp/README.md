# Deliver with kapp
![kapp](https://img.shields.io/badge/kapp-latest-blue)
![PodTatoHead](https://img.shields.io/badge/PodTatoHead-v0.3.1-orange)

Website: https://carvel.dev/kapp/ <BR>
Repository: https://github.com/carvel-dev/kapp

## Introduction
Kapp (Part of Carvel) deploys and view groups of Kubernetes resources as "applications". Apply changes safely and predictably, watching resources as they converge.

## Install 
You can install the kapp CLI using the following command:
```bash
mkdir kapp-bin/
curl -L https://carvel.dev/install.sh | K14SIO_INSTALL_BIN_DIR=kapp-bin bash
export PATH=$$PWD/local-bin/:$$PATH
kapp version
```

## Deliver
1. Create a namespace for the application
    > kubectl create ns podtato-kapp || true
2. Deploy the application
    > kustomize build ./app | kapp deploy -a podtato-head -n podtato-kapp --yes -f -

_Note: No need to write a script to wait until all your resources are _really_ created : kapp is waiting for all dependencies of your resources to be ready._

If you try to run the above command a second time, nothing happens : kapp only changes what is necessary.

If you try to run the above command a second time, nothing happens : kapp only changes what is necessary.

- Inspect an app : `kapp inspect -a podtato-head -n podtato-kapp --tree`
- Display apps : `kapp ls -n podtato-kapp`
- Update an app :
    - change image tag in `../app/kustomization.yaml`
    - display diff before deploying : `kustomize build ./app | kapp deploy -a podtato-head -n podtato-kapp --diff-changes -f -`
- Delete app : `kapp delete -a podtato-head -n podtato-kapp`

_Note: Those who know Terraform should see similarities regarding resources management._

## Uninstall
1. Delete the `podtato-kapp` namespace
2. Delete the `kapp-bin` directory