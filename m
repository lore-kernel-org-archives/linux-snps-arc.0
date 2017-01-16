From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Jan 2017 10:58:52 -0800
Subject: [PATCH] ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484593145-1493-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

commit d65283f7b695b5 added mod->arch.secstr under
CONFIG_ARC_DW2_UNWIND, but used it unconditionally which broke builds
when the option was disabled. Fix that by adjusting the #ifdef guard.

And while at it add a missing guard (for unwinder) in module.c as well

Reported-by: Waldemar Brodkorb <wbx at openadk.org>
Cc: <stable at vger.kernel.org [4.9]>
Fixes: d65283f7b695b5 ("ARC: module: elide loop to save reference to .eh_frame")
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/module.h | 4 ++--
 arch/arc/kernel/module.c      | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/module.h b/arch/arc/include/asm/module.h
index 6e91d8b339c3..567590ea8f6c 100644
--- a/arch/arc/include/asm/module.h
+++ b/arch/arc/include/asm/module.h
@@ -14,13 +14,13 @@
 
 #include <asm-generic/module.h>
 
-#ifdef CONFIG_ARC_DW2_UNWIND
 struct mod_arch_specific {
+#ifdef CONFIG_ARC_DW2_UNWIND
 	void *unw_info;
 	int unw_sec_idx;
+#endif
 	const char *secstr;
 };
-#endif
 
 #define MODULE_PROC_FAMILY "ARC700"
 
diff --git a/arch/arc/kernel/module.c b/arch/arc/kernel/module.c
index 42e964db2967..3d99a6091332 100644
--- a/arch/arc/kernel/module.c
+++ b/arch/arc/kernel/module.c
@@ -32,8 +32,8 @@ int module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 #ifdef CONFIG_ARC_DW2_UNWIND
 	mod->arch.unw_sec_idx = 0;
 	mod->arch.unw_info = NULL;
-	mod->arch.secstr = secstr;
 #endif
+	mod->arch.secstr = secstr;
 	return 0;
 }
 
@@ -113,8 +113,10 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 
 	}
 
+#ifdef CONFIG_ARC_DW2_UNWIND
 	if (strcmp(module->arch.secstr+sechdrs[tgtsec].sh_name, ".eh_frame") == 0)
 		module->arch.unw_sec_idx = tgtsec;
+#endif
 
 	return 0;
 
-- 
2.7.4
