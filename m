From: davem@davemloft.net (David Miller)
Date: Sat, 08 Dec 2018 20:58:47 -0800 (PST)
Subject: [PATCH 07/10] sparc64/pci_sun4v: move code around a bit
In-Reply-To: <20181208173702.15158-8-hch@lst.de>
References: <20181208173702.15158-1-hch@lst.de>
 <20181208173702.15158-8-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181208.205847.1994202125580037481.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Christoph Hellwig <hch@lst.de>
Date: Sat,  8 Dec 2018 09:36:59 -0800

> Move the alloc / free routines down the file so that we can easily use
> the map / unmap helpers to implement non-consistent allocations.
> 
> Also drop the _coherent postfix to match the method name.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Acked-by: David S. Miller <davem at davemloft.net>
