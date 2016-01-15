From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 15 Jan 2016 10:49:15 +0000
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <5698CDBD.2010908@openwrt.org>
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1452854954.18381.37.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Felix,

On Fri, 2016-01-15@11:45 +0100, Felix Fietkau wrote:
> On 2016-01-15 00:12, Alexey Brodkin wrote:
> > Given those patches are relevant to any ARC platform and even
> > ISA version it makes perfect sense for patches to exist
> > in one place instead of being duplicated for each new ARC-based ASIC.
> > 
> > Note this is a prerequisite for upstreaming of ARC HS38 support in
> > OpenWRT.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Felix Fietkau <nbd at openwrt.org>
> > Cc: Jo-Philipp Wich <jow at openwrt.org>
> > Cc: Jonas Gorski <jogo at openwrt.org>
> > --- /dev/null
> > +++ b/target/linux/generic/patches-4.4/331-arc-remove-dependency-on-DEVTMPFS.patch
> > @@ -0,0 +1,36 @@
> > +From adfbf9e6cad93281cffceab078e7f6f2a8e094f9 Mon Sep 17 00:00:00 2001
> > +From: Alexey Brodkin <abrodkin at synopsys.com>
> > +Date: Thu, 13 Aug 2015 01:56:02 +0300
> > +Subject: [PATCH 1/2] openwrt: arc - remove dependency on DEVTMPFS
> > +
> > +OpenWRT builds initramfs so that it doesn't require DEVTMPFS so dropping
> > +this dependency. That helps to escape 2 separate kernel rebuilds with
> > +and without initramfs.
> > +
> > +2 builds happen because OpenWRT first builds kernel and later modules.
> > +When building entire kernel with simple "make" INITRAMFS sets to a real
> > +value and so was triggering DEVTMPFS selection. Then when building only
> > +modules with "make modules" command INITRAMFS is zeroed and so kernel
> > +config was changing that lead to full kernel rebuild.
> > +
> > +Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > +---
> > + arch/arc/Kconfig | 2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> > +index 6312f60..a95bab3 100644
> > +--- a/arch/arc/Kconfig
> > ++++ b/arch/arc/Kconfig
> > +@@ -12,8 +12,6 @@ config ARC
> > + 	select BUILDTIME_EXTABLE_SORT
> > + 	select COMMON_CLK
> > + 	select CLONE_BACKWARDS
> > +-	# ARC Busybox based initramfs absolutely relies on DEVTMPFS for /dev
> > +-	select DEVTMPFS if !INITRAMFS_SOURCE=""
> > + 	select GENERIC_ATOMIC64
> > + 	select GENERIC_CLOCKEVENTS
> > + 	select GENERIC_FIND_FIRST_BIT
> Could you please send this one upstream as well?

Adding Vineet so he may comment if that change makes sense upstream.

-Alexey
