From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 26 Jun 2018 18:26:24 -0700
Subject: [PATCH v2] ldso/arc: fix LD_DEBUG segv when printing R_ARC_NONE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1530062784-12353-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
v2: Also remove a bogus trailing l in prints
---
 ldso/ldso/arc/elfinterp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ldso/ldso/arc/elfinterp.c b/ldso/ldso/arc/elfinterp.c
index 5a02bc2348da..a30c19bcb832 100644
--- a/ldso/ldso/arc/elfinterp.c
+++ b/ldso/ldso/arc/elfinterp.c
@@ -64,7 +64,7 @@ _dl_linux_resolver(struct elf_resolve *tpnt, unsigned int plt_pc)
 	if (_dl_debug_bindings) {
 		_dl_dprintf(_dl_debug_file, "\nresolve function: %s", symname);
 		if (_dl_debug_detail)
-			_dl_dprintf(_dl_debug_file, "\n\tpatched %x ==> %pc @ %pl\n",
+			_dl_dprintf(_dl_debug_file, "\n\tpatched %x ==> %pc @ %p\n",
 					*got_addr, new_addr, got_addr);
 	}
 
@@ -178,7 +178,7 @@ _dl_do_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
 
 log_entry:
 #if defined __SUPPORT_LD_DEBUG__
-	if (_dl_debug_detail)
+	if (_dl_debug_detail && (reloc_type != R_ARC_NONE))
 		_dl_dprintf(_dl_debug_file,"\tpatched: %x ==> %x @ %x",
 				old_val, *reloc_addr, reloc_addr);
 #endif
@@ -214,7 +214,7 @@ _dl_do_lazy_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
 	}
 
 #if defined __SUPPORT_LD_DEBUG__
-	if (_dl_debug_reloc && _dl_debug_detail)
+	if (_dl_debug_reloc && _dl_debug_detail && (reloc_type != R_ARC_NONE))
 		_dl_dprintf(_dl_debug_file, "\tpatched: %x ==> %x @ %x\n",
 				old_val, *reloc_addr, reloc_addr);
 #endif
-- 
2.7.4
