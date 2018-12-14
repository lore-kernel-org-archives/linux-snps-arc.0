From: sam@ravnborg.org (Sam Ravnborg)
Date: Fri, 14 Dec 2018 19:10:56 +0100
Subject: [PATCH 1/2] dma-mapping: zero memory returned from dma_alloc_*
In-Reply-To: <20181214082515.14835-2-hch@lst.de>
References: <20181214082515.14835-1-hch@lst.de>
 <20181214082515.14835-2-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181214181056.GA17941@ravnborg.org>
To: linux-snps-arc@lists.infradead.org

Hi Christoph,

I stumbled upon this one:

#define __get_dma_pages(gfp_mask, order) \
                __get_free_pages((gfp_mask) | GFP_DMA, (order))

(include/linux/gfp.h)
Should it also have the __GFP_ZERO treatment?
Or maybe this is already done in your tree..

As for the sparc bits:
Acked-by: Sam Ravnborg <sam at ravnborg.org> [sparc]

	Sam
