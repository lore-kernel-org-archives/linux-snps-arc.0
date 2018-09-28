From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Sep 2018 19:28:56 +0300
Subject: [PATCH v2] ARC: HSDK: improve reset driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180928162856.4726-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As for today HSDK reset driver implements only
.reset() callback.

In case of driver which implements one of standard
reset controller usage pattern
(call *_deassert() in probe(), call *_assert() in remove())
that leads to inoperability of this reset driver.

Improve HSDK reset driver by calling .reset() callback inside of
.deassert() callback to avoid each reset controller
user adaptation for work with both reset methods
(reset() and {.assert() & .deassert()} pair)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
Changes v1->v2:
 * Don't call hsdk_reset_reset in .assert callback.

 drivers/reset/reset-hsdk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/reset/reset-hsdk.c b/drivers/reset/reset-hsdk.c
index 8bce391c6943..399440f197c5 100644
--- a/drivers/reset/reset-hsdk.c
+++ b/drivers/reset/reset-hsdk.c
@@ -84,8 +84,21 @@ static int hsdk_reset_reset(struct reset_controller_dev *rcdev,
 	return ret;
 }
 
+static int hsdk_reset_dummy(struct reset_controller_dev *rcd, unsigned long id)
+{
+	return 0;
+}
+
+/*
+ * Doing real reset from .assert isn't necessary/useful here. So we pass
+ * 'hsdk_reset_dummy' to .assert callback to prevent -ENOTSUPP returning by
+ * reset_control_assert() to make happy drivers which check
+ * reset_control_{assert | deassert} return status.
+ */
 static const struct reset_control_ops hsdk_reset_ops = {
 	.reset	= hsdk_reset_reset,
+	.assert = hsdk_reset_dummy,
+	.deassert = hsdk_reset_reset,
 };
 
 static int hsdk_reset_probe(struct platform_device *pdev)
-- 
2.14.4
