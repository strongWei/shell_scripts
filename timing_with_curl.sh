#!/bin/bash - 
#===============================================================================
#
#          FILE: timing_with_curl.sh
# 
#         USAGE: ./timing_with_curl.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2021年11月28日 15:44
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ $# == 0 ]; then
    echo "Usage: $0 url"
    exit 1
fi

#time_namelookup: The time, in seconds, it took from the start until the name resolving was completed.
#
#time_connect: The time, in seconds, it took from the start until the TCP connect to the remote host (or proxy) was completed.
#
#time_appconnect: The time, in seconds, it took from the start until the SSL/SSH/etc connect/handshake to the remote host was completed. (Added in 7.19.0)
#
#time_pretransfer: The time, in seconds, it took from the start until the file transfer was just about to begin. This includes all pre-transfer commands and negotiations that are specific to the particular protocol(s) involved.
#
#time_redirect: The time, in seconds, it took for all redirection steps include name lookup, connect, pretransfer and transfer before the final transaction was started. time_redirect shows the complete execution time for multiple redirections. (Added in 7.12.3)
#
#time_starttransfer: The time, in seconds, it took from the start until the first byte was just about to be transferred. This includes time_pretransfer and also the time the server needed to calculate the result.
#
#time_total: The total time, in seconds, that the full operation lasted. The time will be displayed with millisecond resolution.
curl -L -w "time_namelookup: %{time_namelookup} 
time_connect: %{time_connect}  
time_appconnect: %{time_appconnect}
time_pretransfer: %{time_pretransfer}
time_redirect: %{time_redirect}
time_starttransfer: %{time_starttransfer}
time_total: %{time_total}
" $1

