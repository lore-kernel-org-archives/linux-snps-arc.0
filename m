From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 14 Oct 2016 16:27:33 +0300
Subject: [PATCH] drm/arcpgu: Accommodate adv7511 switch to DRM bridge
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1476451653-8179-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC PGU driver starts crashing on initialization after
'commit e12c2f645557 ("drm/i2c: adv7511: Convert to drm_bridge")'
This happenes because in "arcpgu_drm_hdmi_init" function we get pointer
of "drm_i2c_encoder_driver" structure, which doesn't exist after
adv7511 hdmi encoder interface changed from slave encoder to drm bridge.
So, when we call "encoder_init" function from this structure driver
crashes.

Bootlog:
------------------------------------->8--------------------------------
[drm] Initialized drm 1.1.0 20060810
arcpgu e0017000.pgu: arc_pgu ID: 0xabbabaab
arcpgu e0017000.pgu: assigned reserved memory node frame_buffer at 9e000000
Path: (null)
CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-00001-gb5642252fa01-dirty #8
task: 9a058000 task.stack: 9a032000

[ECR   ]: 0x00220100 => Invalid Read @ 0x00000004 by insn @ 0x803934e8
[EFA   ]: 0x00000004
[BLINK ]: drm_atomic_helper_connector_dpms+0xa6/0x230
[ERET  ]: drm_atomic_helper_connector_dpms+0xa4/0x230
[STAT32]: 0x00000846 : K DE       E2 E1
BTA: 0x8016d949  SP: 0x9a033e34  FP: 0x00000000
LPS: 0x8036f6fc LPE: 0x8036f700 LPC: 0x00000000
r00: 0x8063c118 r01: 0x805b98ac r02: 0x00000b11
r03: 0x00000000 r04: 0x9a010f54 r05: 0x00000000
r06: 0x00000001 r07: 0x00000000 r08: 0x00000028
r09: 0x00000001 r10: 0x00000007 r11: 0x00000054
r12: 0x720a3033

Stack Trace:
  drm_atomic_helper_connector_dpms+0xa4/0x230
  arcpgu_drm_hdmi_init+0xbc/0x228
  arcpgu_probe+0x168/0x244
  platform_drv_probe+0x26/0x64
  really_probe+0x1f0/0x32c
  __driver_attach+0xa8/0xd0
  bus_for_each_dev+0x3c/0x74
  bus_add_driver+0xc2/0x184
  driver_register+0x50/0xec
  do_one_initcall+0x3a/0x120
  kernel_init_freeable+0x108/0x1a0
------------------------------------->8--------------------------------

Fix ARC PGU driver to be able work with drm bridge hdmi encoder
interface. The hdmi connector code isn't needed anymore as we expect
the adv7511 bridge driver to create/manage the connector.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_hdmi.c | 144 +++++++++-----------------------------
 1 file changed, 35 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index b7a8b2a..48a6c63 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -14,104 +14,54 @@
  *
  */
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_encoder_slave.h>
 #include <drm/drm_atomic_helper.h>
 
 #include "arcpgu.h"
 
-struct arcpgu_drm_connector {
-	struct drm_connector connector;
-	struct drm_encoder_slave *encoder_slave;
-};
-
-static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
+static void arcpgu_drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
 {
-	const struct drm_encoder_slave_funcs *sfuncs;
-	struct drm_encoder_slave *slave;
-	struct arcpgu_drm_connector *con =
-		container_of(connector, struct arcpgu_drm_connector, connector);
-
-	slave = con->encoder_slave;
-	if (slave == NULL) {
-		dev_err(connector->dev->dev,
-			"connector_get_modes: cannot find slave encoder for connector\n");
-		return 0;
-	}
-
-	sfuncs = slave->slave_funcs;
-	if (sfuncs->get_modes == NULL)
-		return 0;
-
-	return sfuncs->get_modes(&slave->base, connector);
-}
-
-static enum drm_connector_status
-arcpgu_drm_connector_detect(struct drm_connector *connector, bool force)
-{
-	enum drm_connector_status status = connector_status_unknown;
-	const struct drm_encoder_slave_funcs *sfuncs;
-	struct drm_encoder_slave *slave;
-
-	struct arcpgu_drm_connector *con =
-		container_of(connector, struct arcpgu_drm_connector, connector);
-
-	slave = con->encoder_slave;
-	if (slave == NULL) {
-		dev_err(connector->dev->dev,
-			"connector_detect: cannot find slave encoder for connector\n");
-		return status;
-	}
+	struct drm_bridge *bridge = encoder->bridge;
 
-	sfuncs = slave->slave_funcs;
-	if (sfuncs && sfuncs->detect)
-		return sfuncs->detect(&slave->base, connector);
-
-	dev_err(connector->dev->dev, "connector_detect: could not detect slave funcs\n");
-	return status;
+	bridge->funcs->mode_set(bridge, mode, adjusted_mode);
 }
 
