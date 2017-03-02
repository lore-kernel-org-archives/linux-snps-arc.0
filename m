From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu,  2 Mar 2017 20:27:54 +0300
Subject: [PATCH] drm/arcpgu: use .mode_fixup instead of .atomic_check
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488475674-6694-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Since we cannot always generate exactly requested pixel clock
there's not much sense in checking requested_clock == clk_round_rate().
In that case for quite some modes we'll be getting -EINVAL and no video
output at all.

But given there's some tolerance to real pixel clock in TVs/monitors
we may still give it a try with the clock as close to requested one as
PLL on the board may generate. So we just do a fixup to what current
board may provide.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Daniel Vetter <daniel.vetter at ffwll.ch>
Cc: David Airlie <airlied at linux.ie>
Cc: Jose Abreu <joabreu at synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index ad9a95916f1f..3f2823c1efc3 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -129,18 +129,16 @@ static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
-				     struct drm_crtc_state *state)
+static bool arc_pgu_crtc_mode_fixup(struct drm_crtc *crtc,
+				    const struct drm_display_mode *mode,
+				    struct drm_display_mode *adjusted_mode)
 {
 	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-	struct drm_display_mode *mode = &state->adjusted_mode;
-	long rate, clk_rate = mode->clock * 1000;
 
-	rate = clk_round_rate(arcpgu->clk, clk_rate);
-	if (rate != clk_rate)
-		return -EINVAL;
+	adjusted_mode->clock =
+		clk_round_rate(arcpgu->clk, mode->clock * 1000) / 1000;
 
-	return 0;
+	return true;
 }
 
 static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -165,8 +163,8 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 	.disable	= arc_pgu_crtc_disable,
 	.prepare	= arc_pgu_crtc_disable,
 	.commit		= arc_pgu_crtc_enable,
-	.atomic_check	= arc_pgu_crtc_atomic_check,
 	.atomic_begin	= arc_pgu_crtc_atomic_begin,
+	.mode_fixup	= arc_pgu_crtc_mode_fixup,
 };
 
 static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
-- 
2.7.4
