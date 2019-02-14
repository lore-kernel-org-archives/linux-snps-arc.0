From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 14 Feb 2019 18:07:44 +0300
Subject: [PATCH v2 1/2] ARC: U-boot: check arguments paranoidly
In-Reply-To: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190214150745.18773-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Handle U-boot arguments paranoidly:
 * don't allow to pass unknown tag.
 * try to use external device tree blob only if corresponding tag
   (TAG_DTB) is set.
 * don't check uboot_tag if kernel build with no ARC_UBOOT_SUPPORT.

NOTE:
If U-boot args are invalid we skip them and try to use embedded device
tree blob. We can't panic on invalid U-boot args as we really pass
invalid args due to bug in U-boot code.
This happens if we don't provide external DTB to U-boot and
don't set 'bootargs' U-boot environment variable (which is default
case at least for HSDK board) In that case we will pass
{r0 = 1 (bootargs in r2); r1 = 0; r2 = 0;} to linux which is invalid.

While I'm at it refactor U-boot arguments handling code.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/head.S  |  4 +--
 arch/arc/kernel/setup.c | 90 +++++++++++++++++++++++++++++++++++--------------
 2 files changed, 66 insertions(+), 28 deletions(-)

diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 8b90d25a15cc..d45b862be05c 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -93,9 +93,9 @@ ENTRY(stext)
 #ifdef CONFIG_ARC_UBOOT_SUPPORT
 	; Uboot - kernel ABI
 	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
-	;    r1 = magic number (board identity, unused as of now
+	;    r1 = magic number (always zero as of now)
 	;    r2 = pointer to uboot provided cmdline or external DTB in mem
-	; These are handled later in setup_arch()
+	; These are handled later in handle_uboot_args()
 	st	r0, [@uboot_tag]
 	st	r2, [@uboot_arg]
 #endif
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index feb90093e6b1..88a885db9bb8 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -36,7 +36,7 @@ unsigned int intr_to_DE_cnt;
 
 /* Part of U-boot ABI: see head.S */
 int __initdata uboot_tag;
-char __initdata *uboot_arg;
+unsigned int __initdata uboot_arg;
 
 const struct machine_desc *machine_desc;
 
@@ -462,43 +462,81 @@ void setup_processor(void)
 	arc_chk_core_config();
 }
 
-static inline int is_kernel(unsigned long addr)
+static inline bool uboot_arg_invalid(unsigned int addr)
 {
-	if (addr >= (unsigned long)_stext && addr <= (unsigned long)_end)
-		return 1;
-	return 0;
+	/*
+	 * Check that it is a untranslated address (although MMU is not enabled
+	 * yet, it being a high address ensures this is not by fluke)
+	 */
+	if (addr < PAGE_OFFSET)
+		return true;
+
+	/* Check that address doesn't clobber resident kernel image */
+	return addr >= (unsigned int)_stext && addr <= (unsigned int)_end;
 }
 
-void __init setup_arch(char **cmdline_p)
+#define IGNORE_ARGS		"Ignore U-boot args: "
+
+/* uboot_tag values for U-boot - kernel ABI revision 0; see head.S */
+#define UBOOT_TAG_NONE		0
+#define UBOOT_TAG_CMDLINE	1
+#define UBOOT_TAG_DTB		2
+
+void __init handle_uboot_args(void)
 {
+	bool use_embedded_dtb = true;
+	bool append_cmdline = false;
+
 #ifdef CONFIG_ARC_UBOOT_SUPPORT
-	/* make sure that uboot passed pointer to cmdline/dtb is valid */
-	if (uboot_tag && is_kernel((unsigned long)uboot_arg))
-		panic("Invalid uboot arg\n");
+	/* check that we know this tag */
+	if (uboot_tag != UBOOT_TAG_NONE &&
+	    uboot_tag != UBOOT_TAG_CMDLINE &&
+	    uboot_tag != UBOOT_TAG_DTB) {
+		pr_warn(IGNORE_ARGS "invalid uboot tag: '%08x'\n", uboot_tag);
+		goto ignore_uboot_args;
+	}
+
+	if (uboot_tag != UBOOT_TAG_NONE && uboot_arg_invalid(uboot_arg)) {
+		pr_warn(IGNORE_ARGS "invalid uboot arg: '%08x'\n", uboot_arg);
+		goto ignore_uboot_args;
+	}
+
+	/* see if U-boot passed an external Device Tree blob */
+	if (uboot_tag == UBOOT_TAG_DTB) {
+		machine_desc = setup_machine_fdt((void *)uboot_arg);
 
-	/* See if u-boot passed an external Device Tree blob */
-	machine_desc = setup_machine_fdt(uboot_arg);	/* uboot_tag == 2 */
-	if (!machine_desc)
+		/* external Device Tree blob is invalid - use embedded one */
+		use_embedded_dtb = !machine_desc;
+	}
+
+	if (uboot_tag == UBOOT_TAG_CMDLINE)
+		append_cmdline = true;
+
+ignore_uboot_args:
 #endif
-	{
-		/* No, so try the embedded one */
+
+	if (use_embedded_dtb) {
 		machine_desc = setup_machine_fdt(__dtb_start);
 		if (!machine_desc)
 			panic("Embedded DT invalid\n");
+	}
 
-		/*
-		 * If we are here, it is established that @uboot_arg didn't
-		 * point to DT blob. Instead if u-boot says it is cmdline,
-		 * append to embedded DT cmdline.
-		 * setup_machine_fdt() would have populated @boot_command_line
-		 */
-		if (uboot_tag == 1) {
-			/* Ensure a whitespace between the 2 cmdlines */
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-			strlcat(boot_command_line, uboot_arg,
-				COMMAND_LINE_SIZE);
-		}
+	/*
+	 * If we are here, it is established that @uboot_arg points to cmdline,
+	 * which should be appended to embedded DT cmdline.
+	 * NOTE: Don't move the cmdline processing before embedded DT processing
+	 * since we rely on @boot_command_line populating by setup_machine_fdt()
+	 */
+	if (append_cmdline) {
+		/* Ensure a whitespace between the 2 cmdlines */
+		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, (char *)uboot_arg, COMMAND_LINE_SIZE);
 	}
+}
+
+void __init setup_arch(char **cmdline_p)
+{
+	handle_uboot_args();
 
 	/* Save unparsed command line copy for /proc/cmdline */
 	*cmdline_p = boot_command_line;
-- 
2.14.5
