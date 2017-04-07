---
layout: post
title: "Linux: Use `trash` instead of `rm`"
description: ""
category: 
tags: ["Linux"]
---

# Why use `trash` instead of `rm` ?
If you wrongly `rm` sth, it can't recovered.

While if you just move sth to trash, it could be recovered.

# Use `trash` in your Linux
1. Install trash command.  
	In Ubuntu 14.04, run: `sudo apt-get install trash`

2. Add following lines into ~/.bashrc.  
~~~~
alias trash="trash"
alias th="trash"
alias del="trash"
alias rm="echo Use 'del' to move to trash, or the full path i.e. '/bin/rm'"
alias trash-restore="restore-trash" # since trash-restore is easy to use than original restore-trash.
~~~~

3. Let it take effect, run:	`source .bashrc`

# Examples
1. To delete sth
~~~
touch foo
del foo
~~~
or 
~~~
touch foo
th foo
~~~

2. View all deleted files: `trash-list`
3. How to restore?
	1. First way:
       run `trash-restore`, and input index of file you want to restore.
	
	2. Second way:
	   Go to */home/$username/.local/share/Trash/files* and save your file.
		



