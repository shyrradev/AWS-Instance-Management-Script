#!/bin/bash

start_instance() {
#checking if instance id is provided    
        if [ -z "$1" ]; then
    echo "Please provide an instance id"
    exit 1
    fi
#AWS CLI command to start the instance
    aws ec2 start-instances --instance-ids "$1"
#checking if the command executed successfully    
    if [ $? -ne 0 ]; then
        echo "Error starting instance, please check the proper configurations of AWS CLI connection or INSTANCE ID"
        else
        echo "instance $1 started"
    fi
}

stop_instance() {
     if [ -z "$1" ]; then
    echo "Please provide an instance id"
    exit 1
    fi
    aws ec2 stop-instances --instance-ids "$1"
     if [ $? -eq 0 ]; then
        echo "instance $1 started"
        else
        echo "Error starting instance, please check the proper configurations of AWS CLI connection or INSTANCE ID"
    fi
}
instance=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running")
list_instances() {
    instance=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running")
    aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"
     if [ $? -eq 0 ]; then
        echo "$instance running. if reservation then there are no running instances"
        else
        echo "Error listing instances, please check the proper configurations of AWS CLI connection or INSTANCE ID"
    fi
}

main () {
    while true; do
     echo "Select Instance Management Operations"
     echo "1. Start Instance"
     echo "2. Stop Instance"
     echo "3. List Instance"
     echo "4. Exit"
     read -p "enter your choice: " choice

     case $choice in 
        1) read -p "enter instance id: " instance_id
        start_instance $instance_id ;;
        2) read -p "enter instance id: " instance_id
        stop_instance $instance_id ;;
        3) list_instances ;;
        4) exit ;;
        *) echo "invalid choice, operation closed, please try again" ;;
        
        esac 
    done
}
main





}