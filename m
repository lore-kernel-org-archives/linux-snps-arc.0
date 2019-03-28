From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 28 Mar 2019 16:02:41 -0700
Subject: [PATCH] [ARC] PR 88409: miscompilation due to missing cc clobber in
 longlong.h macros
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1553814161-3750-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

simple test such as below was failing.

| void main(int argc, char *argv[])
| {
|    size_t total_time = 115424;                       // expected 115.424
|    double secs = (double)total_time/(double)1000;
|    printf("%s %d %lf\n", "secs", total_time, secs);  // prints 113.504
|    printf("%d\n", (size_t)secs);
| }

The printf eventually called into glibc stdlib/divrem.c:__mpn_divrem()
which uses the __arc__ specific inline asm macros from longlong.h which
were causing miscompilation.

include/
2019-03-28  Vineet Gupta <vgupta at synopsys.com>

	PR 89877

	* longlong.h [__arc__] (add_ssaaaa): Add cc clobber
	(sub_ddmmss): Likewise.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 include/ChangeLog  | 7 +++++++
 include/longlong.h | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/ChangeLog b/include/ChangeLog
index be08141deeb9..96d967d10a52 100644
--- a/include/ChangeLog
+++ b/include/ChangeLog
@@ -1,3 +1,10 @@
+2019-03-28  Vineet Gupta <vgupta at synopsys.com>
+
+	PR 89877
+
+	* longlong.h [__arc__] (add_ssaaaa): Add cc clobber
+	(sub_ddmmss): Likewise.
+
 2019-02-11  Philippe Waroquiers  <philippe.waroquiers at skynet.be>
 
 	* splay-tree.h (splay_tree_delete_key_fn): Update comment.
diff --git a/include/longlong.h b/include/longlong.h
index 3dd8dc3aa80c..1f0ce4204255 100644
--- a/include/longlong.h
+++ b/include/longlong.h
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
