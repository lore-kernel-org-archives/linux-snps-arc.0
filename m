From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 7 Feb 2019 13:12:43 +0000
Subject: patch "devres: Align data[] to ARCH_KMALLOC_MINALIGN" added to
 driver-core-linus
In-Reply-To: <1541965277161164@kroah.com>
References: <1541965277161164@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64681D5C43@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Greg,

> -----Original Message-----
> From: gregkh at linuxfoundation.org <gregkh at linuxfoundation.org>
> Sent: Sunday, November 11, 2018 10:41 PM
> To: alexey.brodkin at synopsys.com; David.Laight at ACULAB.COM; alexey.brodkin at synopsys.com; geert at linux-
> m68k.org; greg at kroah.com; gregkh at linuxfoundation.org; peterz at infradead.org; stable at vger.kernel.org;
> tglx at linutronix.de; vineet.gupta1 at synopsys.com; will.deacon at arm.com
> Subject: patch "devres: Align data[] to ARCH_KMALLOC_MINALIGN" added to driver-core-linus
> 
> 
> This is a note to let you know that I've just added the patch titled
> 
>     devres: Align data[] to ARCH_KMALLOC_MINALIGN
> 
> to my driver-core git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> in the driver-core-linus branch.
> 
> The patch will show up in the next release of the linux-next tree
> (usually sometime within the next 24 hours during the week.)
> 
> The patch will hopefully also be merged in Linus's tree for the
> next -rc kernel release.
> 
> If you have any questions about this process, please let me know.
> 
> 
> From a66d972465d15b1d89281258805eb8b47d66bd36 Mon Sep 17 00:00:00 2001
> From: Alexey Brodkin <alexey.brodkin at synopsys.com>
> Date: Wed, 31 Oct 2018 18:25:47 +0300
> Subject: devres: Align data[] to ARCH_KMALLOC_MINALIGN
> 
> Initially we bumped into problem with 32-bit aligned atomic64_t
> on ARC, see [1]. And then during quite lengthly discussion Peter Z.
> mentioned ARCH_KMALLOC_MINALIGN which IMHO makes perfect sense.
> If allocation is done by plain kmalloc() obtained buffer will be
> ARCH_KMALLOC_MINALIGN aligned and then why buffer obtained via
> devm_kmalloc() should have any other alignment?
 
[snip]

> Cc: <stable at vger.kernel.org> # 4.8+
> Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

I noticed this patch was not only merged in Linus' tree quite some time ago
but it was as well back-ported to v4.20, see [1] but for some reason there's
no backport to either LTS kernel (v4.19, v4.14 and v4.9).

Is there any problem with this patch and LTS kernels or may we have this one
applied?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.20.y&id=a66d972465d15b1d89281258805eb8b47d66bd36

-Alexey
