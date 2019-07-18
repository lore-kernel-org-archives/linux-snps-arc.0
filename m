From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Jul 2019 20:51:23 +0000
Subject: [PATCH v2 2/2] ARC: enable uboot support unconditionally
In-Reply-To: <20190214150745.18773-3-Eugeniy.Paltsev@synopsys.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
 <20190214150745.18773-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120530B12273DDC5B06D823A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Greg,

> -----Original Message-----
> From: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Sent: Thursday, February 14, 2019 6:08 PM
> To: linux-snps-arc at lists.infradead.org; Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-kernel at vger.kernel.org; Alexey Brodkin <abrodkin at synopsys.com>; Corentin Labbe
> <clabbe at baylibre.com>; khilman at baylibre.com; Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Subject: [PATCH v2 2/2] ARC: enable uboot support unconditionally
> 
> After reworking U-boot args handling code and adding paranoid
> arguments check we can eliminate CONFIG_ARC_UBOOT_SUPPORT and
> enable uboot support unconditionally.
> 
> For JTAG case we can assume that core registers will come up
> reset value of 0 or in worst case we rely on user passing
> '-on=clear_regs' to Metaware debugger.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

May we have this one back-ported to linux-4.19.y?

It was initially applied to Linus' tree during 5.0 development
cycle [1] but was never back-ported.

Now w/o that patch in KernelCI we see boot failure on ARC HSDK
board [2] as opposed to normally working later kernel versions.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493a2f812446e92bcb1e69a77381b4d39808d730
[2] https://storage.kernelci.org/stable/linux-4.19.y/v4.19.59/arc/hsdk_defconfig/gcc-8/lab-baylibre/boot-hsdk.txt

Below is that same patch but rebased on linux-4.19 as in its pristine
form it won't apply due to offset of one of hunks.

-Alexey

------------------------------------>8--------------------------------
>From 3e565355f6a2d1a82bc9ecd47a46d1fa3c0cd2c1 Mon Sep 17 00:00:00 2001
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Date: Thu, 14 Feb 2019 18:07:45 +0300
Subject: [PATCH] ARC: enable uboot support unconditionally

After reworking U-boot args handling code and adding paranoid
arguments check we can eliminate CONFIG_ARC_UBOOT_SUPPORT and
enable uboot support unconditionally.

For JTAG case we can assume that core registers will come up
reset value of 0 or in worst case we rely on user passing
'-on=clear_regs' to Metaware debugger.

Cc: stable at vger.kernel.org
Tested-by: Corentin LABBE <clabbe at baylibre.com>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig                        | 13 -------------
 arch/arc/configs/nps_defconfig          |  1 -
 arch/arc/configs/vdk_hs38_defconfig     |  1 -
 arch/arc/configs/vdk_hs38_smp_defconfig |  2 --
 arch/arc/kernel/head.S                  |  2 --
 arch/arc/kernel/setup.c                 |  2 --
 6 files changed, 21 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 85eb7fc2e241..97b45fe8f0c2 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -199,7 +199,6 @@ config NR_CPUS
 
 config ARC_SMP_HALT_ON_RESET
 	bool "Enable Halt-on-reset boot mode"
-	default y if ARC_UBOOT_SUPPORT
 	help
 	  In SMP configuration cores can be configured as Halt-on-reset
 	  or they could all start at same time. For Halt-on-reset, non
@@ -538,18 +537,6 @@ config ARC_DBG_TLB_PARANOIA
 
 endif
 
-config ARC_UBOOT_SUPPORT
-	bool "Support uboot arg Handling"
-	default n
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
index 208bf2c9e7b0..a72bbda2f7aa 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -100,7 +100,6 @@ ENTRY(stext)
 	st.ab   0, [r5, 4]
 1:
 
-#ifdef CONFIG_ARC_UBOOT_SUPPORT
 	; Uboot - kernel ABI
 	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
 	;    r1 = magic number (always zero as of now)
@@ -109,7 +108,6 @@ ENTRY(stext)
 	st	r0, [@uboot_tag]
 	st      r1, [@uboot_magic]
 	st	r2, [@uboot_arg]
-#endif
 
 	; setup "current" tsk and optionally cache it in dedicated r25
 	mov	r9, @init_task
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index a1218937abd6..89c97dcfa360 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -493,7 +493,6 @@ void __init handle_uboot_args(void)
 	bool use_embedded_dtb = true;
 	bool append_cmdline = false;
 
-#ifdef CONFIG_ARC_UBOOT_SUPPORT
 	/* check that we know this tag */
 	if (uboot_tag != UBOOT_TAG_NONE &&
 	    uboot_tag != UBOOT_TAG_CMDLINE &&
@@ -525,7 +524,6 @@ void __init handle_uboot_args(void)
 		append_cmdline = true;
 
 ignore_uboot_args:
-#endif
 
 	if (use_embedded_dtb) {
 		machine_desc = setup_machine_fdt(__dtb_start);
-- 
2.16.2
