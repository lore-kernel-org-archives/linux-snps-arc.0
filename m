From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sat, 01 Oct 2016 16:09:04 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sun Oct 02, 03:08
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161001160904.1.92420@8e2d6d7be827>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sun Oct 02, 03:08

http://kisskb.ellerman.id.au/kisskb/buildresult/12818312/

Commit:   Merge branch 'akpm' (patches from Andrew)
          dbd8805b0ad46f04cababea5d01f072142961411
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

kernel/sched/core.c:3277:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
block/cfq-iosched.c:3819:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:742:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1154:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4286:49: warning: array subscript is above array bounds [-Warray-bounds]
