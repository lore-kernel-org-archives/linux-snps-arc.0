From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 27 Aug 2018 17:38:03 +0300
Subject: [PATCH] ARC: HSDK: improve reset driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180827143803.28178-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As for today HSDK reset driver implements only
.reset() callback.

In case of driver which implements one of standard
reset controller usage pattern
(call *_deassert() in probe(), call *_assert() in remove())
that leads to inoperability of this reset driver.

Improve HSDK reset driver by calling .reset() callback inside of
.assert()/.deassert() callbacks to avoid each reset controller
user adaptation for work with both reset methods
(reset() and .assert()/.deassert() pair)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/reset/reset-hsdk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-hsdk.c b/drivers/reset/reset-hsdk.c
index 8bce391c6943..1fd91df91343 100644
--- a/drivers/reset/reset-hsdk.c
+++ b/drivers/reset/reset-hsdk.c
@@ -86,6 +86,8 @@ static int hsdk_reset_reset(struct reset_controller_dev *rcdev,
 
 static const struct reset_control_ops hsdk_reset_ops = {
 	.reset	= hsdk_reset_reset,
+	.assert = hsdk_reset_reset,
+	.deassert = hsdk_reset_reset,
 };
 
 static int hsdk_reset_probe(struct platform_device *pdev)
-- 
2.14.4
