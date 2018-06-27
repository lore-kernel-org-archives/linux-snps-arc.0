From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 26 Jun 2018 17:13:31 -0700
Subject: [PATCH] ldso/arc: fix LD_DEBUG segv when printing R_ARC_NONE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1530058411-720-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ldso/ldso/arc/elfinterp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ldso/ldso/arc/elfinterp.c b/ldso/ldso/arc/elfinterp.c
index 5a02bc2348da..17d588899dfc 100644
--- a/ldso/ldso/arc/elfinterp.c
+++ b/ldso/ldso/arc/elfinterp.c
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
