From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 24 Jun 2019 19:13:17 +0000
Subject: [PATCH 7/7] arc: use the generic remapping allocator for coherent
 DMA allocations
In-Reply-To: <20190624131417.GA10593@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-8-hch@lst.de>
 <78ac563f2815a9a14bfab6076d0ef948497f5b9f.camel@synopsys.com>
 <20190615083554.GC23406@lst.de> <20190624131417.GA10593@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d9ed8f6a82801b94d1d7792eb74effdbce09ce51.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Christoph,

Yep I've reviewed and tested it for both cases:
- coherent/noncoherent dma
- allocation from atomic_pool/regular allocation

everything works fine for ARC.

So,

Reviewed-by: Evgeniy Paltsev <paltsev at synopsys.com>
Tested-by: Evgeniy Paltsev <paltsev at synopsys.com>

for both
[PATCH 2/7] arc: remove the partial DMA_ATTR_NON_CONSISTENT support
[PATCH 7/7] arc: use the generic remapping allocator for coherent DMA allocations


On Mon, 2019-06-24@15:14 +0200, hch@lst.de wrote:
> On Sat, Jun 15, 2019@10:35:54AM +0200, hch@lst.de wrote:
> > On Fri, Jun 14, 2019@06:05:01PM +0000, Eugeniy Paltsev wrote:
> > > Hi Christoph,
> > > 
> > > Regular question - do you have any public git repository with all this dma changes?
> > > I want to test it for ARC.
> > > 
> > > Pretty sure the
> > >  [PATCH 2/7] arc: remove the partial DMA_ATTR_NON_CONSISTENT support
> > > is fine.
> > > 
> > > Not so sure about
> > >  [PATCH 7/7] arc: use the generic remapping allocator for coherent DMA allocations
> > > :)
> > 
> >    git://git.infradead.org/users/hch/misc.git dma-not-consistent-cleanup
> > 
> > Gitweb:
> > 
> >    
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.infradead.org_users_hch_misc.git_shortlog_refs_heads_dma-2Dnot-2Dconsistent-2Dcleanup&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN1MriPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=ipYAmX3rwLxDIdXUztTMYBZkKFGZBY9vykJVBwq_KXE&s=uRWKQoDT8pPKRPYCB6k4oO3mtRFRNyLolRDeBBIVtNQ&e=
> >  
> 
> Did you get a chance to look into these patches?
-- 
 Eugeniy Paltsev
