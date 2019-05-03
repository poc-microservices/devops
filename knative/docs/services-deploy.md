# Deploy services to cluster

There are 3 services to deploy. The script is allocated at devops/knative folder

## Deploy store service

``` bash
./bin/deploy-store.sh
```

## Deploy inventory service

``` bash
./bin/deploy-inventory.sh
```

## Deploy delivery service

``` bash
./bin/deploy-delivery.sh
```

## Apply the routing

Rewrite the original host header to the host header of the service in order to redirect requests to Search service.

``` bash
./bin/routing.sh
```

## Test store service

1. Get the Istio Ingress Gateway IP

``` bash
kubectl get svc istio-ingressgateway --namespace istio-system
```

Return

``` console
| NAME                | TYPE           | CLUSTER-IP     | EXTERNAL-IP        | PORT(S)                                                                                                                |
| ------------------- |:--------------:|:--------------:|:------------------:|:----------------------------------------------------------------------------------------------------------------------:|
| istio-ingressgateway| LoadBalancer   | 10.23.240.60  | **35.193.130.105**  | 80:30727/TCP,443:32076/TCP,31400:30239/TCP,15011:30498/TCP,8060:32041/TCP,853:32176/TCP,15030:30465/TCP,15031:30818/TC |
```

2. Access the store services

``` bash
curl http://35.193.130.105/store/ -H "Host: example.com"
```

Return

``` bash
"Hello Knative Eventing."
```

3. The Inventory and Delivery Service are only exposed to the local cluster.

``` bash
curl http://35.193.130.105/delivery/ -H "Host: example.com"
```

Response

``` console
HTTP 404 Not Found
```