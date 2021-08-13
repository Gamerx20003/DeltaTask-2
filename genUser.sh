#! /bin/bash
#adding users

i=1
while [ $i -le 30 ]
do
  useradd sysad_$i -m
  ((i++))
done

i=1
while [ $i -le 30 ]
do
  useradd appdev_$i -m
  ((i++))
done

i=1
while [ $i -le 30 ]
do
  useradd webdev_$i -m
  ((i++))
done

useradd jay_jay -m

#creating groups

i=21
while [ $i -le 30 ]
do
  j=11
  k=1
  while [ $j -le 20 ] && [ $k -le 10 ]
  do
     groupadd sf$i 
     groupadd st$j 
     groupadd ss$k 
     groupadd af$i
     groupadd at$j 
     groupadd as$k 
     groupadd wf$i 
     groupadd wt$j 
     groupadd ws$k
     ((j++)) 
     ((k++))
  done 
  ((i++))
done

#adding user to groups

#sysad Grouping

i=1
while [ $i -le 10 ]
do
  usermod -a -G ss$i sysad_$i
  ((i++))
done

while [ $i -le 20 ]
do
  j=1
  while [ $j -le 10 ] 
  do
    usermod -a -G st$i,ss$j sysad_$i
    ((j++))
  done 
  ((i++))
done

while [ $i -le 30 ]
do
  j=11
  k=1
  while [ $j -le 20 ] && [ $k -le 10 ]
  do
     usermod -a -G sf$i,st$j,ss$k sysad_$i 
     ((j++)) 
     ((k++))
  done 
  ((i++))
done

#app dev grouping

i=1
while [ $i -le 10 ]
do
  usermod -a -G as$i appdev_$i
  ((i++))
done

while [ $i -le 20 ]
do
  j=1
  while [ $j -le 10 ] 
  do
    usermod -a -G at$i,as$j appdev_$i
    ((j++))
  done 
  ((i++))
done

while [ $i -le 30 ]
do
  j=11
  k=1
  while [ $j -le 20 ] && [ $k -le 10 ]
  do
     usermod -a -G af$i,at$j,as$k appdev_$i 
     ((j++)) 
     ((k++))
  done 
  ((i++))
done

#web dev grouping

i=1
while [ $i -le 10 ]
do
  usermod -a -G ws$i webdev_$i
  ((i++))
done

while [ $i -le 20 ]
do
  j=1
  while [ $j -le 10 ] 
  do
    usermod -a -G wt$i,ws$j webdev_$i
    ((j++))
  done 
  ((i++))
done

while [ $i -le 30 ]
do
  j=11
  k=1
  while [ $j -le 20 ] && [ $k -le 10 ]
  do
     usermod -a -G wf$i,wt$j,ws$k webdev_$i 
     ((j++)) 
     ((k++))
  done 
  ((i++))
done

#adding Jay_Jay to every group

i=21
while [ $i -le 30 ]
do
  j=11
  k=1
  while [ $j -le 20 ] && [ $k -le 10 ]
  do
     usermod -a -G sf$i,st$j,ss$k,af$i,at$j,as$k,wf$i,wt$j,ws$k jay_jay
     ((j++)) 
     ((k++))
  done 
  ((i++))
done

