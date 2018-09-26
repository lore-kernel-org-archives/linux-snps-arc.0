From: ville.syrjala@linux.intel.com (Ville =?iso-8859-1?Q?Syrj=E4l=E4?=)
Date: Wed, 26 Sep 2018 19:37:23 +0300
Subject: [PATCH] DRM: VBLANK: provide valid timestamp for EVENT_FLIP
In-Reply-To: <20180926142535.17997-1-Eugeniy.Paltsev@synopsys.com>
References: <20180926142535.17997-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926163723.GW9144@intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 26, 2018@05:25:35PM +0300, Eugeniy Paltsev wrote:
> If driver/HW doesn't support vblank functionality (for example
> UDL driver, ARCPGU driver, ...) we always have vblank->time == 0.
> In result we always provide zero timestamp for
> DRM_EVENT_FLIP_COMPLETE. This breaks userspace apps (for example
> weston) which relies on timestamp value.
> 
> Setup time to provide valid timestamp for DRM_EVENT_FLIP_COMPLETE
> event.
> 
> Cc: stable at vger.kernel.org
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 28cdcf76b6f9..0d19aca48782 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -911,6 +911,15 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>  
>  	if (dev->num_crtcs > 0) {

If those drivers don't support vblank stuff why are they calling
drm_vblank_init() w/ num_crtcs > 0? If they didn't they'd take the
else branch which already does what you want.

>  		seq = drm_vblank_count_and_time(dev, pipe, &now);
> +
> +		/*
> +		 * If driver/HW doesn't support vblank functionality we
> +		 * always have vblank->time == 0. Setup time to provide valid
> +		 * timestamp for DRM_EVENT_FLIP_COMPLETE event.
> +		 */
> +		if (!now && e->event.base.type == DRM_EVENT_FLIP_COMPLETE)
> +			now = ktime_get();
> +
>  	} else {
>  		seq = 0;
>  
> -- 
> 2.14.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrj?l?
Intel
