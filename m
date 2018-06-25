From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 25 Jun 2018 15:45:40 +0000
Subject: [RFC] ARC: allow to use IOC and non-IOC DMA devices simultaneously
In-Reply-To: <1529677805.31605.28.camel@synopsys.com>
References: <20180615125819.527-1-Eugeniy.Paltsev@synopsys.com>
 <563bd0ab-e40c-f9ad-4e9c-dbf5b13358b5@synopsys.com>
 <1529677805.31605.28.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <456ab2264aa42d575e7ca5d28d34466aea082f14.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

On Fri, 2018-06-22@16:30 +0200, Eugeniy Paltsev wrote:
> Hi Vineet, Christoph,
> thanks for responding.

[snip]

> > > (BTW: current ARC dma_noncoherent_ops implementation also has same
> > > problem if IOC and HIGHMEM are enabled.)
> > 
> > Can we highlight this fact, add error prints somewhere ?
> 
> The easiest solution is to panic if both IOC and ZONE_HIGHMEM enabled.

I don't think it's the best idea - I would expect to get PAE40 enabled
by default or at least to be used quite often on both AXS103 and HSDK
and so restricting usage of IOC on such configurations will be quite
confusing.

That said we need to figure out how to get IOC + HIGHMEM/PAE working
reliably if that's possible at all.

Christoph, do you think if this is doable?
The main concern here is: some random data buffer might be allocated
in any available memory [and in HIGHMEM/PAE if it exists essentially] and
when it comes to DMA exchange that involves that buffer what should we do?

The only thing I may think of could be a bounce-buffer in ZONE_NORMAL.
Is it used by anybody? Are there any better ideas? 

-Alexey
