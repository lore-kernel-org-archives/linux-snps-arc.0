From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 4 Oct 2018 16:19:16 +0000
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <4f6e9e8bf60f05872afaed4a1d8e516331e95ea7.camel@synopsys.com>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
 <20180709140717.GR2476@hirez.programming.kicks-ass.net>
 <20180709141056.GR2512@hirez.programming.kicks-ass.net>
 <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
 <20180709144925.GU2476@hirez.programming.kicks-ass.net>
 <4f6e9e8bf60f05872afaed4a1d8e516331e95ea7.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ad4f865a92828c3226628a0e378ca2fb4054e96a.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On Mon, 2018-07-09@17:53 +0300, Alexey Brodkin wrote:
> Hi Peter,
> 
> On Mon, 2018-07-09@16:49 +0200, Peter Zijlstra wrote:
> > On Mon, Jul 09, 2018@02:33:26PM +0000, Alexey Brodkin wrote:
> > > > In fact, since alloc_dr() uses kmalloc() to allocate the entire thing,
> > > > it is impossible to guarantee a larger alignment than kmalloc does.
> > > 
> > > Well but 4-bytes [which is critical for atomic64_t] should be much less
> > > than a sane cache line length so above should work.
> > 
> > AFAICT ARCH_KMALLOC_MINALIGN ends up being 4 on x86_32 (it doesn't
> > define ARCH_DMA_MINALIGN and doesn't seem to otherwise override the
> > thing).
> > 
> > So unconditionally setting the alignment of devres::data to 8 seems
> > broken.
> 
> Well but then what other options do we have to fix a problem with
> misaligned access to atomic64_t in drm_gpu_scheduler?

Ping!

Should I send v4 with ARCH_KMALLOC_MINALIGN used for alignment
if explicitly set __aligned__(8) will break x86_32?

-Alexey
