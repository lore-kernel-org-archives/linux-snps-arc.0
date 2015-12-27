From: noamc@ezchip.com (Noam Camus)
Date: Sun, 27 Dec 2015 15:23:39 +0200
Subject: [PATCH v5 20/20] ARC: Add eznps platform to Kconfig and Makefile
In-Reply-To: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1451222619-3610-21-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

This commit should be left last since only now eznps platform
is in state which one can actually use.
Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/Kconfig  |    1 +
 arch/arc/Makefile |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 079946e..9d828a3 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -92,6 +92,7 @@ source "arch/arc/plat-sim/Kconfig"
 source "arch/arc/plat-tb10x/Kconfig"
 source "arch/arc/plat-axs10x/Kconfig"
 #New platform adds here
+source "arch/arc/plat-eznps/Kconfig"
 
 endmenu
 
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index aeb1902..6212fea 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -99,6 +99,11 @@ core-y		+= arch/arc/boot/dts/
 core-$(CONFIG_ARC_PLAT_SIM)	+= arch/arc/plat-sim/
 core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
+core-$(CONFIG_ARC_PLAT_EZNPS)	+= arch/arc/plat-eznps/
+
+ifdef CONFIG_ARC_PLAT_EZNPS
+KBUILD_CPPFLAGS += -I$(srctree)/arch/arc/plat-eznps/include
+endif
 
 drivers-$(CONFIG_OPROFILE)	+= arch/arc/oprofile/
 
-- 
1.7.1
