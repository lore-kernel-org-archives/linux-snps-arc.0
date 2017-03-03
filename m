From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 3 Mar 2017 13:27:30 +0000
Subject: [PATCH] drm/arcpgu: use .mode_fixup instead of .atomic_check
In-Reply-To: <20170302195437.mlhzia2q2oav27mr@phenom.ffwll.local>
References: <1488475674-6694-1-git-send-email-abrodkin@synopsys.com>
 <20170302195437.mlhzia2q2oav27mr@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488547649.2940.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Thu, 2017-03-02@20:54 +0100, Daniel Vetter wrote:
> On Thu, Mar 02, 2017@08:27:54PM +0300, Alexey Brodkin wrote:
> > 
> > Since we cannot always generate exactly requested pixel clock
> > there's not much sense in checking requested_clock == clk_round_rate().
> > In that case for quite some modes we'll be getting -EINVAL and no video
> > output at all.
> > 
> > But given there's some tolerance to real pixel clock in TVs/monitors
> > we may still give it a try with the clock as close to requested one as
> > PLL on the board may generate. So we just do a fixup to what current
> > board may provide.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Daniel Vetter <daniel.vetter at ffwll.ch>
> > Cc: David Airlie <airlied at linux.ie>
> > Cc: Jose Abreu <joabreu at synopsys.com>
> > ---
> > ?drivers/gpu/drm/arc/arcpgu_crtc.c | 16 +++++++---------
> > ?1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > index ad9a95916f1f..3f2823c1efc3 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > @@ -129,18 +129,16 @@ static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
> > ?			??????~ARCPGU_CTRL_ENABLE_MASK);
> > ?}
> > ?
> > -static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
> > -				?????struct drm_crtc_state *state)
> > +static bool arc_pgu_crtc_mode_fixup(struct drm_crtc *crtc,
> > +				????const struct drm_display_mode *mode,
> > +				????struct drm_display_mode *adjusted_mode)
> 
> This isn't required at all, see drm_crtc_state.adjusted_mode. Just update
> that and you're good - .mode_fixup is the backwards compatibility function
> for old kms drivers, atomic_check is strictly more powerful.

So if I understood you correct here what I really need is just to get rid of existing check,
right? I.e. the following is to be in v2 respin:
------------------------------->8-------------------------------
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index ad9a95916f1f..86f1555914e8 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -129,20 +129,6 @@ static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
??????????????????????????????~ARCPGU_CTRL_ENABLE_MASK);
?}
?
-static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
-????????????????????????????????????struct drm_crtc_state *state)
-{
-???????struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
-???????struct drm_display_mode *mode = &state->adjusted_mode;
-???????long rate, clk_rate = mode->clock * 1000;
-
-???????rate = clk_round_rate(arcpgu->clk, clk_rate);
-???????if (rate != clk_rate)
-???????????????return -EINVAL;
-
-???????return 0;
-}
-
?static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
??????????????????????????????????????struct drm_crtc_state *state)
?{
@@ -165,7 +151,6 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
????????.disable????????= arc_pgu_crtc_disable,
????????.prepare????????= arc_pgu_crtc_disable,
????????.commit?????????= arc_pgu_crtc_enable,
-???????.atomic_check???= arc_pgu_crtc_atomic_check,
????????.atomic_begin???= arc_pgu_crtc_atomic_begin,
?};
------------------------------->8-------------------------------

> Please also make sure the documentation properly explains this, and if
> not, please submit a patch to improve it.

You mean explains what? That .mode_fixup is not meant to be used in
new code?

-Alexey
