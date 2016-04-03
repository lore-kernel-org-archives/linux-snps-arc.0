From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sun, 03 Apr 2016 18:02:23 -0000
Subject: kisskb: OK linus/axs101_defconfig/arcompact Mon Apr 04, 04:01
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160403180223.1.49860@5cdd4cf8fb63>
To: linux-snps-arc@lists.infradead.org

OK linus/axs101_defconfig/arcompact Mon Apr 04, 04:01

http://kisskb.ellerman.id.au/kisskb/buildresult/12653240/

Commit:   Linux 4.6-rc2
          9735a22799b9214d17d3c231fe377fc852f042e9
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

No errors found in log

Possible warnings (24)
----------------------

drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
kernel/sched/core.c:3098:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:735:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:295:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/sunrpc/svc_xprt.h:175:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
