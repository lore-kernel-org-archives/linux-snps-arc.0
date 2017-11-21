From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Nov 2017 13:25:51 -0800
Subject: glibc: nptl/tst-cancel17 and librt issue
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I've been trying to run glibc test suite as part of prereq for ARC port 
submission, running into some landmines.

make subdirs=nptl check fails as librt.so fails to link due to missing pthread 
symbols. The real librt built does have libpthread.so in its link cmd hence is 
fine, but not this librt.

This issue is seen for aarc64 cross builds too.

make -k doesn't cure it and check stops midway anyways.

Any tips on how to fix those. I'm still trying to come to grips with glibc build 
system

TIA,
-Vineet
