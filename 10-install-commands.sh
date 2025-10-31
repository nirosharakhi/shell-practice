#!/bin/bash
USERID = $(id -u)
if [ $USERID -ne 0 ]
then
    echo "error::Please run this script with root access"
    exit 1
    else
    echo "you are running with root access"
fi

