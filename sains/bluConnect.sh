#!/bin/zsh

echo "Getting instance ID from aws"
instanceId=`aws ssm describe-instance-information --filters --profile SOMS_PROD --region eu-west-1 --output text | grep blu | cut -f6`

echo "port forwarding to instanceID: $instanceId"

aws ssm start-session --target $instanceId --document-name AWS-StartPortForwardingSession --parameters "portNumber=[60000],localPortNumber=[60003]" --region eu-west-1 --profile SOMS_PROD

echo "script complete..."
