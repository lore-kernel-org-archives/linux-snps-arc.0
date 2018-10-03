From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  3 Oct 2018 14:04:57 +0300
Subject: [PATCH] drm: fb-helper: Validate requested pixel format against bpp
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181003110457.9318-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Validate requested pixel format against bits_per_pixel to reject
invalid formats with subcomponents length sum is greater than requested
bits_per_pixel.

weston 5.0.0 with fbdev backend tries to set up an ARGB x8r8g8b8 pixel
format without bits_per_pixel updating. So it can request
x8r8g8b8 with 16 bpp which is obviously incorrect and should be
rejected.

Cc: stable at vger.kernel.org
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 16ec93b75dbf..4f39da07f053 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1610,6 +1610,13 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 		return -EINVAL;
 	}
 
+	if ((var->green.length + var->blue.length + var->red.length +
+	    var->transp.length) > var->bits_per_pixel) {
+		DRM_DEBUG("fb requested pixel format can't fit in %d bpp\n",
+			  var->bits_per_pixel);
+		return -EINVAL;
+	}
+
 	switch (var->bits_per_pixel) {
 	case 16:
 		depth = (var->green.length == 6) ? 16 : 15;
-- 
2.14.4
