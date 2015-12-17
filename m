From: akpm@linux-foundation.org (Andrew Morton)
Date: Wed, 16 Dec 2015 21:43:26 -0800
Subject: + arc-convert-to-dma_map_ops.patch added to -mm tree
In-Reply-To: <56724817.7090003@synopsys.com>
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
 <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
 <20151124075047.GA29572@lst.de> <56724817.7090003@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151216214326.82515ce1.akpm@linux-foundation.org>
To: linux-snps-arc@lists.infradead.org

On Thu, 17 Dec 2015 10:58:55 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> On Tuesday 24 November 2015 01:20 PM, hch@lst.de wrote:
> > Hi Vineet,
> > 
> > the original version went through the buildbot, which succeeded.  It seems
> > like the official buildbot does not support arc, and might benefit from
> > helping to set up an arc environment.  However in the meantime Guenther
> > send me output from his buildbot and I sent a fix for arc.
> > 
> 
> Hi Andrew, Christoph
> 
> The dma mapping conversion build error fixlet (below) exists as a separate patch
> which will break bisectability. Will it be possible to squash it into the orig commit.
> 

That's the plan.  In http://ozlabs.org/~akpm/mmots/series you'll see

arc-convert-to-dma_map_ops.patch
arc-convert-to-dma_map_ops-fix.patch

I keep the base patch(es) and its fixes separate for various
tacking/history/bookkeeping reasons and fold them all together just
before sending things off to Linus.
