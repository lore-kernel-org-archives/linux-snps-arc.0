From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 03 Jun 2016 09:59:30 -0000
Subject: kisskb: OK linux-next/axs103_smp_defconfig/arcv2 Fri Jun 03, 19:58
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160603095930.1.92910@ba5591fa2a1b>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs103_smp_defconfig/arcv2 Fri Jun 03, 19:58

http://kisskb.ellerman.id.au/kisskb/buildresult/12706367/

Commit:   Add linux-next specific files for 20160531
          05f29d5380397c1748ae2aeed9eeb268ee47dff1
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

kernel/sched/core.c:3210:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:742:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:299:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
