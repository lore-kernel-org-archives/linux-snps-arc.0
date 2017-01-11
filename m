From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Wed, 11 Jan 2017 23:40:18 +0100
Subject: [uclibc-ng-devel] ARC uClibc-ng testsuite runs empty ?
In-Reply-To: <dde21784-c3e4-5a53-6d10-0ac640d18192@synopsys.com>
References: <f806e391-de89-5636-ab91-d4eb46e4f482@synopsys.com>
 <20170111204849.GH1913@waldemar-brodkorb.de>
 <dde21784-c3e4-5a53-6d10-0ac640d18192@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170111224018.GB20925@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi,
Vineet Gupta wrote,

> On 01/11/2017 12:48 PM, Waldemar Brodkorb wrote:
> > I reported the issue to Alexey last year.
> > We added your binutils maintainer to the thread.
> > Yesterday he had again time to reproduce the problem, but there was
> > some missing information I gave him yesterday.
> > 
> > So may be you can help with this?
> 
> It is beyond my area of expertise and Cuper is looking into it, it is in good
> hands already ;-)
> 
> OTOH the reason I was dabbling into this was to track down tst-getpid2 failure on
> ARC as reported in last known reports.
> 
> It seems glibc dropped this test and added a new one instead. See commit
> 0cb313f7cb0e41 ("Fix clone (CLONE_VM) pid/tid reset (BZ#19957)")
> 
> I tried copying over tst-clone2 into uClibc (with a hdr include adjustment), but
> it seems to runtime fail for me very early (atleast in nSIM).
> 
> | [ARCLinux]# ./tst-clone2
> | child pid (62) != received pid/tid (0/1606237724)
> | parent pid (61) != received pid/tid (0/1606237724)
> | [ARCLinux]# random: crng init done
> | echo $?
> | 2
> 
> Can you please double check this for other targets !

I have yesterday seen this commit
c579f48edba88380635ab98cb612030e3ed8691e in glibc and would 
like to follow here and remove any PID/TID caching.

Afterwards I can take a look into 0cb313f7cb0e41.
 
> > It is really blocking any complete regression testing :( 
> 
> I know sucks, lets hope Cuper nails it down quickly.

That would be really cool.

best regards
 Waldemar
