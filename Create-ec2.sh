#!/bin/bash

NAMES=("mongodb" "redis" "mysql" "RabbitMQ" "web" "catalogue" "cart" "payment" "shipping" "Dispatch")
INSTANCE_TYPE=""
IMAGE_ID=ami-031d574cddc5bb371
SECURITY_GROUP_ID=sg-01078218058c8212f


for i in ${NAMES[@]}
do 
    if {{ $i == "mongodb" || $i == "mysql" }}
    then 
        INSTANCE_TYPE="t3.medium"
    else
        INSTANCE_TYPE="t2.micro"
    fi
    echo "creating $i instance"
    aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --key-name MyKeyPair --security-group-ids $SECURITY_GROUP_ID 

    
done