# kubernetes-aws

Creates Docker environment with AWS command line tools and Kubernetes installed.

You can build the container by running:

```
./build.sh
```

This will create the jdeskins/kubernetes-aws image.  To change the name of the image, edit build.sh and run.sh
to what name you prefer.

## Custom Settings

The [env.list](env.list) file contains settings you can override.  These variables are used when Kubernetes is creating
the cluster on the cloud provider.


## Environment

When ready to create the cluster, you can run the following command which will place you inside a running
Docker container with the Kubernetes environment specified in the Dockerfile:

```
./run.sh
```

To use a particular AWS profile in ~/.aws/credentials when creating the cluster, then set the 
AWS_DEFAULT_PROFILE environment variable to that profile name.  Run the following to use that variable:
```
export AWS_DEFAULT_PROFILE=profile_name
./run-with-profile.sh
```

This will also create a "kubeconfig" directory on the local host - which is mapped to /root/.kube directory 
in the running container.  The credentials needed for accessing the cluster will be stored in that location.


## Create Cluster
 
To create a new cluster from inside the running container, execute:
```
./scripts/create-cluster.sh
```
 
This will automatically create the kubernetes cluster based on the values in the [env.list](env.list) file.

After the cluster is created, you can check the node status.
```
kubectl get nodes
```


### Create Deployment

```
kubectl create -f deployments/helloworld/helloworld-v1.yaml
```

You can view the status of the pods by running:
```
kubectl get pods
```

Add the wide output flag to see the nodes:
```
kubectl get pods -o wide
```

Display services with wide output to view external address:
```
kubectl get svc -o wide
```

### Scale

Scale the application to 3 replicas
```
kubectl scale deployment hello-app --replicas=4
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

### Rollback the Update
```
kubectl rollout undo deployment/hello-app
```

### Delete the deployment:
```
kubectl delete service,deployment hello-app
```


### Without Configuration Files
A simple way to launch containers without using a configuration file
```
kubectl run hello-app --image=jdeskins/hello-node:1.0 --port=8080
```

Allow the service to be accessible behind a load balancer:
```
kubectl expose deployment hello-app --type="LoadBalancer"
```

### Scale

Scale the application to 3 replicas
```
kubectl scale deployment hello-app --replicas=3
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
kubectl set image deployment/hello-app hello-app=jdeskins/hello-node:2.0
```

Delete the deployment:
```
kubectl delete service,deployment hello-app
```

## Delete Cluster
```
./kubernetes/cluster/kube-down.sh
```
