From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  3 Mar 2017 18:19:24 +0300
Subject: [PATCH] drm/arcpgu: Get rid of "encoder-slave" property
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488554364-25579-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We used to use "encoder-slave" property in PGU's
Device Tree node to refer to the encoder, but since there's
a way to find it with some code smarts we get rid of
obviously extra complication in PGU node.

Again inspired by ARM's HDLCD code.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Liviu Dudau <Liviu.Dudau at arm.com>
Cc: Daniel Vetter <daniel at ffwll.ch>
Cc: David Airlie <airlied at linux.ie>
Cc: Rob Herring <robh+dt at kernel.org>
---
 arch/arc/boot/dts/axs10x_mb.dtsi |  1 -
 drivers/gpu/drm/arc/arcpgu_drv.c | 23 +++++++++++++++++------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 41cfb29b62c1..2fe030186b9d 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -287,7 +287,6 @@
 		pgu at 17000 {
 			compatible = "snps,arcpgu";
 			reg = <0x17000 0x400>;
-			encoder-slave = <&adv7511>;
 			clocks = <&pguclk>;
 			clock-names = "pxlclk";
 			memory-region = <&frame_buffer>;
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 5c82f52fba80..b1b2286bda95 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <linux/of_graph.h>
 #include <linux/of_reserved_mem.h>
 
 #include "arcpgu.h"
@@ -83,7 +84,7 @@ static int arcpgu_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct arcpgu_drm_private *arcpgu;
-	struct device_node *encoder_node;
+	struct device_node *encoder, *port;
 	struct resource *res;
 	int ret;
 
@@ -118,14 +119,24 @@ static int arcpgu_load(struct drm_device *drm)
 	if (arc_pgu_setup_crtc(drm) < 0)
 		return -ENODEV;
 
-	/* find the encoder node and initialize it */
-	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
-	if (encoder_node) {
-		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
-		of_node_put(encoder_node);
+	/* There is only one output port inside each device, find it */
+	port = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+
+	if (port) {
+		if (of_device_is_available(port))
+			encoder = of_graph_get_remote_port_parent(port);
+		of_node_put(port);
+	}
+
+	if (encoder && of_device_is_available(encoder)) {
+		dev_info(drm->dev, "Found encoder node %s, proceeding with it\n",
+			 encoder->name);
+		ret = arcpgu_drm_hdmi_init(drm, encoder);
+		of_node_put(encoder);
 		if (ret < 0)
 			return ret;
 	} else {
+		dev_info(drm->dev, "No encoder node, assume simulation\n");
 		ret = arcpgu_drm_sim_init(drm, NULL);
 		if (ret < 0)
 			return ret;
-- 
2.7.4
