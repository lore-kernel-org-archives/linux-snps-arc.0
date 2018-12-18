From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:23 -0800
Subject: [PATCH 01/21] longlong.h: sync from gcc to fix ARC inline asm
 constraints
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This corresponds to the version

Author: law <law at 138bc75d-0d04-0410-961f-82ee72b054a4>
Date:   Tue Jun 27 16:10:15 2017 +0000

        * longlong.h: Remove ns32k support.

    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 249696 138bc75d-0d04-0410-961f-82ee72b054a4

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog         |  1 +
 stdlib/longlong.h | 65 ++++++-------------------------------------------------
 2 files changed, 8 insertions(+), 58 deletions(-)

diff --git a/ChangeLog b/ChangeLog
index 027b23493ed8..456e4b670c23 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -2,6 +2,7 @@
 
 	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
 	syscall-template file.
+	* stdlib/longlong.h: Fix asm constraints for ARC code.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/stdlib/longlong.h b/stdlib/longlong.h
index c7c6977c9fd6..fb982dd530c9 100644
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
@@ -1086,7 +1050,7 @@ extern UDItype __umulsidi3 (USItype, USItype);
   } while (0)
 #endif
 
-#if defined(__sh__) && (!defined (__SHMEDIA__) || !__SHMEDIA__) && W_TYPE_SIZE == 32
+#if defined(__sh__) && W_TYPE_SIZE == 32
 #ifndef __sh1__
 #define umul_ppmm(w1, w0, u, v) \
   __asm__ (								\
@@ -1159,21 +1123,6 @@ extern UDItype __umulsidi3 (USItype, USItype);
 
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
2.7.4
