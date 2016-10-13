From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 13 Oct 2016 10:46:14 -0700
Subject: [PATCH] ARC: update .note.ABI-tag for ABIv4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1476380774-25566-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Cc: Anton Kolesov <akolesov at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 libc/sysdeps/linux/arc/crt1.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libc/sysdeps/linux/arc/crt1.S b/libc/sysdeps/linux/arc/crt1.S
index ae863e7acf5f..70a06e058d3b 100644
--- a/libc/sysdeps/linux/arc/crt1.S
+++ b/libc/sysdeps/linux/arc/crt1.S
@@ -72,5 +72,9 @@ __start:
 0:	.asciz "GNU"		/* Vendor name */
 1:	.align 4
 2:	.long 0			/* Note data: Linux executable */
-	.long 3,9,0		/* Earliest compatible kernel */
+#if (__GNUC__ > 4)
+	.long 4,8,0		/* Earliest compatible kernel for ABI v4 */
+#else
+	.long 3,9,0		/* Earliest compatible kernel for ABI v3 */
+#endif
 3:	.align 4		/* Pad out section */
-- 
2.7.4
