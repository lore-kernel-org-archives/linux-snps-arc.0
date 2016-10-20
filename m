From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 20 Oct 2016 13:16:44 +0000
Subject: [PATCH] dmaengine: DW DMAC: split pdata to hardware properties
 and platform quirks
In-Reply-To: <1476960501.3693.19.camel@linux.intel.com>
References: <1473945253-16649-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1476960501.3693.19.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1476969404.2882.26.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2016-10-20@13:48 +0300, Andy Shevchenko wrote:
> On Thu, 2016-09-15@16:14 +0300, Eugeniy Paltsev wrote:
> > 
> > This patch is to address a proposal by Andy in this thread:
> > http://www.spinics.net/lists/dmaengine/msg10754.html
> > Split platform data to actual hardware properties, and platform
> > quirks.
> > Now we able to use quirks and hardware properties separately from
> > different sources (pdata, device tree or autoconfig registers)
> > 
> My comments below.
> 
> Sorry for delayed answer.
No problems.
> 
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > ?drivers/dma/dw/core.c????????????????| 31 +++++++++++++++---------
> > --
> > ?drivers/dma/dw/platform.c????????????| 42 +++++++++++++++++++++---
> > -
> > -----------
> > ?include/linux/platform_data/dma-dw.h | 20 +++++++++++------
> > ?3 files changed, 57 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> > index c2c0a61..9352735 100644
> > --- a/drivers/dma/dw/core.c
> > +++ b/drivers/dma/dw/core.c
> > @@ -1451,10 +1451,25 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > ?
> > ?	dw->regs = chip->regs;
> > ?	chip->dw = dw;
> + empty line.
> 
> > 
> > +	/* Reassign the platform data pointer */
> > +	pdata = dw->pdata;
> > ?
> > ?	pm_runtime_get_sync(chip->dev);
> > ?
> > -	if (!chip->pdata) {
> > +	if ((!chip->pdata) ||
> > +	???(chip->pdata && test_bit(QUIRKS_ONLY_USED, &chip-
> > >pdata-
> I don't think you need atomic test / set of those bits.
I don't need?atomic bit operations here, I just used standard bit API
to make code more clear.

> > 
> > > 
> > > quirks))) {
> > +
> > +		/*
> > +		?* Fill quirks with the default values in case of
> > pdata absence
> /*
> ?* Multi-line comments should include full sentences
> ?* (punctuation matters).
> ?*/
> 
> > 
> > +		?*/
> > +		if (!chip->pdata) {
> > +			set_bit(QUIRKS_IS_PRIVATE, &pdata-
> > >quirks);
> > +			set_bit(QUIRKS_IS_MEMCPY, &pdata->quirks);
> > +			set_bit(QUIRKS_IS_NOLLP, &pdata->quirks);
> > +		} else {
> > +			pdata->quirks = chip->pdata->quirks;
> > +		}
> > +
> > ?		dw_params = dma_readl(dw, DW_PARAMS);
> > ?		dev_dbg(chip->dev, "DW_PARAMS: 0x%08x\n",
> > dw_params);
> > ?
> > @@ -1464,9 +1479,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > ?			goto err_pdata;
> > ?		}
> > ?
> > -		/* Reassign the platform data pointer */
> > -		pdata = dw->pdata;
> > -
> > ?		/* Get hardware configuration parameters */
> > ?		pdata->nr_channels = (dw_params >>
> > DW_PARAMS_NR_CHAN
> > & 7) + 1;
> > ?		pdata->nr_masters = (dw_params >>
> > DW_PARAMS_NR_MASTER
> > & 3) + 1;
> > @@ -1477,8 +1489,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > ?		pdata->block_size = dma_readl(dw, MAX_BLK_SIZE);
> > ?
> > ?		/* Fill platform data with the default values */
> > -		pdata->is_private = true;
> > -		pdata->is_memcpy = true;
> > ?		pdata->chan_allocation_order =
> > CHAN_ALLOCATION_ASCENDING;
> > ?		pdata->chan_priority = CHAN_PRIORITY_ASCENDING;
> > ?	} else if (chip->pdata->nr_channels >
> > DW_DMA_MAX_NR_CHANNELS)
> > {
> > @@ -1486,9 +1496,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > ?		goto err_pdata;
> > ?	} else {
> > ?		memcpy(dw->pdata, chip->pdata, sizeof(*dw-
> > >pdata));
> > -
> > -		/* Reassign the platform data pointer */
> > -		pdata = dw->pdata;
> > ?	}
> > ?
> > ?	dw->chan = devm_kcalloc(chip->dev, pdata->nr_channels,
> > sizeof(*dw->chan),
> > @@ -1569,7 +1576,7 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > ?				(dwc_params >> DWC_PARAMS_MBLK_EN
> > &
> > 0x1) == 0;
> > ?		} else {
> > ?			dwc->block_size = pdata->block_size;
> > -			dwc->nollp = pdata->is_nollp;
> > +			dwc->nollp = test_bit(QUIRKS_IS_NOLLP,
> > &pdata->quirks);
> Perhaps you need another patch which actually moves nollp to dwc-
> >flags.
As I can see, we already have?DW_DMA_IS_SOFT_LLP flag in "dwc->flags"
with same functionality, which is set if "dwc->nollp" is true. Probably
we can use this flag and get rid of "dwc->nollp".
But I'm a bit confused why we clear DW_DMA_IS_SOFT_LLP bit in
"dwc_scan_descriptors" and "dwc_terminate_all" functions.
Any ideas about that?

> > 
> > ?		}
> > ?	}
> > ?
> > @@ -1582,9 +1589,9 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > ?
> > ?	/* Set capabilities */
> > ?	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);
> > -	if (pdata->is_private)
> > +	if (test_bit(QUIRKS_IS_PRIVATE, &pdata->quirks))
> > ?		dma_cap_set(DMA_PRIVATE, dw->dma.cap_mask);
> > -	if (pdata->is_memcpy)
> > +	if (test_bit(QUIRKS_IS_MEMCPY, &pdata->quirks))
> > ?		dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
> > ?
> > ?	dw->dma.dev = chip->dev;
> > diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> > index 5bda0eb..308b977 100644
> > --- a/drivers/dma/dw/platform.c
> > +++ b/drivers/dma/dw/platform.c
> > @@ -12,6 +12,7 @@
> > ? * published by the Free Software Foundation.
> > ? */
> > ?
> > +#include <linux/bitops.h>
> > ?#include <linux/module.h>
> > ?#include <linux/device.h>
> > ?#include <linux/clk.h>
> > @@ -111,41 +112,48 @@ dw_dma_parse_dt(struct platform_device *pdev)
> > ?		return NULL;
> > ?	}
> > ?
> > -	if (of_property_read_u32(np, "dma-masters", &nr_masters))
> > -		return NULL;
> > -	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
> > -		return NULL;
> > -
> > -	if (of_property_read_u32(np, "dma-channels",
> > &nr_channels))
> > -		return NULL;
> > -
> > ?	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata),
> > GFP_KERNEL);
> > ?	if (!pdata)
> > ?		return NULL;
> > ?
> > +	set_bit(QUIRKS_ONLY_USED, &pdata->quirks);
> > +
> > +	if (of_property_read_bool(np, "is-private"))
> > +		set_bit(QUIRKS_IS_PRIVATE, &pdata->quirks);
> > +
> > +	if (of_property_read_bool(np, "is-memcpy"))
> > +		set_bit(QUIRKS_IS_MEMCPY, &pdata->quirks);
> > +
> > +	if (of_property_read_bool(np, "is-nollp"))
> > +		set_bit(QUIRKS_IS_NOLLP, &pdata->quirks);
> I would suggest to convert to unified device property API first.
I'll do that.

