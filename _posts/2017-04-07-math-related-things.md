---
layout: post
title: "Math Related Things"
---
# Relation between Density and Histrogram funcion
Given $$ X \sim f(x) $$ , where $$ f(x) $$ is the density function of $$ X $$ , and the width of each bin $$ W $$ , we can produce histrogram function $$ H(x) $$ , by 
sampling variable $$ X $$  $$ N $$ times, resulting in $$ x1,x2...xN $$ .  
Then, there's a conclusion: $$ H(x) \approx f(x) \times W \times N $$ .

# How to generate a random direction?
When doing academic research, I need to generate a random direction, i.e. it points to any direciton in an equalled probability. At first, I thought, assign each dimension a random value(Uniform Distribution) is sufficient. After second thought, I find out it's not correct.   
Let's say, a N-dimension direction $$ D $$ is defined by $$ D = (X_1, X_2...X_N) $$ . 

* If we just let $$ X_i $$ be a random variable, i.e. $$ \forall i=1,2..N, X_i \sim U(-1,-1) $$ , $$ D $$ is *NOT* a random direction.

* To generate a truly random direction, we can let $$ \forall i=1,2..N, X_i \sim N(0,1) $$ , where N(0,1) is  a Normal Distribution with $$ u=0 $$ , $$ \theta=1 $$ , at this time, $$ D = (X_1, X_2...X_N) $$ points to every direction in the same probability. And length of $$ D $$ , $$ R = \sqrt{(X_1^2 + X_2^2 + ... + X_N^2)} \sim N(0,1) $$ 
