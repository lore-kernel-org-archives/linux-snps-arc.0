From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 3 Apr 2019 10:37:03 -0700
Subject: [PATCH] Update longlong.h
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1554313023-4980-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

To propagate a fix for gcc bug 88409 [1] in ARC specific code

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89877

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog         | 4 ++++
 stdlib/longlong.h | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/ChangeLog b/ChangeLog
index c27da0f6ac94..a158f64dd0cd 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,7 @@
+2019-04-03  Vineet Gupta <vgupta at synopsys.com>
+
+	* stdlib/longlong.h: Update from GCC.
+
 2019-03-20  mansayk  <6688000 at gmail.com>
 
 	[BZ #24296]
diff --git a/stdlib/longlong.h b/stdlib/longlong.h
index 3dd8dc3aa80c..1f0ce4204255 100644
--- a/stdlib/longlong.h
+++ b/stdlib/longlong.h
@@ -199,7 +199,8 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
 	   : "%r" ((USItype) (ah)),					\
 	     "rICal" ((USItype) (bh)),					\
 	     "%r" ((USItype) (al)),					\
-	     "rICal" ((USItype) (bl)))
+	     "rICal" ((USItype) (bl))					\
+	   : "cc")
 #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
   __asm__ ("sub.f	%1, %4, %5\n\tsbc	%0, %2, %3"		\
 	   : "=r" ((USItype) (sh)),					\
@@ -207,7 +208,8 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
 	   : "r" ((USItype) (ah)),					\
 	     "rICal" ((USItype) (bh)),					\
 	     "r" ((USItype) (al)),					\
-	     "rICal" ((USItype) (bl)))
+	     "rICal" ((USItype) (bl))					\
+	   : "cc")
 
 #define __umulsidi3(u,v) ((UDItype)(USItype)u*(USItype)v)
 #ifdef __ARC_NORM__
-- 
2.7.4
