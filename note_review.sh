#!/bin/bash - 
#===============================================================================
#
#          FILE: note_review.sh
# 
#         USAGE: ./note_review.sh 
# 
#   DESCRIPTION: get the VNote files to review
# 
#       OPTIONS: ---
#  REQUIREMENTS: bc date
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: codeever
#  ORGANIZATION: 
#       CREATED: 2021年12月03日 09:43
#      REVISION: v1.1
#===============================================================================

set -o errexit
set -o nounset                              # Treat unset variables as an error

NOTE_DIR="/data/Notes"
START_DATE="2021-12-01"

# get the file change from the start date tp the end date 
# usage: logChanged $start_date $end_date
logChanged(){
    cd $NOTE_DIR
    echo "$(git log --name-only --oneline --since=$1'T00:00' --until=$2'T00:00' | grep '.md$')"
}

# get the next date of the specific date
# usage: nextDate $specific_date
nextDate(){
    echo $(date -d "$1 + 1 day" +%F)    
}

# get the date of specific date  $num days ago
# usage: substrateDate  $specific_date $num
substrateDate(){
    echo $(date -d "$1 - $2 day" +%F)    
}

# get the timestamp of date
# usage: dateTimestamp $specific_date
dateTimestamp(){
    echo $(date -d "$1" +%s)
}

# get review files of the specific date
# usange getReviewfile $specific_date
getReviewfile(){
    start_date=''
    end_date=''
    substrate_num=0
    reviewfiles=''
    for i in {0..6}; do
        substrate_num=$(echo "2^$i" |bc) 
        start_date=$(substrateDate $1 $substrate_num)

        if [ $(dateTimestamp $start_date) -lt $(dateTimestamp $START_DATE) ]; then
            break
        fi

        end_date=$(nextDate $start_date)
        reviewfiles="$reviewfiles""$(logChanged $start_date $end_date)"
    done

    echo "$reviewfiles" |uniq
}

getReviewfile $(date +%F)
