#!/bin/bash

PATH=$PATH:/home/alberto/AWS/Git/AWS-Tooling/

aws cloudformation delete-stack \
    --stack-name DokuwikiBaseStack
waitForDeletion.py -s DokuwikiBaseStack
beep

