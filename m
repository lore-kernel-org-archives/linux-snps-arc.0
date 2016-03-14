From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 14 Mar 2016 08:27:27 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Mon Mar 14, 19:26
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160314082727.1.35694@820dd7c2bc0c>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Mon Mar 14, 19:26

http://kisskb.ellerman.id.au/kisskb/buildresult/12633624/

Commit:   Add linux-next specific files for 20160314
          4342eec3c5a2402ca5de3d6e56f541fe1c5171e2
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[3]: *** [net/ethernet/eth.o] Error 1
make[2]: *** [net/ethernet] Error 2
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[3]: *** [drivers/of/device.o] Error 1
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[2]: *** [lib/pci_iomap.o] Error 1
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[2]: *** [lib/devres.o] Error 1
make[1]: *** [lib] Error 2
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[3]: *** [net/core/dev.o] Error 1
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[5]: *** [drivers/video/fbdev/core/fbmon.o] Error 1
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[6]: *** [drivers/net/ethernet/stmicro/stmmac/stmmac_main.o] Error 1
make[5]: *** [drivers/net/ethernet/stmicro/stmmac] Error 2
make[4]: *** [drivers/net/ethernet/stmicro] Error 2
make[3]: *** [drivers/net/ethernet] Error 2
make[2]: *** [drivers/of] Error 2
make[4]: *** [drivers/video/fbdev/core] Error 2
make[3]: *** [drivers/video/fbdev] Error 2
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[3]: *** [drivers/scsi/scsi_lib.o] Error 1
make[2]: *** [net/core] Error 2
make[1]: *** [net] Error 2
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[4]: *** [drivers/usb/host/ehci-hcd.o] Error 1
make[3]: *** [drivers/usb/host] Error 2
arch/arc/include/asm/pci.h:13:40: fatal error: asm-generic/pci-dma-compat.h: No such file or directory
make[4]: *** [drivers/usb/core/message.o] Error 1
make[2]: *** [drivers/net] Error 2
make[2]: *** [drivers/scsi] Error 2
make[2]: *** [drivers/video] Error 2
make[3]: *** [drivers/usb/core] Error 2
make[2]: *** [drivers/usb] Error 2
make[1]: *** [drivers] Error 2
make: *** [sub-make] Error 2

Possible warnings (91)
----------------------

drivers/pci/pcie/Kconfig:61:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:67:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:74:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:61:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:67:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:74:warning: choice value used outside its choice group
<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
Warning (unit_address_vs_reg): Node /timer at 0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /timer at 1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /cpu_card has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /cpu_card/arc700-intc at cpu has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /axs10x_mb has a reg or ranges property, but no unit name
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
kernel/sysctl.c:1958:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/core.c:3080:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
kernel/sysctl.c:1958:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
kernel/time/posix-cpu-timers.c:787:21: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
kernel/time/posix-cpu-timers.c:95:8: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:665:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:1238:13: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
ipc/shm.c:1252:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1712:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
fs/namei.c:1712:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
include/linux/rbtree.h:83:28: warning: 'rb_parent' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/rbtree.h:86:11: warning: 'rb_link' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/mmap.c:558:17: warning: 'prev' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
include/linux/kernel.h:735:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined [enabled by default]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/asm-generic/bug.h:74:48: warning: 'fn' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:363:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/ethtool.c:295:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:370:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:315:21: warning: 'handle' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:556:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/usb/core/hub.c:2767:16: warning: 'portchange' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/core/hub.c:2740:20: warning: 'portstatus' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_extents.h:224:8: warning: '*((void *)&zero_ex+8)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_extents.h:225:12: warning: '*((void *)&zero_ex+6)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:3119:2: warning: 'zero_ex.ee_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/tty/serial/8250/8250_core.c:250:10: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:2312:14: warning: 'lblock' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:2311:14: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:499:15: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:473:40: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
