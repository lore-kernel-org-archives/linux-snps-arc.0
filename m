From: hch@lst.de (Christoph Hellwig)
Date: Fri, 14 Dec 2018 19:35:09 +0100
Subject: [PATCH 1/2] dma-mapping: zero memory returned from dma_alloc_*
In-Reply-To: <20181214181056.GA17941@ravnborg.org>
References: <20181214082515.14835-1-hch@lst.de>
 <20181214082515.14835-2-hch@lst.de> <20181214181056.GA17941@ravnborg.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181214183509.GA5247@lst.de>
To: linux-snps-arc@lists.infradead.org

On Fri, Dec 14, 2018@07:10:56PM +0100, Sam Ravnborg wrote:
> Hi Christoph,
> 
> I stumbled upon this one:
> 
> #define __get_dma_pages(gfp_mask, order) \
>                 __get_free_pages((gfp_mask) | GFP_DMA, (order))

This isn't directly related to the dma mapping, but another place
that hides GFP_DMA allocations.  So no need for the treatment,
but we really should kill this obsfucating wrapper..
