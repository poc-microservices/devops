# Setup K8s Cluster

1. Create cluster

``` bash
gcloud container clusters create cluster-online-store \
    --zone=us-central1-a \
    --cluster-version=latest \
    --machine-type=n1-standard-4 \
    --enable-autoscaling --min-nodes=1 --max-nodes=1 \
    --enable-autorepair \
    --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
    --num-nodes=1
```

2. Create node pool with 1 node to deploy services

``` bash
gcloud container node-pools create standard-pool \
--cluster  cluster-online-store \
--machine-type=n1-standard-1 \
--num-nodes=1 \
--node-labels=environment=staging,team=store \
--zone=us-central1-a
```

3. Check the cluster and node pools are running

``` bash
gcloud container clusters list
gcloud container node-pools list --zone=us-central1-a --cluster=cluster-online-store
```