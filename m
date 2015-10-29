From: mans@mansr.com (=?iso-8859-1?Q?M=E5ns_Rullg=E5rd?=)
Date: Thu, 29 Oct 2015 12:52:17 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 29 Oct 2015 01:47:35 +0300")
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <yw1xr3kddegu.fsf@unicorn.mansr.com>
To: linux-snps-arc@lists.infradead.org

Alexey Brodkin <Alexey.Brodkin at synopsys.com> writes:

> Existing default implementation of __div64_32() for 32-bit arches unfolds
> into huge routine with tons of arithmetics like +, -, * and all of them
> in loops. That leads to obvious performance degradation if do_div() is
> frequently used.
>
> Good example is extensive TCP/IP traffic.
> That's what I'm getting with perf out of iperf3:
>  -------------->8--------------
>     30.05%  iperf3   [kernel.kallsyms]        [k] copy_from_iter
>     11.77%  iperf3   [kernel.kallsyms]        [k] __div64_32
>      5.44%  iperf3   [kernel.kallsyms]        [k] memset
>      5.32%  iperf3   [kernel.kallsyms]        [k] stmmac_xmit
>      2.70%  iperf3   [kernel.kallsyms]        [k] skb_segment
>      2.56%  iperf3   [kernel.kallsyms]        [k] tcp_ack
>  -------------->8--------------
>
> do_div() here is mostly used in skb_mstamp_get() to convert nanoseconds
> received from local_clock() to microseconds used in timestamp.
> BTW conversion itself is as simple as "/=1000".
>
> Fortunately we already have much better __div64_32() for 32-bit ARM.
> There in case of division by constant preprocessor calculates so-called
> "magic number" which is later used in multiplications instead of divisions.
> It's really nice and very optimal but obviously works only for ARM
> because ARM assembly is involved.
>
> Now why don't we extend the same approach to all other 32-bit arches
> with multiplication part implemented in pure C. With good compiler
> resulting assembly will be quite close to manually written assembly.
>
> And that change implements that.
>
> But there's at least 1 problem which I don't know how to solve.
> Preprocessor magic only happens if __div64_32() is inlined (that's
> obvious - preprocessor has to know if divider is constant or not).
>
> But __div64_32() is already marked as weak function (which in its turn
> is required to allow some architectures to provide its own optimal
> implementations). I.e. addition of "inline" for __div64_32() is not an
> option.
>
> So I do want to hear opinions on how to proceed with that patch.
> Indeed there's the simplest solution - use this implementation only in
> my architecture of preference (read ARC) but IMHO this change may
> benefit other architectures as well.

I tried something similar for MIPS a while ago after noticing a similar
perf report.  Adapting Nico's ARM code gave some nice speedups, but only
when I used MIPS assembly for the long multiplies.  Apparently gcc is
still too stupid to do the sane thing.

-- 
M?ns Rullg?rd
mans at mansr.com
