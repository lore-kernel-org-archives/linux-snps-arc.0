From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sun, 29 May 2016 04:25:48 -0000
Subject: kisskb: FAILED linus/axs103_smp_defconfig/arcv2 Sun May 29, 14:25
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201605290426.u4T4OBDZ038412@mx0a-001b2d01.pphosted.com>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs103_smp_defconfig/arcv2 Sun May 29, 14:25

http://kisskb.ellerman.id.au/kisskb/buildresult/12704252/

Commit:   hpfs: implement the show_options method
          037369b872940cd923835a0a589763180c4a36bc
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

fs/dcache.c:1673: undefined reference to `hashlen_string'
include/linux/sunrpc/svcauth.h:175: undefined reference to `hashlen_string'
include/linux/sunrpc/svcauth.h:175: undefined reference to `hashlen_string'
include/linux/sunrpc/svcauth.h:175: undefined reference to `hashlen_string'
include/linux/sunrpc/svcauth.h:175: undefined reference to `hashlen_string'
make[1]: *** [vmlinux] Error 1
make: *** [sub-make] Error 2

Possible warnings (17)
----------------------

kernel/sched/core.c:3210:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:742:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:299:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:175:1: warning: control reaches end of non-void function [-Wreturn-type]
