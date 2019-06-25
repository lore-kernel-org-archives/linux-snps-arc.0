From: hch@lst.de (hch@lst.de)
Date: Tue, 25 Jun 2019 08:34:02 +0200
Subject: [PATCH 7/7] arc: use the generic remapping allocator for
 coherent DMA allocations
In-Reply-To: <d9ed8f6a82801b94d1d7792eb74effdbce09ce51.camel@synopsys.com>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-8-hch@lst.de>
 <78ac563f2815a9a14bfab6076d0ef948497f5b9f.camel@synopsys.com>
 <20190615083554.GC23406@lst.de> <20190624131417.GA10593@lst.de>
 <d9ed8f6a82801b94d1d7792eb74effdbce09ce51.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190625063402.GC29561@lst.de>
To: linux-snps-arc@lists.infradead.org

On Mon, Jun 24, 2019@07:13:17PM +0000, Eugeniy Paltsev wrote:
> Hi Christoph,
> 
> Yep I've reviewed and tested it for both cases:
> - coherent/noncoherent dma
> - allocation from atomic_pool/regular allocation
> 
> everything works fine for ARC.

Thanks.  I've applied the whole series to the dma-mapping for-next
branch.
