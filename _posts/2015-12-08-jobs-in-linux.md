---
layout: post
title: "Jobs In Linux"
description: ""
category: 
tags: ["Linux" ]
---

The general job control commands in Linux are:

| jobs | list the current jobs
| fg | resume the job that's next in the queue
| fg %[number] | resume job [number]
| bg | Push the next job in the queue into the background
| bg %[number] | Push the job [number] into the background
| kill %[number] | Kill the job numbered [number]
| kill -[signal] %[number] | Send the signal [signal] to job number [number]
| disown %[number] | disown the process(no more terminal will be owner), so command will be alive even after closing the terminal.

That's pretty much all of them. Note the % infront of the job number in the commands - this is what tells kill you're talking about jobs and not processes.


Note bash lets you skip the fg if you specify a job number.

For example, these are equivalent and resume the latest job:
~~~
%
%%
fg
fg %
~~~

These resume job #4:
~~~
%4
fg 4
~~~
