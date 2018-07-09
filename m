From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Jul 2018 14:33:26 +0000
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <20180709141056.GR2512@hirez.programming.kicks-ass.net>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
 <20180709140717.GR2476@hirez.programming.kicks-ass.net>
 <20180709141056.GR2512@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On Mon, 2018-07-09@16:10 +0200, Peter Zijlstra wrote:
> On Mon, Jul 09, 2018@04:07:17PM +0200, Peter Zijlstra wrote:
> > On Mon, Jul 09, 2018@04:45:50PM +0300, Alexey Brodkin wrote:
> > > --- a/drivers/base/devres.c
> > > +++ b/drivers/base/devres.c
> > > @@ -24,8 +24,12 @@ struct devres_node {
> > >  
> > >  struct devres {
> > >  	struct devres_node		node;
> > > -	/* -- 3 pointers */
> > > -	unsigned long long		data[];	/* guarantee ull alignment */
> > > +	/*
> > > +	 * data[] must be 64 bit aligned even on 32 bit architectures
> > > +	 * because it might be accessed by instructions that require
> > > +	 * aligned memory arguments such as atomic64_t.
> > > +	 */
> > > +	u8 __aligned(8)			data[];
> > >  };
> > 
> > Seeing that this ends up in a semi generic allocation thing, I don't
> > feel this should be different from ARCH_KMALLOC_MINALIGN.
> 
> In fact, since alloc_dr() uses kmalloc() to allocate the entire thing,
> it is impossible to guarantee a larger alignment than kmalloc does.

Well but 4-bytes [which is critical for atomic64_t] should be much less
than a sane cache line length so above should work.

-Alexey
