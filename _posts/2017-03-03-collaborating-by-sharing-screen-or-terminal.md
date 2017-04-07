---
layout: post
title: "Collaborating by sharing screen or terminal"
description: ""
category: 
tags: []
---

# [tmate](http://tmate.io)
Tmate is an instant terminal sharing application.

## How to use it?
1. run `tmate`
2. run `tmate show-messages`
3. get the web url from the result of last command


# [screen](https://www.gnu.org/software/screen/)
---
[About how to remote working together on a terminal session in linux](http://technonstop.com/screen-commands-for-terminal-sharing).

## Teacher side

`screen -d -R hello`

## Students side

`screen -x hello`

# Others potential options
---
1. Open Broadcast Studio(obs)
	It's a software to capture and stream it to a RTMP(Real Time Message Protocol) server.

2. RMTP server(e.g. [MonaServer](https://sourceforge.net/projects/monaserver))
	A server to receive stream, and play it.

3. [doitlive](http://doitlive.readthedocs.io/en/latest/)

4. [asciinema](https://asciinema.org)
	a tool to record your terminal operation, and replay it if you wish.

