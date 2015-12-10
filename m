From: mpe@ellerman.id.au (Michael Ellerman)
Date: Thu, 10 Dec 2015 20:04:01 +1100
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec
 10, 17:33
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D53D7@IN01WEMBXA.internal.synopsys.com>
References: <20151210063403.1.54732@94a655e5a217>
 <C2D7FE5348E1B147BCA15975FBA23075F44D53D7@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449738241.7156.1.camel@ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

On Thu, 2015-12-10@07:05 +0000, Vineet Gupta wrote:

> On Thursday 10 December 2015 12:05 PM, noreply@ellerman.id.au wrote:

> > FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec 10, 17:33
> > 
> > http://kisskb.ellerman.id.au/kisskb/buildresult/12564629/
> > 
> > Commit:   Add linux-next specific files for 20151210
> >           8225f4e85cb03daea14661380745886ce01fd83a
> > Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4
> > 
> > Possible errors
> > ---------------
> > 
> > include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory
> > make[2]: *** [kernel/bounds.s] Error 1
> > make[1]: *** [prepare0] Error 2
> > make: *** [sub-make] Error 2
> > 
> > No warnings found in log.
> 
> Hi Michael,
> 
> It is weird that no other arch build show similar errors.
> Building same linux-next on my machine seems to be fine as well.

That is weird. I'll ask it to rebuild it and see if it happens again.

Do you build with -j?

> From looking at logs it looks like some sort of a make / paralle jobs timing issue
> at build farm.
> 
> P.S. Could you also update system to also cc lkml and
> linux-snps-arc at lists.infradead.org for such errors.

I'll add the arc list, I don't like to cc lkml so as not to annoy people with
too many error mails.

cheers
