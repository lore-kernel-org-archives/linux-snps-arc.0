From: hch@lst.de (Christoph Hellwig)
Date: Fri, 30 Aug 2019 18:05:15 +0200
Subject: [PATCH 19/26] arm64: remove __iounmap
In-Reply-To: <20190819073601.4yxjvmyjtpi7tk56@willie-the-truck>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-20-hch@lst.de>
 <20190819073601.4yxjvmyjtpi7tk56@willie-the-truck>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190830160515.GC26887@lst.de>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 19, 2019@08:36:02AM +0100, Will Deacon wrote:
> On Sat, Aug 17, 2019@09:32:46AM +0200, Christoph Hellwig wrote:
> > No need to indirect iounmap for arm64.
> > 
> > Signed-off-by: Christoph Hellwig <hch at lst.de>
> > ---
> >  arch/arm64/include/asm/io.h | 3 +--
> >  arch/arm64/mm/ioremap.c     | 4 ++--
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> Not sure why we did it like this...
> 
> Acked-by: Will Deacon <will at kernel.org>

Can you just pick this one up through the arm64 tree for 5.4?
