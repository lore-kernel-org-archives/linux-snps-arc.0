From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 12 Aug 2016 13:36:12 +0000
Subject: Wrong "nollp" DW DMAC parameter value on ARC SDP.
In-Reply-To: <1470999584.4887.94.camel@linux.intel.com>
References: <1470988994.21247.33.camel@synopsys.com>
 <1470999584.4887.94.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471008972.21247.40.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2016-08-12@13:59 +0300, Andy Shevchenko wrote:
> On Fri, 2016-08-12@08:03 +0000, Eugeniy Paltsev wrote:
> > 
> > Hi,
> > 
> > "nollp" parameter defines if DW DMAC channel supports multi block
> > transfer or not.
> > 
> > It is calculated in runtime, but differently depending on on
> > availability of pdata. If pdata is absent "nollp" is calculated
> > using
> > autoconfig hardware registers. Otherwise "nollp" is calculated
> > using
> > the next code construction:
> > channel_writel(dwc, LLP, DWC_LLP_LOC(0xffffffff));
> > dwc->nollp = DWC_LLP_LOC(channel_readl(dwc, LLP)) == 0;
> > channel_writel(dwc, LLP, 0);
> > 
> > I realized that these methods give different results.
> > For example on ARC AXS101 SDP in case of using autoconfig "nollp"
> > was
> > calculated as "true" (and DMAC works fine),?
> > otherwise "nollp" was calculated as "false" (and DMAC doesn't
> > work).
> Can you show out what the value you read back?

channel_readl(dwc, LLP) return 0xfffffffc

> > So I'm wondering how the code in question really works?
> > From DW AHB DMAC databook I wasn't able to find anything relevant
> > to
> > this tricky implementation. Could you please clarify a little but
> > what
> > happens here?
> "Table 4-1:
> ...
> Hardcode Channel x LLP register to 0?
> ...
> Description: If set to 1, hardcodes channel x Linked List Pointer
> register to 0 (LLPx.LOC == 0), ..."
> 
> 
> > 
> > Maybe we should add "nollp" field in pdata structure and receive it
> > from pdata/device tree (like we use "is_private" or "is_memcpu"
> > fields)
> Yeah, perhaps we can remove that trick since we need this flag to be
> set
> on Intel Quark which might have the same issue as your case [1].
> 
> [1]?http://www.spinics.net/lists/linux-serial/msg22948.html
> 

In which tree I can find this patch applied,?so I may base my work on
it?

-- 
?Paltsev Eugeniy
