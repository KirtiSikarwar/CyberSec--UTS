#!/bin/bash

echo  "My First bash script",

echo date

echo $(uname)

echo $(hostname -I) | awk '{print $1}'

echo $(ip addr)

echo $(hostname)


if ( ! -d /home/sysadmin/Tango)
then 
        mkdir /home/sysadmin/Tango 

fi

Tango=/home/sysadmin/research/sys_info.txt

if ( -f $Tango )
then
        rm $Tango
fi

