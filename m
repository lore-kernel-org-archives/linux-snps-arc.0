From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Thu, 07 Jun 2018 04:36:59 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Thu Jun 07, 14:35
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180607043659.1.76587@ccbefa4da728>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Thu Jun 07, 14:35

http://kisskb.ellerman.id.au/kisskb/buildresult/13390353/

Commit:   Merge tag 'trace-v4.18' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace
          5eb6eed7e0fe880dc8de8da203cc888716bbf196
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */
 #define KERN_ERR KERN_SOH "3" /* error conditions */

Possible warnings (78)
----------------------

/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/fs/ext4/inode.c:3619:12: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/mm/percpu.c:1371:17: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/percpu.c:1371:17: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
 #define KERN_WARNING KERN_SOH "4" /* warning conditions */
/kisskb/src/mm/percpu.c:1937:27: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/percpu.c:1937:32: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/percpu.c:1937:37: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/percpu.c:1937:42: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/percpu.c:1937:52: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/percpu.c:1937:56: warning: format '%zu' expects argument of type 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
/kisskb/src/fs/ext4/page-io.c:163:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 6 has type 'ssize_t {aka int}' [-Wformat=]
/kisskb/src/drivers/base/regmap/regmap.c:1493:22: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/base/regmap/regcache.c:719:20: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/fs/ext4/xattr.c:480:8: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/drivers/base/component.c:174:24: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'ssize_t {aka int}' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/mm/dmapool.c:96:46: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'unsigned int' [-Wformat=]
/kisskb/src/mm/dmapool.c:96:51: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka const unsigned int}' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/net/ipv4/tcp_input.c:4237:49: warning: array subscript is above array bounds [-Warray-bounds]
/kisskb/src/net/sunrpc/xprtsock.c:2644:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/lib/dma-direct.c:46:26: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/net/sunrpc/svc.c:1345:33: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_dp_helper.c:798:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_dp_helper.c:831:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_dp_helper.c:883:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_dp_dual_mode_helper.c:201:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 5 has type 'ssize_t {aka int}' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_dp_dual_mode_helper.c:220:16: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'ssize_t {aka int}' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
/kisskb/src/fs/buffer.c:235:37: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/drm/drm_print.h:105:24: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_info.c:118:24: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kern_levels.h:5:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_gem_cma_helper.c:115:21: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/gpu/drm/drm_gem_cma_helper.c:507:18: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/usb/host/ehci-q.c:365:2: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat=]
/kisskb/src/drivers/usb/host/ehci-q.c:365:2: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
/kisskb/src/include/linux/kernel.h:811:29: warning: comparison of distinct pointer types lacks a cast
