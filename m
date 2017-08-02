From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 2 Aug 2017 07:16:39 +0000
Subject: snps,dwmac interrupt storm (Was: ARC770: "unexpected IRQ trap
 at vector 00" during boot)
In-Reply-To: <f8fe08e7-aafb-6dfa-48b7-56c7bcd8f66a@synopsys.com>
References: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
 <4881796E12491D4BB15146FE0209CE6467DBE119@DE02WEMBXB.internal.synopsys.com>
 <5422227b-6ca3-b4f4-91a6-b760a4b98861@adaptrum.com>
 <4881796E12491D4BB15146FE0209CE6467DBED94@DE02WEMBXB.internal.synopsys.com>
 <222b10ef-2bd6-9212-5982-427854f0c19c@synopsys.com>
 <0c96e559-d0a8-8b1c-96e4-63799fb13d57@adaptrum.com>
 <f8fe08e7-aafb-6dfa-48b7-56c7bcd8f66a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1501658198.6345.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alex,

On Wed, 2017-08-02@11:53 +0530, Vineet Gupta wrote:
> On 08/02/2017 03:03 AM, Alex wrote:
> > 
> > On 07/25/2017 08:08 PM, Vineet Gupta wrote:
> > 
> > Hi Vineet,
> > 
> > > 
> > > On 07/26/2017 01:41 AM, Alexey Brodkin wrote:
> > > > 
> > > > BTW what is your exact kernel version?
> > > > 
> > > > In the meantime we'll try to revisit rework of ARC's INTC init
> > > > procedure??but
> > > > I cannot promise anything very soon as I'm on ETO this week but we'll
> > > > see how it goes.
> > > 
> > > And exactly do we intend to rework - AFAIK nothings really broken at the
> > > moment in ARC intc handling !
> > 
> > I have tried the workarouns I mentioned on top of linux 4.9.34, and it works?
> > exactly as expected. however, on top of 4.13-rc3 [1], the story is a lot?
> > different. As soon as I release the GMAC from reset, the boot stops. I can?
> > single-step through JTAG, and see that the GMAC sends an interrupt storm. The?
> > kernel doesn't have time to move on with the dwmac initialization and register the?
> > interrupt, and that's that.

The only guess I have given mentioned symptoms is you're somehow affected by
90f522a20e3d "NET: dwmac: Make dwmac reset unconditional", see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=90f522a20e3d16d153e5a5f84cf4ff92281ee417

I guess what happens in 4.13-rc3 with that patch in place your previous work-around
gets reset together with GMAC on driver probe.

So just try to revert that patch for a moment and let me know if that was the case.

-Alexey
