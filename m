From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 07:02:28 +0000
Subject: [PATCH] arc: get rid of DEVTMPFS dependency on INITRAMFS_SOURCE
References: <1455973466-15611-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8BA2D@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 20 February 2016 06:35 PM, Alexey Brodkin wrote:
> Even though DEVTMPFS is required when our pre-built initramfs
> is used it is not the case in general. It is perfectly possible
> to use initramfs with device nodes already populated or there
> could be other usages, see discussion below for more detials:
> http://thread.gmane.org/gmane.comp.embedded.openwrt.devel/37819/focus=37821
>
> This change removes mentioned dependency from arch/arc/Kconfig
> updating instead those defconfigs that are usually used with this
> kind of pre-build initramfs.
>
> And while at it all touched defconfigs were regenerated via
> savedefconfig and some options were removed:
>  * USB is selected by other options implicitly
>  * VGA_CONSOLE is disableb for ARC since
>    031e29b5877f31676739dc2f847d04c2c0732034
>  * EXT3_FS automatically selects EXT4_FS
>  * MTDxxx and JFFS2_FS make no sense for AXS because
>    AXS NAND controller is not upstreamed
>  * NET_OSCI_LAN is not in upstream as well
>  * ARCPGU_xxx options make no sense because ARC PGU is not yet
>    in upstream and when it gets there all config options would
>    be taken from devicetree
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Thx for additional cleanup Alexey. Applied to for-curr (4.5)

-Vineet
