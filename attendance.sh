#!/bin/bash

declare -A userdate        
declare -a all

for user in {webdev_,sysad_,appdev_}{1..30}
do
    all+=("$user")
done

date1="2019-09-27"
date2=$(date +%F)
echo Enter Date 1 and Date 2 in yyyy-mm-dd format:
read date1 date2


date2=$(date -d "$date2 1 days" +'%Y-%m-%d')

while read line
do
    name=$(cut -d' ' -f 1 <<<$line) 
    date=$(cut -d' ' -f 3 <<<$line) 
    userdate[$date]="${userdate[$date]} $name"
done < /home/jegan/Desktop/attendance.log

while [ "$date1" != "$date2" ]
do
    dwc="$date1,"
    if [ "${userdate[$dwc]}" != "" ]     
    then
        declare -A dummy   
        for variable in ${userdate[$dwc]}     
        do
            dummy[$variable]="present"
        done
        echo "Absent on $date1 are..."    
        for people in ${all[*]}
        do
            if [ "${dummy[$people]}" != "present" ]
            then
                echo $people
            fi 
        done
        unset dummy
        echo
    fi
    date1=$(date -d "$date1 1 days" +'%Y-%m-%d')
done
