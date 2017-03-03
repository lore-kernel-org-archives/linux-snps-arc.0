From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 3 Mar 2017 19:24:06 +0000
Subject: [PATCH] drm/arcpgu: use .mode_fixup instead of .atomic_check
In-Reply-To: <873786fc-406e-850d-f9fb-a6c9ba8cf95c@synopsys.com>
References: <1488475674-6694-1-git-send-email-abrodkin@synopsys.com>
 <20170302195437.mlhzia2q2oav27mr@phenom.ffwll.local>
 <1488547649.2940.5.camel@synopsys.com>
 <873786fc-406e-850d-f9fb-a6c9ba8cf95c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488569045.2973.14.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Fri, 2017-03-03@18:05 +0000, Jose Abreu wrote:
> Hi Alexey,
> 
> 
> On 03-03-2017 13:27, Alexey Brodkin wrote:
> > 
> > 
> > So if I understood you correct here what I really need is just to get rid of existing check,
> > right? I.e. the following is to be in v2 respin:
> > ------------------------------->8-------------------------------
> > diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > index ad9a95916f1f..86f1555914e8 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > @@ -129,20 +129,6 @@ static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
> > ??????????????????????????????~ARCPGU_CTRL_ENABLE_MASK);
> > ?}
> > ?
> > -static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
> > -????????????????????????????????????struct drm_crtc_state *state)
> > -{
> > -???????struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> > -???????struct drm_display_mode *mode = &state->adjusted_mode;
> > -???????long rate, clk_rate = mode->clock * 1000;
> > -
> > -???????rate = clk_round_rate(arcpgu->clk, clk_rate);
> > -???????if (rate != clk_rate)
> > -???????????????return -EINVAL;
> > -
> > -???????return 0;
> > -}
> > -
> > ?static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
> > ??????????????????????????????????????struct drm_crtc_state *state)
> > ?{
> > @@ -165,7 +151,6 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
> > ????????.disable????????= arc_pgu_crtc_disable,
> > ????????.prepare????????= arc_pgu_crtc_disable,
> > ????????.commit?????????= arc_pgu_crtc_enable,
> > -???????.atomic_check???= arc_pgu_crtc_atomic_check,
> > ????????.atomic_begin???= arc_pgu_crtc_atomic_begin,
> > ?};
> > ------------------------------->8-------------------------------
> 
> I don't think you can remove the check entirely as this will make
> any mode be accepted, right?

Correct. Otherwise we'll get some modes and devices that
don't work.

Remember our saga with 74.25 vs 74.40 MHz?

With our PLLs on AXS and HSDK boards we may generate 74.25 MHz clock
which satisfy some monitors especially those who pass correct EDID to the host.
But what if EDID is either corrupted or doesn't exist (that's my case with
some industrial monitor as well as with old DVI monitor)?

In that case Linux kernel attempts to calculate all the values including pixel clock
but then instead of 74.25 we'll get 74.40 and equipment that used to work is no longer useful.

So strictly speaking existing check makes perfect sense. But it reduces
compatibility with not very good monitors.

Probably better solution to the problem is just to throw away [my] faulty HW and
buy equipment that conforms to standards (not really sure if EDID is a hard
requirement for DVI/HDMI displays or this is just an option).

BTW I'm wondering if there're any guidelines on what could be pixel clock
deviation from the requested one?

-Alexey
