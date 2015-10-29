From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Oct 2015 07:34:23 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446104062.2584.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Nicolas,

On Wed, 2015-10-28@19:32 -0400, Nicolas Pitre wrote:
> On Thu, 29 Oct 2015, Alexey Brodkin wrote:
> 
> > Fortunately we already have much better __div64_32() for 32-bit ARM.
> > There in case of division by constant preprocessor calculates so-called
> > "magic number" which is later used in multiplications instead of divisions.
> 
> It's not magic, it is science.  :-)

Indeed, but I was under impression that's how people call that value in that
particular case. So for me it looks appropriate here.

> > It's really nice and very optimal but obviously works only for ARM
> > because ARM assembly is involved.
> > 
> > Now why don't we extend the same approach to all other 32-bit arches
> > with multiplication part implemented in pure C. With good compiler
> > resulting assembly will be quite close to manually written assembly.
> 
> You appear to have left out optimizations where there is no overflow to 
> carry.  That, too, can be determined at compile time.

That might be the case - let me look at that a bit more.
But that was not the biggest problem. I actually wanted to send it
as RFC but due to last minute change I made "git pathc-format -1" and
forgot to change topic from PATCH to RFC.

> > But there's at least 1 problem which I don't know how to solve.
> > Preprocessor magic only happens if __div64_32() is inlined (that's
> > obvious - preprocessor has to know if divider is constant or not).
> > 
> > But __div64_32() is already marked as weak function (which in its turn
> > is required to allow some architectures to provide its own optimal
> > implementations). I.e. addition of "inline" for __div64_32() is not an
> > option.
> 
> You can't inline __div64_32().  It should remain as is and used only for 
> the slow path.
> 
> For the constant based optimization to work, you need to modify do_div() 
> in include/asm-generic/div64.h directly.

I thought about that but if I replace existing implementation of do_div()
with proposed here some arches like SH and MIPS won't be able to use their
own __div64_32() in do_div() any longer.

So how to deal with that then?

> > So I do want to hear opinions on how to proceed with that patch.
> > Indeed there's the simplest solution - use this implementation only in
> > my architecture of preference (read ARC) but IMHO this change may
> > benefit other architectures as well.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: linux-snps-arc at lists.infradead.org
> > Cc: Vineet Gupta <vgupta at synopsys.com>
> > Cc: Ingo Molnar <mingo at elte.hu>
> > Cc: Stephen Hemminger <shemminger at linux-foundation.org>
> > Cc: David S. Miller <davem at davemloft.net>
> > Cc: Nicolas Pitre <nico at cam.org>
> 
> This email address has been unused for the last 7 years. Please update 
> your reference.

My bad - I blindly took that email from your prehistoric patch
"[ARM] 3611/4: optimize do_div() when divisor is constant".

-Alexey
