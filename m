From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sun, 29 May 2016 08:39:14 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Sun May 29, 18:38
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201605290840.u4T8cc48012409@mx0a-001b2d01.pphosted.com>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Sun May 29, 18:38

http://kisskb.ellerman.id.au/kisskb/buildresult/12704515/

Commit:   Rename other copy of hash_string to hashlen_string
          f2a031b66ec6da1512f9db228e4174ad2c7d2688
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

kernel/sched/core.c:3210:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:742:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:299:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/sunrpc/svc_xprt.h:175:1: warning: control reaches end of non-void function [-Wreturn-type]
