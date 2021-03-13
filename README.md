# rk8s

https://mdneuzerling.com/post/hosting-a-plumber-api-with-kubernetes/

https://code.markedmondson.me/r-on-kubernetes-serverless-shiny-r-apis-and-scheduled-scripts/


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