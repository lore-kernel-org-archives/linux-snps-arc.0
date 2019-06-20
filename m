From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 20 Jun 2019 09:15:14 +0200
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190620071514.GR3419@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Jun 19, 2019@11:55:41PM +0000, Vineet Gupta wrote:

> FWIW I tried to avoid all of this by using the 2 byte NOP_S and B_S variants which
> ensures we can never straddle cache line so the alignment issue goes away. There's
> a nice code size reduction too - see [1] . But I get build link errors in
> networking code around DO_ONCE where the unlikely code is too much and offset
> can't be encoded in signed 10 bits which B_S is allowed.

Yeah, so on x86 we have a 2 byte and a 5 byte relative jump and have the
exact same issue. We're currently using 5 byte jumps unconditionally for
the same reason.

Getting it to use the 2 byte one where possible is a 'fun' project for
someone with spare time at some point.  It might need a GCC plugin to
pull off, I've not put too much tought into it.
