From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Wed, 4 Sep 2019 13:48:13 +0000
Subject: [U-Boot] [RFC PATCH] net: designware: drop compatible altr,
 socfpga-stmmac
In-Reply-To: <CY4PR1201MB0120A2635B4F31DB3F8273BCA1B80@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190819184313.8383-1-ralph.siemsen@linaro.org>
 <CY4PR1201MB01205C73F3502FFB2F9192BFA1AB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CANr=Z=bF3dqXP919XJXzwrMYs_zW+yx_kpxeWYraxF1D7-S4-Q@mail.gmail.com>
 <CY4PR1201MB0120A2635B4F31DB3F8273BCA1B80@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <BN8PR12MB3266D46C80EF36B9A53A8C88D3B80@BN8PR12MB3266.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <abrodkin@synopsys.com>
Date: Sep/04/2019, 06:59:01 (UTC+00:00)

> Hi Joe,
> 
> > -----Original Message-----
> > From: Joe Hershberger <joe.hershberger at ni.com>
> > Sent: Wednesday, September 4, 2019 1:10 AM
> > To: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Ralph Siemsen <ralph.siemsen at linaro.org>; Joseph Hershberger <joseph.hershberger at ni.com>; u-
> > boot at lists.denx.de; linux-snps-arc at lists.infradead.org; Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > Subject: Re: [U-Boot] [RFC PATCH] net: designware: drop compatible altr, socfpga-stmmac
> > 
> > On Tue, Aug 20, 2019 at 3:07 AM Alexey Brodkin
> > <Alexey.Brodkin@synopsys.com> wrote:
> > >
> > > Hi Ralph,
> > >
> > > > -----Original Message-----
> > > > From: Ralph Siemsen <ralph.siemsen at linaro.org>
> > > > Sent: Monday, August 19, 2019 9:43 PM
> > > > To: u-boot at lists.denx.de; Joe Hershberger <joe.hershberger at ni.com>; Alexey Brodkin
> > > > <abrodkin at synopsys.com>; Vlad Zakharov <vzakhar at synopsys.com>
> > > > Cc: Ralph Siemsen <ralph.siemsen at linaro.org>
> > > > Subject: [RFC PATCH] net: designware: drop compatible altr,socfpga-stmmac
> > > >
> > > > The same compatible = "altr,socfpga-stmmac" appears in both
> > > > drivers/net/designware.c and drivers/net/dwmac_socfgpa.c,
> > > > creating ambiguity in which driver will be bound.
> > > >
> > > > For Intel/Altera SoC devices, dwmac_socfpga.c is the correct driver.
> > > > So drop the compatible string from designware.c.
> > > >
> > > > Signed-off-by: Ralph Siemsen <ralph.siemsen at linaro.org>
> > > > ---
> > > > This compatible string also appears in: axs10x_mb.dtsi and hsdk.dts.
> > > > Maintainers of those boards have been copied, kindly review.
> > >
> > > Thanks for this clean-up.
> > >
> > > Speaking about AXS10x board where we do have DW GMAC
> > > I cannot recall the reason I chose to use "altr,socfpga-stmmac"
> > > for the board here [1] 3 years ago.
> > >
> > > But given we don't have any special quirks implemented whatever
> > > is the most generic DW GMAC compatible string is should be good for us.
> > >
> > > Joe, could you please suggest if we need to use just "st,stm32-dwmac"
> > > or add our own compatible as the ASIC is not from ST obviously but
> > > an FPGA with Synopsys ARC SoC?
> > 
> > I think we should only be using what Linux does, so I'm afraid I have
> > to defer to what exists in the DTs there.
> 
> In the Linux kernel we use "snps,dwmac", see [1].
> But maybe we need to switch to "snps,dwmac-3.70a" even as what we really have is 3.73a.
> 
> While in U-Boot we don't have either one, the most generic is "st,stm32-dwmac", see [2].
> So maybe we want to add at least "snps,dwmac".
> 
> @Jose Abreu could you please confirm if "snps,dwmac-3.70a" is OK for GMAC IP v3.73a?

Yes it should be okay.

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/boot/dts/axs10x_mb.dtsi#n74
> [2] https://gitlab.denx.de/u-boot/u-boot/blob/master/drivers/net/designware.c#L855
> 
> -Alexey


---
Thanks,
Jose Miguel Abreu
