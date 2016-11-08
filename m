From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 8 Nov 2016 12:22:51 +0000
Subject: [PATCH v3 0/3] dmaengine: DW DMAC: split pdata to hardware
 properties
In-Reply-To: <1478526908.5295.67.camel@linux.intel.com>
References: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1478087707.2603.7.camel@synopsys.com>
 <1478526908.5295.67.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478607771.2603.31.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2016-11-07@15:55 +0200, Andy Shevchenko wrote:
>?
> Thanks for an update, but, please, answer to all my comments to your
> patch v2. Either you are okay with them, then you didn't address few,
> or
> you are not okay, I didn't get why. Deffer newer version until we get
> an
> agreement on the implementation.
>?

Thanks for response.
My comments are given inline?below.


---
> > Changes for v2:
> >????- use separate bool values for quirks in "dw_dma_platform_data"
> > instead of
> >??????common bit field.
> >?
> >????- convert device tree properties reading to unified device
> > property
> > API.
> This should be a separate patch.
>?
Agree. Implemented as?separate patch in?PATCH v3 series.

> >?
> >?
> > I was wrong about DW_DMA_IS_SOFT_LLP flag - it is used to check
> > about
> > ongoing soft llp transfer. So DW_DMA_IS_SOFT_LLP flag and "dwc-
> > >?
> > > nollp"?
> > variable have different functions and I couldn't just get rid of
> > "dwc-
> > >?
> > > nollp"
> > and use DW_DMA_IS_SOFT_LLP flag instead. So I left "dwc->nollp"
> > untouched.
> So, then perhaps we may convert it to another flag let's say
> DW_DMA_IS_LLP_SUPPORTED.
>?
> But this is other story independent of the subject.

Implemented in?PATCH v3 series.?
"dwc->nollp" was converted to "DW_DMA_IS_LLP_SUPPORTED" flag.

> >?
> > --- a/drivers/dma/dw/core.c
> > +++ b/drivers/dma/dw/core.c
> > @@ -1452,9 +1452,24 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> >??	dw->regs = chip->regs;
> >??	chip->dw = dw;
> >??
> > +	/* Reassign the platform data pointer */
> > +	pdata = dw->pdata;
> > +
> >??	pm_runtime_get_sync(chip->dev);
> >??
> > -	if (!chip->pdata) {
> > +	if ((!chip->pdata) || (chip->pdata && chip->pdata-
> > >?
> > > only_quirks_used)) {
> It's simple as
> if (!chip->pdata || chip->pdata->only_quirks_used)
>?
> > ?[--sources--]
> >?
> Would we leave the first part in the place it is now and add new
> piece
> after?
>?
> > [--sources--]
> >?
> ...like
>?
> /* Apply platform defined quirks */
> if (chip->data && chip->data->only_quirks_used) {
>??...
> }
Agree. That looks better.

>?
> >?
> > -	if (of_property_read_u32(np, "dma-channels",
> > &nr_channels))
> > -		return NULL;
> > +	if (device_property_read_bool(dev, "is-private"))
> As I mentioned above, please do a separate patch for this.
Implemented as?separate patch in?PATCH v3 series.?

>?
> >?
> > @@ -183,7 +186,7 @@ static int dw_probe(struct platform_device
> > *pdev)
> >??
> >??	pdata = dev_get_platdata(dev);
> >??	if (!pdata)
> > -		pdata = dw_dma_parse_dt(pdev);
> > +		pdata = dw_dma_parse_dt(dev);
> Perhaps you might rename the function to something like
>?
> dw_dma_parse_properties(dev);
Implemented in?PATCH v3 series.

>?
> >?
> > + * @only_quirks_used: Only read quirks (like "is_private" or
> > "is_memcpy") from
> > + *	platform data structure. Read other parameters from
> > device
> > tree
> > + *	node (if exists) or from hardware autoconfig registers.
> Can you somehow be more clear that all listed quirks will be copied
> from
> platform data.
See?comment below.

>?
> >?
> >???* @is_nollp: The device channels does not support multi block
> > transfers.
> >???* @chan_allocation_order: Allocate channels starting from 0 or 7
> >???* @chan_priority: Set channel priority increasing from 0 to 7 or
> > 7
> > to 0.
> > @@ -52,6 +55,7 @@ struct dw_dma_platform_data {
> >??	unsigned int	nr_channels;
> >??	bool		is_private;
> >??	bool		is_memcpy;
> >?
> > +	bool		only_quirks_used;
> Perhaps add if at the end of quirk list and name just?
>?
> >?
> >??	bool		is_nollp;
> ...here
>?
> bool use_quirks;
>?

I don't treat "is_nollp" as quirks like "is_private" or "is_memcpy".
It is like general pdata field: we can easily?read it from autoconfig
registers (and we don't have any problem with that) in case of
pdata/device-tree absence (as opposed to quirks like "is_private" or
"is_memcpy")

So, in PATCH v3 series "is_nollp" used as regular pdata field.

--?
?Paltsev Eugeniy
