From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 15 Aug 2016 11:10:34 +0000
Subject: Wrong "nollp" DW DMAC parameter value on ARC SDP.
In-Reply-To: <1471010908.4887.100.camel@linux.intel.com>
References: <1470988994.21247.33.camel@synopsys.com>
 <1470999584.4887.94.camel@linux.intel.com>
 <1471008972.21247.40.camel@synopsys.com>
 <1471010908.4887.100.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471259434.21247.47.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2016-08-12@17:08 +0300, Andy Shevchenko wrote:
> On Fri, 2016-08-12@13:36 +0000, Eugeniy Paltsev wrote:
> >?
> > On Fri, 2016-08-12@13:59 +0300, Andy Shevchenko wrote:
> > >?
> > >?
> > > On Fri, 2016-08-12@08:03 +0000, Eugeniy Paltsev wrote:
> > > >?
> > > >?
> > > >?
> > > > Hi,
> > > >?
> > > > "nollp" parameter defines if DW DMAC channel supports multi
> > > > block
> > > > transfer or not.
> > > >?
> > > > It is calculated in runtime, but differently depending on on
> > > > availability of pdata. If pdata is absent "nollp" is calculated
> > > > using
> > > > autoconfig hardware registers. Otherwise "nollp" is calculated
> > > > using
> > > > the next code construction:
> > > > channel_writel(dwc, LLP, DWC_LLP_LOC(0xffffffff));
> > > > dwc->nollp = DWC_LLP_LOC(channel_readl(dwc, LLP)) == 0;
> > > > channel_writel(dwc, LLP, 0);
> > > >?
> > > > I realized that these methods give different results.
> > > > For example on ARC AXS101 SDP in case of using autoconfig
> > > > "nollp"
> > > > was
> > > > calculated as "true" (and DMAC works fine),?
> > > > otherwise "nollp" was calculated as "false" (and DMAC doesn't
> > > > work).
> > > Can you show out what the value you read back?
> > channel_readl(dwc, LLP) return 0xfffffffc
> Nice.
>?
> Oh, forgot to ask, what are the DW_PARAMS and DWC_PARAMS[x] are on
> the same hardware?
DW_PARAMS: 0x38280b0c
DWC_PARAMS[0]: 0x4926d300
DWC_PARAMS[1]: 0x4926d300
DWC_PARAMS[2]: 0x4926d300
DWC_PARAMS[3]: 0x4926d300
> I assume we are talking about that one which has no hardware LLP
> support.
Yep.
> >?
> > >?
> > > >?
> > > > So I'm wondering how the code in question really works?
> > > > From DW AHB DMAC databook I wasn't able to find anything
> > > > relevant
> > > > to
> > > > this tricky implementation. Could you please clarify a little
> > > > but
> > > > what
> > > > happens here?
> > > "Table 4-1:
> > > ...
> > > Hardcode Channel x LLP register to 0?
> > > ...
> > > Description: If set to 1, hardcodes channel x Linked List Pointer
> > > register to 0 (LLPx.LOC == 0), ..."
> So, any comment on this one? I suppose you may have an access to some
> internal Synopsys documentation which might shed a light. Or maybe I
> missed something else which should be considered.
Looks like this code based on idea, what if DMA ip-core doesn't have?
LLP support it will not have LLP registers. It is not necessarily true.
>
> >?
> > >?
> > > >?
> > > > Maybe we should add "nollp" field in pdata structure and
> > > > receive
> > > > it
> > > > from pdata/device tree (like we use "is_private" or "is_memcpu"
> > > > fields)
> > > Yeah, perhaps we can remove that trick since we need this flag to
> > > be
> > > set
> > > on Intel Quark which might have the same issue as your case [1].
> > >?
> > > [1] http://www.spinics.net/lists/linux-serial/msg22948.html
> > >?
> > In which tree I can find this patch applied, so I may base my work
> > on
> > it?
> The series is under review. I'm preparing v10, so, I would like to
> re-
> make this patch with regarding to your input.
>?
> For now I would prefer just to remove the trick, but I still wonder
> what
> the circumstances are to bring it not working.
>?
Please add this code to read "is_memcpy" and "is_nollp" property?
from device tree.
----------------------------->8------------------------------
diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..2712602 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
????????if (of_property_read_bool(np, "is_private"))
????????????????pdata->is_private = true;
?
+???????if (of_property_read_bool(np, "is_memcpy"))
+???????????????pdata->is_memcpy = true;
+
+???????if (of_property_read_bool(np, "is_nollp"))
+???????????????pdata->is_nollp = true;
+
????????if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
????????????????pdata->chan_allocation_order = (unsigned char)tmp;
?
----------------------------->8------------------------------
--?
?Paltsev Eugeniy
