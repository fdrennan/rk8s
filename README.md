# rk8s

## Motivation

Want to run R at scale? How about at the tap of a button? That's what this is - (for me at least)

# R Box v1.0

First, we start from the same place. I have pre-configured an AMI that we can use. I have installed
the following on it.

*  RStudio Server
*  Shiny-Server
*  nginx (Not Configured)
*  aws cli
*  kubectl 
*  eksctl

## Run R Box With Command
```
aws ec2 run-instances \ 
    --image-id ami-047c79b3dcb294d8d \
    --count 1 \
    --instance-type t2.large \
    --key-name ndexrbox # whatever your keyfile name is
```

## Set up AWS
```
aws configure
```

# Making stuff with Kubernetes

Start a cluster

```
eksctl create cluster \
  --version 1.19 \
  --region us-west-2 \
  --node-type m5.xlarge \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 3 \
  --name test1
```

```
eksctl scale nodegroup \
    --cluster=test1 \
    --nodes=0 \
    --nodes-max=40 \
    --nodes-min=0 \
    ng-27159ba8
```


Start Services
```
kubectl apply -f ndexr-deploy.yaml
kubectl apply -f ndexr-svc.yaml
```

Descriptives
```
kubectl get all --all-namespaces
kubectl get pods
kubectl get svc
kubectl get nodes
kubectl get svc --all-namespaces
```

Port Forwarding
```
kubectl port-forward ndexr 80:80
```

Stopping the Cluster
```
kubectl delete -f ndexr-deploy.yaml
kubectl delete -f ndexr-svc.yaml
eksctl delete cluster --name=test1
```

Scale
```
kubectl scale deployment student-service --replicas=2
```

Load Test
```
siege -c 10 -r 10 -b "a70fadf9321c440208574f4b3518d86d-1342548954.us-west-2.elb.amazonaws.com/wait"
siege -c 10 -t5s -b "http://acaf0acdf80584b938b54e8c9d7ed07e-2114106703.us-west-2.elb.amazonaws.com"
```

kubectl get all

Hop into Pod
```
kubectl -it exec webapp ls
```

# References
[DockerHub fdrennan/rk8s](https://hub.docker.com/repository/docker/fdrennan/rk8s)

[Hosting a Plumber API with Kubernetes](https://mdneuzerling.com/post/hosting-a-plumber-api-with-kubernetes/)

[Ingress Minikube](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

[Getting Started: eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)

[eksctl.io](https://eksctl.io/)

[Creating and Managing Clusters](https://eksctl.io/usage/creating-and-managing-clusters/)

[Building EKS With eksctl](https://joachim8675309.medium.com/building-eks-with-eksctl-799eeb3b0efd)


```
ubuntu@ip-172-31-9-141:~$ siege -c 255 -t30s -b "a70fadf9321c440208574f4b3518d86d-1342548954.us-west-2.elb.amazonaws.com/wait"
** SIEGE 4.0.4
** Preparing 255 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:                   1204 hits
Availability:                 100.00 %
Elapsed time:                  29.60 secs
Data transferred:               0.04 MB
Response time:                  5.30 secs
Transaction rate:              40.68 trans/sec
Throughput:                     0.00 MB/sec
Concurrency:                  215.71
Successful transactions:        1204
Failed transactions:               0
Longest transaction:           15.20
Shortest transaction:           5.00

```
