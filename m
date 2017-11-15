From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 15 Nov 2017 06:49:54 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Wed Nov 15, 17:48
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171115064954.1.8415@222023911cb9>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Wed Nov 15, 17:48

http://kisskb.ellerman.id.au/kisskb/buildresult/13205652/

Commit:   Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
          894025f24bd028942da3e602b87d9f7223109b14
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (90)
----------------------

include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
drivers/base/component.c:101:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1367:17: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1367:17: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
mm/percpu.c:1916:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1916:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1916:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1916:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1916:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1916:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
mm/slab_common.c:895:45: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
fs/buffer.c:243:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regmap.c:1478:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regcache.c:719:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
block/cfq-iosched.c:3804:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sched/core.c:3245:1: warning: control reaches end of non-void function [-Wreturn-type]
mm/dmapool.c:96:46: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:51: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:3564:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/ethtool.c:311:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
lib/cpumask.c:228:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_dp_helper.c:777:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:810:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:862:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
fs/ext4/ext4_jbd2.h:426:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:201:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:220:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'ssize_t {aka int}' [-Wformat=]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
lib/string.c:1053:1: warning: 'noreturn' function does return
fs/ext4/xattr.c:461:8: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_info.c:118:24: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
net/sunrpc/xprtsock.c:2614:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
net/ipv4/tcp_input.c:4261:49: warning: array subscript is above array bounds [-Warray-bounds]
net/sunrpc/svc.c:1344:33: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/sunrpc/svc_xprt.h:180:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/drm_gem_cma_helper.c:115:60: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:496:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:365:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:365:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:791:16: warning: comparison of distinct pointer types lacks a cast
drivers/scsi/sd.c:1282:1: warning: control reaches end of non-void function [-Wreturn-type]
