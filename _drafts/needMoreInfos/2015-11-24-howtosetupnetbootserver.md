---
layout: post
title: "HowToSetupNetBootServer"
description: ""
category: 
tags: []
---
# Dnsmasq can be installed in ubuntu, by issuing following command:
sudo apt-get install dnsmasq

# prerequest:
#This server should be set up as obatiaing static ip, such as 10.0.0.254
#This file is /etc/dnsmasq.conf
#the interface conntect to lan.
interface=eth1

# anything you like
domain=yourdomain.com


# The dynamic ip range on your lan, which is managed by DHCP
dhcp-range=10.0.0.100,192.168.0.199,255.255.255.0,1h

# The filename use by client.
dhcp-boot=pxelinux.0

# something i don't really know about.
pxe-service=x86PC, "Install Linux", pxelinux

# enable built-in tftp server
enable-tftp

# Where you put the necessary files. E.g., you can download netboot.tar.gz from main page of ubuntu, and extract it into the following directory.
tftp-root=/var/lib/tftpboot



# Some note:
To find other computers among the lan(eth0), issue command:
arp-scan -interface eth0 -l

