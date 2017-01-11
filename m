From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 11 Jan 2017 09:53:02 -0800
Subject: ARC uClibc-ng testsuite runs empty ?
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f806e391-de89-5636-ab91-d4eb46e4f482@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

It seems ARC results are no present for recent releases:

e.g. following is empty:
http://tests.embedded-test.org/uClibc-ng/1.0.21/REPORT.arcv2.toolchain.uClibc-ng-1.0.21

The last good one seems to be
http://tests.embedded-test.org/uClibc-ng/1.0.19/REPORT.arcv2.libc.uClibc-ng-1.0.19

Is this due to the init_module/delete_module change which has been reverted after
1.0.21

Thx,
-Vineet
