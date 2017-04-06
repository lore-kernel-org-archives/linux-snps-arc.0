From: Cupertino.Miranda@synopsys.com (Cupertino Miranda)
Date: Thu,  6 Apr 2017 11:57:25 +0200
Subject: [PATCH] Same iteration variable used for inner and outer loop
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170406095725.18604-1-cmiranda@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Inner loop was using same counter variable (i) as the outer loop, therefore
making outer loop terminate before it visited all of the ELF program segments.
Surrounding code in this inner loop clearly shows the intention that this loop
should not affect the outer one, therefore leading me to the conclusion that
this should be a bug an not expected code.

This bug was detected due to some other bug in ARC binutils that kept setting
TEXTREL for any PIE application.

Apart from the but, I have also moved the debug message inside of the TEXTREL
condition as mprotect is only really called if TELTREL is set.
---
 ldso/ldso/ldso.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
index 4e8a49e..a077f20 100644
--- a/ldso/ldso/ldso.c
+++ b/ldso/ldso/ldso.c
@@ -668,12 +668,13 @@ of this helper program; chances are you did not intend to run this program.\n\
 			 * dynamic linking.  We can set the protection back
 			 * again once we are done.
 			 */
-			_dl_debug_early("calling mprotect on the application program\n");
 			/* Now cover the application program. */
 			if (app_tpnt->dynamic_info[DT_TEXTREL]) {
+				int j;
 				ElfW(Phdr) *ppnt_outer = ppnt;
+				_dl_debug_early("calling mprotect on the application program\n");
 				ppnt = (ElfW(Phdr) *) auxvt[AT_PHDR].a_un.a_val;
-				for (i = 0; i < auxvt[AT_PHNUM].a_un.a_val; i++, ppnt++) {
+				for (j = 0; j < auxvt[AT_PHNUM].a_un.a_val; j++, ppnt++) {
 					if (ppnt->p_type == PT_LOAD && !(ppnt->p_flags & PF_W))
 						_dl_mprotect((void *) (DL_RELOC_ADDR(app_tpnt->loadaddr, ppnt->p_vaddr) & PAGE_ALIGN),
 							     (DL_RELOC_ADDR(app_tpnt->loadaddr, ppnt->p_vaddr) & ADDR_ALIGN) +
-- 
2.9.0
