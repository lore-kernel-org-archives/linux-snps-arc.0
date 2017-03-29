From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Wed, 29 Mar 2017 11:20:46 +0000
Subject: [PATCH v2] clk/axs10x: introduce AXS10X pll driver
In-Reply-To: <20170303235005.GV25384@codeaurora.org>
References: <1487682670-4164-1-git-send-email-vzakhar@synopsys.com>
 <1488547113.2557.44.camel@synopsys.com>
 <20170303235005.GV25384@codeaurora.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490786446.32756.4.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Stephen, Michael,

On Fri, 2017-03-03@15:50 -0800, Stephen Boyd wrote:
> On 03/03, Vlad Zakharov wrote:
> > 
> > Hi Michael, Stephen,
> > 
> > On Tue, 2017-02-21@16:11 +0300, Vlad Zakharov wrote:
> > > 
> > > AXS10X boards manages it's clocks using various PLLs. These PLL has same
> > > dividers and corresponding control registers mapped to different addresses.
> > > So we add one common driver for such PLLs.
> > > 
> > > Each PLL on AXS10X board consist of three dividers: IDIV, FBDIV and
> > > ODIV. Output clock value is managed using these dividers.
> > > 
> > > We add pre-defined tables with supported rate values and appropriate
> > > configurations of IDIV, FBDIV and ODIV for each value.
> > > 
> > > As of today we add support for PLLs that generate clock for the
> > > following devices:
> > > ?* ARC core on AXC CPU tiles.
> > > ?* ARC PGU on ARC SDP Mainboard.
> > > and more to come later.
> > > 
> > > Acked-by: Rob Herring <robh at kernel.org>
> > > Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> > > Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> > > Cc: Michael Turquette <mturquette at baylibre.com>
> > > Cc: Stephen Boyd <sboyd at codeaurora.org>
> > > Cc: Mark Rutland <mark.rutland at arm.com>
> > 
> > Maybe you have any comments or remarks about this patch? And if you don't could you please apply it.
> > 
> 
> I haven't reviewed it yet. The merge window is upon us right now
> so I'll probably get to going through the queue this weekend/next
> week.
> 

Please treat this message as a polite reminder to review my patch.
It is required for some subsystems on our boards, e.g. for ARC PGU.

Thanks.

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
