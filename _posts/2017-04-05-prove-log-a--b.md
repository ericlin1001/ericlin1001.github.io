---
layout: post
title: "Prove O(log(a+b))=O(log(a)+log(b))"
---
To prove: $$\mathbf{O}(\log{(a+b)})=\mathbf{O}(\log{a}+\log{b})$$  
We need to have:  
$$k_1\log{(a+b)} \le \log{a}+\log{b} \le k_2\log{(a+b)}$$  
is equivalent to:  
$$ k_1\log{(a+b)} \le \log{(a*b)} \le k_2\log{(a+b)}$$  

Let e's exponent of both side, we have:  
$$(a+b)^{k_1} \le a*b \le (a+b)^{k_2}$$

Let $$k_1=1, A=1, B = 1$$, we know $$\forall{a>A}, \forall{b>B}$$ and  $$ (a+b) \le a*b$$ is always satisfied.

Let $$k_2=2, A=1, B = 1$$, we know $$\forall{a>A}, \forall{b>B}$$ $$a*b \le (a+b)^2 \iff a*b \le a^2+2ab+b^2 \iff   0 \le a^2+ab+b^2$$ is always satisfied.

