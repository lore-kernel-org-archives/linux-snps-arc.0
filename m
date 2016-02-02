From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 2 Feb 2016 15:36:14 +0000
Subject: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
In-Reply-To: <56B0BD2F.5080409@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
 <1454418916.25997.18.camel@synopsys.com> <56B0BD2F.5080409@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454427373.25997.24.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Tue, 2016-02-02@19:59 +0530, Vineet Gupta wrote:
> Hi Alexey,
> 
> On Tuesday 02 February 2016 06:45 PM, Alexey Brodkin wrote:
> > Hi Vineet,
> > 
> > On Tue, 2016-02-02@16:28 +0530, Vineet Gupta wrote:
> > > +
> > > +Required properties:
> > > +
> > > +- compatible : should be "snps,arc-timer0"
> > > +- interrupts : single Interrupt going into parent intc
> > > +	       (16 for ARCHS cores, 3 for ARC700 cores)
> > > +- clocks     : phandle to the source clock
> > 
> > Actually we're not flexible here.
> > See we have hard-coded "core_clk" in [PATCH 8/9].
> > We use it directly in show_cpuinfo() for reading clock speed
> > as well as in axs103_early_init().
> > 
> > So "source clock" here MUST be "core_clk", otherwise
> > /proc/cpuinfo will report junk instead of meaningful data at least.
> 
> Using hardcoded DT names in generic code is total BS and I slap myself for missing
> that in reviewing 8/9. Please fix it !

But the only other alternative to hard-coded name is use of some internal variable
like "arc_timer_freq".

I.e. we make "arc_timer_freq" global and use it for displaying core frequency.

Are you OK with that?

-Alexey
