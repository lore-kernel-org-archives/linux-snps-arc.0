From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 16 Mar 2018 08:55:08 +0100
Subject: arc_usr_cmpxchg and preemption
In-Reply-To: <1521140611.6358.29.camel@synopsys.com>
References: <1521045375.11552.27.camel@synopsys.com>
 <fdf30e76-f75d-9dda-26ca-ac011c41ee64@synopsys.com>
 <20180314175352.GP4064@hirez.programming.kicks-ass.net>
 <1521059931.11552.51.camel@synopsys.com>
 <20180315081845.GS4064@hirez.programming.kicks-ass.net>
 <1521105128.11552.64.camel@synopsys.com>
 <20180315112829.GW4064@hirez.programming.kicks-ass.net>
 <1521140611.6358.29.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180316075508.GY4043@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 15, 2018@07:03:32PM +0000, Alexey Brodkin wrote:
> > I think there's a bunch of architectures that are in the same boat.
> > m68k, arm, mips was mentioned. Sure, the moment an arch has hardware
> > support you don't need the syscall anymore.
> 
> Here's a brief analysis:
> ARM:  Looks like they got rid of that stuff in v4.4, see
>       commit db695c0509d6 ("ARM: remove user cmpxchg syscall").

Oh shiny, that's why I couldn't find it. I had distinct memories of them
having one though.

> M68K: That's even uglier implementation which is really asking for
>       a facelift, look at sys_atomic_cmpxchg_32() here:
>       https://elixir.bootlin.com/linux/latest/source/arch/m68k/kernel/sys_m68k.c#L461

Yes, I found that code, it's something special allright.

> MIPS: They do it via special sysmips syscall which among other things
>       might handle MIPS_ATOMIC_SET with mips_atomic_set()
> 
> I don't immediately see if there're others but really I'm not sure if it even worth trying to
> clean-up all that since efforts might be spent pointlessly.
> 
> > I was just thinking it would be good to have a common implementation (if
> > possible) rather than 4-5 different copies of basically the same thing.
> 
> From above I would conclude that only M68K might benefit from new
> library implementation. BTW M68K uses a bit different ABI compared to
> ARC for that syscall so it will be really atomic_cmpxchg_32()
> libfunction called from those syscalls, but now I think that's exactly
> what you meant initially, correct?

Right. In any case, I won't insist, but if it's very little effort, it
might well be worth getting rid of that m68k magic.
