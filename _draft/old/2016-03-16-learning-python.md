---
layout: post
title: "Learning Python"
description: ""
category: 
tags: []
---
{% include JB/setup %}

#### Learning Python
----- 

Reference Url: https://docs.python.org/3.4/tutorial/ 

### Tips in IPython:
* edit _i  | edit the last input.
* edit _   | edit the last output.
* load file| load file.
* () is tuple.
* [] is list.

### Code Examples:
	def printTD(tuples,dicts):
		"""it receives two args,  tuples, dicts."""
		for i in range(len(tuples)):
			print("tuples[" + str(i) + "] = " + str(tuples[i]), end = ',');
		keys = sorted(dicts.keys(), key = lambda x:len(x));
		for j in keys:
			print("dicts[" + str(j) + "] = " + str(dicts[j]), end = ',');

	def foo(arg0,  *tuples,  **dicts):
		"""This is foo function, it receives any number of args."""
		print("foo.__doc__ = " + foo.__doc__);
		print("foo(arg0:"+str( arg0), end = ',');
		printTD(tuples, dicts);
		print(")");
		bar( *tuples,  ** dicts);

	def bar(arg0, arg1,  *tuples,  **dicts):
		"""This is bar function"""
		print("bar.__doc__ = " + bar.__doc__);
		print("bar(arg0:" + str(arg0) + ", arg1:" + str(arg1), end = ',');
		printTD(tuples, dicts);
		print(")");
	
# Run: 
	foo("a", "1", 2, "3", mykey1 = 123, adfadfK = 123145, afadf = "afdadf")

# Output: 
	foo.__doc__  =  This is foo function,  it receives any number of args.
	foo(arg0:a, tuples[0]  =  1, tuples[1]  =  2, tuples[2]  =  3, dicts[afadf]  =  afdadf, dicts[mykey1]  =  123, dicts[adfadfK]  =  123145, )
	bar.__doc__  =  This is bar function
	bar(arg0:1, arg1:2, tuples[0]  =  3, dicts[afadf]  =  afdadf, dicts[mykey1]  =  123, dicts[adfadfK]  =  123145, )


