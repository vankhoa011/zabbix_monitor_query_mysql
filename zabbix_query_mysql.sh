#!/bin/bash
select1=0
delete1=0
update1=0
insert1=0
# Show global status of Mysql
str=$(mysql -uroot -Bse "show global status;")

#Get number select query of Mysql
select1=$(echo "$str" | grep -w 'Com_select' | awk '{print $2}')
#Get number delete of Mysql
delete1=$(echo "$str" | grep -w 'Com_delete' | awk '{print $2}')
#Get number update of Mysql
update1=$(echo "$str" | grep -w 'Com_update' | awk '{print $2}')
#Get number insert
insert1=$(echo "$str" | grep -w 'Com_insert' | awk '{print $2}')
# With argument Com_select , print number select

if [ "$1" = "Com_select" ];then
    echo $select1
elif [ "$1" = "Com_delete" ];then
    echo $delete1
elif [ "$1" = "Com_update" ];then
    echo $update1
else
    echo $insert1
fi
