#! /bin/bash

#changing home directory permissions

cd /home/
i=1
while [ $i -le 30 ]
do
  chmod 755 sysad_$i
  chmod o-rx sysad_$i
  ((i++))
done

i=1
while [ $i -le 30 ]
do
  chmod 755 appdev_$i
  chmod o-rx appdev_$i
  ((i++))
done

i=1
while [ $i -le 30 ]
do
  chmod 755 webdev_$i
  chmod o-rx webdev_$i
  ((i++))
done

#changing group ownership 

i=1
while [ $i -le 10 ]
do
  chgrp -R ss$i sysad_$i
  chgrp -R as$i appdev_$i
  chgrp -R ws$i webdev_$i
  ((i++)) 
done

while [ $i -le 20 ]
do
  chgrp -R st$i sysad_$i
  chgrp -R at$i appdev_$i
  chgrp -R wt$i webdev_$i
  ((i++)) 
done

while [ $i -le 30 ]
do
  chgrp -R sf$i sysad_$i
  chgrp -R af$i appdev_$i
  chgrp -R wf$i webdev_$i
  ((i++)) 
done
