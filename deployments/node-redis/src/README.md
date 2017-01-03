# Node Redis Demo App

Run Node.js web app with Redis master/slave.

## Build the Docker image
```
docker build -t jdeskins/node-demo:1.0 .
```

## Kubernetes

### Create Kubernetes Deployment

```
kubectl create -f deploy/redis-master.yaml
kubectl create -f deploy/redis-slave.yaml
kubectl create -f deploy/web-v1.yaml
```

You can view the status of the pods by running:
```
kubectl get pods
```

Query Redis master
```
kubectl exec <redis-master-pod> redis-cli get counter
```

## Docker

### Run Redis and Node
```
./run.sh
```

### Cleanup

```
./stop.sh
```
