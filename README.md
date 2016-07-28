# kubernetes-aws

Creates Docker environment with AWS command line tools and Kubernetes installed.

You can build the container by running:

```
./build.sh
```

This will create the jdeskins/kubernetes-aws image.  To change the name of the image, edit build.sh and run.sh
to what name you prefer.

After the container is built, you can run it by:

```
./run.sh
```

This will create a "kubeconfig" directory on the local host - which is mapped to /root/.kube directory 
in the running container.  This will store the credentials needed for accessing the cluster.


## Create Cluster

When you run the Docker container, you will be placed at the command prompt where you can run k8s commands directly 
or run ./scripts/create-cluster.sh to automatically create the kubernetes cluster based on the values 
in the env.list file.

After the script has created the cluster, you can check the node status.

```
kubectl get nodes
```


### Create Deployment

```
kubectl create -f deployments/nginx/run-my-nginx.yaml
```

View status of pods in json
```
kubectl get pods -l run=my-nginx -o json
```

kubectl get svc

Create service:
```
kubectl create -f deployments/nginx/nginx-svc.yaml
```

To get external address:
```
kubectl get svc -o wide
```

### Delete Deployment
```
kubectl delete deployment my-nginx
kubectl delete svc my-nginx
```

## Delete Cluster
```
./kubernetes/cluster/kube-down.sh
```
