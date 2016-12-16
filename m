From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 16 Dec 2016 23:25:54 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat Dec 17, 10:24
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161216232554.1.81395@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat Dec 17, 10:24

http://kisskb.ellerman.id.au/kisskb/buildresult/12888136/

Commit:   Merge tag 'nfs-for-4.10-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs
          73e2e0c9b13c97df1c8565f6e158caac3c481b44
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

       - On a pNFS error, do not send LAYOUTGET until the LAYOUTRETURN is

Possible warnings (16)
----------------------

kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3828:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
