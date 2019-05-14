From: tpiepho@impinj.com (Trent Piepho)
Date: Tue, 14 May 2019 19:04:55 +0000
Subject: [PATCH] ARC: [hsdk]  Use rgmii-id mode for ethernet phy
In-Reply-To: <CY4PR1201MB01201A8B76EE3A4D2094B646A1080@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190514173941.20046-1-tpiepho@impinj.com>
 <CY4PR1201MB01201A8B76EE3A4D2094B646A1080@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557860695.4229.88.camel@impinj.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2019-05-14@18:22 +0000, Alexey Brodkin wrote:
> > Subject: [PATCH] ARC: [hsdk] Use rgmii-id mode for ethernet phy
> > 
> > If internal delays are desired on the RGMII link, "rgmii-id" should be
> > used as the phy-mode rather than "rgmii" .
> > 
> > This dts has properties to set the delay values, but they are ignored.
> > I suspect this is a mistake.
> > 
> > While the driver should disable delay based on the current DT, it does
> > not, and instead leaves the PHY in the pin strapping default.  Which is
> > usually to have delays very close to the unused values the hsdk DT.
> > Which is why the phy would work even if the delays in the DT are
> > ignored.
> 
> Thanks for this patch!
> 
> Indeed there might very well be something incomplete in that .dts
> as I didn't know all those details.
> 
> I did check and Micrel KSZ9031 Gigabit PHY on HSDK supports on-chip delay.
> That's what its datasheet says:

Hmm, I was under the impression this board used a TI phy!  The phy DT
node contains these properties:

ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;

These are for a dp83867 PHY of course, not a Micrel KSZ9031.  The
micrel driver would just ignore these properties.

> ------------------->8------------------
> RGMII Timing Supports On-Chip Delay According to RGMII Version 2.0,
> with Programming Options for External Delay and Making Adjustments
> and Corrections to TX and RX Timing Paths.
> ------------------->8------------------
> 
> And with proposed change I don't see any regressions so far, which is good.

I suspect the micrel driver will simply ignore the rgmii vs rgmii-id. 
But I have not worked on that driver for a long time and don't know for
sure.

> Still a couple of questions:
>  1. How did you spot this problem?

Found bug in dp83867 phy, grepped all dts files for properties or
symbolic constants that relate to that phy to look for board that might
be affected.

Since dts files almost always use run-time detection of phy type based
on the phy's id registers, I can't search for the "compatible" in the
dts to find boards using the phy.  So perhaps this board is a false
positive, and the real bug is the dts file was written for the dp83867
phy but the board really uses a different phy.

>  2. With some Ethernet cards (especially 1Gb ones) on the other end we do see
>     from time to time auto-negotiation takes that much time that
>     udhcpc fails to get a lease because 3 discovery packets sent in
>     a row get lost since link is not established (i.e. > 5 seconds).
>     Do you think if it has something to do with that particular issue?
>     Unfortunately I cannot reproduce this behavior right now so cannot
>     verify it myself.

Unlikely.  I don't believe the data portion of the RGMII link to the
MAC, which is what these clock skew settings affect, has any effect on
auto-negotiation.  And indeed I can program entirely non-functional
values for delay and see A/N proceed as normal.

If the delay is off slightly, you will see TX or RX (depending on which
delay) packet error rate go up.  On my board, I see about a 50 ps range
over which the error rates goes from virtually 0 to 100%.  There is
about a 200 ps range over which the error rate is 0.  I imagine that
over a temperature range, that 200 ps range is smaller.

I did recently diagnose a problem where A/N was several seconds slower
than expected.  It had to do with the link partner being an Intel PHY
which had "ultra low power mode" enabled.  This is some feature to
reduce power when there is no link.  If the link to the intel phy was
not up, i.e. a direct connect from my device (powered off) to a PC, not
through a switch, then link up would first A/N to 10 mbps mode, not
work, then drop, then come up as 1000 mbps and work.  This took about
7-8 seconds instead of about 3 seconds.  With a switch interposed
between the devices, the Intel PHY does not see a down link (the switch
is on), so this doesn't happen.  Probably not your problem, as I could
only see this in u-boot by the time Linux has booted the phy will have
activated the link and gotten past this screwy 10 mbps thing.
