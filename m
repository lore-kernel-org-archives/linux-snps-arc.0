From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 10 Jun 2016 17:29:11 +0300
Subject: [PATCH 1/3 v2] drm/arcpgu: Make ARC PGU usable on simulation platforms
In-Reply-To: <1465568953-21893-1-git-send-email-abrodkin@synopsys.com>
References: <1465568953-21893-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465568953-21893-2-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Ruud Derwig <rderwig@synopsys.com>

In case of simulation there's no real encoder/transmitter device
because in the model's virtual LCD  we're rendering whatever
appears in frame-buffer memory.

Signed-off-by: Ruud Derwig <rderwig at synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

Changes v1 -> v2:
 * Got rid of dummy arcpgu_drm_encoder_helper_funcs and now rely on default
   best encoder

 drivers/gpu/drm/arc/Makefile     |   2 +-
 drivers/gpu/drm/arc/arcpgu.h     |   1 +
 drivers/gpu/drm/arc/arcpgu_drv.c |  15 ++---
 drivers/gpu/drm/arc/arcpgu_sim.c | 128 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 138 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c

diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
index d48fda7..73de56a 100644
--- a/drivers/gpu/drm/arc/Makefile
+++ b/drivers/gpu/drm/arc/Makefile
@@ -1,2 +1,2 @@
-arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_drv.o
+arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
 obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index 86574b6..329ac75 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -43,6 +43,7 @@ static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
 
 int arc_pgu_setup_crtc(struct drm_device *dev);
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
+int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
 struct drm_fbdev_cma *arcpgu_fbdev_cma_init(struct drm_device *dev,
 	unsigned int preferred_bpp, unsigned int num_crtc,
 	unsigned int max_conn_count);
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 7675bbc..07c1bde 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -149,15 +149,16 @@ static int arcpgu_load(struct drm_device *drm)
 
 	/* find the encoder node and initialize it */
 	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
-	if (!encoder_node) {
-		dev_err(drm->dev, "failed to get an encoder slave node\n");
-		return -ENODEV;
+	if (encoder_node) {
+		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = arcpgu_drm_sim_init(drm, 0);
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = arcpgu_drm_hdmi_init(drm, encoder_node);
-	if (ret < 0)
-		return ret;
-
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
 
diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
new file mode 100644
index 0000000..2bf06d7
--- /dev/null
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -0,0 +1,128 @@
+/*
+ * ARC PGU DRM driver.
+ *
+ * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_atomic_helper.h>
+
+#include "arcpgu.h"
+
+#define XRES_DEF	640
+#define YRES_DEF	480
+
+#define XRES_MAX	8192
+#define YRES_MAX	8192
+
+
+struct arcpgu_drm_connector {
+	struct drm_connector connector;
+	struct drm_encoder_slave *encoder_slave;
+};
+
+static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+	return count;
+}
+
+static enum drm_connector_status
+arcpgu_drm_connector_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_helper_funcs
+arcpgu_drm_connector_helper_funcs = {
+	.get_modes = arcpgu_drm_connector_get_modes,
+};
+
+static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.reset = drm_atomic_helper_connector_reset,
+	.detect = arcpgu_drm_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = arcpgu_drm_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
+{
+	struct arcpgu_drm_connector *arcpgu_connector;
+	struct drm_encoder_slave *encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
+	if (encoder == NULL)
+		return -ENOMEM;
+
+	encoder->base.possible_crtcs = 1;
+	encoder->base.possible_clones = 0;
+
+	ret = drm_encoder_init(drm, &encoder->base, &arcpgu_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
+	arcpgu_connector = devm_kzalloc(drm->dev, sizeof(*arcpgu_connector),
+					GFP_KERNEL);
+	if (!arcpgu_connector) {
+		ret = -ENOMEM;
+		goto error_encoder_cleanup;
+	}
+
+	connector = &arcpgu_connector->connector;
+	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
+
+	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
+			DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret < 0) {
+		dev_err(drm->dev, "failed to initialize drm connector\n");
+		goto error_encoder_cleanup;
+	}
+
+	ret = drm_mode_connector_attach_encoder(connector, &encoder->base);
+	if (ret < 0) {
+		dev_err(drm->dev, "could not attach connector to encoder\n");
+		drm_connector_unregister(connector);
+		goto error_connector_cleanup;
+	}
+
+	arcpgu_connector->encoder_slave = encoder;
+
+	return 0;
+
+error_connector_cleanup:
+	drm_connector_cleanup(connector);
+
+error_encoder_cleanup:
+	drm_encoder_cleanup(&encoder->base);
+	return ret;
+}
-- 
2.5.5
