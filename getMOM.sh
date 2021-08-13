#! /bin/bash

date1='2021-09-27'

declare -a momerlist
declare -a datelist
touch moms.txt 

echo "enter the dates"
read gdate1 gdate2

while read line
do
  name=$(cut -d' ' -f 1 <<<$line) 
  date=$(cut -d' ' -f 3 <<<$line) 
  if [ "$date" = "$date1," ]
  then
  i=1
  for i in {1..10}
    do 
      if [ "$name" = "sysad_$i" ] || [ "$name" = "webdev_$i" ] || [ "$name" = "appdev_$i" ]
      then
          MOMer="$name"
      fi
    done
  else
    momerlist+="$MOMer"
    datelist+="$date1"
    date1="$date"
  fi  
done < /home/jegan/Desktop/attendance.log

n=${#datelist[@]} 

i=0
while [ $i -lt $n ]
do
  if [ "${datelist[$i]}" = "$gdate1" ]
  then
     req1=$i
  fi   
  if [ "${datelist[$i]}" = "$gdate2" ]
  then
     req2=$i     
  fi
((i++))
done

while (( $req1 -le $req2 ))
do
  while read line
  do
  echo "${momerlist[$req1]}"'\t'"${datelist[$req1]}"'\t'$line >> /home/jay_jay/Desktop/MOMs.txt
  done < /home/"${momerlist[$req1]}"/Desktop/${datelist[$req1]}_mom.txt
  ((req1++))
done  
  




