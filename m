From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 6 Nov 2017 17:15:01 -0800
Subject: [gcc] backport of gcc patch to #gcc-7-branch
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e5d18586-2f4f-ebbe-6c54-b1275f67c4f4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

As part of porting glibc to ARC one of the pre-req is to get it to build with 
upstream toolchain components. The patch 927c0132251f ("[ARC] Configure script to 
allow non uclibc based triplets") seems to be present in gcc #master, but not in 
#gcc-7-branch. Can it be backported to gcc 7 please.

Thx,
-Vineet
