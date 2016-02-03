From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 3 Feb 2016 13:50:28 +0000
Subject: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
In-Reply-To: <1454507041.3375.39.camel@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
 <1454418916.25997.18.camel@synopsys.com> <56B0BD2F.5080409@synopsys.com>
 <1454427373.25997.24.camel@synopsys.com>
 <1454453846.25997.31.camel@synopsys.com>
 <1454507041.3375.39.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454507428.3375.44.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

(re-sending because Mike's email @ti is no longer valid)

Hi Mike,

On Wed, 2016-02-03@01:57 +0300, Alexey Brodkin wrote:
> Hi Vineet,
> 
> On Tue, 2016-02-02@18:36 +0300, Alexey Brodkin wrote:
> > Hi Vineet,
> > 
> > On Tue, 2016-02-02@19:59 +0530, Vineet Gupta wrote:
> > > Hi Alexey,
> > > 
> > > On Tuesday 02 February 2016 06:45 PM, Alexey Brodkin wrote:
> > > > Hi Vineet,
> > > > 
> > > > On Tue, 2016-02-02@16:28 +0530, Vineet Gupta wrote:
> > > > > +
> > > > > +Required properties:
> > > > > +
> > > > > +- compatible : should be "snps,arc-timer0"
> > > > > +- interrupts : single Interrupt going into parent intc
> > > > > +            (16 for ARCHS cores, 3 for ARC700 cores)
> > > > > +- clocks     : phandle to the source clock
> > > > 
> > > > Actually we're not flexible here.
> > > > See we have hard-coded "core_clk" in [PATCH 8/9].
> > > > We use it directly in show_cpuinfo() for reading clock speed
> > > > as well as in axs103_early_init().
> > > > 
> > > > So "source clock" here MUST be "core_clk", otherwise
> > > > /proc/cpuinfo will report junk instead of meaningful data at least.
> > > 
> > > Using hardcoded DT names in generic code is total BS and I slap myself for missing
> > > that in reviewing 8/9. Please fix it !
> > 
> > But the only other alternative to hard-coded name is use of some internal variable
> > like "arc_timer_freq".
> > 
> > I.e. we make "arc_timer_freq" global and use it for displaying core frequency.
> 
> Well actually there's another possibility that is used on many other platforms
> (ARM both 32 and 64-bit flavors is a good example) - just print bogomips instead
> of additional core frequency.

We're in the process of switching ARC to generic clk framework.

One of the problems we're trying to solve now is how to obtain
precise CPU frequency value for outputting it for example by /proc/cpuinfo.

This precise (in terms of what value was set via Device Tree or extracted and decoded
from CPU configuration registers) CPU frequency is very useful for example for
benchmarking. In comparison bogomips might be misleading at times.

Before moving to clk framework we used to have 2 ARC-specific calls
arc_get_core_freq() and  arc_set_core_freq() which were basically wrappers for
one variable where we stored CPU frequency.

I took a look at what other architectures do and so far saw these options:
 [1] Just print bogomips (ARM both 32- and 64-bit, m64k, Microblaze, Mips,
                          mn10300, openrisc, s390, sh, um, unicore32, )
 [2] Get frequency from some kind of architecture-specific structure or variable
     (Alpha, AVR32, c6x, nios2, powerpc, sparc, tile, xtensa) 
 [3] Get frequency from cpufreq framework (ia64, x86)
 [4] Decode frequency from hardware registers (Blackfin)

Any thoughts on what's the best way to get CPU frequency in run-time
(preferably with use of clk framework so we'll need no arch-specific
variables)?

Regards,
Alexey
