#!/bin/bash

/usr/bin/aws ec2 run-instances \
    --image-id ami-047c79b3dcb294d8d \
    --count 1 \
    --instance-type t2.large \
    --key-name ndexrbox # whatever your keyfile name is
