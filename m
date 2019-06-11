From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 11 Jun 2019 20:21:59 +0300
Subject: [PATCH] drm/arcpgu: rework encoder search
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190611172159.24048-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Instead of using non-standard "encoder-slave" property to find
encoder let's find it by associated endpoint.

While I'm on it add corresponding log message if we don't find
any encoder and we assume that we use virtual LCD on the
simulation platform.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index c9f78397d345..d08b9977f021 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -23,6 +23,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -54,7 +55,7 @@ static int arcpgu_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct arcpgu_drm_private *arcpgu;
-	struct device_node *encoder_node;
+	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
 	struct resource *res;
 	int ret;
 
@@ -89,14 +90,23 @@ static int arcpgu_load(struct drm_device *drm)
 	if (arc_pgu_setup_crtc(drm) < 0)
 		return -ENODEV;
 
-	/* find the encoder node and initialize it */
-	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
+	/*
+	 * There is only one output port inside each device. It is linked with
+	 * encoder endpoint.
+	 */
+	endpoint_node = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	if (endpoint_node) {
+		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
+		of_node_put(endpoint_node);
+	}
+
 	if (encoder_node) {
 		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
 		of_node_put(encoder_node);
 		if (ret < 0)
 			return ret;
 	} else {
+		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
 		ret = arcpgu_drm_sim_init(drm, NULL);
 		if (ret < 0)
 			return ret;
-- 
2.21.0
