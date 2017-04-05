---
layout: post
title: "SubtleErros"
description: ""
category: 
tags: []
---
{% include JB/setup %}

To use function:sort in <algorithm>, be careful the compare function, it must stafisfy the following condtions:
Strick weak ordering:
* For all a, comp(a,a)==false
* if comp(a,b)==true, then comp(b,a)==false
* if comp(a,b)==true and comp(b,c)==true then comp(a,c)==true.

There is subtle case, extracted from a project.
{% highlight cpp %}

#include<iostream>
#include<cmath>
#include<assert.h>
#include<algorithm>

#define INF 1E99
using namespace std;
#define Max 101
double y[Max]={999999999999999967336168804116691273849533185806555472917961779471295845921727862608739868455469056.000000,999999999999999967336168804116691273849533185806555472917961779471295845921727862608739868455469056.000000,0.268631,0.223484,0.213363,0.203873,0.173396,0.171805,0.147066,0.135305,0.134438,0.093370,0.089916,0.081520,0.071410,0.054217,0.053685,0.051608,0.050618,0.050609,0.049449,0.047833,0.044590,0.044254,0.042998,0.041539,0.041011,0.038471,0.037384,0.037166,0.034642,0.034594,0.033551,0.033043,0.031951,0.031941,0.030951,0.030664,0.030208,0.029337,0.028936,0.028868,0.028305,0.027229,0.026968,0.026251,0.023536,0.023084,0.021200,0.021200,0.020107,0.020075,0.019947,0.018689,0.018667,0.018572,0.018344,0.017546,0.017215,0.016306,0.004288,0.015338,0.015144,0.014992,0.015005,0.012036,0.014128,0.014105,0.013985,0.013434,0.012250,0.013691,0.011912,0.011595,0.011551,0.011333,0.011783,0.011277,0.010987,0.010294,0.010187,0.008622,0.008548,0.008067,0.008052,0.007850,0.007344,0.007235,0.007142,0.007064,0.006905,0.006130,0.005503,0.005436,0.005128,0.004613,0.004352,0.004099,0.003833,0.002572,0.013791};
int x[Max+50];
bool cmp(const int a,const int b){
	if(!(a>=0&&a<Max&&b>=0&&b<Max))assert(false);
	//return false;
	return y[a]>y[b];
//	if(y[a]>=y[b])return true;
//	return false;
}
int main(){
	//int x[5]={0,1,2,3,4};
	int n=Max;
	for(int i=0;i<n;i++){
		x[i]=i;
	}
	sort(x,x+n,cmp);
	for(int i=0;i<Max;i++){
		cout<<y[x[i]]<<",";
	}
	cout<<"Hello"<<endl;
	return 0;
}
{% endhighlight %}


