From: daniel@ffwll.ch (Daniel Vetter)
Date: Mon, 1 Oct 2018 10:14:08 +0200
Subject: [PATCH] DRM: UDL: get rid of useless vblank initialization
In-Reply-To: <20180928144126.21598-1-Eugeniy.Paltsev@synopsys.com>
References: <20180928144126.21598-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181001081408.GV11082@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Fri, Sep 28, 2018@05:41:26PM +0300, Eugeniy Paltsev wrote:
> UDL doesn't support vblank functionality so we don't need to
> initialize vblank here (we are able to send page flip
> completion events even without vblank initialization)
> 
> Moreover current drm_vblank_init call with num_crtcs > 0 causes
> sending DRM_EVENT_FLIP_COMPLETE event with zero timestamp every
> time. This breaks userspace apps (for example weston) which
> relies on timestamp value.
> 
> Cc: stable at vger.kernel.org
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Reviewed-by: Daniel Vetter <daniel.vetter at ffwll.ch>

> ---
>  drivers/gpu/drm/udl/udl_main.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index f455f095a146..1b014d92855b 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -350,15 +350,10 @@ int udl_driver_load(struct drm_device *dev, unsigned long flags)
>  	if (ret)
>  		goto err;
>  
> -	ret = drm_vblank_init(dev, 1);
> -	if (ret)
> -		goto err_fb;
> -
>  	drm_kms_helper_poll_init(dev);
>  
>  	return 0;
> -err_fb:
> -	udl_fbdev_cleanup(dev);
> +
>  err:
>  	if (udl->urbs.count)
>  		udl_free_urb_list(dev);
> -- 
> 2.14.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
