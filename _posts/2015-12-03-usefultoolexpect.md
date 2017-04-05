---
layout: post
title: "UsefulTool:Expect"
description: ""
category: 
tags: []
---
{% include JB/setup %}
### Expect

Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc. Expect really makes this stuff trivial. Expect is also useful for testing these same applications. And by adding Tk, you can also wrap interactive applications in X11 GUIs.

More details can be found:http://expect.sourceforge.net/
-----

There is my example:

	#!/usr/bin/expect
	set timeout 2
	spawn ssh middle

	expect "$"
	send "./startRun.sh\r"

	expect "Password:"
	send "cluster510\r"

	expect ":"
	send "cluster510\r"

	expect "$"
	send "su cluster\r"

	expect "Password:"
	send "cluster510\r"

	expect "$"
	send "cd ~/linjunhao/Projects\r"
	interact
	#expect eof

