---
layout: post
title: "NTP SyncTime"
description: ""
category: 
tags: []
---
{% include JB/setup %}
#### A basic step about synchronizing time using ntp.
## Install Ntp Server
In master server:

		sudo apt-get install ntp
		sudo service ntpd start

## Synchronizing time according to Master Server.
In all slavery servers:

		cmd='echo [Password]|sudo -S ntpdate [Master_Server]'
		for line in $(cat machinefile)
		do
			ssh $line "$cmd";
			if [ "$?" -eq "0" ]; then
			echo Success:$line.
			else
			echo Erro:$line.
			fi
		done
		


