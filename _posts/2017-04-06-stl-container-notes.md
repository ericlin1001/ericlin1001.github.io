---
layout: post
title: "STL container notes"
---

# Sequence container:
## array
Just like int a[], it's a simple wrapper of [];

## vector
### Modifier
push_back(),pop_back();
### Accesser
operator[],front(),back()

## deque
push_back(),pop_back();

## set
insert(), find(), erase();

# Non-sequence container:

## list
push_back(),pop_back();


## map
### Modifier
opertor[],insert(pair())
### Accesser
operator[],find()

# Adaptor

## stack
### Modifier
pop(), push();
### Accesser
top()

## priority_queue -> vector
### Modifier
pop(), push();
### Accesser
top()


## queue -> deque
### Modifier
push(),pop();
### Accesser
front(),back();


# Author: Eric Lin
