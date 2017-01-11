From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Wed, 11 Jan 2017 21:48:50 +0100
Subject: [uclibc-ng-devel] ARC uClibc-ng testsuite runs empty ?
In-Reply-To: <f806e391-de89-5636-ab91-d4eb46e4f482@synopsys.com>
References: <f806e391-de89-5636-ab91-d4eb46e4f482@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170111204849.GH1913@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Vineet Gupta wrote,

> Hi Waldemar,
> 
> It seems ARC results are no present for recent releases:
> 
> e.g. following is empty:
> http://tests.embedded-test.org/uClibc-ng/1.0.21/REPORT.arcv2.toolchain.uClibc-ng-1.0.21

Toolchain is always empty, it just shows toolchain building runs
fine.
 
> The last good one seems to be
> http://tests.embedded-test.org/uClibc-ng/1.0.19/REPORT.arcv2.libc.uClibc-ng-1.0.19
> 
> Is this due to the init_module/delete_module change which has been reverted after
> 1.0.21

No, the problem is the removal of the testsuite from uClibc-ng.
Now the test suite is compiled as a part of normal applications and 
arc binutils segfaults.

I reported the issue to Alexey last year.
We added your binutils maintainer to the thread.
Yesterday he had again time to reproduce the problem, but there was
some missing information I gave him yesterday.

So may be you can help with this?

It is really blocking any complete regression testing :( 

Sorry for late response, my mailman has disappeared and no
mailinglist mails where sent out for some days.

best regards
 Waldemar
