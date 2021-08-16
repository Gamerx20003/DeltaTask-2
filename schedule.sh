#! /bin/bash

while IFS=" "  read f1 f2
do
   if [ "$f1" = $(date +%F) ]
   then
      i=1
      while [ $i -le 30 ]
      do 
      cd /home/sysad_$i
      echo " MEET TODAY ( $f1 ) at time: $f2 " > schedule.txt 
      cd /home/webdev_$i
      echo " MEET TODAY ( $f1 ) at time: $f2 " > schedule.txt
      cd /home/appdev_$i
      echo " MEET TODAY ( $f1 ) at time: $f2 " > schedule.txt
      ((i++))
      done
   else
      i=1
      while [ $i -le 30 ]
      do 
      cd /home/sysad_$i
      echo " NO MEET TODAY " > schedule.txt 
      cd /home/webdev_$i
      echo " NO MEET TODAY " > schedule.txt
      cd /home/appdev_$i
      echo " NO MEET TODAY " > schedule.txt
      ((i++))
      done
   fi  
done < future.txt

