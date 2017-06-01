From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu,  1 Jun 2017 13:41:12 +0300
Subject: [PATCH v3] hsdk: initial port for HSDK board
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496313672-13350-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This initial port adds support of ARC HS Development Kit board with some
basic features such serial port, USB, SD/MMC and Ethernet.

Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
heavily use IO Coherency for speeding-up DMA-aware peripherals.

Note as opposed to other ARC boards we link Linux kernel to
0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
situated at our more usual link base 0x8000_0000.

Signed-off-by: Eugeniy Paltsev <paltsev at synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
---

Changes v2 -> v3:
 * Added Rob to Cc-list for DT binding approval
 * Removed mention of prerequsite patch from commit message
 * Removed hsdk_early_init() as hsdk_init_per_cpu() is executed on
   all cores anyways including master
 * Cleaned-up board's .dts a little bit
 * Removed CONFIG_DP83867_PHY from defconfig as it was only used on
   FPGA prototype, on real board we use MICREL PHY which is still selected

Changes v1 -> v2:
 * Update copyright year from 2016 to more up to date 2017
 * Merge early UART clock with AXS10x as in both cases that's 33.3 MHz
 * Bump memory to 1Gb, we don't use more for now because it requires
   trickier IOC setup and usage
 * Update early platform init code:
    - Added missing fixup_pae_regs() to per-cpu init
    - Mark most of functions as "static __init"
    - Use writel_relaxed() for setting CREG_PAE, CREG_PAE_UPDATE is still
      written with stronger writel() since we don't want reordering to happen,
      otherwise value written to CREG_PAE won't be applied

 Documentation/devicetree/bindings/arc/hsdk.txt |   7 ++
 arch/arc/Kconfig                               |   1 +
 arch/arc/Makefile                              |   1 +
 arch/arc/boot/dts/hsdk.dts                     | 151 +++++++++++++++++++++++++
 arch/arc/configs/hsdk_defconfig                |  71 ++++++++++++
 arch/arc/kernel/devtree.c                      |   5 +-
 arch/arc/plat-hsdk/Kconfig                     |  12 ++
 arch/arc/plat-hsdk/Makefile                    |   9 ++
 arch/arc/plat-hsdk/platform.c                  |  59 ++++++++++
 9 files changed, 314 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
 create mode 100644 arch/arc/boot/dts/hsdk.dts
 create mode 100644 arch/arc/configs/hsdk_defconfig
 create mode 100644 arch/arc/plat-hsdk/Kconfig
 create mode 100644 arch/arc/plat-hsdk/Makefile
 create mode 100644 arch/arc/plat-hsdk/platform.c

diff --git a/Documentation/devicetree/bindings/arc/hsdk.txt b/Documentation/devicetree/bindings/arc/hsdk.txt
new file mode 100644
index 000000000000..be50654bbf61
--- /dev/null
+++ b/Documentation/devicetree/bindings/arc/hsdk.txt
@@ -0,0 +1,7 @@
+Synopsys DesignWare ARC HS Development Kit Device Tree Bindings
+---------------------------------------------------------------------------
+
+ARC HSDK Board with quad-core ARC HS38x4 in silicon.
+
+Required root node properties:
+    - compatible = "snps,hsdk";
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index a5459698f0ee..92c912819613 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -101,6 +101,7 @@ source "arch/arc/plat-tb10x/Kconfig"
 source "arch/arc/plat-axs10x/Kconfig"
 #New platform adds here
 source "arch/arc/plat-eznps/Kconfig"
+source "arch/arc/plat-hsdk/Kconfig"
 
 endmenu
 
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 44ef35d33956..55ca925edf65 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -111,6 +111,7 @@ core-$(CONFIG_ARC_PLAT_SIM)	+= arch/arc/plat-sim/
 core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_PLAT_EZNPS)	+= arch/arc/plat-eznps/
