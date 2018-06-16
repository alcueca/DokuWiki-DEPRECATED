#!/bin/bash

PATH=$PATH:/home/alberto/AWS/Git/AWS-Tooling/

aws cloudformation delete-stack \
    --stack-name DokuwikiServerStack
waitForDeletion.py -s DokuwikiServerStack
beep

