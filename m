From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 14 Sep 2018 14:45:55 +0000
Subject: [PATCH] drm/etnaviv: add DMA configuration for etnaviv platform
 device
In-Reply-To: <20180914092438.21492-1-l.stach@pengutronix.de>
References: <20180914092438.21492-1-l.stach@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1536936354.24275.11.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lucas,

On Fri, 2018-09-14@11:24 +0200, Lucas Stach wrote:
> The etnaviv device is a virtual device backing the DRM device, which may
> drive multiple hardware GPU core devies. As most of the dma-mapping handling
> is done through the virtual device, we need to make sure that a proper DMA
> setup is in place. The easiest way to get a reasonable configuration is
> to let the virtual device share the DMA configuration with one of the GPU
> devices, so call of_dma_configure() with the right parameters manually.
> 
> This assumes that all etnaviv driven GPU devices in the system share the
> same DMA configuration. If we ever encounter a SoC where the GPUs are on
> busses with different offsets or behind different IOMMUs that will require
> much deeper changes to the driver, as we would need to implement etnaviv
> specific versions of most of the DRM helper functions.
> 
> For now we should be fine with this solution.

This works fine on HSDK, thanks!

Tested-By: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

> 
> Signed-off-by: Lucas Stach <l.stach at pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 9b2720b41571..83c1f46670bf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -592,8 +592,6 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct component_match *match = NULL;
>  
> -	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> -
>  	if (!dev->platform_data) {
>  		struct device_node *core_node;
>  
> @@ -655,13 +653,30 @@ static int __init etnaviv_init(void)
>  	for_each_compatible_node(np, NULL, "vivante,gc") {
>  		if (!of_device_is_available(np))
>  			continue;
> -		pdev = platform_device_register_simple("etnaviv", -1,
> -						       NULL, 0);
> -		if (IS_ERR(pdev)) {
> -			ret = PTR_ERR(pdev);
> +
> +		pdev = platform_device_alloc("etnaviv", -1);
> +		if (!pdev) {
> +			ret = -ENOMEM;
> +			of_node_put(np);
> +			goto unregister_platform_driver;
> +		}
> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> +		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> +
> +		/*
> +		 * Apply the same DMA configuration to the virtual etnaviv
> +		 * device as the GPU we found. This assumes that all Vivante
> +		 * GPUs in the system share the same DMA constraints.
> +		 */
> +		of_dma_configure(&pdev->dev, np, true);
> +
> +		ret = platform_device_add(pdev);
> +		if (ret) {
> +			platform_device_put(pdev);
>  			of_node_put(np);
>  			goto unregister_platform_driver;
>  		}
> +
>  		etnaviv_drm = pdev;
>  		of_node_put(np);
>  		break;
-- 
 Eugeniy Paltsev
