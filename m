From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 23 Oct 2018 11:01:14 +0000
Subject: [PATCH] DRM: UDL: get rid of useless vblank initialization
In-Reply-To: <20180928144126.21598-1-Eugeniy.Paltsev@synopsys.com>
References: <20180928144126.21598-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1540292472.19916.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi David,

Maybe you have any comments or remarks about this patch?
And if you don't could you please apply it. Thanks!

On Fri, 2018-09-28@17:41 +0300, Eugeniy Paltsev wrote:
> UDL doesn't support vblank functionality so we don't need to
> initialize vblank here (we are able to send page flip
> completion events even without vblank initialization)
> 
> Moreover current drm_vblank_init call with num_crtcs > 0 causes
> sending DRM_EVENT_FLIP_COMPLETE event with zero timestamp every
> time. This breaks userspace apps (for example weston) which
> relies on timestamp value.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter at ffwll.ch>
> Cc: stable at vger.kernel.org
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
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
-- 
 Eugeniy Paltsev
