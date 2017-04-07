---
layout: post
title: "use Trash instead of Rm"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Why use trash instead of rm ?

	If you wrongly rm sth, it can't recovered.
	While if you just move sth trash, it can be found if you delete accidently.

# How to use trash?

1. Install trash command.

	`sudo apt-get install trash`

2. Add following lines into ~/.bashrc.

	```
	alias trash="trash"
	alias del="trash"
	alias rm="echo Use 'del' to move to trash, or the full path i.e. '/bin/rm'"
	```

3. Let it take effect.

	`source .bashrc`

# Practice
1. How to delete sth?

	```
	touch foo
	del foo
	```

2. How to undelete sth?

	1. Find the file name that you want to restore.

		`trash-list`
	
	2. Go to /home/$username/.local/share/Trash/files and save your file.
		
# Notice

Never use rm, until you correctly know what it does.



