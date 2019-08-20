From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 20 Aug 2019 08:07:15 +0000
Subject: [RFC PATCH] net: designware: drop compatible altr,socfpga-stmmac
In-Reply-To: <20190819184313.8383-1-ralph.siemsen@linaro.org>
References: <20190819184313.8383-1-ralph.siemsen@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB01205C73F3502FFB2F9192BFA1AB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Ralph,

> -----Original Message-----
> From: Ralph Siemsen <ralph.siemsen at linaro.org>
> Sent: Monday, August 19, 2019 9:43 PM
> To: u-boot at lists.denx.de; Joe Hershberger <joe.hershberger at ni.com>; Alexey Brodkin
> <abrodkin at synopsys.com>; Vlad Zakharov <vzakhar at synopsys.com>
> Cc: Ralph Siemsen <ralph.siemsen at linaro.org>
> Subject: [RFC PATCH] net: designware: drop compatible altr,socfpga-stmmac
> 
> The same compatible = "altr,socfpga-stmmac" appears in both
> drivers/net/designware.c and drivers/net/dwmac_socfgpa.c,
> creating ambiguity in which driver will be bound.
> 
> For Intel/Altera SoC devices, dwmac_socfpga.c is the correct driver.
> So drop the compatible string from designware.c.
> 
> Signed-off-by: Ralph Siemsen <ralph.siemsen at linaro.org>
> ---
> This compatible string also appears in: axs10x_mb.dtsi and hsdk.dts.
> Maintainers of those boards have been copied, kindly review.

Thanks for this clean-up.

Speaking about AXS10x board where we do have DW GMAC
I cannot recall the reason I chose to use "altr,socfpga-stmmac"
for the board here [1] 3 years ago.

But given we don't have any special quirks implemented whatever
is the most generic DW GMAC compatible string is should be good for us.

Joe, could you please suggest if we need to use just "st,stm32-dwmac"
or add our own compatible as the ASIC is not from ST obviously but
an FPGA with Synopsys ARC SoC?

[1] https://gitlab.denx.de/u-boot/u-boot/commit/fb2dea60e8f355ae00d427db09112a90839c96ec

-Alexey
