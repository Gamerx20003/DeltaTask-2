#! /bin/bash


echo "Enter a date"
read date1
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
  fi
done < attendance.log

touch $date1_mom.txt /home/"$MOMer"/Desktop
echo "This is the MOM " > /home/"$MOMer"/Desktop/$date1_mom.txt 
