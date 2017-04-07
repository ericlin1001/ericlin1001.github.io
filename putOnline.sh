#!/bin/bash
currentBranch=`git branch |grep '*'|cut -d' ' -f2`
if [  $currentBranch != "master" ]; then
	echo "Current branch: $currentBranch is NOT master branch, can't push online"
	echo "To switch to master branch: \`git checkout master\`"
	exit 0;
fi
if [ -z "$1" ]; then
	comment="latest build."
else 
	comment="$1"
fi

git add --all  .
git commit -m "$comment"
git push origin master
