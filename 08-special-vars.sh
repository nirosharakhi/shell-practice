#!/bin/bash

echo "All variables passed to the script:$@"
echo "Number of variables :$#"
echo "scriptname:$0"
echo "current directory:$PWD"
echo "User running this script:$USER"
echo  "Home directory of the user :$HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background ;$!"

