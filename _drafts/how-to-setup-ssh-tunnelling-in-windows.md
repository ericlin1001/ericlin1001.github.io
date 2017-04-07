---
layout: post
title: "How to setup ssh tunnelling in windows"
description: ""
category: 
tags: ["SSH", "Tunnelling"]
---

# Situation
You have a middle computer A, says OS is win7, the middle computer A connects to a inside computer B, which has access to inner network. And each time, you wan to access the inner network, you have to connect to the middle computer A first, and then connec to the inside computer B.  
The problem is: Does it exists a way to direct connect to B from outside network.
The answer is:  Yes, it exists, and it's ssh tunnelling.  

# How to do that?
1. First, setup port(22) forwarding in computer A(Win7).
PortForwarding in Win7:
	E.g. We want to forward localhost(A):1234 to remote host(B) 192.168.1.5:22
	`netsh interface portproxy add v4tov4 listenport=1234 connectaddress=192.168.1.5 connectport=22`

2. Enable firewall to accept data from port 1234 in computer A(win7)
	`netsh firewall set portopening TCP 1234 ENABLE`
3. That's it.
	Now you access inside computer(B) from outside computer C,  by run `ssh <A-ip>:1234`, <A-ip> is the ip of computer A.
	
