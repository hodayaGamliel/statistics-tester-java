#!/bin/sh

#set -x

# read -p "Enter your new secret key : ";
# KEY=$REPLY

KEY=$1

echo "echo '$KEY' > /opt/takipi/work/secret.key" | sudo sh
echo "The secret.key file edited"

PID=`ps -ef | grep takipi-service | awk '{print $2}'| head -n 1`
kill -9 $PID
PID=`ps -ef | grep takipi-service | awk '{print $2}'| head -n 1`
echo "Takipi demaon restarted - the new pid $PID"

echo "The new key is:"
echo "cat /Library/Takipi/work/secret.key" | sudo sh
