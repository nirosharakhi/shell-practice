#!/bin/bash
USERID = $(id -u)
if [$USERID -ne 0]
then
    echo "Error:Please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then  
        echo "installing $2 is success"
    else
        echo "installing $2 is failure"
        exit 1
    fi
}

dnf list mysql 
if [ $? -ne 0 ]
then 
    echo "mysql is not installed going to install it"
    dnf list mysql
    VALIDATE $? "mysql"
else
    echo "Mysql is already installed...nothing to do"
fi

dnf list python3
if [ $? -ne 0 ]
then 
    echo "python is not installed going to install it"
    dnf list python
    VALIDATE $? "python3"
else
    echo "python3 is already installed...nothing to do"
fi

dnf list nginx
if [ $? -ne 0 ]
then 
    echo "nginx is not installed going to install it"
    dnf list nginx
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...nothing to do"
fi

