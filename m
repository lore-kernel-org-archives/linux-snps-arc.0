From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 15 Mar 2018 19:03:32 +0000
Subject: arc_usr_cmpxchg and preemption
In-Reply-To: <20180315112829.GW4064@hirez.programming.kicks-ass.net>
References: <1521045375.11552.27.camel@synopsys.com>
 <fdf30e76-f75d-9dda-26ca-ac011c41ee64@synopsys.com>
 <20180314175352.GP4064@hirez.programming.kicks-ass.net>
 <1521059931.11552.51.camel@synopsys.com>
 <20180315081845.GS4064@hirez.programming.kicks-ass.net>
 <1521105128.11552.64.camel@synopsys.com>
 <20180315112829.GW4064@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521140611.6358.29.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On Thu, 2018-03-15@12:28 +0100, Peter Zijlstra wrote:
> On Thu, Mar 15, 2018@09:12:09AM +0000, Alexey Brodkin wrote:
> > On Thu, 2018-03-15@09:18 +0100, Peter Zijlstra wrote:
> > > Also, it might make sense to stuff this implementation in some lib/ file
> > > somewhere and make all platforms that need it use the same code, afaict
> > > there really isn't anything platform specific to it.
> > 
> > Not clear which part do you mean here.
> > Are you talking about entire cmpxchg syscall implementation?
> 
> Yep.

Hm... new generic syscall doing something sane people are not supposed to do?
Let's see who's going to express his/her excitement about that :)

But even introduction of that new syscall is obviously not enough
as we'll need to fix-up libc for affected arches accordingly...

> > Do you think there're many users of that quite an inefficient
> > [compared to proper HW version] atomic exchange?
> 
> I think there's a bunch of architectures that are in the same boat.
> m68k, arm, mips was mentioned. Sure, the moment an arch has hardware
> support you don't need the syscall anymore.

Here's a brief analysis:
ARM:  Looks like they got rid of that stuff in v4.4, see
      commit db695c0509d6 ("ARM: remove user cmpxchg syscall").

M68K: That's even uglier implementation which is really asking for
      a facelift, look at sys_atomic_cmpxchg_32() here:
      https://elixir.bootlin.com/linux/latest/source/arch/m68k/kernel/sys_m68k.c#L461

MIPS: They do it via special sysmips syscall which among other things
      might handle MIPS_ATOMIC_SET with mips_atomic_set()

I don't immediately see if there're others but really I'm not sure if it even worth trying to
clean-up all that since efforts might be spent pointlessly.

> I was just thinking it would be good to have a common implementation (if
> possible) rather than 4-5 different copies of basically the same thing.
