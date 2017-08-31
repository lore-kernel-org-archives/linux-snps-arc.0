From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 31 Aug 2017 17:21:58 +0300
Subject: [PATCH] arc: Flush and invalidate caches on start
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170831142158.27245-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This is useful to make sure no stale data exists in caches after bootloaders.
The worst thing could be some lines of cache were locked in a bootloader
for example during DDR recalibration and never unlocked. This may lead
to really unpredictable issues later down the line.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/head.S | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 8b90d25a15cc..04e28b664183 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -34,6 +34,10 @@
 #endif
 	sr	r5, [ARC_REG_IC_CTRL]
 
+	; Invalidate entire I$
+	mov	r5, 1
+	sr	r5, [ARC_REG_IC_IVIC]
+
 1:
 	lr	r5, [ARC_REG_DC_BCR]
 	breq    r5, 0, 1f		; D$ doesn't exist
@@ -46,6 +50,18 @@
 #endif
 	sr	r5, [ARC_REG_DC_CTRL]
 
+	; Flush entire D$
+	mov	r5, 1
+	sr	r5, [ARC_REG_DC_FLSH]
+	; Wait for flush operation to complete
+1:
+	lr	r5, [ARC_REG_DC_CTRL]
+	bbit1	r5, DC_CTRL_FLUSH_STATUS, 1b
+
+	; Invalidate entire D$
+	mov	r5, 1
+	sr	r5, [ARC_REG_DC_IVDC]
+
 1:
 .endm
 
-- 
2.11.0
