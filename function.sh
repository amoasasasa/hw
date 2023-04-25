#!/usr/bin/ksh
todays_date=`date "+%Y%m%d"`
directory_name="f\f\f\f"
filename="HSBC IBPC HELLOG"

def difference(){
    directory=$1
    shift 1
    filename=$@
    cd $directory
    for i in $filename
    do
        codename="$i.???"
    	codename_bkp="$codename"_"$todays_date*"
    	local file_cnt=`ls -lrt $codename $codename_bkp|wc -l`
    	if [ $file_cnt > 2 ]
    	then
    		echo "There are more backup files for present date. Below is the list of files"
    		ls -lrt $codename_bkp
    		echo "please select which file do you want to select to compare?"
    		read $codename_bkp
            echo "updated the bkp variable"
        fi
    	echo "showing vimdiff for $codename and $codename_bkp. Press enter"
    	read 
    	vimdiff $codename $codename_bkp
    done
}