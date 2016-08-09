# Node Redis Demo App

Run Node.js web app with Redis master and multiple slaves within a Kubernetes cluster.

## Build the Docker image
This example uses the jdeskins/node-demo:1.0 Docker image that is publically available.
To build your own, run the following command using the name you want.  Replace the image
name in web-deployment-v1.yaml file.
```
docker build -t jdeskins/node-demo:1.0 .
```

## Run in Kubernetes Cluster
This assumes a k8s cluster is already created and you have access to deploy.

Deploy the Redis services:

```
kubectl create -f redis-master.yaml
kubectl create -f redis-slave.yaml
```
Deploy the frontend web app:

```
kubectl create -f web-deployment-v1.yaml
```


## Cleanup

Remove the running containers:
```
kubectl delete service redis-slave redis-master node-demo
kubectl delete deployment redis-slave redis-master node-demo
```

To tear down the cluster, from kubernetes root directory, run:
```
./cluster/kube-down.sh
```