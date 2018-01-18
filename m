From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Jan 2018 16:48:08 +0300
Subject: [PATCH] ARC: Allow disabling of prefetch operations for debugging
 purposes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180118134808.40970-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Kconfig                 |  5 +++++
 arch/arc/include/asm/processor.h | 11 +++++++++++
 arch/arc/lib/memcpy-archs.S      | 16 ++++++++++++++++
 arch/arc/lib/memset-archs.S      |  6 ++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 9d5fd00d9e91..aa5262e8e43f 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -532,6 +532,11 @@ config ARC_DBG_TLB_PARANOIA
 	bool "Paranoia Checks in Low Level TLB Handlers"
 	default n
 
+config ARC_DISABLE_PREFETCH
+	bool "Disable use of prefetch instructions"
+	default n
+	help
+	  Suppresses usage of prefetchw and prealloc instructions.
 endif
 
 config ARC_UBOOT_SUPPORT
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 8ee41e988169..01011c0515d4 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -106,6 +106,17 @@ extern unsigned int get_wchan(struct task_struct *p);
  */
 #define current_text_addr() ({ __label__ _l; _l: &&_l; })
 
+#ifdef CONFIG_ARC_DISABLE_PREFETCH
+#define ARCH_HAS_PREFETCH
+#define prefetch(x)
+
+#define ARCH_HAS_PREFETCHW
+#define prefetchw(x)
+
+#define ARCH_HAS_SPINLOCK_PREFETCH
+#define spin_lock_prefetch(x)
+#endif /* CONFIG_ARC_DISABLE_PREFETCH */
+
 #endif /* !__ASSEMBLY__ */
 
 /*
diff --git a/arch/arc/lib/memcpy-archs.S b/arch/arc/lib/memcpy-archs.S
index d61044dd8b58..0a29d024be01 100644
--- a/arch/arc/lib/memcpy-archs.S
+++ b/arch/arc/lib/memcpy-archs.S
@@ -41,8 +41,10 @@
 #endif
 
 ENTRY_CFI(memcpy)
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetch [r1]		; Prefetch the read location
 	prefetchw [r0]		; Prefetch the write location
+#endif
 	mov.f	0, r2
 ;;; if size is zero
 	jz.d	[blink]
@@ -72,8 +74,10 @@ ENTRY_CFI(memcpy)
 	lpnz	@.Lcopy32_64bytes
 	;; LOOP START
 	LOADX (r6, r1)
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	PREFETCH_READ (r1)
 	PREFETCH_WRITE (r3)
+#endif
 	LOADX (r8, r1)
 	LOADX (r10, r1)
 	LOADX (r4, r1)
@@ -117,9 +121,13 @@ ENTRY_CFI(memcpy)
 	lpnz	@.Lcopy8bytes_1
 	;; LOOP START
 	ld.ab	r6, [r1, 4]
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetch [r1, 28]	;Prefetch the next read location
+#endif
 	ld.ab	r8, [r1,4]
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetchw [r3, 32]	;Prefetch the next write location
+#endif
 
 	SHIFT_1	(r7, r6, 24)
 	or	r7, r7, r5
@@ -162,9 +170,13 @@ ENTRY_CFI(memcpy)
 	lpnz	@.Lcopy8bytes_2
 	;; LOOP START
 	ld.ab	r6, [r1, 4]
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetch [r1, 28]	;Prefetch the next read location
+#endif
 	ld.ab	r8, [r1,4]
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetchw [r3, 32]	;Prefetch the next write location
+#endif
 
 	SHIFT_1	(r7, r6, 16)
 	or	r7, r7, r5
@@ -204,9 +216,13 @@ ENTRY_CFI(memcpy)
 	lpnz	@.Lcopy8bytes_3
 	;; LOOP START
 	ld.ab	r6, [r1, 4]
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetch [r1, 28]	;Prefetch the next read location
+#endif
 	ld.ab	r8, [r1,4]
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetchw [r3, 32]	;Prefetch the next write location
+#endif
 
 	SHIFT_1	(r7, r6, 8)
 	or	r7, r7, r5
diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index 62ad4bcb841a..343f292d92a0 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -11,7 +11,9 @@
 #undef PREALLOC_NOT_AVAIL
 
 ENTRY_CFI(memset)
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetchw [r0]		; Prefetch the write location
+#endif
 	mov.f	0, r2
 ;;; if size is zero
 	jz.d	[blink]
@@ -48,11 +50,13 @@ ENTRY_CFI(memset)
 
 	lpnz	@.Lset64bytes
 	;; LOOP START
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 #ifdef PREALLOC_NOT_AVAIL
 	prefetchw [r3, 64]	;Prefetch the next write location
 #else
 	prealloc  [r3, 64]
 #endif
+#endif /* CONFIG_ARC_DISABLE_PREFETCH */
 #ifdef CONFIG_ARC_HAS_LL64
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
@@ -85,7 +89,9 @@ ENTRY_CFI(memset)
 	lsr.f	lp_count, r2, 5 ;Last remaining  max 124 bytes
 	lpnz	.Lset32bytes
 	;; LOOP START
+#ifndef CONFIG_ARC_DISABLE_PREFETCH
 	prefetchw   [r3, 32]	;Prefetch the next write location
+#endif
 #ifdef CONFIG_ARC_HAS_LL64
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
-- 
2.11.0
