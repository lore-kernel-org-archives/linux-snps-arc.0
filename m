From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 14 May 2019 18:22:21 +0000
Subject: [PATCH] ARC: [hsdk]  Use rgmii-id mode for ethernet phy
In-Reply-To: <20190514173941.20046-1-tpiepho@impinj.com>
References: <20190514173941.20046-1-tpiepho@impinj.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB01201A8B76EE3A4D2094B646A1080@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Trent,

> -----Original Message-----
> From: Trent Piepho <tpiepho at impinj.com>
> Sent: Tuesday, May 14, 2019 8:40 PM
> To: linux-snps-arc at lists.infradead.org
> Cc: Trent Piepho <tpiepho at impinj.com>; Alexey Brodkin <abrodkin at synopsys.com>; Vineet Gupta
> <vgupta at synopsys.com>
> Subject: [PATCH] ARC: [hsdk] Use rgmii-id mode for ethernet phy
> 
> If internal delays are desired on the RGMII link, "rgmii-id" should be
> used as the phy-mode rather than "rgmii" .
> 
> This dts has properties to set the delay values, but they are ignored.
> I suspect this is a mistake.
> 
> While the driver should disable delay based on the current DT, it does
> not, and instead leaves the PHY in the pin strapping default.  Which is
> usually to have delays very close to the unused values the hsdk DT.
> Which is why the phy would work even if the delays in the DT are
> ignored.

Thanks for this patch!

Indeed there might very well be something incomplete in that .dts
as I didn't know all those details.

I did check and Micrel KSZ9031 Gigabit PHY on HSDK supports on-chip delay.
That's what its datasheet says:
------------------->8------------------
RGMII Timing Supports On-Chip Delay According to RGMII Version 2.0,
with Programming Options for External Delay and Making Adjustments
and Corrections to TX and RX Timing Paths.
------------------->8------------------

And with proposed change I don't see any regressions so far, which is good.

Still a couple of questions:
 1. How did you spot this problem?
 2. With some Ethernet cards (especially 1Gb ones) on the other end we do see
    from time to time auto-negotiation takes that much time that
    udhcpc fails to get a lease because 3 discovery packets sent in
    a row get lost since link is not established (i.e. > 5 seconds).
    Do you think if it has something to do with that particular issue?
    Unfortunately I cannot reproduce this behavior right now so cannot
    verify it myself.

-Alexey
