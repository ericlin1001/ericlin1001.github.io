---
layout: post
title: "NotesOfOrdering"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Basic explantion

1. Preorder
reflexive, transitive

2. Partial order(non-strict)
reflexive, antisymmetric, transitive.

2. Partial order(strict)
irreflexive, antisymmetric, transitive.

3. Total order
total, antisymmetric, transivtive

4. Strict weak orderings(strict partial order and transitivityOfIncomparability)
irreflexive, antisymmetric, transitivity, transitivityOfIncomparability

5. Well-order(total order and every non-empty subset of S has a leat element)
total, antisymmetric, transivtive, leastOfSubset


# Some definition
Suppose P is a set and R(<=) is a relation on P, then we have following definition, for all a, b, c in P:

1. reflexive: `a<=a `
2. antisymmetric: `if a<=b and b<=a then a=b(if a<=b and a!=b then b<=a must NOT hold)`
3. transitivity: `if a<=b and b<=c then a<=c`
4. totality: `a<=b or b<=a (it deduces reflexive)`

5. comparability(a, b): `a<b or a<b`
6. incomparability(a, b): `neither a<b nor b<a`
7. transitivityOfIncomparability: `for all a, b ,c, if incomparability(a,b) and incomparability(b,c), then incomparability(a,c)`
8. leastOfSubset: `for all non-empty subset A of S, there exits a least element is A`
9. irreflexive: `not a<=a`

# strict <==> non-strict
If <= if a non-strict partial order, then the corresponding non-strict partial order <= is the reflexive closure given by:

`a<b if a<=b and a!=b`

Conversely, strict ==> non-strict

`a<=b if a<b or a=b.`

# Reference
[Order theory](https://en.wikipedia.org/wiki/Order_theory)

[List of order theory topics](https://en.wikipedia.org/wiki/List_of_order_theory_topics)
