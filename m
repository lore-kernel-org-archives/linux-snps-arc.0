From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 30 Dec 2016 12:34:57 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Fri Dec 30, 23:33
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161230123457.1.12760@0c6d80572b6b>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Fri Dec 30, 23:33

http://kisskb.ellerman.id.au/kisskb/buildresult/12896564/

Commit:   mm/filemap: fix parameters to test_bit()
          98473f9f3f9bd404873cd1178c8be7d6d619f0d1
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

      mm/filemap.c:933:9: error: too few arguments to function 'test_bit'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (88)
----------------------

include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
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
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/regmap/regmap.c:1396:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regcache.c:717:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:46: warning: format '%Zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:51: warning: format '%Zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
drivers/gpu/drm/drm_dp_helper.c:776:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:809:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:861:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
fs/buffer.c:243:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
block/cfq-iosched.c:3828:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:201:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:220:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'ssize_t {aka int}' [-Wformat=]
kernel/sched/core.c:3293:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:3439:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4301:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_info.c:118:24: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/sunrpc/xprtsock.c:2553:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
net/sunrpc/svc.c:1263:33: warning: format '%Zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/sunrpc/svc_xprt.h:177:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_gem_cma_helper.c:115:60: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:457:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:4:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:378:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/scsi/sd.c:1173:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:753:16: warning: comparison of distinct pointer types lacks a cast
