#!/bin/bash
file=`ls _posts/ |grep  -i $1`
echo $file
vim _posts/$file
./submit.sh
