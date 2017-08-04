From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Fri,  4 Aug 2017 13:03:52 -0700
Subject: [PATCH v2 1/2] ARC: [plat-anarion] Add early boot workarounds for
 Anarion SOC
In-Reply-To: <20170728220707.13960-3-alex.g@adaptrum.com>
References: <20170728220707.13960-3-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170804200353.15653-1-alex.g@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

An ARC, the interrupts are enabled globally, rather than per-line, as
drivers request it. Thus, we need to make sure that peripherals don't
generate any before the respective drivers are probed.
The GMAC is infamous for spamming interrupts, so it must be kept in
reset until the driver is probed and interrupt mapping established.

Signed-off-by: Alexandru Gagniuc <alex.g at adaptrum.com>
---
Changes since v1:
 * None

 arch/arc/Kconfig                 |  1 +
 arch/arc/Makefile                |  1 +
 arch/arc/plat-anarion/Kconfig    | 10 ++++++++++
 arch/arc/plat-anarion/Makefile   |  7 +++++++
 arch/arc/plat-anarion/platform.c | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 arch/arc/plat-anarion/Kconfig
 create mode 100644 arch/arc/plat-anarion/Makefile
 create mode 100644 arch/arc/plat-anarion/platform.c

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index a545969..dff8423 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -100,6 +100,7 @@ source "arch/arc/plat-sim/Kconfig"
 source "arch/arc/plat-tb10x/Kconfig"
 source "arch/arc/plat-axs10x/Kconfig"
 #New platform adds here
+source "arch/arc/plat-anarion/Kconfig"
 source "arch/arc/plat-eznps/Kconfig"
 
 endmenu
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 44ef35d..9bc0048 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -109,6 +109,7 @@ core-y		+= arch/arc/boot/dts/
 
 core-$(CONFIG_ARC_PLAT_SIM)	+= arch/arc/plat-sim/
 core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
+core-$(CONFIG_ARC_PLAT_ANARION)	+= arch/arc/plat-anarion/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_PLAT_EZNPS)	+= arch/arc/plat-eznps/
 
diff --git a/arch/arc/plat-anarion/Kconfig b/arch/arc/plat-anarion/Kconfig
new file mode 100644
index 0000000..632c7be
--- /dev/null
+++ b/arch/arc/plat-anarion/Kconfig
@@ -0,0 +1,10 @@
+#
+# (C) Copyright 2017 Adaptrum, Inc.
+# Written by Alexandru Gagniuc <alex.g at adaptrum.com> for Adaptrum, Inc.
+# Licensed under the GPLv2 or (at your option) any later version.
+#
+
+menuconfig ARC_PLAT_ANARION
+	bool "Adaptrum Anarion based platforms"
+	help
+	  Support for Adaptrum Anarion based ARC platforms.
diff --git a/arch/arc/plat-anarion/Makefile b/arch/arc/plat-anarion/Makefile
new file mode 100644
index 0000000..9596a41
--- /dev/null
+++ b/arch/arc/plat-anarion/Makefile
@@ -0,0 +1,7 @@
+#
+# (C) Copyright 2017 Adaptrum, Inc.
+# Written by Alexandru Gagniuc <alex.g at adaptrum.com> for Adaptrum, Inc.
+# Licensed under the GPLv2 or (at your option) any later version.
+#
+
+obj-y := platform.o
diff --git a/arch/arc/plat-anarion/platform.c b/arch/arc/plat-anarion/platform.c
new file mode 100644
index 0000000..ef0d381
--- /dev/null
+++ b/arch/arc/plat-anarion/platform.c
@@ -0,0 +1,39 @@
+/*
+ * Workarounds for Adaptrum Anarion SOC
+ *
+ * Copyright (C) 2017, Adaptrum, Inc.
+ * (Written by Alexandru Gagniuc <alex.g at adaptrum.com> for Adaptrum, Inc.)
+ * Licensed under the GPLv2 or (at your option) any later version.
+ */
+
+#include <asm/io.h>
+#include <linux/init.h>
+#include <asm/mach_desc.h>
+
+#define GMAC0_RESET		0xf2018000
+#define GMAC1_RESET		0xf2018100
+
+/* This works around an issue where the GMAC will generate interrupts before
+ * the driver is probed, confusing the heck out of the early boot.
+ */
+static void __init anarion_gmac_irq_storm_workaround(void)
+{
+	writel(1, (void *)GMAC0_RESET);
+	writel(1, (void *)GMAC1_RESET);
+}
+
+static void __init anarion_early_init(void)
+{
+	anarion_gmac_irq_storm_workaround();
+	/* Please, no more workarounds!!! */
+}
+
+static const char *anarion_compat[] __initconst = {
+	"adaptrum,anarion",
+	NULL,
+};
+
+MACHINE_START(ANARION, "anarion")
+	.dt_compat	= anarion_compat,
+	.init_early	= anarion_early_init,
+MACHINE_END
-- 
2.9.3
