CIRCLE_WORKFLOW_ID=b7212c3
aws eks --region us-east-1 update-kubeconfig --name CapstoneADLRM-Cluster-${CIRCLE_WORKFLOW_ID}
URL=$(kubectl get svc capstoneadlrm-microservice-${CIRCLE_WORKFLOW_ID} -o wide | awk '{print $4}' | tail -n 1)
curl -s ${URL}:8000         
if curl -s ${URL}:8000 | grep "Hello World!"
then
  exit 0
else
  exit 1
fi