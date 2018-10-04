From: daniel@ffwll.ch (Daniel Vetter)
Date: Thu, 4 Oct 2018 12:49:38 +0200
Subject: [PATCH v2] drm: fb-helper: Reject all pixel format changing
 requests
In-Reply-To: <20181004103422.GL9144@intel.com>
References: <20181003164538.5534-1-Eugeniy.Paltsev@synopsys.com>
 <20181004103422.GL9144@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181004104938.GJ31561@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Thu, Oct 04, 2018@01:34:22PM +0300, Ville Syrj?l? wrote:
> On Wed, Oct 03, 2018@07:45:38PM +0300, Eugeniy Paltsev wrote:
> > drm fbdev emulation doesn't support changing the pixel format at all,
> > so reject all pixel format changing requests.
> > 
> > Cc: stable at vger.kernel.org
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > Changes v1->v2:
> >  * Reject all pixel format changing request, not just the invalid ones.
> > 
> >  drivers/gpu/drm/drm_fb_helper.c | 91 ++++++++++++-----------------------------
> >  1 file changed, 26 insertions(+), 65 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 16ec93b75dbf..48598d7f673f 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1580,6 +1580,25 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
> >  }
> >  EXPORT_SYMBOL(drm_fb_helper_ioctl);
> >  
> > +static bool drm_fb_pixel_format_equal(const struct fb_var_screeninfo *var_1,
> > +				      const struct fb_var_screeninfo *var_2)
> > +{
> > +	return var_1->bits_per_pixel == var_2->bits_per_pixel &&
> > +	       var_1->grayscale == var_2->grayscale &&
> > +	       var_1->red.offset == var_2->red.offset &&
> > +	       var_1->red.length == var_2->red.length &&
> > +	       var_1->red.msb_right == var_2->red.msb_right &&
> > +	       var_1->green.offset == var_2->green.offset &&
> > +	       var_1->green.length == var_2->green.length &&
> > +	       var_1->green.msb_right == var_2->green.msb_right &&
> > +	       var_1->blue.offset == var_2->blue.offset &&
> > +	       var_1->blue.length == var_2->blue.length &&
> > +	       var_1->blue.msb_right == var_2->blue.msb_right &&
> > +	       var_1->transp.offset == var_2->transp.offset &&
> > +	       var_1->transp.length == var_2->transp.length &&
> > +	       var_1->transp.msb_right == var_2->transp.msb_right;
> > +}
> 
> Could have shortened a bit with memcmp() but this works too.

I'm always vary of memcmp with structs that might have padding and stuff.

> Reviewed-by: Ville Syrj?l? <ville.syrjala at linux.intel.com>
> 
> I suppose we really should be doing the same for most of the rest of
> var_screeninfo as we don't allow changing the timings/etc. either.

Timing at least doens't have an immediate correctness impact of userspace
rendering the wrong format :-)

Thanks for review&patch, applied to drm-misc-fixes.
-Daniel

> 
> > +
> >  /**
> >   * drm_fb_helper_check_var - implementation for &fb_ops.fb_check_var
> >   * @var: screeninfo to check
> > @@ -1590,7 +1609,6 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> >  {
> >  	struct drm_fb_helper *fb_helper = info->par;
> >  	struct drm_framebuffer *fb = fb_helper->fb;
> > -	int depth;
> >  
> >  	if (var->pixclock != 0 || in_dbg_master())
> >  		return -EINVAL;
> > @@ -1610,72 +1628,15 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> >  		return -EINVAL;
> >  	}
> >  
> > -	switch (var->bits_per_pixel) {
> > -	case 16:
> > -		depth = (var->green.length == 6) ? 16 : 15;
> > -		break;
> > -	case 32:
> > -		depth = (var->transp.length > 0) ? 32 : 24;
> > -		break;
> > -	default:
> > -		depth = var->bits_per_pixel;
> > -		break;
> > -	}
> > -
> > -	switch (depth) {
> > -	case 8:
> > -		var->red.offset = 0;
> > -		var->green.offset = 0;
> > -		var->blue.offset = 0;
> > -		var->red.length = 8;
> > -		var->green.length = 8;
> > -		var->blue.length = 8;
> > -		var->transp.length = 0;
> > -		var->transp.offset = 0;
> > -		break;
> > -	case 15:
> > -		var->red.offset = 10;
> > -		var->green.offset = 5;
> > -		var->blue.offset = 0;
> > -		var->red.length = 5;
> > -		var->green.length = 5;
> > -		var->blue.length = 5;
> > -		var->transp.length = 1;
> > -		var->transp.offset = 15;
> > -		break;
> > -	case 16:
> > -		var->red.offset = 11;
> > -		var->green.offset = 5;
> > -		var->blue.offset = 0;
> > -		var->red.length = 5;
> > -		var->green.length = 6;
> > -		var->blue.length = 5;
> > -		var->transp.length = 0;
> > -		var->transp.offset = 0;
> > -		break;
> > -	case 24:
> > -		var->red.offset = 16;
> > -		var->green.offset = 8;
> > -		var->blue.offset = 0;
> > -		var->red.length = 8;
> > -		var->green.length = 8;
> > -		var->blue.length = 8;
> > -		var->transp.length = 0;
> > -		var->transp.offset = 0;
> > -		break;
> > -	case 32:
> > -		var->red.offset = 16;
> > -		var->green.offset = 8;
> > -		var->blue.offset = 0;
> > -		var->red.length = 8;
> > -		var->green.length = 8;
> > -		var->blue.length = 8;
> > -		var->transp.length = 8;
> > -		var->transp.offset = 24;
> > -		break;
> > -	default:
> > +	/*
> > +	 * drm fbdev emulation doesn't support changing the pixel format at all,
> > +	 * so reject all pixel format changing requests.
> > +	 */
> > +	if (!drm_fb_pixel_format_equal(var, &info->var)) {
> > +		DRM_DEBUG("fbdev emulation doesn't support changing the pixel format\n");
> >  		return -EINVAL;
> >  	}
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_fb_helper_check_var);
> > -- 
> > 2.14.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel at lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Ville Syrj?l?
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
