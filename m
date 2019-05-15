From: tpiepho@impinj.com (Trent Piepho)
Date: Wed, 15 May 2019 18:16:06 +0000
Subject: [PATCH] ARC: [hsdk]  Use rgmii-id mode for ethernet phy
In-Reply-To: <CY4PR1201MB0120392117C0EC116D20788DA1090@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190514173941.20046-1-tpiepho@impinj.com>
 <CY4PR1201MB01201A8B76EE3A4D2094B646A1080@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <1557860695.4229.88.camel@impinj.com>
 <CY4PR1201MB0120392117C0EC116D20788DA1090@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557944165.4229.130.camel@impinj.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2019-05-15@16:21 +0000, Alexey Brodkin wrote:
> > -----Original Message-----
> > From: Trent Piepho <tpiepho at impinj.com>
> > Sent: Tuesday, May 14, 2019 10:05 PM
> > To: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Vineet.Gupta1 at synopsys.com; Eugeniy.Paltsev at synopsys.com; linux-snps-arc at lists.infradead.org
> > Subject: Re: [PATCH] ARC: [hsdk] Use rgmii-id mode for ethernet phy
> > 
> > On Tue, 2019-05-14@18:22 +0000, Alexey Brodkin wrote:
> > > > Subject: [PATCH] ARC: [hsdk] Use rgmii-id mode for ethernet phy
> > > > 
> > > > If internal delays are desired on the RGMII link, "rgmii-id" should be
> > > > used as the phy-mode rather than "rgmii" .
> > > > 
> > > > This dts has properties to set the delay values, but they are ignored.
> > > > I suspect this is a mistake.
> > > > 
> But we have another boards where DP83865 PHY is used,
> these are AXS101 & AXS103 which share the same base-board .dtsi,
> see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/boot/dts/axs10x_mb.dtsi#n75
> 
> Even though it's not immediately clear there's a TI PHY as there's
> no PHY node at all but see what we have in the bootlog:
> > NatSemi DP83865 stmmac-0:01: attached PHY driver [NatSemi DP83865] ...
> 
> I guess I need to add PHY node and use suggested by you "rgmii-id", right?

The dp83865 is a different driver than the dp83867.  My check of it
didn't find any evidence of it doing anything w.r.t. rgmii clock skew. 
A quick check of dp83865 datasheet shows it's a very different device
than the dp83867.

> > work, then drop, then come up as 1000 mbps and work.  This took about
> > 7-8 seconds instead of about 3 seconds.  With a switch interposed
> > between the devices, the Intel PHY does not see a down link (the switch
> > is on), so this doesn't happen.  Probably not your problem, as I could
> > only see this in u-boot by the time Linux has booted the phy will have
> > activated the link and gotten past this screwy 10 mbps thing.
> 
> Hm, that's interesting... I think at least on some of our machines we do
> have Intel controllers and most probably Intel PHYs as well so that might
> very well be the case. Do you know if that "ultra low power mode" could be
> somehow easily disabled?

If the machine with the intel phy is running windows, there is a driver
option (device manager, properties, advanced..) for it.  Driver version
12.15.22.6 from 4/5/2016 does not have a control, while version
12.17.10.6 from 4/3/2018 does have the control.  Those are my only two
data points.  I don't know how to control this feature from Linux. 
Never used an Intel phy on an embedded device.
