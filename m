From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Dec 2015 07:05:12 +0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec
 10, 17:33
References: <20151210063403.1.54732@94a655e5a217>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D53D7@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 10 December 2015 12:05 PM, noreply@ellerman.id.au wrote:
> FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec 10, 17:33
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/12564629/
>
> Commit:   Add linux-next specific files for 20151210
>           8225f4e85cb03daea14661380745886ce01fd83a
> Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4
>
> Possible errors
> ---------------
>
> include/linux/jiffies.h:10:33: fatal error: generated/timeconst.h: No such file or directory
> make[2]: *** [kernel/bounds.s] Error 1
> make[1]: *** [prepare0] Error 2
> make: *** [sub-make] Error 2
>
> No warnings found in log.

Hi Michael,

It is weird that no other arch build show similar errors.
Building same linux-next on my machine seems to be fine as well.

>From looking at logs it looks like some sort of a make / paralle jobs timing issue
at build farm.

P.S. Could you also update system to also cc lkml and
linux-snps-arc at lists.infradead.org for such errors.

Thx,
-Vineet
