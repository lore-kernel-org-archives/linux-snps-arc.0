From: hch@lst.de (Christoph Hellwig)
Date: Fri, 30 Aug 2019 18:04:54 +0200
Subject: [PATCH 12/26] x86: clean up ioremap
In-Reply-To: <20190817103402.GA7602@gmail.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-13-hch@lst.de> <20190817103402.GA7602@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190830160454.GB26887@lst.de>
To: linux-snps-arc@lists.infradead.org

On Sat, Aug 17, 2019@12:34:02PM +0200, Ingo Molnar wrote:
> 
> * Christoph Hellwig <hch@lst.de> wrote:
> 
> > Use ioremap as the main implemented function, and defined
> > ioremap_nocache to it as a deprecated alias.
> > 
> > Signed-off-by: Christoph Hellwig <hch at lst.de>
> > ---
> >  arch/x86/include/asm/io.h | 8 ++------
> >  arch/x86/mm/ioremap.c     | 8 ++++----
> >  arch/x86/mm/pageattr.c    | 4 ++--
> >  3 files changed, 8 insertions(+), 12 deletions(-)
> 
> Acked-by: Ingo Molnar <mingo at kernel.org>

Can you pick it up through tip for 5.4?  That way we can get most
bits in through their maintainer trees, and then I'll resubmit the
rest for the next merge window.
