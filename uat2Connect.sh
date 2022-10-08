#!/bin/zsh

echo "Getting instance ID from aws"

instanceId=`/usr/local/bin/aws ssm describe-instance-information --filters "Key=tag:Name,Values=soms-staging-uat2-db-1" --profile SOMS_NONPROD --region eu-west-1 | grep InstanceId | cut -d'"' -f4`

echo "port forwarding to instanceID: $instanceId"

/usr/local/bin/aws ssm start-session --target $instanceId --document-name AWS-StartPortForwardingSession --parameters "portNumber=[50000],localPortNumber=[50001]" --region eu-west-1 --profile SOMS_NONPROD

echo "script complete..."
