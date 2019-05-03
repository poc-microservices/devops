# Setup Knative

There are 2 ways to install

* By K8s CLI
* By Knative CLI

## Install by K8s CLI

[Reference Link](https://www.knative.dev/docs/install/knative-with-gke/)

### Install Istio

``` bash
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.0/istio-crds.yaml && \
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.0/istio.yaml
kubectl label namespace default istio-injection=enabled
kubectl get pods --namespace istio-system
```

### Install Knative

``` bash
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.0/serving.yaml \
--filename https://github.com/knative/build/releases/download/v0.5.0/build.yaml \
--filename https://github.com/knative/eventing/releases/download/v0.5.0/release.yaml \
--filename https://github.com/knative/eventing-sources/releases/download/v0.5.0/eventing-sources.yaml \
--filename https://github.com/knative/serving/releases/download/v0.5.0/monitoring.yaml \
--filename https://raw.githubusercontent.com/knative/serving/v0.5.0/third_party/config/build/clusterrole.yaml
```

## Install by Knative CLI

[Reference link](https://developer.ibm.com/blogs/knctl-a-simpler-way-to-work-with-knative/)
[Knative CLI](https://github.com/cppforlife/knctl/releases)

* Install Knative CLI

``` bash
# compare checksum output to what's included in the release notes
$ shasum -a 256 ~/Downloads/knctl-*

# move binary to your system’s /usr/local/bin -- might require root password
$ mv ~/Downloads/knctl-* /usr/local/bin/knctl

# make the newly copied file executable -- might require root password
$ chmod +x /usr/local/bin/knctl
```

* Install Knative

``` bash
knctl install
```

## Check all knative services is up and running

``` bash
kubectl get pods --namespace knative-serving
kubectl get pods --namespace knative-build
kubectl get pods --namespace knative-eventing
kubectl get pods --namespace knative-sources
kubectl get pods --namespace knative-monitoring
```