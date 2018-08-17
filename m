From: hch@lst.de (Christoph Hellwig)
Date: Fri, 17 Aug 2018 08:42:22 +0200
Subject: [RFC] etnaviv: missing dma_mask
In-Reply-To: <20180814141225.6123-1-Eugeniy.Paltsev@synopsys.com>
References: <20180814141225.6123-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180817064222.GB10811@lst.de>
To: linux-snps-arc@lists.infradead.org

On Tue, Aug 14, 2018@05:12:25PM +0300, Eugeniy Paltsev wrote:
> Hi Lucas, Christoph,
> 
> After switching ARC to generic dma_noncoherent cache ops 
> etnaviv driver start failing on dma maping functions because of
> dma_mask lack.
> 
> So I'm wondering is it valid case to have device which is
> DMA capable and doesn't have dma_mask set?
> 
> If not, then I guess something like that should work
> (at least it works for ARC):

This looks ok is a minimal fix:

Reviewed-by: Christoph Hellwig <hch at lst.de>

But why doesn't this device have a dma-range property in DT?
