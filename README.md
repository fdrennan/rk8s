# rk8s

## Installation

Follow the directions [here](https://kubernetes.io/docs/tasks/tools/) for minikube, kubectl.




```
eksctl create cluster \
  --version 1.19 \
  --region us-west-2 \
  --node-type m5.xlarge \
  --nodes 10 \
  --nodes-min 1 \
  --nodes-max 10 \
  --name ndexr
  
eksctl scale nodegroup --cluster=ndexr --nodes=30 --name=ndexr --nodes-min=30 --nodes-max=40
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
eksctl delete cluster --name=ndexr
```

Scale
```
kubectl scale deployment student-service --replicas=2
```

Load Test
```
siege -c 10 -r 10 -b "http://a1bcc99a0252f4bff90a4649ddcbf7f7-236701808.us-west-2.elb.amazonaws.com/wait"
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