+core-$(CONFIG_ARC_PLAT_HSDK)	+= arch/arc/plat-hsdk/
 
 ifdef CONFIG_ARC_PLAT_EZNPS
 KBUILD_CPPFLAGS += -I$(srctree)/arch/arc/plat-eznps/include
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
new file mode 100644
index 000000000000..b567a96e5da4
--- /dev/null
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -0,0 +1,151 @@
+/*
+ * Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Device Tree for ARC HS Development Kit
+ */
+/dts-v1/;
+
+/include/ "skeleton_hs_idu.dtsi"
+
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	model = "snps,hsdk";
+	compatible = "snps,hsdk";
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
+	};
+
+	cpu {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&core_intc>;
+
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <1000000000>;
+		};
+
+		core_intc: archs-intc at cpu {
+			compatible = "snps,archs-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		idu_intc: idu-interrupt-controller {
+			compatible = "snps,archs-idu-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		arcpct0: pct {
+			compatible = "snps,archs-pct";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&idu_intc>;
+
+		ranges = <0x00000000 0xf0000000 0x10000000>;
+
+		uart: dw-apb-uart at 5000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x5000 0x100>;
+			clock-frequency = <33330000>;
+			interrupts = <6>;
+			baud = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+
+		gmacclk: gmacclk {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		mmcclk_ciu: mmcclk_ciu {
+			compatible = "fixed-clock";
+			clock-frequency = <100000000>;
+			#clock-cells = <0>;
+		};
+
+		mmcclk_biu: mmcclk_biu {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		ethernet at 8000 {
+			#interrupt-cells = <1>;
+			compatible = "snps,dwmac";
+			reg = <0x8000 0x2000>;
+			interrupts = <10>;
+			interrupt-names = "macirq";
+			phy-mode = "rgmii";
+			snps,pbl = <32>;
+			clocks = <&gmacclk>;
+			clock-names = "stmmaceth";
+			phy-handle = <&phy0>;
+
+			mdio0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+				phy0: ethernet-phy at 0 {
+					reg = <0>;
+					ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+					ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+					ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+				};
+			};
+		};
+
+		ohci at 60000 {
+			compatible = "generic-ohci";
+			reg = <0x60000 0x100>;
+			interrupts = <15>;
+		};
+
+		ehci at 40000 {
+			compatible = "generic-ehci";
+			reg = <0x40000 0x100>;
+			interrupts = <15>;
+		};
+
+		mmc at a000 {
+			compatible = "altr,socfpga-dw-mshc";
+			reg = <0xa000 0x400>;
+			num-slots = <1>;
+			fifo-depth = <16>;
+			card-detect-delay = <200>;
+			clocks = <&mmcclk_biu>, <&mmcclk_ciu>;
+			clock-names = "biu", "ciu";
+			interrupts = <12>;
+			bus-width = <4>;
+		};
+	};
+
+	memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00000000 0x90000000 0x40000000>;
+		device_type = "memory";
+		reg = <0x90000000 0x40000000>;	/* 1 GB */
+	};
+};
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
new file mode 100644
index 000000000000..b653eaec5846
--- /dev/null
+++ b/arch/arc/configs/hsdk_defconfig
@@ -0,0 +1,71 @@
+CONFIG_DEFAULT_HOSTNAME="ARCLinux"
+CONFIG_SYSVIPC=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_PID_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
+CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_ARC_PLAT_HSDK=y
+CONFIG_ISA_ARCV2=y
+CONFIG_SMP=y
+CONFIG_LINUX_LINK_BASE=0x90000000
+CONFIG_ARC_BUILTIN_DTB_NAME="hsdk"
+CONFIG_PREEMPT=y
+# CONFIG_COMPACTION is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_MICREL_PHY=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT3_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_FTRACE is not set
diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 3b67f538f142..521ef3521a1c 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -29,8 +29,9 @@ static void __init arc_set_early_base_baud(unsigned long dt_root)
 {
 	if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
 		arc_base_baud = 166666666;	/* Fixed 166.6MHz clk (TB10x) */
-	else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp"))
-		arc_base_baud = 33333333;	/* Fixed 33MHz clk (AXS10x) */
+	else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp") ||
+		 of_flat_dt_is_compatible(dt_root, "snps,hsdk"))
+		arc_base_baud = 33333333;	/* Fixed 33MHz clk (AXS10x & HSDK) */
 	else if (of_flat_dt_is_compatible(dt_root, "ezchip,arc-nps"))
 		arc_base_baud = 800000000;      /* Fixed 800MHz clk (NPS) */
 	else
diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
new file mode 100644
index 000000000000..21ec7623d16c
--- /dev/null
+++ b/arch/arc/plat-hsdk/Kconfig
@@ -0,0 +1,12 @@
+#
+# Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+
+menuconfig ARC_PLAT_HSDK
+	bool "ARC HS Development Kit board"
+	help
+	  Support for ARC HS Development Kit board
diff --git a/arch/arc/plat-hsdk/Makefile b/arch/arc/plat-hsdk/Makefile
new file mode 100644
index 000000000000..9a50c511a672
--- /dev/null
+++ b/arch/arc/plat-hsdk/Makefile
@@ -0,0 +1,9 @@
+#
+# Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+
+obj-y := platform.o
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
new file mode 100644
index 000000000000..243bfab03faf
--- /dev/null
+++ b/arch/arc/plat-hsdk/platform.c
@@ -0,0 +1,59 @@
+/*
+ * ARC HSDK Platform support code
+ *
+ * Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <asm/arcregs.h>
+#include <asm/io.h>
+#include <asm/mach_desc.h>
+
+/*
+ * By default ICCM is mapped to 0x7z while this area is used for
+ * Virtual kernel mappings, so move it to currently unused area.
+ */
+static void __init relocate_iccm(void)
+{
+	if (cpuinfo_arc700[smp_processor_id()].iccm.sz)
+		write_aux_reg(ARC_REG_AUX_ICCM, 0x60000000);
+}
+
+/*
+ * Default configuration of PAE regs doesn't work for us causing
+ * problems with DMA to/from peripherals even if PAE40 is not used.
+ */
+static void __init fixup_pae_regs(void)
+{
+#define ARC_PERIPHERAL_BASE	0xf0000000
+#define	CREG_BASE		(ARC_PERIPHERAL_BASE + 0x1000)
+#define	CREG_PAE		(CREG_BASE + 0x180)
+#define	CREG_PAE_UPDATE		(CREG_BASE + 0x194)
+
+	/* Default is 1, which means "PAE offset = 4GByte" */
+	writel_relaxed(0, (void __iomem *) CREG_PAE);
+
+	/* Really apply settings made above */
+	writel(1, (void __iomem *) CREG_PAE_UPDATE);
+}
+
+static void __init hsdk_init_per_cpu(unsigned int cpu)
+{
+	relocate_iccm();
+	fixup_pae_regs();
+}
+
+static const char *hsdk_compat[] __initconst = {
+	"snps,hsdk",
+	NULL,
+};
+
+MACHINE_START(SIMULATION, "hsdk")
+	.dt_compat	= hsdk_compat,
+	.init_per_cpu	= hsdk_init_per_cpu,
+MACHINE_END
-- 
2.7.5
