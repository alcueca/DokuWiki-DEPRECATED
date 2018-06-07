#!/bin/bash

PATH=$PATH:/home/alberto/AWS/Git/AWS-Tooling/

aws cloudformation delete-stack \
    --stack-name DockerServerDokuwiki
waitForDeletion.py -s DockerServerDokuwiki
beep

