---
layout: post
title: "Windows_How_to_restart_a_program"
description: ""
category: 
tags: []
---
{% include JB/setup %}

1. Save following code as **restart.bat**.
```
taskkill /F /IM  [process's name]
./start.vbs
```

2. Save following code as **start.vbs**, in the same directory.
```
Set ws = CreateObject("WScript.Shell")
ws.Run "[the full path of exe file]"
```

3. Just double click the **restart.bat**
