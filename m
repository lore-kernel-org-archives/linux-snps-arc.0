From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 2 Dec 2015 06:32:25 +0000
Subject: Non existing DMA functions in ARC: dma_alloc_attrs,
 dma_free_attrs, dma_mmap_attrs
References: <565DF772.4060802@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D45E5@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 02 December 2015 01:09 AM, Carlos Palminha wrote:
> Hi guys,
>
> I'm bringing up a new ARC PGU driver for DRM framework with latest kernel tree.
> I'm using ARC AXS101 as a base and selected one the DRM required config: HAVE_DMA_ATTRS due to some memory allocation helpers in DRM.
>
> I'm getting some errors with DMA functions not implemented in ARC: dma_alloc_attrs, dma_free_attrs, dma_mmap_attrs
>
> Any clue?
>
> Regards,
> C.Palminha
>
> ---
> include/linux/dma-mapping.h: In function ?dma_alloc_writecombine?:
> include/linux/dma-mapping.h:283:2: error: implicit declaration of function ?dma_alloc_attrs? [-Werror=implicit-function-declaration]
>   return dma_alloc_attrs(dev, size, dma_addr, gfp, &attrs);

This is because ARC port current lacks support for dma_attr_t and associated helpers.
There is a series in flight in linux-next, by Christoph, which already addresses that.

You can either cherry-pick those or in the interim use the hack attached.

P.S. Per your comment at top, I'm assuming you are working off of mainline 4.3 or 4.4

-Vineet

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-donot-merge-minimal-dma_attr_t-support-for-ARC.patch
Type: text/x-patch
Size: 1981 bytes
Desc: 0001-donot-merge-minimal-dma_attr_t-support-for-ARC.patch
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20151202/e8a2bb0b/attachment.bin>
