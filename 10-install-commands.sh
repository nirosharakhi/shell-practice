#!/bin/bash
USERID = $(id -u)
if [ $USERID -ne 0 ]
then
    echo "error::Please run this script with root access"
    exit 1
    else
    echo "you are running with root access"
fi 

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "MYSQl is not installed.... going to install it"
    dnf install mysql
    if [ $? -ne 0 ]
    then 
        echo "installing mysql....success"
    else 
        echo "installing mysql... failure"
    exit 1
    fi
else 
    echo "Mysql is already installed..nothing to do"
fi