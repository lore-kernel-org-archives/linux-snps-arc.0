From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Sep 2018 14:32:01 +0000
Subject: [PATCH] DRM: VBLANK: provide valid timestamp for EVENT_FLIP
In-Reply-To: <20180926163723.GW9144@intel.com>
References: <20180926142535.17997-1-Eugeniy.Paltsev@synopsys.com>
 <20180926163723.GW9144@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1538145120.5186.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2018-09-26@19:37 +0300, Ville Syrj?l? wrote:
> On Wed, Sep 26, 2018@05:25:35PM +0300, Eugeniy Paltsev wrote:
> > If driver/HW doesn't support vblank functionality (for example
> > UDL driver, ARCPGU driver, ...) we always have vblank->time == 0.
> > In result we always provide zero timestamp for
> > DRM_EVENT_FLIP_COMPLETE. This breaks userspace apps (for example
> > weston) which relies on timestamp value.
> > 
> > Setup time to provide valid timestamp for DRM_EVENT_FLIP_COMPLETE
> > event.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 28cdcf76b6f9..0d19aca48782 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -911,6 +911,15 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> >  
> >  	if (dev->num_crtcs > 0) {
> 
> If those drivers don't support vblank stuff why are they calling
> bldrm_vank_init() w/ num_crtcs > 0? If they didn't they'd take the
> else branch which already does what you want.

Hmm...
As I can see UDL call drm_vblank_init() with num_crtcs = 1 but UDL HW
doesn't support vblank at all.
I guess I need to fix it.

> >  		seq = drm_vblank_count_and_time(dev, pipe, &now);
> > +
> > +		/*
> > +		 * If driver/HW doesn't support vblank functionality we
> > +		 * always have vblank->time == 0. Setup time to provide valid
> > +		 * timestamp for DRM_EVENT_FLIP_COMPLETE event.
> > +		 */
> > +		if (!now && e->event.base.type == DRM_EVENT_FLIP_COMPLETE)
> > +			now = ktime_get();
> > +
> >  	} else {
> >  		seq = 0;
> >  
> > -- 
> > 2.14.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel at lists.freedesktop.org
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.freedesktop.org_mailman_listinfo_dri-2Ddevel&d=DwIDAw&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN1M
> > riPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=5bbb9SeVXTMPDa1bXQxqlBIOnSdKaKY5W0BkMCgwijE&s=50EhApCZAeMMDUEd6FVpXf5owd1Bi3vn5GaBt0KE2Cw&e=
> 
> 
-- 
 Eugeniy Paltsev