-static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_helper_funcs
-arcpgu_drm_connector_helper_funcs = {
-	.get_modes = arcpgu_drm_connector_get_modes,
-};
-
-static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = arcpgu_drm_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = arcpgu_drm_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static struct drm_encoder_helper_funcs arcpgu_drm_encoder_helper_funcs = {
 	.dpms = drm_i2c_encoder_dpms,
 	.mode_fixup = drm_i2c_encoder_mode_fixup,
-	.mode_set = drm_i2c_encoder_mode_set,
+	.mode_set = arcpgu_drm_i2c_encoder_mode_set,
 	.prepare = drm_i2c_encoder_prepare,
 	.commit = drm_i2c_encoder_commit,
-	.detect = drm_i2c_encoder_detect,
 };
 
 static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static void arcpgu_drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_bridge *bridge = encoder->bridge;
+
+	if (mode == DRM_MODE_DPMS_ON)
+		bridge->funcs->enable(bridge);
+	else
+		bridge->funcs->disable(bridge);
+}
+
+static struct drm_encoder_slave_funcs arcpgu_drm_encoder_slave_funcs = {
+	.dpms = arcpgu_drm_i2c_encoder_dpms,
+};
+
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 {
-	struct arcpgu_drm_connector *arcpgu_connector;
-	struct drm_i2c_encoder_driver *driver;
 	struct drm_encoder_slave *encoder;
-	struct drm_connector *connector;
 	struct i2c_client *i2c_slave;
+	struct drm_bridge *bridge;
+
 	int ret;
 
 	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
@@ -129,16 +79,14 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 		return -EPROBE_DEFER;
 	}
 
-	driver =
-	    to_drm_i2c_encoder_driver(to_i2c_driver(i2c_slave->dev.driver));
-	ret = driver->encoder_init(i2c_slave, drm, encoder);
-	if (ret) {
-		dev_err(drm->dev, "failed to initialize i2c encoder slave\n");
-		return ret;
-	}
+	/* Locate drm bridge from the hdmi encoder DT node */
+	bridge = of_drm_find_bridge(np);
+	if (!bridge)
+		return -EPROBE_DEFER;
 
 	encoder->base.possible_crtcs = 1;
 	encoder->base.possible_clones = 0;
+	encoder->slave_funcs = &arcpgu_drm_encoder_slave_funcs;
 	ret = drm_encoder_init(drm, &encoder->base, &arcpgu_drm_encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
@@ -147,37 +95,15 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 	drm_encoder_helper_add(&encoder->base,
 			       &arcpgu_drm_encoder_helper_funcs);
 
-	arcpgu_connector = devm_kzalloc(drm->dev, sizeof(*arcpgu_connector),
-					GFP_KERNEL);
-	if (!arcpgu_connector) {
-		ret = -ENOMEM;
-		goto error_encoder_cleanup;
-	}
+	/* Link drm_bridge to encoder */
+	bridge->encoder = &encoder->base;
+	encoder->base.bridge = bridge;
 
-	connector = &arcpgu_connector->connector;
-	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
-	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
-			DRM_MODE_CONNECTOR_HDMIA);
-	if (ret < 0) {
-		dev_err(drm->dev, "failed to initialize drm connector\n");
-		goto error_encoder_cleanup;
-	}
-
-	ret = drm_mode_connector_attach_encoder(connector, &encoder->base);
-	if (ret < 0) {
-		dev_err(drm->dev, "could not attach connector to encoder\n");
-		drm_connector_unregister(connector);
-		goto error_connector_cleanup;
+	ret = drm_bridge_attach(drm, bridge);
+	if (ret) {
+		drm_encoder_cleanup(&encoder->base);
+		return ret;
 	}
 
-	arcpgu_connector->encoder_slave = encoder;
-
 	return 0;
-
-error_connector_cleanup:
-	drm_connector_cleanup(connector);
-
-error_encoder_cleanup:
-	drm_encoder_cleanup(&encoder->base);
-	return ret;
 }
-- 
2.5.5
