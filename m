From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Sun, 29 May 2016 20:35:10 +0200
Subject: [PATCH 13/26] drm/arc: Nuke event_list
In-Reply-To: <1464546923-13439-1-git-send-email-daniel.vetter@ffwll.ch>
References: <1464546923-13439-1-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464546923-13439-14-git-send-email-daniel.vetter@ffwll.ch>
To: linux-snps-arc@lists.infradead.org

This is just used for cleanup in preclose, and with the reworked event
handling code this is now done properly by the core.

Nuke it!

But it also shows that arc totally fails at sending out drm events for
flips. Next patch will hack that up.

Cc: Carlos Palminha <palminha at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
---
 drivers/gpu/drm/arc/arcpgu.h      |  1 -
 drivers/gpu/drm/arc/arcpgu_crtc.c |  4 ----
 drivers/gpu/drm/arc/arcpgu_drv.c  | 19 -------------------
 3 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index 86574b698a78..8c01a25d279a 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -22,7 +22,6 @@ struct arcpgu_drm_private {
 	struct clk		*clk;
 	struct drm_fbdev_cma	*fbdev;
 	struct drm_framebuffer	*fb;
-	struct list_head	event_list;
 	struct drm_crtc		crtc;
 	struct drm_plane	*plane;
 };
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 92f8beff8e60..d5ca0c280e68 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -155,10 +155,6 @@ static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
 		event->pipe = drm_crtc_index(crtc);
 
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
-		list_add_tail(&event->base.link, &arcpgu->event_list);
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 	}
 }
 
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index bc53ebb83f75..d407fd79a400 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -81,22 +81,6 @@ static const struct file_operations arcpgu_drm_ops = {
 	.mmap = arcpgu_gem_mmap,
 };
 
-static void arcpgu_preclose(struct drm_device *drm, struct drm_file *file)
-{
-	struct arcpgu_drm_private *arcpgu = drm->dev_private;
-	struct drm_pending_vblank_event *e, *t;
-	unsigned long flags;
-
-	spin_lock_irqsave(&drm->event_lock, flags);
-	list_for_each_entry_safe(e, t, &arcpgu->event_list, base.link) {
-		if (e->base.file_priv != file)
-			continue;
-		list_del(&e->base.link);
-		e->base.destroy(&e->base);
-	}
-	spin_unlock_irqrestore(&drm->event_lock, flags);
-}
-
 static void arcpgu_lastclose(struct drm_device *drm)
 {
 	struct arcpgu_drm_private *arcpgu = drm->dev_private;
@@ -122,8 +106,6 @@ static int arcpgu_load(struct drm_device *drm)
 	if (IS_ERR(arcpgu->clk))
 		return PTR_ERR(arcpgu->clk);
 
-	INIT_LIST_HEAD(&arcpgu->event_list);
-
 	arcpgu_setup_mode_config(drm);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -192,7 +174,6 @@ int arcpgu_unload(struct drm_device *drm)
 static struct drm_driver arcpgu_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
 			   DRIVER_ATOMIC,
-	.preclose = arcpgu_preclose,
 	.lastclose = arcpgu_lastclose,
 	.name = "drm-arcpgu",
 	.desc = "ARC PGU Controller",
-- 
2.8.1
