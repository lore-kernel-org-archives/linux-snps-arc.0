From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 28 Feb 2019 10:59:29 -0800
Subject: [PATCH] ARCv2: Add explcit unaligned access support (and ability
 to disable too)
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501464380DE@US01WEMBX2.internal.synopsys.com>
References: <20190228174742.GA18868@roeck-us.net>
 <C2D7FE5348E1B147BCA15975FBA2307501464380DE@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190228185929.GA9842@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Feb 28, 2019@06:12:33PM +0000, Vineet Gupta wrote:
> On 2/28/19 9:47 AM, Guenter Roeck wrote:
> > On Wed, Jan 30, 2019@07:32:41PM +0300, Eugeniy Paltsev wrote:
> >> As of today we enable unaligned access unconditionally on ARCv2.
> >> Do this under a Kconfig option to allow disable it for test, benchmarking
> >> etc. Also while at it
> >>
> >>   - Select HAVE_EFFICIENT_UNALIGNED_ACCESS
> >>   - Although gcc defaults to unaligned access (since GNU 2018.03), add the
> >>     right toggles for enabling or disabling as appropriate
> >>   - update bootlog to prints both HW feature status (exists, enabled/disabled)
> >>     and SW status (used / not used).
> >>   - wire up the relaxed memcpy for unaligned access
> >>
> >> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> >> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> >> [vgupta: squashed patches, handle gcc -mno-unaligned-access quick]
> > Hi,
> >
> > with my brand-new gcc-8.3.0, built from upstream gcc, this patch
> > results in
> >
> > arch/arc/kernel/setup.c: In function 'arc_cpu_mumbojumbo.constprop':
> > include/linux/compiler.h:348:38: error:
> > 	call to '__compiletime_assert_326' declared with attribute error: gcc doesn't support -mno-unaligned-access
> 
> Sorry it broke ur build - but it did catch a deficiency in compiler as intended -
> yay !
> 
> > when trying to build allnoconfig or tinyconfig. I get the same results
> > with gcc-8.2.0.
> 
> Unaligned access code gen was enabled by default in 7.x actually, but us OS folks
> were late to find that which led to the recent patch to disable it which was
> broken in gcc.
> Claudiu fixed gcc promptly but that patch didn't make it to upstream, which I've
> posted now.
> 
> http://lists.infradead.org/pipermail/linux-snps-arc/2019-February/005522.html
> 
> > Do I need some special compiler configuration flag when building the
> > arcv2 toolchain ? Or am I simply out of luck for using upstream gcc ?
> 
> Once the patch hits mainline you could use that. In the mean time I'll back out
> the "detector" as it might trip other people too.
> 

Can you possibly use $(cc-option,-mno-unaligned-access), or would that
defeat the purpose ?

> Many Thx for your testing service.

My pleasure.

Thanks,
Guenter
