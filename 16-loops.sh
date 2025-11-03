#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql","python","httpd")

mkdir -p LOGS_FOLDER
echo "script started executed at :$(date)" | tee -a LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R Error::Please run this script with root access $N" | tee -a $LOG_FILE
    exit1
else   
    echo "you are running with root access" |  tee -a $LOG_FILE
fi
VALIDATE()
{
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G success $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is...$R FAILURE $N" | tee -a $LOG_FILE
        exit1
    fi
}

for package in $@
do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed...going to install it" | tee -a $LOG_FILE
        dnf install $package -y &&$LOG_FILE
        VALIDATE $? "$package"
    else    
        echo -e "Nothing to do $package..$Y already installed $N" | tee -a $LOG_FILE
    fi
done