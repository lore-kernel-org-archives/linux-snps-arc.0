From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 10 Jul 2017 09:13:30 -0000
Subject: kisskb: OK linux-next/axs101_defconfig/arcompact Mon Jul 10, 19:11
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170710091330.1.3202@222023911cb9>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs101_defconfig/arcompact Mon Jul 10, 19:11

http://kisskb.ellerman.id.au/kisskb/buildresult/13088689/

Commit:   Add linux-next specific files for 20170710
          3ac23ebd359fad520696cd51763065c3bea2a344
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

block/cfq-iosched.c:3827:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sched/core.c:3218:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:314:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4257:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/string.c:986:1: warning: 'noreturn' function does return [enabled by default]
include/linux/sunrpc/svc_xprt.h:179:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1274:1: warning: control reaches end of non-void function [-Wreturn-type]
