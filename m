From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 05 Apr 2017 00:53:26 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Wed Apr 05, 10:51
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170405005326.1.87653@d08bfdc9c891>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Wed Apr 05, 10:51

http://kisskb.ellerman.id.au/kisskb/buildresult/12986030/

Commit:   Merge tag 'drm-fixes-for-v4.11-rc6' of git://people.freedesktop.org/~airlied/linux
          1a589c0443e498078f5f2acedef5575bc705dcd7
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

      drm/msm: adreno: fix build error without debugfs
      drm/vmwgfx: Remove getparam error message

Possible warnings (16)
----------------------

net/core/ethtool.c:310:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3827:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sched/core.c:3322:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4248:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
