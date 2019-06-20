From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 20 Jun 2019 23:12:42 +0200
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <50a5120f512e7d6784efa403a7597c159074c8c1.camel@synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <50a5120f512e7d6784efa403a7597c159074c8c1.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190620211242.GB3436@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Jun 20, 2019@06:34:29PM +0000, Eugeniy Paltsev wrote:
> On Wed, 2019-06-19@10:12 +0200, Peter Zijlstra wrote:
> > On Tue, Jun 18, 2019@04:16:20PM +0000, Vineet Gupta wrote:

> > I'm assuming you've looked at what x86 currently does and found
> > something like that doesn't work for ARC?
> 
> To be honest I've mostly look at arm/arm64 implementation :)

Yeah, but that's fixed instruction width RISC. They have it easy.
