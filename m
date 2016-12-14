From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 14 Dec 2016 20:05:42 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Thu Dec 15, 07:04
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161214200542.1.32087@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Thu Dec 15, 07:04

http://kisskb.ellerman.id.au/kisskb/buildresult/12884858/

Commit:   Merge branch 'for-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata
          b92e09bb5bf4db65aeb8ca0094fdd5142ed54451
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (18)
----------------------

    Christoph Hellwig pipes in about the hidden nvme warning:
      So for now I guess this warning is it, until Intel reconsideres and
kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3828:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
