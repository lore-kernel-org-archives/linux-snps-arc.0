From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Tue, 11 Apr 2017 22:52:25 +0200
Subject: static linking broken?
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170411205225.GD5361@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

it seems static linking is totally broken for ARC and uClibc-ng:

file root_nsim-arcv2_uclibc-ng_archs/bin/busybox 
root_nsim-arcv2_uclibc-ng_archs/bin/busybox: ELF 32-bit LSB
executable, *unknown arch 0xc3* version 1 (SYSV), dynamically
linked, interpreter *empty*, for GNU/Linux 4.8.0, stripped

I am using arc-2016.09-release within OpenADK.

Do you ever used static linking?

I only test with nsim, but can't use any static binaries.

best regards
 Waldemar
