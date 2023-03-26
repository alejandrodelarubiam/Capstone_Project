aws cloudformation deploy \
  --template-file .circleci/files/cluster.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --tags project=capstoneADLRM \
  --stack-name "capstone2ADLRM-infrastructure-${CIRCLE_WORKFLOW_ID:0:7}" \
  --parameter-overrides ID="1234" 
  $SHELL
#   aws cloudformation deploy --template-file .circleci/files/infrastructure.yml --capabilities CAPABILITY_NAMED_IAM --tags project=capstoneADLRM --stack-name "capstone2ADLRM-infrastructure-${CIRCLE_WORKFLOW_ID:0:7}" --parameter-overrides ID="1234"