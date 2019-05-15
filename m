From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 15 May 2019 16:21:28 +0000
Subject: [PATCH] ARC: [hsdk]  Use rgmii-id mode for ethernet phy
In-Reply-To: <1557860695.4229.88.camel@impinj.com>
References: <20190514173941.20046-1-tpiepho@impinj.com>
 <CY4PR1201MB01201A8B76EE3A4D2094B646A1080@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <1557860695.4229.88.camel@impinj.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120392117C0EC116D20788DA1090@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Trent,

> -----Original Message-----
> From: Trent Piepho <tpiepho at impinj.com>
> Sent: Tuesday, May 14, 2019 10:05 PM
> To: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet.Gupta1 at synopsys.com; Eugeniy.Paltsev at synopsys.com; linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH] ARC: [hsdk] Use rgmii-id mode for ethernet phy
> 
> On Tue, 2019-05-14@18:22 +0000, Alexey Brodkin wrote:
> > > Subject: [PATCH] ARC: [hsdk] Use rgmii-id mode for ethernet phy
> > >
> > > If internal delays are desired on the RGMII link, "rgmii-id" should be
> > > used as the phy-mode rather than "rgmii" .
> > >
> > > This dts has properties to set the delay values, but they are ignored.
> > > I suspect this is a mistake.
> > >
> > > While the driver should disable delay based on the current DT, it does
> > > not, and instead leaves the PHY in the pin strapping default.  Which is
> > > usually to have delays very close to the unused values the hsdk DT.
> > > Which is why the phy would work even if the delays in the DT are
> > > ignored.
> >
> > Thanks for this patch!
> >
> > Indeed there might very well be something incomplete in that .dts
> > as I didn't know all those details.
> >
> > I did check and Micrel KSZ9031 Gigabit PHY on HSDK supports on-chip delay.
> > That's what its datasheet says:
> 
> Hmm, I was under the impression this board used a TI phy!  The phy DT
> node contains these properties:
> 
> ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;

Got those removed, see explanation here:
http://lists.infradead.org/pipermail/linux-snps-arc/2019-May/005754.html

But we have another boards where DP83865 PHY is used,
these are AXS101 & AXS103 which share the same base-board .dtsi,
see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/boot/dts/axs10x_mb.dtsi#n75

Even though it's not immediately clear there's a TI PHY as there's
no PHY node at all but see what we have in the bootlog:
| NatSemi DP83865 stmmac-0:01: attached PHY driver [NatSemi DP83865] ...

I guess I need to add PHY node and use suggested by you "rgmii-id", right?

> I did recently diagnose a problem where A/N was several seconds slower
> than expected.  It had to do with the link partner being an Intel PHY
> which had "ultra low power mode" enabled.  This is some feature to
> reduce power when there is no link.  If the link to the intel phy was
> not up, i.e. a direct connect from my device (powered off) to a PC, not
> through a switch, then link up would first A/N to 10 mbps mode, not
> work, then drop, then come up as 1000 mbps and work.  This took about
> 7-8 seconds instead of about 3 seconds.  With a switch interposed
> between the devices, the Intel PHY does not see a down link (the switch
> is on), so this doesn't happen.  Probably not your problem, as I could
> only see this in u-boot by the time Linux has booted the phy will have
> activated the link and gotten past this screwy 10 mbps thing.

Hm, that's interesting... I think at least on some of our machines we do
have Intel controllers and most probably Intel PHYs as well so that might
very well be the case. Do you know if that "ultra low power mode" could be
somehow easily disabled?

-Alexey
