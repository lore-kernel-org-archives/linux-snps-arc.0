From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 17 Oct 2016 02:31:01 -0000
Subject: kisskb: OK linux-next/axs101_defconfig/arcompact Mon Oct 17, 13:29
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161017023101.1.10038@8e2d6d7be827>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs101_defconfig/arcompact Mon Oct 17, 13:29

http://kisskb.ellerman.id.au/kisskb/buildresult/12833194/

Commit:   Add linux-next specific files for 20161016
          caa9243fcc00956ed9783b6f32ca69bfb75e4177
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

kernel/sched/core.c:3292:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3826:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4284:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:57:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1155:1: warning: control reaches end of non-void function [-Wreturn-type]
