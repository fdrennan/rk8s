### Warning
### With these commands comes a lot of power, but

# To create a Kubernetes service, use the template below.
eksctl create cluster \
  --version 1.19 \
  --region us-west-2 \
  --node-type m5.xlarge \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 3 \
  --name rk8s

# To change the number of servers in your Kubernetes service, use
# the following command. You will need to supply your particular
# ng (node group) id for name.
eksctl scale nodegroup \
    --cluster rk8s \
    --name ng-c75a0a89 \
    --nodes-min 3 \
    --nodes 60 \
    --nodes-max 60

# To apply changes to your Kubernetes cluster, use the apply command.
kubectl apply -f ./kube/prod/ndexr-deploy.yaml
kubectl apply -f ./kube/prod/ndexr-svc.yaml

# If you want to test your service, use the siege command line tool.
# Here, we slam the endpoint with 255 concurrent users for 60 seconds.
siege -c 255 -t60s -b "http://fill-in-endpoint-here/wait"

# If you want to delete the cluster, use the following command.
eksctl delete cluster --name=rk8s
