#!/bin/bash

filename=`rake post title=$1|awk '{print $4}'`
echo $filename
vim $filename
./submit.sh
