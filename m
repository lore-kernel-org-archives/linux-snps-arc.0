From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 27 Nov 2018 14:20:45 -0800
Subject: [PATCH] ARC: change defconfig defaults to ARCv2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181127222045.18491-1-khilman@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Change the default defconfig (used with 'make defconfig') to the ARCv2
nsim_hs_defconfig, and also switch the default Kconfig ISA selection to
ARCv2.

This allows several default defconfigs (e.g. make defconfig, make
allnoconfig, make tinyconfig) to all work with ARCv2 by default.

Signed-off-by: Kevin Hilman <khilman at baylibre.com>
---
Applies on v4.20-rc4

 arch/arc/Kconfig  | 2 +-
 arch/arc/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index c9e2a1323536..a65ca0955d8b 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -109,7 +109,7 @@ endmenu
 
 choice
 	prompt "ARC Instruction Set"
-	default ISA_ARCOMPACT
+	default ISA_ARCV2
 
 config ISA_ARCOMPACT
 	bool "ARCompact ISA"
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c64c505d966c..df00578c279d 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -6,7 +6,7 @@
 # published by the Free Software Foundation.
 #
 
-KBUILD_DEFCONFIG := nsim_700_defconfig
+KBUILD_DEFCONFIG := nsim_hs_defconfig
 
 cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
-- 
2.11.0
