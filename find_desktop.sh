#!/bin/bash - 
#===============================================================================
#
#          FILE: find_desktop.sh
# 
#         USAGE: ./find_desktop.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2021年12月10日 10:23
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ ! $# -eq 1 ];then
    echo "Usage: $0 desktop-name"
    exit
fi

# find system|user application
grep -i "Name=$1" -r /usr/share/applications $HOME/.local/share/applications |cut -d':' -f1
