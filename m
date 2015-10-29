From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Oct 2015 13:05:44 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <yw1xr3kddegu.fsf@unicorn.mansr.com>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <yw1xr3kddegu.fsf@unicorn.mansr.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446123944.3203.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi mans,

On Thu, 2015-10-29@12:52 +0000, M?ns Rullg?rd wrote:
> Alexey Brodkin <Alexey.Brodkin at synopsys.com> writes:
> 
> > Existing default implementation of __div64_32() for 32-bit arches unfolds
> > into huge routine with tons of arithmetics like +, -, * and all of them
> > in loops. That leads to obvious performance degradation if do_div() is
> > frequently used.
> > 
> > Good example is extensive TCP/IP traffic.
> > That's what I'm getting with perf out of iperf3:
> >  -------------->8--------------
> >     30.05%  iperf3   [kernel.kallsyms]        [k] copy_from_iter
> >     11.77%  iperf3   [kernel.kallsyms]        [k] __div64_32
> >      5.44%  iperf3   [kernel.kallsyms]        [k] memset
> >      5.32%  iperf3   [kernel.kallsyms]        [k] stmmac_xmit
> >      2.70%  iperf3   [kernel.kallsyms]        [k] skb_segment
> >      2.56%  iperf3   [kernel.kallsyms]        [k] tcp_ack
> >  -------------->8--------------
> > 
> > do_div() here is mostly used in skb_mstamp_get() to convert nanoseconds
> > received from local_clock() to microseconds used in timestamp.
> > BTW conversion itself is as simple as "/=1000".
> > 
> > Fortunately we already have much better __div64_32() for 32-bit ARM.
> > There in case of division by constant preprocessor calculates so-called
> > "magic number" which is later used in multiplications instead of divisions.
> > It's really nice and very optimal but obviously works only for ARM
> > because ARM assembly is involved.
> > 
> > Now why don't we extend the same approach to all other 32-bit arches
> > with multiplication part implemented in pure C. With good compiler
> > resulting assembly will be quite close to manually written assembly.
> > 
> > And that change implements that.
> > 
> > But there's at least 1 problem which I don't know how to solve.
> > Preprocessor magic only happens if __div64_32() is inlined (that's
> > obvious - preprocessor has to know if divider is constant or not).
> > 
> > But __div64_32() is already marked as weak function (which in its turn
> > is required to allow some architectures to provide its own optimal
> > implementations). I.e. addition of "inline" for __div64_32() is not an
> > option.
> > 
> > So I do want to hear opinions on how to proceed with that patch.
> > Indeed there's the simplest solution - use this implementation only in
> > my architecture of preference (read ARC) but IMHO this change may
> > benefit other architectures as well.
> 
> I tried something similar for MIPS a while ago after noticing a similar
> perf report.  Adapting Nico's ARM code gave some nice speedups, but only
> when I used MIPS assembly for the long multiplies.  Apparently gcc is
> still too stupid to do the sane thing.

Could you please elaborate a little bit on what was a problem with gcc
compared to hand-written asm?

The point is if preprocessor does proper constant propagation then compiler
will need to implement only calculations marked "run-time calculations".
And in its turn those are pretty straight-forward 32-bit + and *.

And at least on ARC I saw with that change perf no longer captures
__div64_32() during iperf and iperf results itself improved for about 10%.
So I'd say advantage is quite noticeable.

-Alexey
