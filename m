From: joseph@codesourcery.com (Joseph Myers)
Date: Fri, 21 Dec 2018 18:46:41 +0000
Subject: [PATCH 01/21] longlong.h: sync from gcc to fix ARC inline asm
 constraints
In-Reply-To: <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812211845320.10148@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> This corresponds to the version
> 
> Author: law <law at 138bc75d-0d04-0410-961f-82ee72b054a4>
> Date:   Tue Jun 27 16:10:15 2017 +0000
> 
>         * longlong.h: Remove ns32k support.

It seems odd to update from an out-of-date version of longlong.h, missing 
the subsequent RISC-V changes.  So I've committed this patch instead to 
update to the current version in GCC.



Update longlong.h.

This patch updates longlong.h from GCC.  There were no local changes
in glibc (the previous version was identical to the r232143 GCC
version, apart from copyright dates which had been updated in both
places), so this patch makes it identical to the version in GCC again.

Tested for x86_64 and x86.  Also tested with build-many-glibcs.py for
its RISC-V configurations, as the glibc architecture with the most
substantial changes in longlong.h in this patch.

2018-12-21  Joseph Myers  <joseph at codesourcery.com>

	* stdlib/longlong.h: Update from GCC.

diff --git a/stdlib/longlong.h b/stdlib/longlong.h
index c7c6977c9f..7f3dc17dc0 100644
--- a/stdlib/longlong.h
+++ b/stdlib/longlong.h
@@ -197,17 +197,17 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
 	   : "=r" ((USItype) (sh)),					\
 	     "=&r" ((USItype) (sl))					\
 	   : "%r" ((USItype) (ah)),					\
-	     "rIJ" ((USItype) (bh)),					\
+	     "rICal" ((USItype) (bh)),					\
 	     "%r" ((USItype) (al)),					\
-	     "rIJ" ((USItype) (bl)))
+	     "rICal" ((USItype) (bl)))
 #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
   __asm__ ("sub.f	%1, %4, %5\n\tsbc	%0, %2, %3"		\
 	   : "=r" ((USItype) (sh)),					\
 	     "=&r" ((USItype) (sl))					\
 	   : "r" ((USItype) (ah)),					\
-	     "rIJ" ((USItype) (bh)),					\
+	     "rICal" ((USItype) (bh)),					\
 	     "r" ((USItype) (al)),					\
-	     "rIJ" ((USItype) (bl)))
+	     "rICal" ((USItype) (bl)))
 
 #define __umulsidi3(u,v) ((UDItype)(USItype)u*(USItype)v)
 #ifdef __ARC_NORM__
@@ -221,8 +221,8 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
     }									\
   while (0)
 #define COUNT_LEADING_ZEROS_0 32
-#endif
-#endif
+#endif /* __ARC_NORM__ */
+#endif /* __arc__ */
 
 #if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) \
  && W_TYPE_SIZE == 32
@@ -858,42 +858,6 @@ extern UDItype __umulsidi3 (USItype, USItype);
 #endif
 #endif /* __mips__ */
 
