From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 05 Jul 2017 07:37:09 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Wed Jul 05, 17:36
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170705073709.1.67246@222023911cb9>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Wed Jul 05, 17:36

http://kisskb.ellerman.id.au/kisskb/buildresult/13083724/

Commit:   Add linux-next specific files for 20170705
          0c5f0311f690e99f99453ebec77cf3229417c809
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

drivers/i2c/busses/i2c-designware-platdrv.c:331:2: error: implicit declaration of function 'i2c_detect_slave_mode' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[4]: *** [drivers/i2c/busses/i2c-designware-platdrv.o] Error 1
make[3]: *** [drivers/i2c/busses] Error 2
make[2]: *** [drivers/i2c] Error 2
make[1]: *** [drivers] Error 2
make: *** [sub-make] Error 2

Possible warnings (17)
----------------------

kernel/sched/core.c:3223:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3827:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/string.c:986:1: warning: 'noreturn' function does return [enabled by default]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:314:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:416:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:179:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4257:49: warning: array subscript is above array bounds [-Warray-bounds]
drivers/scsi/sd.c:1274:1: warning: control reaches end of non-void function [-Wreturn-type]
