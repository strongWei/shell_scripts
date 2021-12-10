#!/bin/bash - 
#===============================================================================
#
#          FILE: lnmp_manager.sh
# 
#         USAGE: ./lnmp_manager.sh start|stop
# 
#   DESCRIPTION: manager the lnmp on local machine
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2021年12月07日 15:33
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

serviceStart(){
    systemctl status $1 | grep -q 'Active: active'
    
    if [ $? -eq 1 ];then
        echo "$1 is starting..."
        sudo systemctl start $1
    else
        echo "$1 is started"
    fi
}


serviceStop(){
    systemctl status $1 | grep -q 'Active: active'
    
    if [ $? -eq 1 ];then
        echo "$1 is stoped"
    else
        echo "$1 is stoping..."
        sudo systemctl stop $1
    fi
}



if [ ! $# -eq 1 ];then
    echo "Usage: $0 start|stop"
    exit 1
fi


if [ "$1" = "start" ]; then 
    echo 'starting...';
    serviceStart mysql    
    serviceStart php8.0-fpm
    serviceStart nginx

elif [ "$1" = "stop" ]; then
    echo 'stop...';
    serviceStop mysql    
    serviceStop php8.0-fpm
    serviceStop nginx
else
    echo "Usage: $0 start|stop"
    exit 1
fi

echo 'complete!'
