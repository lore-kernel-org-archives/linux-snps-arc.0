From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu,  2 Aug 2018 11:50:16 +0300
Subject: [PATCH] ARC: [plat-axs10x] Enable SWAP
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180802085016.16000-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

SWAP support on ARC was fixed earlier by
commit 6e3761145a9b ("ARC: Fix CONFIG_SWAP")
so now we may safely enable it on platforms that
have external media like USB and SD-card.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: stable at vger.kernel.org # 6e3761145a9b: ARC: Fix CONFIG_SWAP
---
 arch/arc/configs/axs101_defconfig     | 1 -
 arch/arc/configs/axs103_defconfig     | 1 -
 arch/arc/configs/axs103_smp_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 3dbb2b3f60af..96b7258a76be 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -1,4 +1,3 @@
-# CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 4d7b85d4b2dc..72fc21ef1334 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -1,4 +1,3 @@
-# CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 92417e2e39f3..2ac89bd00e28 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -1,4 +1,3 @@
-# CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
-- 
2.17.1
