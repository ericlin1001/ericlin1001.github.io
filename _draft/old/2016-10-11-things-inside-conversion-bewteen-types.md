---
layout: post
title: "Things Inside Conversion Bewteen Types"
description: ""
category: 
tags: []
---

#Things inside conversion of different types
What happens when converting variables between different types? (C++)


#Program to find the truth

```
#include<iostream>
using namespace std;

//
typedef unsigned char byte;
typedef signed char sbyte;
typedef unsigned int dword;
typedef signed int sdword;
//

enum MyType{TYPE_UNKNOW,TYPE_BYTE,TYPE_SBYTE,TYPE_DWORD,TYPE_SDWORD};
template<class T>
MyType getType(const T t){return TYPE_UNKNOW;}
MyType getType(const dword t){return TYPE_DWORD;}
MyType getType(const sdword t){return TYPE_SDWORD;}
MyType getType(const byte t){return TYPE_BYTE;}
MyType getType(const sbyte t){return TYPE_SBYTE;}

template <class T>
const char *getTypeName(const T t){
	switch(getType(t)){
		default:
		case TYPE_UNKNOW:
			return "Unknow";
		case TYPE_BYTE:
			return "Unsigned Byte";
		case TYPE_SBYTE:
			return "Signed Byte\t";
		case TYPE_DWORD:
			return "Unsigned Double Word";
		case TYPE_SDWORD:
			return "Signed Double Word";
	};
}
template<class T>
bool getByte(const T b,int i){
	unsigned long k=1;
	k<<=i;
	return (b&k)==k;
	//return ((b>>i)&0x1)==0x1;
}
//
template <class T>
inline void _printB(const T t,int numBits){
	//like a memory [high ... low]
	//print from high address bits, to low address bits.
	for(int i=numBits-1;i>=0;i--){
		cout<<getByte(t,i);
	}
}

template <class T>
inline void printB(const T t,int numBits=-1){
	if(numBits==-1){
		if(getType(t)==TYPE_BYTE||getType(t)==TYPE_SBYTE){
			numBits=8;
		}else{
			numBits=32;
		}
	}
	_printB(t,numBits);
}

template<class T>
void printT(const T t){
	if(getType(t)==TYPE_BYTE||getType(t)==TYPE_SBYTE){
		cout<<(int)t;
	}else{
		cout<<t;
	}
}
//
template<class T>
void testType(T t){
#define print(m) cout<<#m"\t";printT(m);cout<<"\t";printB(m);cout<<endl;
	byte b=t;
	sbyte sb=t;
	dword dw=t;
	sdword sdw=t;
#define ToWhat(v) cout<<"To "<<getTypeName(v)<<"\t";print(v);
	ToWhat(b);
	ToWhat(sb);
	ToWhat(dw);
	ToWhat(sdw);
	cout<<endl;
}
void testAllType(){
#define ShowTest(v,cmd) cmd;\
	cout<<"After run command:"#cmd""<<endl;\
	cout<<"From "<<getTypeName(v)<<"\t";print(v);\
	cout<<"---"<<endl;\
	testType(v);cout<<endl;

#define ShowTests(v)  \
	ShowTest(v,v=128);\
	ShowTest(v,v=127);\
	ShowTest(v,v++);\
	ShowTest(v,v++);\
	ShowTest(v,v=-1);\
	ShowTest(v,v--);\
	ShowTest(v,v=0xffffff00+64);\

	byte b;
	sbyte sb;
	dword dw;
	sdword sdw;
	//
	ShowTests(b);
	ShowTests(sb);
	ShowTests(dw);
	ShowTests(sdw);
	//
}
int main(){
	testAllType();
	return 0;
}
```


#The result of program.

