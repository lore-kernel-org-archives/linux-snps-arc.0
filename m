From: b.zolnierkie@samsung.com (Bartlomiej Zolnierkiewicz)
Date: Wed, 10 Oct 2018 16:46:17 +0200
Subject: [PATCH] ARC: remove redundant 'default n' from Kconfig
References: <CGME20181010144619eucas1p2e4e6d3c43dd12e5b9cec7a29c4bf95ad@eucas1p2.samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181010144619eucas1p2e4e6d3c43dd12e5b9cec7a29c4bf95ad~cRpUq8hi71426914269eucas1p2J@eucas1p2.samsung.com>
To: linux-snps-arc@lists.infradead.org

'default n' is the default value for any bool or tristate Kconfig
setting so there is no need to write it explicitly.

Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
is not set' for visible symbols") the Kconfig behavior is the same
regardless of 'default n' being present or not:

    ...
    One side effect of (and the main motivation for) this change is making
    the following two definitions behave exactly the same:
    
        config FOO
                bool
    
        config FOO
                bool
                default n
    
    With this change, neither of these will generate a
    '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
    That might make it clearer to people that a bare 'default n' is
    redundant.
    ...

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie at samsung.com>
---
 arch/arc/Kconfig |   11 -----------
 1 file changed, 11 deletions(-)

Index: b/arch/arc/Kconfig
===================================================================
--- a/arch/arc/Kconfig	2018-10-09 15:58:34.951122837 +0200
+++ b/arch/arc/Kconfig	2018-10-10 16:44:11.551907020 +0200
@@ -176,13 +176,11 @@ endchoice
 
 config CPU_BIG_ENDIAN
 	bool "Enable Big Endian Mode"
-	default n
 	help
 	  Build kernel for Big Endian Mode of ARC CPU
 
 config SMP
 	bool "Symmetric Multi-Processing"
-	default n
 	select ARC_MCIP if ISA_ARCV2
 	help
 	  This enables support for systems with more than one CPU.
@@ -254,7 +252,6 @@ config ARC_CACHE_PAGES
 config ARC_CACHE_VIPT_ALIASING
 	bool "Support VIPT Aliasing D$"
 	depends on ARC_HAS_DCACHE && ISA_ARCOMPACT
-	default n
 
 endif	#ARC_CACHE
 
@@ -262,7 +259,6 @@ config ARC_HAS_ICCM
 	bool "Use ICCM"
 	help
 	  Single Cycle RAMS to store Fast Path Code
-	default n
 
 config ARC_ICCM_SZ
 	int "ICCM Size in KB"
@@ -273,7 +269,6 @@ config ARC_HAS_DCCM
 	bool "Use DCCM"
 	help
 	  Single Cycle RAMS to store Fast Path Data
-	default n
 
 config ARC_DCCM_SZ
 	int "DCCM Size in KB"
@@ -366,13 +361,11 @@ if ISA_ARCOMPACT
 
 config ARC_COMPACT_IRQ_LEVELS
 	bool "Setup Timer IRQ as high Priority"
-	default n
 	# if SMP, LV2 enabled ONLY if ARC implementation has LV2 re-entrancy
 	depends on !SMP
 
 config ARC_FPU_SAVE_RESTORE
 	bool "Enable FPU state persistence across context switch"
-	default n
 	help
 	  Double Precision Floating Point unit had dedicated regs which
 	  need to be saved/restored across context-switch.
@@ -453,7 +446,6 @@ config HIGHMEM
 
 config ARC_HAS_PAE40
 	bool "Support for the 40-bit Physical Address Extension"
-	default n
 	depends on ISA_ARCV2
 	select HIGHMEM
 	select PHYS_ADDR_T_64BIT
@@ -496,7 +488,6 @@ config HZ
 
 config ARC_METAWARE_HLINK
 	bool "Support for Metaware debugger assisted Host access"
-	default n
 	help
 	  This options allows a Linux userland apps to directly access
 	  host file system (open/creat/read/write etc) with help from
@@ -524,13 +515,11 @@ config ARC_DW2_UNWIND
 
 config ARC_DBG_TLB_PARANOIA
 	bool "Paranoia Checks in Low Level TLB Handlers"
-	default n
 
 endif
 
 config ARC_UBOOT_SUPPORT
 	bool "Support uboot arg Handling"
-	default n
 	help
 	  ARC Linux by default checks for uboot provided args as pointers to
 	  external cmdline or DTB. This however breaks in absence of uboot,
