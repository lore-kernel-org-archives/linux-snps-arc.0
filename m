From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 11 Jul 2016 09:02:46 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Mon Jul 11, 19:02
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160711090246.1.16080@2186539ca1fc>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Mon Jul 11, 19:02

http://kisskb.ellerman.id.au/kisskb/buildresult/12742500/

Commit:   tmpfs: fix regression hang in fallocate undo
          7f556567036cb7f89aabe2f0954b08566b4efb53
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

kernel/sched/core.c:3226:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:742:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:299:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:420:1: warning: control reaches end of non-void function [-Wreturn-type]
