From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 9 Nov 2016 16:03:33 -0800
Subject: [PATCH] ARC: string: handle gcc 6.x macro changes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478736213-26116-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In gcc 6.x cleanup, the macros got renamed.
(Need to support the old toggle for some more time)

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 libc/string/arc/arcv2/memcpy.S | 2 +-
 libc/string/arc/arcv2/memset.S | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libc/string/arc/arcv2/memcpy.S b/libc/string/arc/arcv2/memcpy.S
index 7573daf51acb..ba29e8790721 100644
--- a/libc/string/arc/arcv2/memcpy.S
+++ b/libc/string/arc/arcv2/memcpy.S
@@ -23,7 +23,7 @@
 # define EXTRACT_2(RX,RY,IMM)	lsr	RX, RY, 0x08
 #endif
 
-#ifdef __LL64__
+#if defined(__LL64__) || defined(__ARC_LL64__)
 # define PREFETCH_READ(RX)	prefetch [RX, 56]
 # define PREFETCH_WRITE(RX)	prefetchw [RX, 64]
 # define LOADX(DST,RX)		ldd.ab	DST, [RX, 8]
diff --git a/libc/string/arc/arcv2/memset.S b/libc/string/arc/arcv2/memset.S
index 0918d377462c..343cfaf81c6d 100644
--- a/libc/string/arc/arcv2/memset.S
+++ b/libc/string/arc/arcv2/memset.S
@@ -52,7 +52,7 @@ ENTRY(memset)
 	lpnz	@.Lset64bytes
 	;; LOOP START
 	PREWRITE(r3, 64)	;Prefetch the next write location
-#ifdef __LL64__
+#if defined(__LL64__) || defined(__ARC_LL64__)
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
@@ -85,7 +85,7 @@ ENTRY(memset)
 	lpnz	.Lset32bytes
 	;; LOOP START
 	prefetchw [r3, 32]	;Prefetch the next write location
-#ifdef __LL64__
+#if defined(__LL64__) || defined(__ARC_LL64__)
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
-- 
2.7.4
