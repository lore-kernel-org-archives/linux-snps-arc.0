From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Dec 2017 11:12:40 -0800
Subject: [PATCH 1/2] ARC: uaccess: dont use "l" inline as constraint
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512760361-17663-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This constraint has been removed from gcc

There was an earlier fix 3c7c7a2fc8811 which fixed this in delay.h but
somehow missed this one as gcc change had not made its way into
production toolchains

Cc: stable at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/uaccess.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index f35974ee7264..c9173c02081c 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -668,6 +668,7 @@ __arc_strncpy_from_user(char *dst, const char __user *src, long count)
 		return 0;
 
 	__asm__ __volatile__(
+	"	mov	lp_count, %5		\n"
 	"	lp	3f			\n"
 	"1:	ldb.ab  %3, [%2, 1]		\n"
 	"	breq.d	%3, 0, 3f               \n"
@@ -684,8 +685,8 @@ __arc_strncpy_from_user(char *dst, const char __user *src, long count)
 	"	.word   1b, 4b			\n"
 	"	.previous			\n"
 	: "+r"(res), "+r"(dst), "+r"(src), "=r"(val)
-	: "g"(-EFAULT), "l"(count)
-	: "memory");
+	: "g"(-EFAULT), "r"(count)
+	: "lp_count", "lp_start", "lp_end", "memory");
 
 	return res;
 }
-- 
2.7.4
