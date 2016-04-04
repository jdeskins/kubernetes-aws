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

This will place you at the command prompt and you can run k8s commands directly 
or run ./init-cluster.sh to create the kubernetes cluster.

It doesn't currently run the build script automatically to allow for container debugging while this is still
relatively new.