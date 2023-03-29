#!/usr/bin/ksh

inp_file="/a/a/a/a/20230329.csv"

if [ -f $inp_file ]
then
    while read line
    do
        path=`echo $line|awk -F"|" '{print $1}'`
        patt=`echo $line|awk -F"|" '{print $2}'`

        cnt=`cut -d"," -F1 $inp_file|grep $patt|wc -l`
        echo "count for $patt file = $cnt"
        if [ $cnt != 0 ] 
        then
            echo "cd $path"
            echo "cut -d"," -F1 $inp_file|grep $patt|xargs -i mv {} ../"
        else
            echo "No null file for $patt"
        fi
    done < requirement.txt
else
echo "$inp_file not generated today"
fi
