From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 5 Sep 2017 15:37:48 +0000
Subject: Setting CPU clock frequency on early boot
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504625867.32565.34.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

I'd like to get some feedback on our idea as well as check
if somebody faces similar situations and if so what would be the best
way to implement some generic solution that suits everyone.

So that's our problem:
1. On power-on hardware might start clocking CPU with either
? ?too high frequency (such that CPU may get stuck at some point)
? ?or too low frequency.

? ?That all sounds stupid but let me elaborate a bit here.
? ?I'm talking about FPGA-based devboards firmware for which
? ?(here I mean just image loaded in FPGA with CPU implementation
? ?but not some software yet) might not be stable or be even experimental.

? ?For example we may deal with dual-core or quad-core designs.
? ?Former might be OK running @100MHz and latter is only usable
? ?@75MHz and lower. The simplest solution might be to use some safe
? ?value before something like CPUfreq kicks in. But we don't yet have
? ?CPUfreq for ARC (we do plan to get it working sometime soon) which
? ?means simple change of CPU frequency once time-keeping infrastructure
? ?was brought-up is not an option... I.e. we'll end up with the system running
? ?much slower compared what could have been possible.

2. Up until now we used to do dirty hacks in early platform init code.
? ?Namely (see?axs103_early_init() in?arch/arc/plat-axs10x/axs10x.c):
? ? 1) Read CPU's "clock-frequency" from .dtb (remember we're on very early
? ? ? ?boot stage still so no expanded DevTree yet exists).
? ? 2) Check how many cores we have and which freq is usable
? ? 3) Update PLL settings right in place if new freq != existing in PLL.

? ?Even though it is proven to work but with more platforms in the pipeline
? ?we'll need to copy-paste pretty much the same stuff across all affected
? ?plats. Which is not nice.

? ?Moreover back in the day we didn't have a proper clk driver for CPU's PLL.
? ?Thus acting on PLL registers right in place was the only thing we were able
? ?to do. Now with introduction of normal clk driver
? ?(see?drivers/clk/axs10x/pll_clock.c in linux-next) we'd like to utilize
? ?it and have a cleaner and more universal solution to the problem.

? ?That's how it could be done -?http://patchwork.ozlabs.org/patch/801240/
? ?Basically in architecture's time_init() we check if there's explicitly
? ?specified "clock-frequency" parameter in cpu's node in Device Tree and
? ?if there's one we set it via just instantiated clk driver.

We may indeed proceed with mentioned solution for ARC but if that makes
sense for somebody else it might worth getting something similar in generic
init code. Any thoughts?

All comments and suggestions are more than welcome.

-Alexey
