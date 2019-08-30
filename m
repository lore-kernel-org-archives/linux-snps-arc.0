From: hch@lst.de (Christoph Hellwig)
Date: Fri, 30 Aug 2019 18:06:35 +0200
Subject: [PATCH 04/26] mips: remove ioremap_cachable
In-Reply-To: <20190819205722.4eir2edy6qgtgarl@pburton-laptop>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-5-hch@lst.de>
 <20190819205722.4eir2edy6qgtgarl@pburton-laptop>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190830160635.GE26887@lst.de>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 19, 2019@08:57:30PM +0000, Paul Burton wrote:
> Hi Christoph,
> 
> On Sat, Aug 17, 2019@09:32:31AM +0200, Christoph Hellwig wrote:
> > Just define ioremap_cache directly.
> > 
> > Signed-off-by: Christoph Hellwig <hch at lst.de>
> 
> Acked-by: Paul Burton <paul.burton at mips.com>

Can you pick this patch up through the mips tree?
