From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 11 Jan 2016 07:47:23 +0000
Subject: [PATCH] arc: Removed local initramfs source file from axs101
 configuration.
References: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
 <1452208821.18725.9.camel@synopsys.com> <56905363.3020703@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E843B4@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 09 January 2016 05:55 AM, Carlos Palminha wrote:
> Hi Alexey,
>
> Probably my e-mail comments before the patch mislead you...
> If you download the kernel source and try to compile it, it won't work because of the INITRAMFS pointing to a non-existing directory. (check log below)
>
> That's why that option should be removed from the standard kernel.

Since the axs101 DT cmdline lacks any reference to root device - how does this
unmodified kernel boot anyways w/o changing DT. Does uboot provide the cmdline for
rootfs ?

The reason we've had initramfs for ages (vs. relying on uboot) is because we can't
have uboot based workflow primarily because Alexey / I have 1 AXS MB and we
constantly keep switching between 700 and HS builds.

I think you can use KCONFIG_ALLCONFIG (grep in Documentation) to override the
INITRAMFS !

-Vineet
