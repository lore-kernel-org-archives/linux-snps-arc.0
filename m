From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Apr 2017 09:59:03 +0300
Subject: [PATCH] arcpgu: Simplify driver name
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492757943-17037-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This very minor change is still useful because it aligns
ARC PGU driver name with other DRM drivers and makes usage of
that driver name a bit easier.

For example in libdrm's test app we'll use "arcpgu" instead of
a bit more ugly "drm-arcpgu".

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Daniel Vetter <daniel.vetter at ffwll.ch>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 0b6eaa49a1db..c33cdbae7588 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -166,7 +166,7 @@ static struct drm_driver arcpgu_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
 			   DRIVER_ATOMIC,
 	.lastclose = arcpgu_lastclose,
-	.name = "drm-arcpgu",
+	.name = "arcpgu",
 	.desc = "ARC PGU Controller",
 	.date = "20160219",
 	.major = 1,
-- 
2.7.4
