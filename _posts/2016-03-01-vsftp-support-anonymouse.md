---
layout: post
title: "VSFTP support anonymouse"
description: ""
category: 
tags: []
---
{% include JB/setup %}
Configuration like this:
anon_root=~/ftp/anonymous
mkdir ~/ftp/anonymous/upload
where ~/ftp/anonymous doesn't have write access, ~/ftp/anonymous/upload does have wirte access.
And anonymous users upload files to ~/ftp/anonymous/upload/
~/ftp/anonymous/ may should be owned by ftp user,
	while ~/ftp/anonymous/upload/ can be owned by anyones.