-#if defined (__ns32000__) && W_TYPE_SIZE == 32
-#define umul_ppmm(w1, w0, u, v) \
-  ({union {UDItype __ll;						\
-	   struct {USItype __l, __h;} __i;				\
-	  } __xx;							\
-  __asm__ ("meid %2,%0"							\
-	   : "=g" (__xx.__ll)						\
-	   : "%0" ((USItype) (u)),					\
-	     "g" ((USItype) (v)));					\
-  (w1) = __xx.__i.__h; (w0) = __xx.__i.__l;})
-#define __umulsidi3(u, v) \
-  ({UDItype __w;							\
-    __asm__ ("meid %2,%0"						\
-	     : "=g" (__w)						\
-	     : "%0" ((USItype) (u)),					\
-	       "g" ((USItype) (v)));					\
-    __w; })
-#define udiv_qrnnd(q, r, n1, n0, d) \
-  ({union {UDItype __ll;						\
-	   struct {USItype __l, __h;} __i;				\
-	  } __xx;							\
-  __xx.__i.__h = (n1); __xx.__i.__l = (n0);				\
-  __asm__ ("deid %2,%0"							\
-	   : "=g" (__xx.__ll)						\
-	   : "0" (__xx.__ll),						\
-	     "g" ((USItype) (d)));					\
-  (r) = __xx.__i.__l; (q) = __xx.__i.__h; })
-#define count_trailing_zeros(count,x) \
-  do {									\
-    __asm__ ("ffsd     %2,%0"						\
-	    : "=r" ((USItype) (count))					\
-	    : "0" ((USItype) 0),					\
-	      "r" ((USItype) (x)));					\
-  } while (0)
-#endif /* __ns32000__ */
-
 /* FIXME: We should test _IBMR2 here when we add assembly support for the
    system vendor compilers.
    FIXME: What's needed for gcc PowerPC VxWorks?  __vxworks__ is not good
@@ -1086,7 +1050,57 @@ extern UDItype __umulsidi3 (USItype, USItype);
   } while (0)
 #endif
 
-#if defined(__sh__) && (!defined (__SHMEDIA__) || !__SHMEDIA__) && W_TYPE_SIZE == 32
+#if defined(__riscv)
+#ifdef __riscv_mul
+#define __umulsidi3(u,v) ((UDWtype)(UWtype)(u) * (UWtype)(v))
+#define __muluw3(a, b) ((UWtype)(a) * (UWtype)(b))
+#else
+#if __riscv_xlen == 32
+  #define MULUW3 "call __mulsi3"
+#elif __riscv_xlen == 64
+  #define MULUW3 "call __muldi3"
+#else
+#error unsupport xlen
+#endif /* __riscv_xlen */
+/* We rely on the fact that MULUW3 doesn't clobber the t-registers.
+   It can get better register allocation result.  */
+#define __muluw3(a, b) \
+  ({ \
+    register UWtype __op0 asm ("a0") = a; \
+    register UWtype __op1 asm ("a1") = b; \
+    asm volatile (MULUW3 \
+                  : "+r" (__op0), "+r" (__op1) \
+                  : \
+                  : "ra", "a2", "a3"); \
+    __op0; \
+  })
+#endif /* __riscv_mul */
+#define umul_ppmm(w1, w0, u, v) \
+  do { \
+    UWtype __x0, __x1, __x2, __x3; \
+    UHWtype __ul, __vl, __uh, __vh; \
+ \
+    __ul = __ll_lowpart (u); \
+    __uh = __ll_highpart (u); \
+    __vl = __ll_lowpart (v); \
+    __vh = __ll_highpart (v); \
+ \
+    __x0 = __muluw3 (__ul, __vl); \
+    __x1 = __muluw3 (__ul, __vh); \
+    __x2 = __muluw3 (__uh, __vl); \
+    __x3 = __muluw3 (__uh, __vh); \
+ \
+    __x1 += __ll_highpart (__x0);/* this can't give carry */ \
+    __x1 += __x2; /* but this indeed can */ \
+    if (__x1 < __x2) /* did we get it? */ \
+      __x3 += __ll_B; /* yes, add it in the proper pos.  */ \
+ \
+    (w1) = __x3 + __ll_highpart (__x1); \
+    (w0) = __ll_lowpart (__x1) * __ll_B + __ll_lowpart (__x0); \
+  } while (0)
+#endif /* __riscv */
+
+#if defined(__sh__) && W_TYPE_SIZE == 32
 #ifndef __sh1__
 #define umul_ppmm(w1, w0, u, v) \
   __asm__ (								\
@@ -1159,21 +1173,6 @@ extern UDItype __umulsidi3 (USItype, USItype);
 
 #endif /* __sh__ */
 
-#if defined (__SH5__) && defined (__SHMEDIA__) && __SHMEDIA__ && W_TYPE_SIZE == 32
-#define __umulsidi3(u,v) ((UDItype)(USItype)u*(USItype)v)
-#define count_leading_zeros(count, x) \
-  do									\
-    {									\
-      UDItype x_ = (USItype)(x);					\
-      SItype c_;							\
-									\
-      __asm__ ("nsb %1, %0" : "=r" (c_) : "r" (x_));			\
-      (count) = c_ - 31;						\
-    }									\
-  while (0)
-#define COUNT_LEADING_ZEROS_0 32
-#endif
-
 #if defined (__sparc__) && !defined (__arch64__) && !defined (__sparcv9) \
     && W_TYPE_SIZE == 32
 #define add_ssaaaa(sh, sl, ah, al, bh, bl) \

-- 
Joseph S. Myers
joseph at codesourcery.com
