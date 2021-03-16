eksctl create cluster \
  --version 1.19 \
  --region us-west-2 \
  --node-type m5.xlarge \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 3 \
  --name ndexri-dev

eksctl scale nodegroup \
    --cluster ndexri-dev \
    --name ng-c75a0a89 \
    --nodes-min 3 \
    --nodes 60 \
    --nodes-max 60

siege -c 255 -t60s -b "http://a23fbe6816eda4378ba7fb73a8502d33-267748028.us-west-2.elb.amazonaws.com/wait"

eksctl scale nodegroup --cluster ndexri-dev  --name ng-c75a0a89 --nodes 4

eksctl scale nodegroup \
    --cluster ndexri-dev \
    --name ng-c75a0a89 \
    --nodes-min 1 \
    --nodes 1 \
    --nodes-max 1

eksctl delete cluster --name=ndexri-dev
