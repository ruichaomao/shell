#!/bin/bash
function delline(){
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then
            delline $dir_or_file
        else
            echo $dir_or_file
            sed -i '1d' $dir_or_file
        fi
    done
}
root_dir="/home3/maoruichao/qm/bdf/rg1b850/qqq"
delline $root_dir
