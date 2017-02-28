From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Tue, 28 Feb 2017 21:55:16 +0300
Subject: [PATCH] ARC: Enable XSI math extensions in ARC defconfigs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488308116-32738-1-git-send-email-vzakhar@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This commit enables XSI math extensions to the ISO C standard (bessel).
We need this to be able to build mpv package as it uses functions from
this extensions.

As an example I can refer to buildroot autobuilds where mpv build is
failing when using prebuilt ARC toolchain (which in its turn uses uClibc
without XSI math extensions):
http://autobuild.buildroot.net/results/fb6/fb677a917545adee321bdcd2c2519c81326448c4/build-end.log

Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
---
 extra/Configs/defconfigs/arc/arcv2_defconfig | 1 +
 extra/Configs/defconfigs/arc/defconfig       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/extra/Configs/defconfigs/arc/arcv2_defconfig b/extra/Configs/defconfigs/arc/arcv2_defconfig
index 2d12358..383861f 100644
--- a/extra/Configs/defconfigs/arc/arcv2_defconfig
+++ b/extra/Configs/defconfigs/arc/arcv2_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARC_CPU_HS=y
 ARCH_WANTS_LITTLE_ENDIAN=y
 # UCLIBC_HAS_FPU is not set
 DO_C99_MATH=y
+DO_XSI_MATH=y
 KERNEL_HEADERS="%KERNEL_HEADERS%"
 # DOPIC is not set
 # LDSO_CACHE_SUPPORT is not set
diff --git a/extra/Configs/defconfigs/arc/defconfig b/extra/Configs/defconfigs/arc/defconfig
index f582eb5..d3773aa 100644
--- a/extra/Configs/defconfigs/arc/defconfig
+++ b/extra/Configs/defconfigs/arc/defconfig
@@ -1,6 +1,7 @@
 ARCH_WANTS_LITTLE_ENDIAN=y
 # UCLIBC_HAS_FPU is not set
 DO_C99_MATH=y
+DO_XSI_MATH=y
 KERNEL_HEADERS="%KERNEL_HEADERS%"
 # DOPIC is not set
 # LDSO_CACHE_SUPPORT is not set
-- 
2.7.4
