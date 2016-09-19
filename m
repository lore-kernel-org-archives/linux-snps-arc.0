From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 19 Sep 2016 14:49:33 -0700
Subject: [PATCH 3/3] ARC: dw2 unwind: switch to .eh_frame based unwinding
In-Reply-To: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474321773-18166-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

So finally after almost 8 years of dealing with .debug_frame, we are
finally switching to .eh_frame. The reason being stripped kernel
binaries had non-functional unwinder as .debug_frame was gone.
Also, in general .eh_frame seems more common way of doing unwinding.

This also folds a revert of f52e126cc747 ("ARC: unwind: ensure that
.debug_frame is generated (vs. .eh_frame)") to ensure that we start
getting .eh_frame

Reported-by: Daniel Mentz <danielmentz at google.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Makefile             |  2 ++
 arch/arc/kernel/entry.S       | 12 ------------
 arch/arc/kernel/module.c      | 13 ++++---------
 arch/arc/kernel/unwind.c      |  5 ++---
 arch/arc/kernel/vmlinux.lds.S | 15 +++++----------
 5 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 601ed173080b..fc6ff8f09f23 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -66,6 +66,8 @@ endif
 
 endif
 
+cflags-$(CONFIG_ARC_DW2_UNWIND)		+= -fasynchronous-unwind-tables
+
 # By default gcc 4.8 generates dwarf4 which kernel unwinder can't grok
 ifeq ($(atleast_gcc48),y)
 cflags-$(CONFIG_ARC_DW2_UNWIND)		+= -gdwarf-2
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 2efb0625331d..741712d4d6ff 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -61,18 +61,6 @@ ENTRY(ret_from_fork)
 	b    ret_from_exception
 END(ret_from_fork)
 
-#ifdef CONFIG_ARC_DW2_UNWIND
-; Workaround for bug 94179 (STAR ):
-; Despite -fasynchronous-unwind-tables, linker is not making dwarf2 unwinder
-; section (.debug_frame) as loadable. So we force it here.
-; This also fixes STAR 9000487933 where the prev-workaround (objcopy --setflag)
-; would not work after a clean build due to kernel build system dependencies.
-.section .debug_frame, "wa", at progbits
-
-; Reset to .text as this file is included in entry-<isa>.S
-.section .text, "ax", at progbits
-#endif
-
 ;################### Non TLB Exception Handling #############################
 
 ; ---------------------------------------------
diff --git a/arch/arc/kernel/module.c b/arch/arc/kernel/module.c
index 576a238434a1..9a2849756022 100644
--- a/arch/arc/kernel/module.c
+++ b/arch/arc/kernel/module.c
@@ -22,13 +22,9 @@ static inline void arc_write_me(unsigned short *addr, unsigned long value)
 	*(addr + 1) = (value & 0xffff);
 }
 
-/* ARC specific section quirks - before relocation loop in generic loader
- *
- * For dwarf unwinding out of modules, this needs to
- * 1. Ensure the .debug_frame is allocatable (ARC Linker bug: despite
- *    -fasynchronous-unwind-tables it doesn't).
- * 2. Since we are iterating thru sec hdr tbl anyways, make a note of
- *    the exact section index, for later use.
+/*
+ * This gets called before relocation loop in generic loader
+ * Make a note of the section index of unwinding section
  */
 int module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 			      char *secstr, struct module *mod)
@@ -40,8 +36,7 @@ int module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 	mod->arch.unw_info = NULL;
 
 	for (i = 1; i < hdr->e_shnum; i++) {
-		if (strcmp(secstr+sechdrs[i].sh_name, ".debug_frame") == 0) {
-			sechdrs[i].sh_flags |= SHF_ALLOC;
+		if (strcmp(secstr+sechdrs[i].sh_name, ".eh_frame") == 0) {
 			mod->arch.unw_sec_idx = i;
 			break;
 		}
diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 4e5dbe7617a1..61fd1ce63c56 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -111,7 +111,7 @@ UNW_REGISTER_INFO};
 #define DW_EH_PE_indirect 0x80
 #define DW_EH_PE_omit     0xff
 
-#define CIE_ID	0xffffffffUL
+#define CIE_ID	0
 
 typedef unsigned long uleb128_t;
 typedef signed long sleb128_t;
@@ -510,8 +510,7 @@ static const u32 *__cie_for_fde(const u32 *fde)
 {
 	const u32 *cie;
 
-	/* cie = fde + 1 - fde[1] / sizeof(*fde); */
-	cie = (u32 *) fde[1];
+	cie = fde + 1 - fde[1] / sizeof(*fde);
 
 	return cie;
 }
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 894e696bddaa..bb6d8c5ff2e9 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -84,7 +84,7 @@ SECTIONS
 
 	/*
 	 * .exit.text is discard at runtime, not link time, to deal with
-	 * references from .debug_frame
+	 * references from unwinding sections
 	 * It will be init freed, being inside [__init_start : __init_end]
 	 */
 	.exit.text : { EXIT_TEXT }
@@ -120,18 +120,13 @@ SECTIONS
 
 #ifdef CONFIG_ARC_DW2_UNWIND
 	. = ALIGN(PAGE_SIZE);
-	.debug_frame  : {
+	.eh_frame  : {
 		__start_unwind = .;
-		*(.debug_frame)
+		*(.eh_frame)
 		__end_unwind = .;
 	}
-	/*
-	 * gcc 4.8 generates this for -fasynchonous-unwind-tables,
-	 * while we still use the .debug_frame based unwinder
-	 */
-	/DISCARD/ : {	*(.eh_frame) }
 #else
-	/DISCARD/ : {	*(.debug_frame) }
+	/DISCARD/ : {	*(.eh_frame) }
 #endif
 
 	NOTES
@@ -148,7 +143,7 @@ SECTIONS
 	}
 
 #ifndef CONFIG_DEBUG_INFO
-	/* open-coded because we need .debug_frame seperately for unwinding */
+	/DISCARD/ : { *(.debug_frame) }
 	/DISCARD/ : { *(.debug_aranges) }
 	/DISCARD/ : { *(.debug_pubnames) }
 	/DISCARD/ : { *(.debug_info) }
-- 
2.7.4
