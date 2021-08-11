#!/bin/sh
#ID Instancia
instancia="i-05c...."

#Ahora los Security Groups
www="sg-1"
ssh="sg-2"
blockall="sg-3"

if [ $# -le 0 ];then
 echo Error sintaxis
 exit
fi

if [ "$1" = "1" ];then
#www
  aws ec2 modify-instance-attribute --instance-id $instancia --groups $www
elif [ "$1" = "2" ];then
#ssh
 aws ec2 modify-instance-attribute --instance-id $instancia  --groups $ssh
elif [ "$1" = "3" ];then
#blockall
aws ec2 modify-instance-attribute --instance-id $instancia --groups $blockall
fi