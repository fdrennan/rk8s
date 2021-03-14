# rk8s

## Code to run plumber containers on Kubernetes

[DockerHub](https://hub.docker.com/repository/docker/fdrennan/rk8s)

[Source](https://mdneuzerling.com/post/hosting-a-plumber-api-with-kubernetes/)


```
kubectl get po -A
minikube kubectl -- get po -A
minikube dashboard
```

```
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080
```

```
postgres-configmap.yaml
```

# rk8s
```
minikube start
kubectl apply -f rdeploy.yaml 
kubectl apply -f ringress.yaml
kubectl apply -f rservice.yaml
kubectl port-forward deployment/plumber-on-k8s-deployment 8000:8000
```

[Ingress](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)
```
minikube addons enable ingress
kubectl get pods -n kube-system
kube get deployments
kubectl expose deployment plumber-on-k8s-deployment  --type=NodePort --port=8000
kubectl get service plumber-on-k8s-deployment
minikube service plumber-on-k8s-deployment --url
```

[Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)

```
eksctl create cluster \
    --name my-cluster \
    --region us-west-2 \
    --fargate
    
kubectl get svc

kubectl get nodes -o wide

kubectl get pods --all-namespaces -o wide

eksctl delete cluster --name my-cluster --region us-west-2
```


[Notes](https://eksctl.io/)
```
kubectl apply -f ./ringress.yaml ./rservice.yaml ./rdeploy.yaml
```


[Notes](https://eksctl.io/usage/creating-and-managing-clusters/)
```
eksctl create cluster -f cluster.yaml
eksctl delete cluster -f cluster.yaml
```


# Working 

[Notes](https://joachim8675309.medium.com/building-eks-with-eksctl-799eeb3b0efd)

```
eksctl create cluster \
  --version 1.19 \
  --region us-west-2 \
  --node-type m5.xlarge \
  --nodes 10 \
  --nodes-min 1 \
  --nodes-max 10 \
  --name ndexr
```
eksctl scale nodegroup --cluster=ndexr --nodes=30 --name=ndexr --nodes-min=30 --nodes-max=40


```
kubectl apply -f ndexr-deploy.yaml
kubectl apply -f ndexr-svc.yaml
kubectl get all --all-namespaces
kubectl get pods
kubectl get svc
kubectl get nodes
kubectl delete -f ndexr-deploy.yaml
kubectl delete -f ndexr-svc.yaml
eksctl delete cluster --name=ndexr
```

kubectl get svc --all-namespaces

kubectl scale deployment student-service --replicas=2

```
siege -c 10 -r 10 -b "http://a1bcc99a0252f4bff90a4649ddcbf7f7-236701808.us-west-2.elb.amazonaws.com/wait"
siege -c 10 -t5s -b "http://acaf0acdf80584b938b54e8c9d7ed07e-2114106703.us-west-2.elb.amazonaws.com"
```

```
kubectl -it exec webapp ls
```

```
kubectl get all
```