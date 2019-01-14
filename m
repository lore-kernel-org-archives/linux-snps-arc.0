From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Jan 2019 18:16:49 +0300
Subject: [PATCH 2/2] ARCv2: LIB: memset: move st instruction series to macros
In-Reply-To: <20190114151649.32726-1-Eugeniy.Paltsev@synopsys.com>
References: <20190114151649.32726-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190114151649.32726-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Move store 32 byte instruction series to macros to make code
more readable.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/lib/memset-archs.S | 63 +++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 42 deletions(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index c7717832336f..4a0d562d23cd 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -31,6 +31,24 @@
 # endif
 #endif /* L1_CACHE_SHIFT!=6 */
 
+.macro MEMSET_32BYTE		val, adr
+#ifdef CONFIG_ARC_HAS_LL64
+	std.ab	\val, [\adr, 8]
+	std.ab	\val, [\adr, 8]
+	std.ab	\val, [\adr, 8]
+	std.ab	\val, [\adr, 8]
+#else
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+	st.ab	\val, [\adr, 4]
+#endif
+.endm
+
 ENTRY_CFI(memset)
 	PREFETCHW_INSTR([r0])	; Prefetch the first write location
 	mov.f	0, r2
@@ -70,53 +88,14 @@ ENTRY_CFI(memset)
 	lpnz	@.Lset64bytes
 	;; LOOP START
 	PREALLOC_INSTR([r3, 64]) ;Prefetch the next write location
-#ifdef CONFIG_ARC_HAS_LL64
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-#else
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-#endif
+	MEMSET_32BYTE	r4, r3
+	MEMSET_32BYTE	r4, r3
 .Lset64bytes:
 
 	lsr.f	lp_count, r2, 5 ;Last remaining  max 124 bytes
 	lpnz	.Lset32bytes
 	;; LOOP START
-#ifdef CONFIG_ARC_HAS_LL64
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-#else
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-#endif
+	MEMSET_32BYTE	r4, r3
 .Lset32bytes:
 
 	and.f	lp_count, r2, 0x1F ;Last remaining 31 bytes
-- 
2.14.5
