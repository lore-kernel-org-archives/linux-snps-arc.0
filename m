From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 20 Jun 2019 18:34:29 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <20190619081227.GL3419@hirez.programming.kicks-ass.net>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <50a5120f512e7d6784efa403a7597c159074c8c1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On Wed, 2019-06-19@10:12 +0200, Peter Zijlstra wrote:
> On Tue, Jun 18, 2019@04:16:20PM +0000, Vineet Gupta wrote:
> 
> > > +/*
> > > + * To make atomic update of patched instruction available we need to guarantee
> > > + * that this instruction doesn't cross L1 cache line boundary.
> > > + *
> 
> Oh urgh. Is that the only way ARC can do text patching? We've actually
> considered something like this on x86 at some point, but there we have
> the 'fun' detail that the i-fetch window does not in fact align with L1
> size on all uarchs, so that got complicated real fast.
> 
> I'm assuming you've looked at what x86 currently does and found
> something like that doesn't work for ARC?

To be honest I've mostly look at arm/arm64 implementation :)

But yeah it's good remark about i-fetch window.
It's named 'instruction_fetch_block_width' in ARC documentation and it's
smaller than L1 I$ line size. On ARCv2 it's 16 byte.
So in current implementation we need to guarantee that this instruction doesn't
cross 'instruction_fetch_block' and not L1 cache line boundary.

So there is no problem with this code itself but the comment should be fixed.

[snip]
-- 
 Eugeniy Paltsev