```
After run command:b=128
From Unsigned Byte	b	128	10000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	128	00000000000000000000000010000000
To Signed Double Word	sdw	128	00000000000000000000000010000000


After run command:b=127
From Unsigned Byte	b	127	01111111
---
To Unsigned Byte	b	127	01111111
To Signed Byte		sb	127	01111111
To Unsigned Double Word	dw	127	00000000000000000000000001111111
To Signed Double Word	sdw	127	00000000000000000000000001111111


After run command:b++
From Unsigned Byte	b	128	10000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	128	00000000000000000000000010000000
To Signed Double Word	sdw	128	00000000000000000000000010000000


After run command:b++
From Unsigned Byte	b	129	10000001
---
To Unsigned Byte	b	129	10000001
To Signed Byte		sb	-127	10000001
To Unsigned Double Word	dw	129	00000000000000000000000010000001
To Signed Double Word	sdw	129	00000000000000000000000010000001


After run command:b=-1
From Unsigned Byte	b	255	11111111
---
To Unsigned Byte	b	255	11111111
To Signed Byte		sb	-1	11111111
To Unsigned Double Word	dw	255	00000000000000000000000011111111
To Signed Double Word	sdw	255	00000000000000000000000011111111


After run command:b--
From Unsigned Byte	b	254	11111110
---
To Unsigned Byte	b	254	11111110
To Signed Byte		sb	-2	11111110
To Unsigned Double Word	dw	254	00000000000000000000000011111110
To Signed Double Word	sdw	254	00000000000000000000000011111110


After run command:b=0xffffff00+64
From Unsigned Byte	b	64	01000000
---
To Unsigned Byte	b	64	01000000
To Signed Byte		sb	64	01000000
To Unsigned Double Word	dw	64	00000000000000000000000001000000
To Signed Double Word	sdw	64	00000000000000000000000001000000


After run command:sb=128
From Signed Byte		sb	-128	10000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	4294967168	11111111111111111111111110000000
To Signed Double Word	sdw	-128	11111111111111111111111110000000


After run command:sb=127
From Signed Byte		sb	127	01111111
---
To Unsigned Byte	b	127	01111111
To Signed Byte		sb	127	01111111
To Unsigned Double Word	dw	127	00000000000000000000000001111111
To Signed Double Word	sdw	127	00000000000000000000000001111111


After run command:sb++
From Signed Byte		sb	-128	10000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	4294967168	11111111111111111111111110000000
To Signed Double Word	sdw	-128	11111111111111111111111110000000


After run command:sb++
From Signed Byte		sb	-127	10000001
---
To Unsigned Byte	b	129	10000001
To Signed Byte		sb	-127	10000001
To Unsigned Double Word	dw	4294967169	11111111111111111111111110000001
To Signed Double Word	sdw	-127	11111111111111111111111110000001


After run command:sb=-1
From Signed Byte		sb	-1	11111111
---
To Unsigned Byte	b	255	11111111
To Signed Byte		sb	-1	11111111
To Unsigned Double Word	dw	4294967295	11111111111111111111111111111111
To Signed Double Word	sdw	-1	11111111111111111111111111111111


After run command:sb--
From Signed Byte		sb	-2	11111110
---
To Unsigned Byte	b	254	11111110
To Signed Byte		sb	-2	11111110
To Unsigned Double Word	dw	4294967294	11111111111111111111111111111110
To Signed Double Word	sdw	-2	11111111111111111111111111111110


After run command:sb=0xffffff00+64
From Signed Byte		sb	64	01000000
---
To Unsigned Byte	b	64	01000000
To Signed Byte		sb	64	01000000
To Unsigned Double Word	dw	64	00000000000000000000000001000000
To Signed Double Word	sdw	64	00000000000000000000000001000000


After run command:dw=128
From Unsigned Double Word	dw	128	00000000000000000000000010000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	128	00000000000000000000000010000000
To Signed Double Word	sdw	128	00000000000000000000000010000000


After run command:dw=127
From Unsigned Double Word	dw	127	00000000000000000000000001111111
---
To Unsigned Byte	b	127	01111111
To Signed Byte		sb	127	01111111
To Unsigned Double Word	dw	127	00000000000000000000000001111111
To Signed Double Word	sdw	127	00000000000000000000000001111111


After run command:dw++
From Unsigned Double Word	dw	128	00000000000000000000000010000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	128	00000000000000000000000010000000
To Signed Double Word	sdw	128	00000000000000000000000010000000


After run command:dw++
From Unsigned Double Word	dw	129	00000000000000000000000010000001
---
To Unsigned Byte	b	129	10000001
To Signed Byte		sb	-127	10000001
To Unsigned Double Word	dw	129	00000000000000000000000010000001
To Signed Double Word	sdw	129	00000000000000000000000010000001


After run command:dw=-1
From Unsigned Double Word	dw	4294967295	11111111111111111111111111111111
---
To Unsigned Byte	b	255	11111111
To Signed Byte		sb	-1	11111111
To Unsigned Double Word	dw	4294967295	11111111111111111111111111111111
To Signed Double Word	sdw	-1	11111111111111111111111111111111


After run command:dw--
From Unsigned Double Word	dw	4294967294	11111111111111111111111111111110
---
To Unsigned Byte	b	254	11111110
To Signed Byte		sb	-2	11111110
To Unsigned Double Word	dw	4294967294	11111111111111111111111111111110
To Signed Double Word	sdw	-2	11111111111111111111111111111110


After run command:dw=0xffffff00+64
From Unsigned Double Word	dw	4294967104	11111111111111111111111101000000
---
To Unsigned Byte	b	64	01000000
To Signed Byte		sb	64	01000000
To Unsigned Double Word	dw	4294967104	11111111111111111111111101000000
To Signed Double Word	sdw	-192	11111111111111111111111101000000


After run command:sdw=128
From Signed Double Word	sdw	128	00000000000000000000000010000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	128	00000000000000000000000010000000
To Signed Double Word	sdw	128	00000000000000000000000010000000


After run command:sdw=127
From Signed Double Word	sdw	127	00000000000000000000000001111111
---
To Unsigned Byte	b	127	01111111
To Signed Byte		sb	127	01111111
To Unsigned Double Word	dw	127	00000000000000000000000001111111
To Signed Double Word	sdw	127	00000000000000000000000001111111


After run command:sdw++
From Signed Double Word	sdw	128	00000000000000000000000010000000
---
To Unsigned Byte	b	128	10000000
To Signed Byte		sb	-128	10000000
To Unsigned Double Word	dw	128	00000000000000000000000010000000
To Signed Double Word	sdw	128	00000000000000000000000010000000


After run command:sdw++
From Signed Double Word	sdw	129	00000000000000000000000010000001
---
To Unsigned Byte	b	129	10000001
To Signed Byte		sb	-127	10000001
To Unsigned Double Word	dw	129	00000000000000000000000010000001
To Signed Double Word	sdw	129	00000000000000000000000010000001


After run command:sdw=-1
From Signed Double Word	sdw	-1	11111111111111111111111111111111
---
To Unsigned Byte	b	255	11111111
To Signed Byte		sb	-1	11111111
To Unsigned Double Word	dw	4294967295	11111111111111111111111111111111
To Signed Double Word	sdw	-1	11111111111111111111111111111111


After run command:sdw--
From Signed Double Word	sdw	-2	11111111111111111111111111111110
---
To Unsigned Byte	b	254	11111110
To Signed Byte		sb	-2	11111110
To Unsigned Double Word	dw	4294967294	11111111111111111111111111111110
To Signed Double Word	sdw	-2	11111111111111111111111111111110


After run command:sdw=0xffffff00+64
From Signed Double Word	sdw	-192	11111111111111111111111101000000
---
To Unsigned Byte	b	64	01000000
To Signed Byte		sb	64	01000000
To Unsigned Double Word	dw	4294967104	11111111111111111111111101000000
To Signed Double Word	sdw	-192	11111111111111111111111101000000


```




#Observation
1. When a signed varialbe Var is converted to a bigger-size variable NewVar, the new expanding high bits are filled with the same bit as the highest bit of Var, i.e. if Var is positive, NewVar is filled with 0, while if Var is negative, NewVar is filled with 1.

2. When a unsigned variable is converted to a bigger-size variable, the expanding bits are filled with 0.

3. When a variable is converted to a less-size variable, cut the high bits directly.


#Conclusion
In a nutshell, to expand a Var to a bigger size, fill with 0 if Var is a unsigned or Var is postive, otherwise 1.

