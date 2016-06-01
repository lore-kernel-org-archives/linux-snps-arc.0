From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Thu,  2 Jun 2016 00:06:38 +0200
Subject: [PATCH 15/38] drm/arc: Actually bother with handling atomic events.
In-Reply-To: <1464818821-5736-1-git-send-email-daniel.vetter@ffwll.ch>
References: <1464818821-5736-1-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464818821-5736-16-git-send-email-daniel.vetter@ffwll.ch>
To: linux-snps-arc@lists.infradead.org

The drm core has a nice ready-made helper for exactly the simple case
where it should fire on the next vblank.

Note that arming the vblank event in _begin is probably too early, and
might easily result in the vblank firing too early, before the new set
of planes are actually disabled. But that's kinda a minor issue
compared to just outright hanging userspace.

v2: Be more robust and either arm, when the CRTC is on, or just send
the event out right away.

Cc: Carlos Palminha <palminha at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index d5ca0c280e68..c9f183b11df9 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -145,16 +145,17 @@ static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
 static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
 				      struct drm_crtc_state *state)
 {
-	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-	unsigned long flags;
-
-	if (crtc->state->event) {
-		struct drm_pending_vblank_event *event = crtc->state->event;
+	struct drm_pending_vblank_event *event = crtc->state->event;
 
+	if (event) {
 		crtc->state->event = NULL;
-		event->pipe = drm_crtc_index(crtc);
 
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+		spin_lock_irq(&crtc->dev->event_lock);
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
 	}
 }
 
-- 
2.8.1
