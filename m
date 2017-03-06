From: daniel@ffwll.ch (Daniel Vetter)
Date: Mon, 6 Mar 2017 11:17:49 +0100
Subject: [PATCH] drm/arcpgu: use .mode_fixup instead of .atomic_check
In-Reply-To: <873786fc-406e-850d-f9fb-a6c9ba8cf95c@synopsys.com>
References: <1488475674-6694-1-git-send-email-abrodkin@synopsys.com>
 <20170302195437.mlhzia2q2oav27mr@phenom.ffwll.local>
 <1488547649.2940.5.camel@synopsys.com>
 <873786fc-406e-850d-f9fb-a6c9ba8cf95c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170306101749.3houme6h4a67bbv6@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 03, 2017@06:05:15PM +0000, Jose Abreu wrote:
> Hi Alexey,
> 
> 
> On 03-03-2017 13:27, Alexey Brodkin wrote:
> >
> > So if I understood you correct here what I really need is just to get rid of existing check,
> > right? I.e. the following is to be in v2 respin:
> > ------------------------------->8-------------------------------
> > diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > index ad9a95916f1f..86f1555914e8 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> > @@ -129,20 +129,6 @@ static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
> >                               ~ARCPGU_CTRL_ENABLE_MASK);
> >  }
> >  
> > -static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
> > -                                    struct drm_crtc_state *state)
> > -{
> > -       struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> > -       struct drm_display_mode *mode = &state->adjusted_mode;
> > -       long rate, clk_rate = mode->clock * 1000;
> > -
> > -       rate = clk_round_rate(arcpgu->clk, clk_rate);
> > -       if (rate != clk_rate)
> > -               return -EINVAL;
> > -
> > -       return 0;
> > -}
> > -
> >  static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
> >                                       struct drm_crtc_state *state)
> >  {
> > @@ -165,7 +151,6 @@ static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
> >         .disable        = arc_pgu_crtc_disable,
> >         .prepare        = arc_pgu_crtc_disable,
> >         .commit         = arc_pgu_crtc_enable,
> > -       .atomic_check   = arc_pgu_crtc_atomic_check,
> >         .atomic_begin   = arc_pgu_crtc_atomic_begin,
> >  };
> > ------------------------------->8-------------------------------
> 
> I don't think you can remove the check entirely as this will make
> any mode be accepted, right?

Yes there's still the issue of atomic_check/mode_fixup vs. mode_valid. I'm
still trying to volunteer someone to fix up that mess. But at least it's
all properly documented I hope (if not, pls send patch).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
