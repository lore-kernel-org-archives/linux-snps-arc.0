From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 3 Dec 2018 10:24:20 +0000
Subject: [PATCH v2] ARC: change defconfig defaults to ARCv2
In-Reply-To: <20181202064929.9B32D20851@mail.kernel.org>
References: <20181130125156.34460-1-abrodkin@synopsys.com>
 <20181202064929.9B32D20851@mail.kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3b9f09a5cd48345cd23ec8cb760c322876ceeba3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Sasha,

On Sun, 2018-12-02@06:49 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: 4.4.+
> 
> The bot has tested the following trees: v4.19.5, v4.14.84, v4.9.141, v4.4.165, 
> 
> v4.19.5: Build OK!
> v4.14.84: Build OK!
> v4.9.141: Failed to apply! Possible dependencies:
>     Unable to calculate

That's a fixed hunk for 4.9:
---------------------->8----------------------
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -8,7 +8,7 @@
 
 UTS_MACHINE := arc
 
-KBUILD_DEFCONFIG := nsim_700_defconfig
+KBUILD_DEFCONFIG := nsim_hs_defconfig
 
 cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT) += -mA7
---------------------->8----------------------

> v4.4.165: Failed to apply! Possible dependencies:
>     845033be0041 ("ARC: [plat-eznps] Add eznps board defconfig and dts")

Indeed EzChip's nps400 platform was added later but we don't need it in 4.4.y
as IIRC there were quite some other dependencies, so just drop hunk related to it.

And once nps_defconfig hunk is dropped there's a fixd hunk for arch/arc/Makefile
similarly to 4.9:
---------------------->8----------------------
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -12,7 +12,7 @@ ifeq ($(CROSS_COMPILE),)
 CROSS_COMPILE := arc-linux-
 endif
 
-KBUILD_DEFCONFIG := nsim_700_defconfig
+KBUILD_DEFCONFIG := nsim_hs_defconfig
 
 cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT) += -mA7
---------------------->8----------------------

> How should we proceed with this patch?

Hope above helps. Otherwise I may send complete patches for both
4.4 and 4.9.

Let me know what is your preference.

-Alexey
