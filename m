From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 11 Jan 2016 07:59:47 +0000
Subject: [PATCH] arc: Removed local initramfs source file from axs101
 configuration.
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E843B4@us01wembx1.internal.synopsys.com>
References: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
 <1452208821.18725.9.camel@synopsys.com> <56905363.3020703@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E843B4@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1452499187.3277.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Mon, 2016-01-11@07:47 +0000, Vineet Gupta wrote:
> On Saturday 09 January 2016 05:55 AM, Carlos Palminha wrote:
> > Hi Alexey,
> > 
> > Probably my e-mail comments before the patch mislead you...
> > If you download the kernel source and try to compile it, it won't work because of the INITRAMFS pointing to a non
> > -existing directory. (check log below)
> > 
> > That's why that option should be removed from the standard kernel.
> 
> Since the axs101 DT cmdline lacks any reference to root device - how does this
> unmodified kernel boot anyways w/o changing DT. Does uboot provide the cmdline for
> rootfs ?

Indeed if initramfs is not built-in vmlinux/uImage then kernel command-line
must be adjusted to point to real root device.

This could be done in 2 ways:

 [1] Manually modify "bootargs" value in arch/arc/boot/dts/axs10{1|3}.dts
 [2] In case of U-Boot it's possible to load device tree blob together with uImage
     and in that case U-Boot's "bootargs" env variable will override the one in .dtb

-Alexey
