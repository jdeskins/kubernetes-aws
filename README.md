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
kubectl apply -f deployments/helloworld/helloworld-v1.yaml
```

Display services with wide output to view external address:
```
kubectl get svc -o wide
```

### Scale

Scale the application to 3 replicas
```
kubectl scale deployment hello-node --replicas=4
```

View the pods created:
```
kubectl get pods -o wide
```

See the labels:
```
kubectl get pods --show-labels=true
```

### Update the Image

You can run the following in a separate terminal to see the version numbers change as the update is rolled out.
```
while true; do curl http://[EXTERNAL_ADDRESS]:8080/version; sleep .5; done
```

Run the update:
```
kubectl apply -f deployments/helloworld/helloworld-v2.yaml
```

You should see the version number change as the rolling update takes place.


### Delete the deployment:
```
kubectl delete service,deployment hello-node
```


### Without Configuration Files
A simple way to launch containers without using a configuration file
```
kubectl run hello-node --image=jdeskins/hello-node:1.0 --port=8080
```

Allow the service to be accessible behind a load balancer:
```
kubectl expose deployment hello-node --type="LoadBalancer"
```

### Scale

Scale the application to 3 replicas
```
kubectl scale deployment hello-node --replicas=3
```

View the pods created:
```
kubectl get pods -o wide
```

See the labels:
```
kubectl get pods --show-labels=true
```

### Update the Image

You can run the following in a separate terminal to see the version numbers change as the update is rolled out.
```
while true; do curl http://[EXTERNAL_ADDRESS]:8080/version; sleep .5; done
```

Run the update:
```
kubectl set image deployment/hello-node hello-node=jdeskins/hello-node:2.0
```

Delete the deployment:
```
kubectl delete service,deployment hello-node
```

## Delete Cluster
```
./kubernetes/cluster/kube-down.sh
```
