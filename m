From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 16 Aug 2016 11:32:13 +0000
Subject: Wrong "nollp" DW DMAC parameter value on ARC SDP.
In-Reply-To: <1471264912.4887.117.camel@linux.intel.com>
References: <1470988994.21247.33.camel@synopsys.com>
 <1470999584.4887.94.camel@linux.intel.com>
 <1471008972.21247.40.camel@synopsys.com>
 <1471010908.4887.100.camel@linux.intel.com>
 <1471259434.21247.47.camel@synopsys.com>
 <1471264912.4887.117.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471347132.21247.55.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2016-08-15@15:41 +0300, Andy Shevchenko wrote:
> On Mon, 2016-08-15@11:10 +0000, Eugeniy Paltsev wrote:
> > 
> > On Fri, 2016-08-12@17:08 +0300, Andy Shevchenko wrote:
> > > 
> > > ?
> > > > 
> > > > > 
> > > > > > 
> > > > > > "nollp" parameter defines if DW DMAC channel supports multi
> > > > > > block
> > > > > > transfer or not.
> > > > > > ?
> > > > > > It is calculated in runtime, but differently depending on
> > > > > > on
> > > > > > availability of pdata. If pdata is absent "nollp" is
> > > > > > calculated
> > > > > > using
> > > > > > autoconfig hardware registers. Otherwise "nollp" is
> > > > > > calculated
> > > > > > using
> > > > > > the next code construction:
> > > > > > channel_writel(dwc, LLP, DWC_LLP_LOC(0xffffffff));
> > > > > > dwc->nollp = DWC_LLP_LOC(channel_readl(dwc, LLP)) == 0;
> > > > > > channel_writel(dwc, LLP, 0);
> > > > > > ?
> > > > > > I realized that these methods give different results.
> > > > > > For example on ARC AXS101 SDP in case of using autoconfig
> > > > > > "nollp"
> > > > > > was
> > > > > > calculated as "true" (and DMAC works fine),?
> > > > > > otherwise "nollp" was calculated as "false" (and DMAC
> > > > > > doesn't
> > > > > > work).
> > > > > Can you show out what the value you read back?
> > > > channel_readl(dwc, LLP) return 0xfffffffc
> > > Nice.
> > > ?
> > > Oh, forgot to ask, what are the DW_PARAMS and DWC_PARAMS[x] are
> > > on
> > > the same hardware?
> > DW_PARAMS: 0x38280b0c
> Wow, you have two masters with number 3 and 4? (Just out of
> curiosity)
> 
> > 
> > DWC_PARAMS[0]: 0x4926d300
> > DWC_PARAMS[1]: 0x4926d300
> > DWC_PARAMS[2]: 0x4926d300
> > DWC_PARAMS[3]: 0x4926d300
> A-ha, seems you have CHx_HC_LLP == 0. That may explain.
> ?
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > So I'm wondering how the code in question really works?
> > > > > > From DW AHB DMAC databook I wasn't able to find anything
> > > > > > relevant
> > > > > > to
> > > > > > this tricky implementation. Could you please clarify a
> > > > > > little
> > > > > > but
> > > > > > what
> > > > > > happens here?
> > > > > "Table 4-1:
> > > > > ...
> > > > > Hardcode Channel x LLP register to 0?
> > > > > ...
> > > > > Description: If set to 1, hardcodes channel x Linked List
> > > > > Pointer
> > > > > register to 0 (LLPx.LOC == 0), ..."
> > > So, any comment on this one? I suppose you may have an access to
> > > some
> > > internal Synopsys documentation which might shed a light. Or
> > > maybe I
> > > missed something else which should be considered.
> > Looks like this code based on idea, what if DMA ip-core doesn't
> > have?
> > LLP support it will not have LLP registers. It is not necessarily
> > true.
> Yep.
> 
> Consider to review?
> http://www.spinics.net/lists/dmaengine/msg10682.html
Looks good to me.
>
> > 
> > > 
> > > ?
> > Please add this code to read "is_memcpy" and "is_nollp" property?
> > from device tree.
> > ----------------------------->8------------------------------
> > diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> > index 5bda0eb..2712602 100644
> > --- a/drivers/dma/dw/platform.c
> > +++ b/drivers/dma/dw/platform.c
> > @@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
> > ????????if (of_property_read_bool(np, "is_private"))
> > ????????????????pdata->is_private = true;
> > ?
> > +???????if (of_property_read_bool(np, "is_memcpy"))
> > +???????????????pdata->is_memcpy = true;
> > +
> > +???????if (of_property_read_bool(np, "is_nollp"))
> > +???????????????pdata->is_nollp = true;
> > +
> > ????????if (!of_property_read_u32(np, "chan_allocation_order",
> > &tmp))
> > ????????????????pdata->chan_allocation_order = (unsigned char)tmp;
> Please, make this as a patch and submit either separately, or with
> your
> series mentioning that it has a dependency to my 8250 LPSS series.
> 
Reviewed-by: Eugeniy Platsev <Eugeniy.Paltsev at synopsys.com>
