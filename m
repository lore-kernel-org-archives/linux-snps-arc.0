From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Wed, 13 Jan 2016 01:13:59 +0000
Subject: [PATCH] arc: Removed local initramfs source file from axs101
 configuration.
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E843B4@us01wembx1.internal.synopsys.com>
References: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
 <1452208821.18725.9.camel@synopsys.com> <56905363.3020703@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E843B4@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5695A4D7.3040400@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi guys,

I don't think maintaining that flag this in the kernel is correct... the kernel simply doesn't compile out of the box.
If you grep for  CONFIG_INITRAMFS_SOURCE, ARC is the only architecture that uses that kernel flag by default pointing to an external directory.
I don't think this is proper to have it like this by default from the kernel point of view.

Regards,
C.Palminha

palminha at PALMINHA-E7440 ~/Development/linus.git.linux ((v4.3))
$ grep -r INITRAMFS_SOURCE *|grep configs
arch/arc/configs/axs101_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs/"
arch/arc/configs/axs103_defconfig:CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
arch/arc/configs/axs103_smp_defconfig:CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
arch/arc/configs/nsimosci_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs/"
arch/arc/configs/nsimosci_hs_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
arch/arc/configs/nsimosci_hs_smp_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
arch/arc/configs/nsim_700_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs/"
arch/arc/configs/nsim_hs_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
arch/arc/configs/nsim_hs_smp_defconfig:CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
arch/arc/configs/tb10x_defconfig:CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
arch/mips/configs/nlm_xlr_defconfig:CONFIG_INITRAMFS_SOURCE=""
arch/mips/configs/rt305x_defconfig:CONFIG_INITRAMFS_SOURCE=""
arch/unicore32/configs/unicore32_defconfig:#CONFIG_INITRAMFS_SOURCE="arch/unicore/ramfs/ramfs_config"
arch/xtensa/configs/common_defconfig:CONFIG_INITRAMFS_SOURCE=""

On 11-01-2016 07:47, Vineet Gupta wrote:
> On Saturday 09 January 2016 05:55 AM, Carlos Palminha wrote:
>> Hi Alexey,
>>
>> Probably my e-mail comments before the patch mislead you...
>> If you download the kernel source and try to compile it, it won't work because of the INITRAMFS pointing to a non-existing directory. (check log below)
>>
>> That's why that option should be removed from the standard kernel.
> 
> Since the axs101 DT cmdline lacks any reference to root device - how does this
> unmodified kernel boot anyways w/o changing DT. Does uboot provide the cmdline for
> rootfs ?
> 
> The reason we've had initramfs for ages (vs. relying on uboot) is because we can't
> have uboot based workflow primarily because Alexey / I have 1 AXS MB and we
> constantly keep switching between 700 and HS builds.
> 
> I think you can use KCONFIG_ALLCONFIG (grep in Documentation) to override the
> INITRAMFS !
> 
> -Vineet
> 
