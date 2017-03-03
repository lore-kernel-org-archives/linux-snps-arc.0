From: Liviu.Dudau@arm.com (Liviu Dudau)
Date: Fri, 3 Mar 2017 16:18:10 +0000
Subject: [PATCH] drm/arcpgu: Opt in debugfs
In-Reply-To: <1488544235-25444-1-git-send-email-abrodkin@synopsys.com>
References: <1488544235-25444-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170303161810.GN917@e110455-lin.cambridge.arm.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 03, 2017@03:30:35PM +0300, Alexey Brodkin wrote:
> This change adopts debugfs usage for outputting useful data.
> As of today we print:
>  * Mode and real HW clock values
>  * Standard FB info
> 
> Code is heavily borrowed from ARM's HDLCD thus adding Liviu in Cc.

FWIW: Reviewed-by: Liviu Dudau <Liviu.Dudau at arm.com>

Best regards,
Liviu

> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Liviu Dudau <Liviu.Dudau at arm.com>
> Cc: Daniel Vetter <daniel at ffwll.ch>
> Cc: David Airlie <airlied at linux.ie>
> Cc: Jose Abreu <joabreu at synopsys.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index 8d8344ed655e..5c82f52fba80 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -161,6 +161,32 @@ static int arcpgu_unload(struct drm_device *drm)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_device *drm = node->minor->dev;
> +	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	unsigned long clkrate = clk_get_rate(arcpgu->clk);
> +	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
> +
> +	seq_printf(m, "hw  : %lu\n", clkrate);
> +	seq_printf(m, "mode: %lu\n", mode_clock);
> +	return 0;
> +}
> +
> +static struct drm_info_list arcpgu_debugfs_list[] = {
> +	{ "clocks", arcpgu_show_pxlclock, 0 },
> +	{ "fb", drm_fb_cma_debugfs_show, 0 },
> +};
> +
> +static int arcpgu_debugfs_init(struct drm_minor *minor)
> +{
> +	return drm_debugfs_create_files(arcpgu_debugfs_list,
> +		ARRAY_SIZE(arcpgu_debugfs_list), minor->debugfs_root, minor);
> +}
> +#endif
> +
>  static struct drm_driver arcpgu_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
>  			   DRIVER_ATOMIC,
> @@ -187,6 +213,9 @@ static struct drm_driver arcpgu_drm_driver = {
>  	.gem_prime_vmap = drm_gem_cma_prime_vmap,
>  	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
>  	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> +#ifdef CONFIG_DEBUG_FS
> +	.debugfs_init = arcpgu_debugfs_init,
> +#endif
>  };
>  
>  static int arcpgu_probe(struct platform_device *pdev)
> -- 
> 2.7.4
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ?\_(?)_/?
