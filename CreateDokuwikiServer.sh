#!/bin/bash

PATH=$PATH:/home/alberto/AWS/Git/AWS-Tooling/

aws cloudformation create-stack --profile alberto --stack-name DokuwikiServerStack \
        --template-body file://DokuwikiServer.yaml \
        --region eu-west-1 \
        --parameters \
            ParameterKey=KeyNameParam,ParameterValue=StudentKeyPair \
            ParameterKey=InstanceTypeParam,ParameterValue=t2.micro \
        --disable-rollback

waitForStatus.py -s DokuwikiServerStack -r CREATE_COMPLETE