> 
> > 
> > +
> > +	if (of_property_read_u32(np, "dma-masters", &nr_masters))
> > +		return pdata;
> > +	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
> > +		return pdata;
> > +
> > ?	pdata->nr_masters = nr_masters;
> > -	pdata->nr_channels = nr_channels;
> > ?
> > -	if (of_property_read_bool(np, "is_private"))
> > -		pdata->is_private = true;
> > +	if (of_property_read_u32(np, "dma-channels",
> > &nr_channels))
> > +		return pdata;
> > ?
> > -	if (!of_property_read_u32(np, "chan_allocation_order",
> > &tmp))
> > +	pdata->nr_channels = nr_channels;
> > +
> > +	if (!of_property_read_u32(np, "chan-allocation-order",
> > &tmp))
> > ?		pdata->chan_allocation_order = (unsigned char)tmp;
> > ?
> > -	if (!of_property_read_u32(np, "chan_priority", &tmp))
> > +	if (!of_property_read_u32(np, "chan-priority", &tmp))
> > ?		pdata->chan_priority = tmp;
> > ?
> > -	if (!of_property_read_u32(np, "block_size", &tmp))
> > +	if (!of_property_read_u32(np, "block-size", &tmp))
> > ?		pdata->block_size = tmp;
> > ?
> > ?	if (!of_property_read_u32_array(np, "data-width", arr,
> > nr_masters)) {
> > ?		for (tmp = 0; tmp < nr_masters; tmp++)
> > ?			pdata->data_width[tmp] = arr[tmp];
> > -	} else if (!of_property_read_u32_array(np, "data_width",
> > arr,
> > nr_masters)) {
> > -		for (tmp = 0; tmp < nr_masters; tmp++)
> > -			pdata->data_width[tmp] = BIT(arr[tmp] &
> > 0x07);
> > ?	}
> > ?
> > +	clear_bit(QUIRKS_ONLY_USED, &pdata->quirks);
> > ?	return pdata;
> > ?}
> > ?#else
> > diff --git a/include/linux/platform_data/dma-dw.h
> > b/include/linux/platform_data/dma-dw.h
> > index 5f0e11e..9cd8199 100644
> > --- a/include/linux/platform_data/dma-dw.h
> > +++ b/include/linux/platform_data/dma-dw.h
> > @@ -37,10 +37,7 @@ struct dw_dma_slave {
> > ?/**
> > ? * struct dw_dma_platform_data - Controller configuration
> > parameters
> > ? * @nr_channels: Number of channels supported by hardware (max 8)
> > - * @is_private: The device channels should be marked as private
> > and
> > not for
> > - *	by the general purpose DMA channel allocator.
> > - * @is_memcpy: The device channels do support memory-to-memory
> > transfers.
> > - * @is_nollp: The device channels does not support multi block
> > transfers.
> > + * @quirks: Bit field with platform quirks
> > ? * @chan_allocation_order: Allocate channels starting from 0 or 7
> > ? * @chan_priority: Set channel priority increasing from 0 to 7 or
> > 7
> > to 0.
> > ? * @block_size: Maximum block size supported by the controller
> > @@ -50,9 +47,18 @@ struct dw_dma_slave {
> > ? */
> > ?struct dw_dma_platform_data {
> > ?	unsigned int	nr_channels;
> > -	bool		is_private;
> > -	bool		is_memcpy;
> > -	bool		is_nollp;
> > +/* Only use quirks from platform data structure */
> > +#define QUIRKS_ONLY_USED	0
> > +/*
> > + * The device channels should be marked as private and not for
> > + * by the general purpose DMA channel allocator.
> > + */
> > +#define QUIRKS_IS_PRIVATE	1
> > +/* The device channels do support memory-to-memory transfers. */
> > +#define QUIRKS_IS_MEMCPY	2
> > +/* The device channels do not support multi block transfers. */
> > +#define QUIRKS_IS_NOLLP		3
> You may move descriptions to above struct description field. It will
> be
> consolidated and moreover visible in kernel-doc processed documents.
Good idea.

> > 
> > +	unsigned long	quirks;
> > ?#define CHAN_ALLOCATION_ASCENDING	0	/* zero to seven
> > */
> > ?#define CHAN_ALLOCATION_DESCENDING	1	/* seven to
> > zero
> > */
> > ?	unsigned char	chan_allocation_order;
-- 
?Paltsev Eugeniy
