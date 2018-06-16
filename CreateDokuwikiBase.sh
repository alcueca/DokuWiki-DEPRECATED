#!/bin/bash

PATH=$PATH:/home/alberto/AWS/Git/AWS-Tooling/

aws cloudformation create-stack \
--stack-name DokuwikiBaseStack \
--template-body file://DokuwikiBase.yaml \
--region eu-west-1 \
--profile alberto \
--capabilities CAPABILITY_IAM

waitForStatus.py -s DokuwikiBaseStack -r CREATE_COMPLETE
beep
