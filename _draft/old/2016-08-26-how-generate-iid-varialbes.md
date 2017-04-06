---
layout: post
title: "How generate iid varialbes"
description: ""
category: 
tags: []
---
{% include JB/setup %}
###How to generate independent identical distribution variables(iid.)?
Well, in C++, a random number sequence is enough, becase in some sense, every number in the sequence is independent and randomized. From every position of the sequence, the following sequence still follows the same distribution.

In nutshell, to generate two more idd. vars in C++, i.e. generate N independent sequences, you just need to generate one sequence and divide it into N ones.

###Experiment
I have done a experiment, with Gaussian random distribution.
Let the G() be the function that generates Gaussian random numbers.
'''
a[1000];
b[1000];
for(i=0;i<1000;i++){
	a[i]=G();
}
for(i=0;i<1000;i++){
	b[i]=G();
}
'''
From G(), we have two sequences '''a''','''b'''. And i draw the histrograms of '''a''' and '''b''', and their shapes are still the same as Normal Distribution, and the correlation of '''a''' and '''b''' is nearly equalled to  0.
