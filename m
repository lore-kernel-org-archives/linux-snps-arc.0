From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Jul 2018 16:49:25 +0200
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
 <20180709140717.GR2476@hirez.programming.kicks-ass.net>
 <20180709141056.GR2512@hirez.programming.kicks-ass.net>
 <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709144925.GU2476@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@02:33:26PM +0000, Alexey Brodkin wrote:
> > In fact, since alloc_dr() uses kmalloc() to allocate the entire thing,
> > it is impossible to guarantee a larger alignment than kmalloc does.
> 
> Well but 4-bytes [which is critical for atomic64_t] should be much less
> than a sane cache line length so above should work.

AFAICT ARCH_KMALLOC_MINALIGN ends up being 4 on x86_32 (it doesn't
define ARCH_DMA_MINALIGN and doesn't seem to otherwise override the
thing).

So unconditionally setting the alignment of devres::data to 8 seems
broken.
