---
layout: post
title: "STL container"
---

# Sequence container:
1. array  
Just like int a[], it's a simple wrapper.

2. vector
	* front()
	* back()
	* operator[]
	* push_back()
	* pop_back();

3. deque
	* front()
	* back()
	* operator[]
	* push_front()
	* push_back()
	* pop_front();
	* pop_back();

4. set
	* insert()
	* find()
	* erase();

# Non-sequence container:

1. list
Doubly-linked lists.
	* front()
	* back()
	* push_front()
	* push_back()
	* pop_front();
	* pop_back();


2. map
	* opertor[]
	* insert(pair())
	* operator[]
	* find()

# Adaptor

1. stack
	* top()
	* push();
	* pop()

2. priority_queue(underlying containter: vector)
	* top()
	* push();
	* pop()


3. queue (underlying containter: deque)
	* front()
	* back();
	* push()
	* pop();


