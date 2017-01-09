From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 9 Jan 2017 09:31:19 -0800
Subject: [PATCH] ARC: ldso: don't use _DYNAMIC@gotpc construct to refer to GOT
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1483983079-28539-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Historically we've used a special construct _DYNAMIC at gotpc to refer to
base address of GOT This has been done with a special hack in binutils
which tools guys now wish to get rid off.

So rewrite the 2 callers of this construct to use the simpler and more
obvious constructs. There's existing _GLOBAL_OFFSET_TABLE symbols
provided by linker which can be used for same purposes.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ldso/ldso/arc/dl-sysdep.h | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/ldso/ldso/arc/dl-sysdep.h b/ldso/ldso/arc/dl-sysdep.h
index c6086e68e5c6..361a9bb9c0c3 100644
--- a/ldso/ldso/arc/dl-sysdep.h
+++ b/ldso/ldso/arc/dl-sysdep.h
@@ -119,37 +119,26 @@ extern unsigned __udivmodsi4(unsigned, unsigned) attribute_hidden;
    | (((type) == R_ARC_COPY) * ELF_RTYPE_CLASS_COPY))
 
 /*
- * Get the runtime address of GOT[0]
+ * Get build time address of .dynamic as setup in GOT[0]
+ * This is called very early in _dl_start() so it has not been relocated to
+ * runtime value
  */
 static __always_inline Elf32_Addr elf_machine_dynamic(void)
 {
-	Elf32_Addr dyn;
-
-	__asm__("ld %0,[pcl,_DYNAMIC at gotpc]\n\t" : "=r" (dyn));
-	return dyn;
+  /* Declaring this hidden ensures that a PC-relative reference is used.  */
+  extern const Elf32_Addr _GLOBAL_OFFSET_TABLE_[] attribute_hidden;
+  return _GLOBAL_OFFSET_TABLE_[0];
 }
 
 /* Return the run-time load address of the shared object.  */
 static __always_inline Elf32_Addr elf_machine_load_address(void)
 {
-    /* To find the loadaddr we subtract the runtime addr of a non-local symbol
-     * say _DYNAMIC from it's build-time addr.
-     * N.B., gotpc loads get optimized by the linker if it finds the symbol
-     * is resolved locally.
-     * A more robust - and efficient - solution would be to use a symbol
-     * set by the linker.  To make it actually save space, we'd have to
-     * suppress the unwanted text relocation in the linked dso, though.
-     * (I.e. in ldso.so.*, though it's just another dso as far as bfd/ld
-     * are concerned.)
-     */
-	Elf32_Addr addr, tmp;
-	__asm__ (
-        "ld  %1, [pcl, _DYNAMIC at gotpc] ;build addr of _DYNAMIC"   "\n"
-        "add %0, pcl, _DYNAMIC at pcl     ;runtime addr of _DYNAMIC" "\n"
-        "sub %0, %0, %1                ;delta"                    "\n"
-        : "=&r" (addr), "=r"(tmp)
-    );
-	return addr;
+	Elf32_Addr build_addr, run_addr;
+
+	build_addr = elf_machine_dynamic();
+	__asm__ ("add %0, pcl, _DYNAMIC at pcl	\n" : "=r" (run_addr));
+
+	return run_addr - build_addr;
 }
 
 static __always_inline void
-- 
2.7.4
