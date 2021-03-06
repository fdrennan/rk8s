
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rk8s

## Motivation

Want to run R at scale? How about at the tap of a button? That’s what
this is - (for me at least)

# R Box

First, we start from the same place. I have pre-configured an AMI that
we can use. I have installed the following on it. More to come.

-   RStudio Server
-   Shiny-Server
-   nginx
-   aws cli
-   kubectl
-   eksctl

## Run R Box With Command

    aws ec2 run-instances \ 
        --image-id ami-047c79b3dcb294d8d \
        --count 1 \
        --instance-type t2.large \
        --key-name ndexrbox # <<- whatever your keyfile name is, this is mine 

## Set up AWS on R Box

    aws configure

# Start a Kubernetes Cluster

    eksctl create cluster \
      --version 1.19 \
      --region us-west-2 \
      --node-type m5.xlarge \
      --nodes 3 \
      --nodes-min 1 \
      --nodes-max 3 \
      --name test-cluster

# Scale Your Cluster

    eksctl scale nodegroup \
        --cluster=test-cluster \
        --nodes=20 \
        --nodes-max=40 \
        --nodes-min=1 \
        ng-27159ba8 # whatever your nodegroup is

Start Services

    kubectl apply -f ndexr-deploy.yaml
    kubectl apply -f ndexr-svc.yaml

Descriptives

    kubectl get all --all-namespaces
    kubectl get pods
    kubectl get svc
    kubectl get nodes
    kubectl get svc --all-namespaces

Port Forwarding

    kubectl port-forward ndexr 80:80

Stopping the Cluster

    kubectl delete -f ndexr-deploy.yaml
    kubectl delete -f ndexr-svc.yaml

Delete the Cluster

    eksctl delete cluster --name=test-cluster

Load Test

    siege -c 10 -t5s -b "http://yourip/wait"

# References

[DockerHub
fdrennan/rk8s](https://hub.docker.com/repository/docker/fdrennan/rk8s)

[Hosting a Plumber API with
Kubernetes](https://mdneuzerling.com/post/hosting-a-plumber-api-with-kubernetes/)

[Ingress
Minikube](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

[Getting Started:
eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)

[eksctl.io](https://eksctl.io/)

[Creating and Managing
Clusters](https://eksctl.io/usage/creating-and-managing-clusters/)

[Building EKS With
eksctl](https://joachim8675309.medium.com/building-eks-with-eksctl-799eeb3b0efd)
