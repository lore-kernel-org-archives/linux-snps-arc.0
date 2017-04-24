From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 24 Apr 2017 15:55:06 +0000
Subject: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1492787583.24567.120.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
 <1492784977.16657.6.camel@synopsys.com>
 <1492787583.24567.120.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1493049305.25985.4.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,
On Fri, 2017-04-21@18:13 +0300, Andy Shevchenko wrote:
> On Fri, 2017-04-21@14:29 +0000, Eugeniy Paltsev wrote:
> > On Tue, 2017-04-18@15:31 +0300, Andy Shevchenko wrote:
> > > On Fri, 2017-04-07@17:04 +0300, Eugeniy Paltsev wrote:
> > > > This patch adds support for the DW AXI DMAC controller.
> > > > +#define AXI_DMA_BUSWIDTHS		??\
> > > > +	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
> > > > +	DMA_SLAVE_BUSWIDTH_2_BYTES	| \
> > > > +	DMA_SLAVE_BUSWIDTH_4_BYTES	| \
> > > > +	DMA_SLAVE_BUSWIDTH_8_BYTES	| \
> > > > +	DMA_SLAVE_BUSWIDTH_16_BYTES	| \
> > > > +	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
> > > > +	DMA_SLAVE_BUSWIDTH_64_BYTES)
> > > > +/* TODO: check: do we need to use BIT() macro here? */
> > >
> > > Still TODO? I remember I answered to this on the first round.
> >
> > Yes, I remember it.
> > I left this TODO as a reminder because src_addr_widths and
> > dst_addr_widths are
> > not used anywhere and they are set differently in different drivers
> > (with or without BIT macro).
>
> Strange. AFAIK they are representing bits (which is not the best
> idea) in the resulting u64 field. So, anything bigger than 63 doesn't
>?make sense.
They are u32 fields!
