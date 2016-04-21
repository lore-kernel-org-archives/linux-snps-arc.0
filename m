From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 21 Apr 2016 14:15:55 +0000
Subject: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <5718D13B.2040906@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
 <5714C9BA.8040004@synopsys.com> <5715F6AC.7090501@synopsys.com>
 <20160420015451.GH15324@codeaurora.org> <5717503F.7020806@synopsys.com>
 <1461168765.3149.31.camel@synopsys.com> <5718A298.50601@synopsys.com>
 <1461241114.2928.4.camel@synopsys.com> <5718D13B.2040906@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461248149.2928.26.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Thu, 2016-04-21@14:10 +0100, Jose Abreu wrote:
> Hi Alexey,
> 
> 
> On 21-04-2016 13:18, Alexey Brodkin wrote:
> > 
> > Hi Jose,
> > 
> > On Thu, 2016-04-21@10:51 +0100, Jose Abreu wrote:
> > > 
> > > Hi Alexey,
> > >?
> > Ok reference clock will change.
> > But I may guess we'll still be able to determine at least that new
> > firmware version in run-time, right? If so we'll update a fix-up in
> > early axs10x platform code so that reference clock will be set as 28224000 Hz.
> Yes, there is a register where the FPGA version date is encoded, we can use that
> to check which firmware is used (if date <= old_firmware_date then
> clock=27000000; else clock=28224000). If that fix is acceptable it could be a
> good solution without having to use custom parameters in the DT (no need to
> encode the different clocks and we would only use one master clock) but I am not
> sure where and how this can be encoded and I don't know how to change the DT on
> runtime. Can you give me some guidelines?

Take a look here -?http://git.kernel.org/cgit/linux/kernel/git/vgupta/arc.git/commit/arch/arc/plat-axs10x/axs10x.c?h=for
-next&id=5cd0f5102753a7405548d0c66c11a2a0a05bbf2e

We do something very similar here - we're patching in run-time
core frequency that was specified in .dts.

And in the very same way one will be able to do fix-ups for other
clocks.

Moreover I would propose to think about that fix-up as of completely
separate topic. I.e. in your driver for AXS' I2S clock just use a new
reference "fixed-clock" (that you'll add in "axs10x_mb.dtsi" as a part of
your driver submission). And once your driver gets accepted we'll work on
fix-up in axs10x platform.

This way we'll move with smaller steps and hopefully will get things done
sooner.

> > And indeed 2 DT files is a no go - we want to run the same one binary
> > (with built-in .dtb) on all flavors of AXS boards. And fix-up I'm talking about
> > will actually do transformation of .dtb early on kernel boot process so that will
> > be a complete equivalent of different DT files.
> And doing modifications on the DT can cause some misdirections to users.

What do you mean here? What kind of problems do you expect to face?

> Besides, we would have clock specific functions in init procedures which is
> precisely what we are trying to avoid by submitting this driver.

You're talking about fixups above here?

-Alexey
