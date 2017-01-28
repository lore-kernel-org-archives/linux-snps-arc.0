From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Sat, 28 Jan 2017 03:01:39 +0300
Subject: [PATCH 2/6] ARCv2: MCIP: Add structure for build register of IDU
In-Reply-To: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485561703-20921-3-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This structure is necessary for retrieving of supported
number of common interrupts in IDU interrupt controller.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 include/soc/arc/mcip.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/soc/arc/mcip.h b/include/soc/arc/mcip.h
index 6902c2a..798c01b 100644
--- a/include/soc/arc/mcip.h
+++ b/include/soc/arc/mcip.h
@@ -14,6 +14,7 @@
 #include <soc/arc/aux.h>
 
 #define ARC_REG_MCIP_BCR	0x0d0
+#define ARC_REG_MCIP_IDU_BCR	0x0D5
 #define ARC_REG_MCIP_CMD	0x600
 #define ARC_REG_MCIP_WDATA	0x601
 #define ARC_REG_MCIP_READBACK	0x602
@@ -69,6 +70,22 @@ struct mcip_bcr {
 #endif
 };
 
+struct mcip_idu_bcr {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad:21, cirqnum:3, ver:8;
+#else
+	unsigned int ver:8, cirqnum:3, pad:21;
+#endif
+};
+
+
+/*
+ * Build register for IDU contains not an actual number of supported common
+ * interrupts but an exponent of 2 which must be multiplied by 4 to
+ * get a number of supported common interrupts.
+ */
+#define mcip_idu_bcr_to_nr_irqs(bcr) (4 * (1 << (bcr).cirqnum))
+
 /*
  * MCIP programming model
  *
-- 
2.7.4
