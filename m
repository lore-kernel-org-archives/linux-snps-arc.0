From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 14 Dec 2016 07:33:47 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Wed Dec 14, 18:32
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161214073347.1.70336@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Wed Dec 14, 18:32

http://kisskb.ellerman.id.au/kisskb/buildresult/12884321/

Commit:   Merge tag 'drm-for-v4.10' of git://people.freedesktop.org/~airlied/linux
          9439b3710df688d853eb6cb4851256f2c92b1797
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

       - Error handling fixes
      drm/nouveau/gr/gf100-: properly ack all FECS error interrupts
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (80)
----------------------

kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/component.c:101:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
mm/percpu.c:890:14: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:890:14: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
mm/percpu.c:1457:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1457:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1457:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1457:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1457:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1457:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
fs/buffer.c:242:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/slab_common.c:815:45: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regmap.c:1396:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/regmap/regcache.c:717:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:46: warning: format '%Zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:51: warning: format '%Zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
block/cfq-iosched.c:3826:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:3329:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:428:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
drivers/scsi/sd.c:1155:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
net/sunrpc/xprtsock.c:2553:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
net/sunrpc/svc.c:1258:33: warning: format '%Zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
