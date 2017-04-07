---
layout: post
title: "Understand output of `diff`"
description: ""
category: 
tags: ["diff"]
---

# Abstract Explanation
The normal output format of `diff` consists of one or more chunks of differences, each hunk shows one area where two files differ.  Normal format hunks
look like this:
~~~
COMMAND
< FROM-FILE-LINE
< FROM-FILE-LINE...
---
> TO-FILE-LINE
> TO-FILE-LINE...
~~~

There are three types of COMMAND.  Each consists of a line
number or comma-separated range of lines followed by a single
character indicating the sort of change to make, and a line number or
comma-separated range of lines in the second file. The types of change commands
are:

1. `LaR`  
Add the lines in range R of the second file after line L of the
first file.  For example, `8a12,15` means append lines 12-15 of
file 2 after line 8 of file 1; or, if changing file 2 into file 1,
delete lines 12-15 of file 2.

2. `FcT`  
Replace the lines in range F of the first file with lines in range
T of the second file.  This is like a combined add and delete, but
more compact.  For example, `5,7c8,10` means change lines 5-7 of
file 1 to read as lines 8-10 of file 2; or, if changing file 2 into
file 1, change lines 8-10 of file 2 to read as lines 5-7 of file 1.

3. `RdL`  
Delete the lines in range R from the first file; line L is where
they would have appeared in the second file had they not been
deleted.  For example, `5,7d3` means delete lines 5-7 of file 1;
or, if changing file 2 into file 1, append lines 5-7 of file 1
after line 3 of file 2.

# Example
We have an original file *a.txt*, like this:
~~~
line1
hello word!
This is line two.
End of file.
~~~
And we change file *a.txt* to *b.txt*, content of *b.txt*:
~~~
hello word!
This is line two, add sth to line two.
Insert a new line, in line3.
End of file.
Insert another new line after the end of file line.
~~~
And we run `diff a.txt b.txt` to show what's the differences between two file, we have the following result:
~~~
1d0
< line1
3c2,3
< This is line two.
---
> This is line two, add sth to line two.
> Insert a new line, in line3.
4a5
> Insert another new line after the end of file line.
~~~
There three change COMMAND: `1d0`, `3c2,3`, `4a5`.
1. `1d0` means *delete* the 1th line of *a.txt* to transform it to *b.txt*, 0 is useless.
2. `3c2,3` means *change* 3th line of *a.txt* to
3. `4a5` means *append* the following lines to transform *a.txt* to *b.txt*.
