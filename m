From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Tue, 28 Feb 2017 22:02:27 +0300
Subject: [PATCH] ARC: Enable getpt() support in ARC defconfigs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This commit enables getpt() support in ARC defconfigs as some packages
need it. E.g. we need this to be able to build xterm package as it uses
getpt().

As an example I can refer to buildroot autobuilds where xterm build is
failing when using prebuilt ARC toolchain (which in its turn uses uClibc
without getpt() support):
http://autobuild.buildroot.net/results/28a/28a92049a6ceef005787c5779f77ecf3fe8ad642/build-end.log

Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
---
 extra/Configs/defconfigs/arc/arcv2_defconfig | 1 +
 extra/Configs/defconfigs/arc/defconfig       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/extra/Configs/defconfigs/arc/arcv2_defconfig b/extra/Configs/defconfigs/arc/arcv2_defconfig
index 383861f..a9d9891 100644
--- a/extra/Configs/defconfigs/arc/arcv2_defconfig
+++ b/extra/Configs/defconfigs/arc/arcv2_defconfig
@@ -16,6 +16,7 @@ UCLIBC_SUSV2_LEGACY=y
 UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV4_LEGACY=y
 UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS_GETPT=y
 UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
 UCLIBC_SV4_DEPRECATED=y
diff --git a/extra/Configs/defconfigs/arc/defconfig b/extra/Configs/defconfigs/arc/defconfig
index d3773aa..9a76e7d 100644
--- a/extra/Configs/defconfigs/arc/defconfig
+++ b/extra/Configs/defconfigs/arc/defconfig
@@ -15,6 +15,7 @@ UCLIBC_SUSV2_LEGACY=y
 UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV4_LEGACY=y
 UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS_GETPT=y
 UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
 UCLIBC_SV4_DEPRECATED=y
-- 
2.7.4
