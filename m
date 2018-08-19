From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sun, 19 Aug 2018 05:48:12 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Sun Aug 19, 15:47
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180819054812.1.93926@bf8565bee66d>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Sun Aug 19, 15:47

http://kisskb.ellerman.id.au/kisskb/buildresult/13481708/

Commit:   Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
          08b5fa819970c318e58ab638f497633c25971813
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (78)
----------------------

kernel/dma/direct.c:46:5: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
mm/percpu.c:1371:17: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1371:17: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
mm/percpu.c:1937:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1937:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1937:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1937:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1937:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
mm/percpu.c:1937:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
fs/ext4/inode.c:3618:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
drivers/base/regmap/regmap.c:1507:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
fs/ext4/xattr.c:482:8: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:46: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
mm/dmapool.c:96:51: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
drivers/base/component.c:174:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:820:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:853:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_helper.c:905:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/base/regmap/regcache.c:719:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:201:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'ssize_t {aka int}' [-Wformat=]
drivers/gpu/drm/drm_dp_dual_mode_helper.c:220:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'ssize_t {aka int}' [-Wformat=]
include/linux/overflow.h:53:15: warning: comparison of distinct pointer types lacks a cast
include/linux/overflow.h:54:15: warning: comparison of distinct pointer types lacks a cast
include/drm/drm_print.h:110:24: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_info.c:118:24: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
net/sunrpc/xprtsock.c:2644:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_atomic.c:436:21: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:115:21: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/gpu/drm/drm_gem_cma_helper.c:507:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
net/sunrpc/svc.c:1345:33: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
net/ipv4/tcp_input.c:4319:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
fs/buffer.c:236:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast
drivers/usb/host/ehci-q.c:365:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
drivers/usb/host/ehci-q.c:365:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
