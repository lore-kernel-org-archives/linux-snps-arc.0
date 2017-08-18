From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 18 Aug 2017 23:47:24 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Sat Aug 19, 09:45
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170818234724.1.49147@222023911cb9>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Sat Aug 19, 09:45

http://kisskb.ellerman.id.au/kisskb/buildresult/13132602/

Commit:   Merge tag 'drm-fixes-for-v4.13-rc6' of git://people.freedesktop.org/~airlied/linux
          04d49f3638d0210de592dd52ad62cfca8b3ed9fe
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (17)
----------------------

net/core/ethtool.c:314:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3827:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4261:49: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/core.c:3218:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
lib/string.c:986:1: warning: 'noreturn' function does return [enabled by default]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:179:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1274:1: warning: control reaches end of non-void function [-Wreturn-type]
