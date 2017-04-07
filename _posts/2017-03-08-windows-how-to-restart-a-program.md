---
layout: post
title: "How to onekey to restart a program in Windows"
description: ""
category: 
tags: []
---

Sometimes, I need to restart a program frequently. So I write this script, to easily quckly restart a program.
Here are steps:
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
