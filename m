From: hch@lst.de (Christoph Hellwig)
Date: Tue, 31 Jul 2018 10:08:57 +0200
Subject: [PATCH v2 4/4] ARC: don't check for HIGHMEM pages in
 arch_dma_alloc
In-Reply-To: <20180730162636.3556-5-Eugeniy.Paltsev@synopsys.com>
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
 <20180730162636.3556-5-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180731080857.GB23303@lst.de>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 30, 2018@07:26:36PM +0300, Eugeniy Paltsev wrote:
> __GFP_HIGHMEM flag is cleared by upper layer functions
> (in include/linux/dma-mapping.h) so we'll never get a
> __GFP_HIGHMEM flag in arch_dma_alloc gfp argument.
> That's why alloc_pages will never return highmem page
> here.
> 
> Get rid of highmem pages handling and cleanup arch_dma_alloc
> and arch_dma_free functions.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch at lst.de>
