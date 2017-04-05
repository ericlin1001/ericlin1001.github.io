#!/bin/bash
if [ -z "$1" ]; then
	comment="By script"
else 
	comment="$1"
fi

git add --all  .
git commit -m "$comment"
git push origin master
