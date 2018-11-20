From: richard.purdie@linuxfoundation.org (richard.purdie@linuxfoundation.org)
Date: Tue, 20 Nov 2018 17:41:42 +0000
Subject: [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <20181119100443.2882-1-abrodkin@synopsys.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3a3d89dc23097b3cc6338e2906eaae904799c008.camel@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

On Mon, 2018-11-19@13:04 +0300, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-
> tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> Cc: Otavio Salvador <otavio at ossystems.com.br>
> Cc: Martin Jansa <martin.jansa at gmail.com>
> Cc: Ross Burton <ross.burton at intel.com>
> Cc: Marek Vasut <marex at denx.de>
> ---

I know others are talking about splitting the packaging and I'm ok with
deferring that to a separate patch.

This patch did break the build in oe-selftest as you renamed a recipe
and didn't update conf/distro/include/maintainers.inc.

Could you send a new version with that tweak please?

(grep 
https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/242/steps/7/logs/step2d
 for the recipe name to see the test that failed)

Cheers,

Richard
