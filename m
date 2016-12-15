From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 15 Dec 2016 23:30:42 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri Dec 16, 10:28
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161215233042.1.419@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri Dec 16, 10:28

http://kisskb.ellerman.id.au/kisskb/buildresult/12885941/

Commit:   Merge tag 'for-f2fs-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
          09cb6464fe5e7fcd5177911429badd139c4481b7
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

       - missing error cases

Possible warnings (16)
----------------------

kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3828:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
