From: paul.gortmaker@windriver.com (Paul Gortmaker)
Date: Sun, 22 Jan 2017 11:32:37 -0500
Subject: [PATCH 13/20] arc: migrate exception table users off module.h and
 onto extable.h
In-Reply-To: <20170122163244.11740-1-paul.gortmaker@windriver.com>
References: <20170122163244.11740-1-paul.gortmaker@windriver.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170122163244.11740-14-paul.gortmaker@windriver.com>
To: linux-snps-arc@lists.infradead.org

This file was only including module.h for exception table related
functions.  We've now separated that content out into its own file
"extable.h" so now move over to that and avoid all the extra header
content in module.h that we don't really need to compile this file.
Since the file does have some EXPORT_SYMBOL, we add export.h include.

Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Paul Gortmaker <paul.gortmaker at windriver.com>
---
 arch/arc/mm/extable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/mm/extable.c b/arch/arc/mm/extable.c
index aa652e281324..c86906b41bfe 100644
--- a/arch/arc/mm/extable.c
+++ b/arch/arc/mm/extable.c
@@ -8,7 +8,8 @@
  * Borrowed heavily from MIPS
  */
 
-#include <linux/module.h>
+#include <linux/export.h>
+#include <linux/extable.h>
 #include <linux/uaccess.h>
 
 int fixup_exception(struct pt_regs *regs)
-- 
2.11.0
