From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 30 Dec 2016 12:36:28 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Fri Dec 30, 23:34
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161230123628.1.70732@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Fri Dec 30, 23:34

http://kisskb.ellerman.id.au/kisskb/buildresult/12896565/

Commit:   mm/filemap: fix parameters to test_bit()
          98473f9f3f9bd404873cd1178c8be7d6d619f0d1
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

      mm/filemap.c:933:9: error: too few arguments to function 'test_bit'

Possible warnings (16)
----------------------

include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3828:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
