From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 27 Apr 2016 17:35:00 +0300
Subject: [PATCH 1/2] drm/arcpgu: use dedicated memory area for frame buffer
In-Reply-To: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461767701-12208-2-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Now when ARC supports reserved memory areas and
per-device coherent DMA allocations we may switch ARC PGU
to use of those dedicated areas.

One of the benefits we may move frame-buffer area out
from IO Coherency aperture and so significantly
reduce IOC utilization allowing less demanding
peripherals to use all perks of IOC.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Dave Airlie <airlied at gmail.com>
Cc: Daniel Vetter <daniel at ffwll.ch>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 5b35e5db..76e187a 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <linux/of_reserved_mem.h>
 
 #include "arcpgu.h"
 #include "arcpgu_regs.h"
@@ -135,6 +136,11 @@ static int arcpgu_load(struct drm_device *drm)
 	dev_info(drm->dev, "arc_pgu ID: 0x%x\n",
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
+	/* Get the optional framebuffer memory resource */
+	ret = of_reserved_mem_device_init(drm->dev);
+	if (ret && ret != -ENODEV)
+		return ret;
+
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
-- 
2.5.5
