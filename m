From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Thu,  2 Jun 2016 00:06:47 +0200
Subject: [PATCH 24/38] drm/arc: Implement nonblocking commit correctly
In-Reply-To: <1464818821-5736-1-git-send-email-daniel.vetter@ffwll.ch>
References: <1464818821-5736-1-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464818821-5736-25-git-send-email-daniel.vetter@ffwll.ch>
To: linux-snps-arc@lists.infradead.org

Committing with block it is not.

Thanks to the fixed up vblank event handling we can just use the
helper support for nonblocking commits now.

Cc: Carlos Palminha <palminha at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index d407fd79a400..a92e533531c3 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -32,17 +32,11 @@ static void arcpgu_fb_output_poll_changed(struct drm_device *dev)
 		drm_fbdev_cma_hotplug_event(arcpgu->fbdev);
 }
 
-static int arcpgu_atomic_commit(struct drm_device *dev,
-				    struct drm_atomic_state *state, bool async)
-{
-	return drm_atomic_helper_commit(dev, state, false);
-}
-
 static struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 	.fb_create  = drm_fb_cma_create,
 	.output_poll_changed = arcpgu_fb_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = arcpgu_atomic_commit,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 static void arcpgu_setup_mode_config(struct drm_device *drm)
-- 
2.8.1
