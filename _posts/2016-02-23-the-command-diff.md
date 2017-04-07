---
layout: post
title: "The Command diff"
description: ""
category: 
tags: []
---
{% include JB/setup %}
The normal output format consists of one or more hunks of differences;
each hunk shows one area where the files differ.  Normal format hunks
look like this:

CHANGE-COMMAND
< FROM-FILE-LINE
< FROM-FILE-LINE...
---
> TO-FILE-LINE
> TO-FILE-LINE...

There are three types of change commands.  Each consists of a line
number or comma-separated range of lines in the first file, a single
character indicating the kind of change to make, and a line number or
comma-separated range of lines in the second file.  All line numbers are
the original line numbers in each file.  The types of change commands
are:

`LaR'
Add the lines in range R of the second file after line L of the
first file.  For example, `8a12,15' means append lines 12-15 of
file 2 after line 8 of file 1; or, if changing file 2 into file 1,
	 delete lines 12-15 of file 2.

	 `FcT'
	 Replace the lines in range F of the first file with lines in range
	 T of the second file.  This is like a combined add and delete, but
	 more compact.  For example, `5,7c8,10' means change lines 5-7 of
	 file 1 to read as lines 8-10 of file 2; or, if changing file 2 into
	 file 1, change lines 8-10 of file 2 to read as lines 5-7 of file 1.

	 `RdL'
	 Delete the lines in range R from the first file; line L is where
	 they would have appeared in the second file had they not been
	 deleted.  For example, `5,7d3' means delete lines 5-7 of file 1;
	 or, if changing file 2 into file 1, append lines 5-7 of file 1
	 after line 3 of file 2.
