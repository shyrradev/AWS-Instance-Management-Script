#!/bin/bash

start_instance() {
    aws ec2 start-instances --instance-ids "$1"
    echo "Instance $1 started"
}

stop_instance() {
    aws ec2 stop-instances --instance-ids "$1"
    echo "instance $1 stopped"
}
list_instances() {
    aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"
    if [ $? -eq 0 ]; then
        echo "Instance list fetched successfully"
        echo "$instances"
        if [ -z "$instances" ]; then
            echo "No instances found."
        fi
    else
        echo "Error fetching instance list, please check the proper configurations of AWS CLI connection"
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