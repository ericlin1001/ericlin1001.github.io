---
layout: post
title: "RandFindings"
description: ""
category: 
tags: []
---
{% include JB/setup %}
2-dimensions vector(X,Y), with X,Y s.t. Uniform Distribution, 
	will leads the direction<X,Y> Not s.t. Uniform Distribution.
	They will locate more in 45,135,225,315 degree's direction.

###To correctly produce random direction in N-dimension space
	let Xi ~ N(0,1), Xi is independent with Xj, for any i,j;
	then <X1,X2...,XN> is a random direction, with r=sqrt(X1^2+X2^2+...+XN^2) ~ N.

