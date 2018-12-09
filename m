From: davem@davemloft.net (David Miller)
Date: Sat, 08 Dec 2018 20:58:40 -0800 (PST)
Subject: [PATCH 06/10] sparc64/iommu: implement DMA_ATTR_NON_CONSISTENT
In-Reply-To: <20181208173702.15158-7-hch@lst.de>
References: <20181208173702.15158-1-hch@lst.de>
 <20181208173702.15158-7-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181208.205840.852094858402072771.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Christoph Hellwig <hch@lst.de>
Date: Sat,  8 Dec 2018 09:36:58 -0800

> Just allocate the memory and use map_page to map the memory.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Acked-by: David S. Miller <davem at davemloft.net>
