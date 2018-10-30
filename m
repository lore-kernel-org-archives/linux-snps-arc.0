From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 30 Oct 2018 16:05:51 +0000
Subject: [PATCH v2] ARC: IOC: panic if kernel was started with
 previously enabled IOC
References: <20181030085421.7657-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075013A5892D6@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/30/18 1:54 AM, Eugeniy Paltsev wrote:
> If IOC was already enabled (due to bootloader) it technically needs to
> be reconfigured with aperture base,size corresponding to Linux memory
> map which will certainly be different than uboot's. But disabling and
> reenabling IOC when DMA might be potentially active is tricky business.
> To avoid random memory issues later, just panic here and ask user to
> upgrade bootloader to one which doesn't enable IOC.
>
> This was actually seen as issue on some of the HSDK board with a version
> of uboot which enabled IOC. There were random issues later with starting
> of X or peripherals etc.
>
> Also while I'm at it, replace hardcoded bits in ARC_REG_IO_COH_PARTIAL
> and ARC_REG_IO_COH_ENABLE registers by definitions.
>
> Inspired by: https://lkml.org/lkml/2018/1/19/557
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v1->v2:
>  * Fix regression: check for IOC existence before accessing to any IOC
>    register.
>
...
...
>  		arc_slc_disable();
>  
> -	if (is_isa_arcv2() && ioc_enable)
> +	if (is_isa_arcv2() && ioc_exists)
>  		arc_ioc_setup();

Folded this hunk into existing patch in for-curr.

Thx,
-Vineet
