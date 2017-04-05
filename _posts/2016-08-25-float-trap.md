---
layout: post
title: "Float trap"
description: ""
category: 
tags: []
---
{% include JB/setup %}
```
int i=0;
for(double x=0;x<10;x+=0.1){
	i++;
}
cout<<i<<endl;
```
Guess what's output?


```
int i=0;
for(double x=0;x<10;x+=0.1){
	i++;
	cout<<i<<setprecision(20)<<x<<endl;
}
cout<<i<<endl;
```
Well, this is accumulated float error.

