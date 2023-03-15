# Deliver with Keptn
![Keptn](https://img.shields.io/badge/Keptn-v0.6.0-blue)
![PodTatoHead](https://img.shields.io/badge/PodTatoHead-v0.3.0-orange)

## Pre-requisites
* Kubernetes cluster >= 1.24 installed

## Deliver
Keptn hooks in the delivery process by injecting a scheduler and observes the deployment process. Furthermore, pre- & post-deployment tests can be executed and evaluations can be performed to ensure the quality of the service. This can be done on a Workload (Deployment, StatefulSet, DaemonSet, etc.) or on an Application Level (e.g., the whole podtato-head application).

## Install Keptn
Keptn itself is installed using a Kubernetes manifest or a Helm chart. In this example, we will use the manifest to install Keptn. This can be installed using the following command:

```console
kubectl apply -f https://github.com/keptn/lifecycle-toolkit/releases/download/v0.6.0/manifest.yaml
```