---
layout: post
title: "How to setup putty to auto connect to your computer"
description: ""
category: 
tags: []
---

# How to make putty(in Win7) auto connect to your computer(Linux)?
Let say, we have a windows computer A, and a linux computer B.
And We want use putty to auto connect B, from A.  
There's steps:
1. Use [puttygen.exe](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) to generate a public key and private key.
2. Save the public key inside linux(~/.ssh/authorized_keys)
3. Inside Putty
	1. In *Connection->Auth->Private key file for authentication*, select the private key you saved.
	2. In *Connection Data*, set *the Auto-login username* as the linux's username.
	3. In *Session*, set the *Host Name*
	4. In *Save Session*s, save the session as **YourSession**
4. Create a shortcut to putty, and in its *property*, change the *target* as : "C:\Program Files\Putty\putty.exe" -load **YourSession**
5. Click the shortcut, and let it go!


