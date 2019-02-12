From: clabbe@baylibre.com (LABBE Corentin)
Date: Tue, 12 Feb 2019 17:39:04 +0100
Subject: [PATCH 1/2] ARC: U-boot: check arguments paranoidly
In-Reply-To: <20190212153932.28371-2-Eugeniy.Paltsev@synopsys.com>
References: <20190212153932.28371-1-Eugeniy.Paltsev@synopsys.com>
 <20190212153932.28371-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212163904.GA14668@Red>
To: linux-snps-arc@lists.infradead.org

On Tue, Feb 12, 2019@06:39:31PM +0300, Eugeniy Paltsev wrote:
> Handle U-boot arguments paranoidly:
>  * don't allow to pass unknown tag.
>  * try to use external device tree blob only if corresponding tag
>    (TAG_DTB) is set.
>  * check that magic number is correct.
>  * don't check uboot_tag if kernel build with no ARC_UBOOT_SUPPORT.
> 
> NOTE:
> If U-boot args are invalid we skip them and try to use embedded device
> tree blob. We can't panic on invalid U-boot args as we really pass
> invalid args due to bug in U-boot code.
> This happens if we don't provide external DTB to U-boot and
> don't set 'bootargs' U-boot environment variable (which is default
> case at least for HSDK board) In that case we will pass
> {r0 = 1 (bootargs in r2); r1 = 0; r2 = 0;} to linux which is invalid.
> 
> NOTE:
> We can safely check U-boot magic value (0x0) in linux passed via
> r1 register as U-boot pass it from the beginning.
> 
> While I'm at it refactor U-boot arguments handling code.
> 

Hello

I have tried to test this serie, but this patch does not apply anymore on current next tree.
It conflicts with "ARC: boot: robustify u-boot arg referencing".

Regards
