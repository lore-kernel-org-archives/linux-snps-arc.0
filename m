From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Thu, 15 Mar 2018 17:24:09 +0000
Subject: [PATCH] mmc: dw_mmc: fix falling from idmac to PIO mode when
 dw_mci_reset occurs
In-Reply-To: <CAPDyKFp--bHg8PH7om7TTY15m0CRw3i4eO1=StRnVofxnf50OQ@mail.gmail.com>
References: <20180314193051.16791-1-Evgeniy.Didin@synopsys.com>
 <CAPDyKFrgBm8-G1CsnqS9G62xFA2qA0XkuGBfA5v6grZnjRLteA@mail.gmail.com>
 <1521119909.10304.1.camel@synopsys.com>
 <CAPDyKFp--bHg8PH7om7TTY15m0CRw3i4eO1=StRnVofxnf50OQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521134649.10304.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2018-03-15@14:39 +0100, Ulf Hansson wrote:
> On 15 March 2018@14:18, Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:
> > Hello Ulf,
> > 
> > On Thu, 2018-03-15@10:57 +0100, Ulf Hansson wrote:
> > > On 14 March 2018@20:30, Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:
> > > > It was found that in IDMAC mode after soft-reset driver switches
> > > > to PIO mode.
> > > > 
> > > > That's what happens in case of DTO timeout overflow calculation failure:
> > > > 1. soft-reset is called
> > > > 2. driver restarts dma
> > > > 3. descriptors states are checked, one of descriptor is owned by the IDMAC.
> > > > 4. driver can't use DMA and then switches to PIO mode.
> > > > 
> > > > Failure was already fixed in:
> > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_linux-2Dmmc_msg48125.html&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujh
> > > > osYI
> > > > TtAw&m=6rPWpKUYQD3kY-2OEikJUWyEJvwKJljWHFC8rd2TCak&s=JjX0Dx8-eSyW2cATMsnG1eAzrKgoDkS1bcS5XYrVtlE&e=.
> > > 
> > > Evgeniy,
> > > 
> > > It seems like I should squash this fix into the above commit? Makes sense?
> > 
> > IMHO it is not a good idea, because this fix is orthogonal to the above commit.
> > Debugging drto overflow issue we found this strange behavior.
> 
> Okay! Thanks for clarifying.
> 
> > This might be general issue of soft-reset. So I think this should be separate patch.
> > Also if these patches are independent, it will be easier to backport them.
> 
> Should I add a stable tag then?

Sure. The issue can happen since v3.17, because starting with this version function dw_mci_reset was implemented.
Commit 3a33a94ce270 ("mmc: dw_mmc: change to use recommended reset procedure").

Best regards,
Evgeniy Didin
