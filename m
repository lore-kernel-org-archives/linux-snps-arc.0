From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:50 +0300
Subject: [RFC 2/6] ARC: Fixed inline asm contraints to gcc 6.x
In-Reply-To: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

It seems glibc had some ancient ARC bits, added as part of some header
sync up back in 1999 (I was still in college)

That code obviously doesn't build with modern compilers.

Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 stdlib/longlong.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/stdlib/longlong.h b/stdlib/longlong.h
index 0ec11c5056bf..fb6557272fa0 100644
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
-- 
2.7.4
