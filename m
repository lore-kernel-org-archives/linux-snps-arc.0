From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu,  2 Aug 2018 11:59:45 +0300
Subject: [PATCH] ARC: Remove disabled CONFIG_DEVKMEM from defconfigs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180802085945.18651-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

CONFIG_DEVKMEM by default is disabled so clean-up
our defconfigs.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Ofer Levi <oferle at mellanox.com>
---
 arch/arc/configs/axs101_defconfig          | 1 -
 arch/arc/configs/axs103_defconfig          | 1 -
 arch/arc/configs/axs103_smp_defconfig      | 1 -
 arch/arc/configs/haps_hs_defconfig         | 1 -
 arch/arc/configs/haps_hs_smp_defconfig     | 1 -
 arch/arc/configs/nps_defconfig             | 1 -
 arch/arc/configs/nsim_700_defconfig        | 1 -
 arch/arc/configs/nsim_hs_defconfig         | 1 -
 arch/arc/configs/nsim_hs_smp_defconfig     | 1 -
 arch/arc/configs/nsimosci_defconfig        | 1 -
 arch/arc/configs/nsimosci_hs_defconfig     | 1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig | 1 -
 arch/arc/configs/tb10x_defconfig           | 1 -
 arch/arc/configs/vdk_hs38_defconfig        | 1 -
 14 files changed, 14 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 96b7258a76be..67cfb46675a2 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -61,7 +61,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 CONFIG_MOUSE_SERIAL=y
 CONFIG_MOUSE_SYNAPTICS_USB=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 72fc21ef1334..42a743c54520 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -62,7 +62,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 CONFIG_MOUSE_SERIAL=y
 CONFIG_MOUSE_SYNAPTICS_USB=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 2ac89bd00e28..5886fdcacb34 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -63,7 +63,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 CONFIG_MOUSE_SERIAL=y
 CONFIG_MOUSE_SYNAPTICS_USB=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
index 4984d9ed1573..765ec516135c 100644
--- a/arch/arc/configs/haps_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -57,7 +57,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
index 1e93690b4a4f..1f97b63c77f3 100644
--- a/arch/arc/configs/haps_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -60,7 +60,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
index 7c9c706ae7f6..31ba224bbfb4 100644
--- a/arch/arc/configs/nps_defconfig
+++ b/arch/arc/configs/nps_defconfig
@@ -59,7 +59,6 @@ CONFIG_NETCONSOLE=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 0b59778604e4..b3c3c5763a3e 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -44,7 +44,6 @@ CONFIG_LXT_PHY=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_ARC=y
 CONFIG_SERIAL_ARC_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
index e829b683887d..cd7aed46e6bf 100644
--- a/arch/arc/configs/nsim_hs_defconfig
+++ b/arch/arc/configs/nsim_hs_defconfig
@@ -45,7 +45,6 @@ CONFIG_DEVTMPFS=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_ARC=y
 CONFIG_SERIAL_ARC_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
index bef937c551f8..84a2a31fd0d4 100644
--- a/arch/arc/configs/nsim_hs_smp_defconfig
+++ b/arch/arc/configs/nsim_hs_smp_defconfig
@@ -44,7 +44,6 @@ CONFIG_DEVTMPFS=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_ARC=y
 CONFIG_SERIAL_ARC_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index ac601e33bb47..f3750934f7b3 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -48,7 +48,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index fef290c65e4c..0069a254215a 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -47,7 +47,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index c0d19623aa82..dd5a7e22944e 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -58,7 +58,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 1aca2e8fd1ba..8129ca7b5ff0 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -58,7 +58,6 @@ CONFIG_STMMAC_ETH=y
 # CONFIG_VT is not set
 CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index 4a459de56679..db47c3541f15 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -52,7 +52,6 @@ CONFIG_NATIONAL_PHY=y
 CONFIG_MOUSE_PS2_TOUCHKIT=y
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
-- 
2.17.1
