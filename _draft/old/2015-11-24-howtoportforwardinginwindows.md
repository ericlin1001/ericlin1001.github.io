---
layout: post
title: "HowtoPortforwardingInWindows"
description: ""
category: 
tags: []
---

How to ssh to host without username?
create a file(config) in ~/.ssh/ containing the following contents:

    Host hostname
    User username


where hostname is the your hostname you want to login in, usernmae is the username you want to use to login in .
To login in without passward, cp content of ~/.ssh/id_rsa.pub into remote host ~/.ssh/authorized_keys .


PortForwarding in Win7:
forward localhost:1234 to remote host 192.168.1.5:4321

    netsh interface portproxy add v4tov4 listenport=1234 connectaddress=192.168.1.5 connectport=4321
    netsh firewall set portopening TCP 1234 ENABLE

