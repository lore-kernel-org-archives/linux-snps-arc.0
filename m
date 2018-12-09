From: davem@davemloft.net (David Miller)
Date: Sat, 08 Dec 2018 20:57:47 -0800 (PST)
Subject: [PATCH 3/6] sparc: remove the sparc32_dma_ops indirection
In-Reply-To: <20181208174115.16237-4-hch@lst.de>
References: <20181208174115.16237-1-hch@lst.de>
 <20181208174115.16237-4-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181208.205747.2007860478185366370.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Christoph Hellwig <hch@lst.de>
Date: Sat,  8 Dec 2018 09:41:12 -0800

> There is no good reason to have a double indirection for the sparc32
> dma ops, so remove the sparc32_dma_ops and define separate dma_map_ops
> instance for the different IOMMU types.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Acked-by: David S. Miller <davem at davemloft.net>
