From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Thu, 27 Oct 2016 18:55:08 +0300
Subject: [PATCH v2] dmaengine: DW DMAC: split pdata to hardware
 properties and platform quirks
In-Reply-To: <1477582497-19302-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1477582497-19302-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477583708.5295.35.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2016-10-27@18:34 +0300, Eugeniy Paltsev wrote:
> This patch is to address a proposal by Andy in this thread:
> http://www.spinics.net/lists/dmaengine/msg11506.html
> Split platform data to actual hardware properties, and platform
> quirks.
> Now we able to use quirks and hardware properties separately from
> different sources (pdata, device tree or autoconfig registers)
> 

Thanks for an update, my comments below.

> ---
> Changes for v2:
> ???- use separate bool values for quirks in "dw_dma_platform_data"
> instead of
> ?????common bit field.

> ???- convert device tree properties reading to unified device property
> API.

This should be a separate patch.

> 
> I was wrong about DW_DMA_IS_SOFT_LLP flag - it is used to check about
> ongoing soft llp transfer. So DW_DMA_IS_SOFT_LLP flag and "dwc-
> >nollp"?
> variable have different functions and I couldn't just get rid of "dwc-
> >nollp"
> and use DW_DMA_IS_SOFT_LLP flag instead. So I left "dwc->nollp"
> untouched.

So, then perhaps we may convert it to another flag let's say
DW_DMA_IS_LLP_SUPPORTED.

But this is other story independent of the subject.

> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -1452,9 +1452,24 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> ?	dw->regs = chip->regs;
> ?	chip->dw = dw;
> ?
> +	/* Reassign the platform data pointer */
> +	pdata = dw->pdata;
> +
> ?	pm_runtime_get_sync(chip->dev);
> ?
> -	if (!chip->pdata) {
> +	if ((!chip->pdata) || (chip->pdata && chip->pdata-
> >only_quirks_used)) {

It's simple as
if (!chip->pdata || chip->pdata->only_quirks_used)

> +		if (!chip->pdata) {
> +			/*
> +			?* Fill quirks with the default values in
> case of
> +			?* pdata absence.
> +			?*/
> +			pdata->is_private = true;
> +			pdata->is_memcpy = true;
> +		} else {
> +			pdata->is_private = chip->pdata->is_private;
> +			pdata->is_memcpy = chip->pdata->is_memcpy;
> +		}

Would we leave the first part in the place it is now and add new piece
after?

> +
> ?		dw_params = dma_readl(dw, DW_PARAMS);
> ?		dev_dbg(chip->dev, "DW_PARAMS: 0x%08x\n", dw_params);
> ?
> @@ -1464,9 +1479,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> ?			goto err_pdata;
> ?		}
> ?
> -		/* Reassign the platform data pointer */
> -		pdata = dw->pdata;
> -
> ?		/* Get hardware configuration parameters */
> ?		pdata->nr_channels = (dw_params >> DW_PARAMS_NR_CHAN
> & 7) + 1;
> ?		pdata->nr_masters = (dw_params >> DW_PARAMS_NR_MASTER
> & 3) + 1;
> @@ -1477,8 +1489,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> ?		pdata->block_size = dma_readl(dw, MAX_BLK_SIZE);
> ?
> ?		/* Fill platform data with the default values */
> -		pdata->is_private = true;
> -		pdata->is_memcpy = true;
> ?		pdata->chan_allocation_order =
> CHAN_ALLOCATION_ASCENDING;
> ?		pdata->chan_priority = CHAN_PRIORITY_ASCENDING;

...like

/* Apply platform defined quirks */
if (chip->data && chip->data->only_quirks_used) {
 ...
}


> -	if (of_property_read_u32(np, "dma-channels", &nr_channels))
> -		return NULL;
> +	if (device_property_read_bool(dev, "is-private"))

As I mentioned above, please do a separate patch for this.

> @@ -183,7 +186,7 @@ static int dw_probe(struct platform_device *pdev)
> ?
> ?	pdata = dev_get_platdata(dev);
> ?	if (!pdata)
> -		pdata = dw_dma_parse_dt(pdev);
> +		pdata = dw_dma_parse_dt(dev);

Perhaps you might rename the function to something like

dw_dma_parse_properties(dev);

> + * @only_quirks_used: Only read quirks (like "is_private" or
> "is_memcpy") from
> + *	platform data structure. Read other parameters from device
> tree
> + *	node (if exists) or from hardware autoconfig registers.

Can you somehow be more clear that all listed quirks will be copied from
platform data.

> ? * @is_nollp: The device channels does not support multi block
> transfers.
> ? * @chan_allocation_order: Allocate channels starting from 0 or 7
> ? * @chan_priority: Set channel priority increasing from 0 to 7 or 7
> to 0.
> @@ -52,6 +55,7 @@ struct dw_dma_platform_data {
> ?	unsigned int	nr_channels;
> ?	bool		is_private;
> ?	bool		is_memcpy;

> +	bool		only_quirks_used;

Perhaps add if at the end of quirk list and name just?

> ?	bool		is_nollp;

...here

bool use_quirks;

> ?#define CHAN_ALLOCATION_ASCENDING	0	/* zero to seven */
> ?#define CHAN_ALLOCATION_DESCENDING	1	/* seven to zero
> */

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
