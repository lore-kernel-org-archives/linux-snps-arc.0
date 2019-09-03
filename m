From: joe.hershberger@ni.com (Joe Hershberger)
Date: Tue, 3 Sep 2019 22:09:50 +0000
Subject: [U-Boot] [RFC PATCH] net: designware: drop compatible altr,
 socfpga-stmmac
In-Reply-To: <CY4PR1201MB01205C73F3502FFB2F9192BFA1AB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190819184313.8383-1-ralph.siemsen@linaro.org>
 <CY4PR1201MB01205C73F3502FFB2F9192BFA1AB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CANr=Z=bF3dqXP919XJXzwrMYs_zW+yx_kpxeWYraxF1D7-S4-Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Aug 20, 2019 at 3:07 AM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Ralph,
>
> > -----Original Message-----
> > From: Ralph Siemsen <ralph.siemsen at linaro.org>
> > Sent: Monday, August 19, 2019 9:43 PM
> > To: u-boot at lists.denx.de; Joe Hershberger <joe.hershberger at ni.com>; Alexey Brodkin
> > <abrodkin at synopsys.com>; Vlad Zakharov <vzakhar at synopsys.com>
> > Cc: Ralph Siemsen <ralph.siemsen at linaro.org>
> > Subject: [RFC PATCH] net: designware: drop compatible altr,socfpga-stmmac
> >
> > The same compatible = "altr,socfpga-stmmac" appears in both
> > drivers/net/designware.c and drivers/net/dwmac_socfgpa.c,
> > creating ambiguity in which driver will be bound.
> >
> > For Intel/Altera SoC devices, dwmac_socfpga.c is the correct driver.
> > So drop the compatible string from designware.c.
> >
> > Signed-off-by: Ralph Siemsen <ralph.siemsen at linaro.org>
> > ---
> > This compatible string also appears in: axs10x_mb.dtsi and hsdk.dts.
> > Maintainers of those boards have been copied, kindly review.
>
> Thanks for this clean-up.
>
> Speaking about AXS10x board where we do have DW GMAC
> I cannot recall the reason I chose to use "altr,socfpga-stmmac"
> for the board here [1] 3 years ago.
>
> But given we don't have any special quirks implemented whatever
> is the most generic DW GMAC compatible string is should be good for us.
>
> Joe, could you please suggest if we need to use just "st,stm32-dwmac"
> or add our own compatible as the ASIC is not from ST obviously but
> an FPGA with Synopsys ARC SoC?

I think we should only be using what Linux does, so I'm afraid I have
to defer to what exists in the DTs there.

-Joe

> [1] https://gitlab.denx.de/u-boot/u-boot/commit/fb2dea60e8f355ae00d427db09112a90839c96ec
>
> -Alexey
> _______________________________________________
> U-Boot mailing list
> U-Boot at lists.denx.de
> https://lists.denx.de/listinfo/u-boot
