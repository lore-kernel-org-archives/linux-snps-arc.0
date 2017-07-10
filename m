From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 10 Jul 2017 09:11:53 -0000
Subject: kisskb: OK linux-next/axs103_smp_defconfig/arcv2 Mon Jul 10, 19:11
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170710091153.1.50629@222023911cb9>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs103_smp_defconfig/arcv2 Mon Jul 10, 19:11

http://kisskb.ellerman.id.au/kisskb/buildresult/13088688/

Commit:   Add linux-next specific files for 20170710
          3ac23ebd359fad520696cd51763065c3bea2a344
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (89)
----------------------

kernel/sched/core.c:3218:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/component.c:101:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:882:14: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:882:14: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
mm/percpu.c:1475:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1475:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1475:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1475:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1475:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1475:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/slab_common.c:886:45: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
mm/dmapool.c:96:46: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:51: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
fs/buffer.c:243:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
block/cfq-iosched.c:3827:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_dp_helper.c:776:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:809:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:861:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
lib/string.c:986:1: warning: 'noreturn' function does return
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/regmap/regmap.c:1399:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:201:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:220:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/base/regmap/regcache.c:719:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
net/core/ethtool.c:314:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_info.c:118:24: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
drivers/scsi/sd.c:1274:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_gem_cma_helper.c:115:60: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:531:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:3531:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:762:16: warning: comparison of distinct pointer types lacks a cast
fs/ext4/ext4_jbd2.h:423:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/page-io.c:162:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/xattr.c:429:8: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
net/ipv4/tcp_input.c:4257:49: warning: array subscript is above array bounds [-Warray-bounds]
net/sunrpc/xprtsock.c:2607:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
net/sunrpc/svc.c:1344:33: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/sunrpc/svc_xprt.h:179:1: warning: control reaches end of non-void function [-Wreturn-type]
