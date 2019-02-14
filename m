From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 14 Feb 2019 18:07:45 +0300
Subject: [PATCH v2 2/2] ARC: enable uboot support unconditionally
In-Reply-To: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190214150745.18773-3-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

After reworking U-boot args handling code and adding paranoid
arguments check we can eliminate CONFIG_ARC_UBOOT_SUPPORT and
enable uboot support unconditionally.

For JTAG case we can assume that core registers will come up
reset value of 0 or in worst case we rely on user passing
'-on=clear_regs' to Metaware debugger.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/Kconfig                        | 12 ------------
 arch/arc/configs/nps_defconfig          |  1 -
 arch/arc/configs/vdk_hs38_defconfig     |  1 -
 arch/arc/configs/vdk_hs38_smp_defconfig |  2 --
 arch/arc/kernel/head.S                  |  2 --
 arch/arc/kernel/setup.c                 |  2 --
 6 files changed, 20 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 376366a7db81..f9534417b201 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -191,7 +191,6 @@ config NR_CPUS
 
 config ARC_SMP_HALT_ON_RESET
 	bool "Enable Halt-on-reset boot mode"
-	default y if ARC_UBOOT_SUPPORT
 	help
 	  In SMP configuration cores can be configured as Halt-on-reset
 	  or they could all start at same time. For Halt-on-reset, non
@@ -515,17 +514,6 @@ config ARC_DBG_TLB_PARANOIA
 
 endif
 
-config ARC_UBOOT_SUPPORT
-	bool "Support uboot arg Handling"
-	help
-	  ARC Linux by default checks for uboot provided args as pointers to
-	  external cmdline or DTB. This however breaks in absence of uboot,
-	  when booting from Metaware debugger directly, as the registers are
-	  not zeroed out on reset by mdb and/or ARCv2 based cores. The bogus
-	  registers look like uboot args to kernel which then chokes.
-	  So only enable the uboot arg checking/processing if users are sure
-	  of uboot being in play.
-
 config ARC_BUILTIN_DTB_NAME
 	string "Built in DTB"
 	help
diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
index 6e84060e7c90..621f59407d76 100644
--- a/arch/arc/configs/nps_defconfig
+++ b/arch/arc/configs/nps_defconfig
@@ -31,7 +31,6 @@ CONFIG_ARC_CACHE_LINE_SHIFT=5
 # CONFIG_ARC_HAS_LLSC is not set
 CONFIG_ARC_KVADDR_SIZE=402
 CONFIG_ARC_EMUL_UNALIGNED=y
-CONFIG_ARC_UBOOT_SUPPORT=y
 CONFIG_PREEMPT=y
 CONFIG_NET=y
 CONFIG_UNIX=y
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index 1e59a2e9c602..e447ace6fa1c 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -13,7 +13,6 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
-CONFIG_ARC_UBOOT_SUPPORT=y
 CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38"
 CONFIG_PREEMPT=y
 CONFIG_NET=y
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index b5c3f6c54b03..c82cdb10aaf4 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -15,8 +15,6 @@ CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
 # CONFIG_ARC_TIMERS_64BIT is not set
-# CONFIG_ARC_SMP_HALT_ON_RESET is not set
-CONFIG_ARC_UBOOT_SUPPORT=y
 CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
 CONFIG_PREEMPT=y
 CONFIG_NET=y
diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index d45b862be05c..6fb1a35f9a29 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -90,7 +90,6 @@ ENTRY(stext)
 	st.ab   0, [r5, 4]
 1:
 
-#ifdef CONFIG_ARC_UBOOT_SUPPORT
 	; Uboot - kernel ABI
 	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
 	;    r1 = magic number (always zero as of now)
@@ -98,7 +97,6 @@ ENTRY(stext)
 	; These are handled later in handle_uboot_args()
 	st	r0, [@uboot_tag]
 	st	r2, [@uboot_arg]
-#endif
 
 	; setup "current" tsk and optionally cache it in dedicated r25
 	mov	r9, @init_task
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 88a885db9bb8..dbab88c8bbb3 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -487,7 +487,6 @@ void __init handle_uboot_args(void)
 	bool use_embedded_dtb = true;
 	bool append_cmdline = false;
 
-#ifdef CONFIG_ARC_UBOOT_SUPPORT
 	/* check that we know this tag */
 	if (uboot_tag != UBOOT_TAG_NONE &&
 	    uboot_tag != UBOOT_TAG_CMDLINE &&
@@ -513,7 +512,6 @@ void __init handle_uboot_args(void)
 		append_cmdline = true;
 
 ignore_uboot_args:
-#endif
 
 	if (use_embedded_dtb) {
 		machine_desc = setup_machine_fdt(__dtb_start);
-- 
2.14.5
