From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 16 Dec 2016 06:03:15 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Fri Dec 16, 17:01
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161216060315.1.98963@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Fri Dec 16, 17:01

http://kisskb.ellerman.id.au/kisskb/buildresult/12886216/

Commit:   Merge tag 'acpi-urgent-4.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
          7ae123edd37a47e178eb9a6631fe4a7108262c10
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (80)
----------------------

include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
mm/percpu.c:891:14: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:891:14: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
mm/percpu.c:1458:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1458:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1458:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1458:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1458:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1458:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/slab_common.c:815:45: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/base/component.c:101:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regmap.c:1396:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/regmap/regcache.c:717:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
fs/buffer.c:242:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:46: warning: format '%Zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:51: warning: format '%Zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3828:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:3447:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
net/sunrpc/xprtsock.c:2553:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/sunrpc/svc.c:1258:33: warning: format '%Zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:744:16: warning: comparison of distinct pointer types lacks a cast
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
