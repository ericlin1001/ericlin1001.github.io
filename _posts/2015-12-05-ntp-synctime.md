---
layout: post
title: "How to synchronize time across a cluster?"
description: ""
category: 
tags: ["NTP", "Cluster"]
---

# A basic step about synchronizing time using ntp.
1. Install Ntp Server in master computer.
Run following commands in master computer:
```
sudo apt-get install ntp
sudo service ntpd start
```

2. Synchronizing time in all slavery computers.  
	Assume we have setup phaseless ssh to all slavery computers, and `machinefile` contains all slavery computers's host names. Then, run following commands in master computer, will let all slavery computers synchronize time based on master coputer. `[Password]` is sudoer's password, `[Master_Server]` is host name of master computer.
~~~
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
~~~
	


