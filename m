From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 2 Feb 2016 13:15:17 +0000
Subject: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
In-Reply-To: <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454418916.25997.18.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Tue, 2016-02-02@16:28 +0530, Vineet Gupta wrote:
> ARC Timers have historically been probed directly.
> As precursor to start probing Timers thru DT introduce these bindings
> 
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Rob Herring <robh at kernel.org>
> Cc: devicetree at vger.kernel.org
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
> b/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
> new file mode 100644
> index 000000000000..ceb80c72a90b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
> @@ -0,0 +1,23 @@
> +Synopsys ARC Local Timer with Interrupt Capabilities
> +- Found on all ARC CPUs (ARC700/ARCHS)
> +- Mandatory clockevent provider
> +
> +Required properties:
> +
> +- compatible : should be "snps,arc-timer0"
> +- interrupts : single Interrupt going into parent intc
> +	       (16 for ARCHS cores, 3 for ARC700 cores)
> +- clocks     : phandle to the source clock

Actually we're not flexible here.
See we have hard-coded "core_clk" in [PATCH 8/9].
We use it directly in show_cpuinfo() for reading clock speed
as well as in axs103_early_init().

So "source clock" here MUST be "core_clk", otherwise
/proc/cpuinfo will report junk instead of meaningful data at least.


> +
> +Optional properties:
> +
> +- interrupt-parent : phandle to parent intc
> +
> +Example:
> +
> +	timer0: timer_clkevt {
> +		compatible = "snps,arc-timer0";
> +		interrupts = <3>;
> +		interrupt-parent = <&core_intc>;
> +		clocks = <&timer0_clk>;
> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
> b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
> new file mode 100644
> index 000000000000..4886192ce2f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
> @@ -0,0 +1,17 @@
> +Synopsys ARC Free Running Local 32-bit Timer
> +- Found on all ARC CPUs (ARC700/ARCHS)
> +- Mandatory clocksource provider on ARC700
> +- Optional clocksource provider on UP ARC HS CPUs
> +  (and if better timer archs-rtc not available in SoC)
> +
> +Required properties:
> +
> +- compatible : should be "snps,arc-timer1"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,arc-timer1";
> +		clocks = <&timer0_clk>;

Ditto, "clocks = <&core_clk>".

> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> new file mode 100644
> index 000000000000..cce60e16aa0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> @@ -0,0 +1,14 @@
> +Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
> +- clocksourc provider for SMP SoC
> +
> +Required properties:
> +
> +- compatible : should be "snps,archs-gfrc"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,archs-gfrc";
> +		clocks = <&timer0_clk>;

Ditto, "clocks = <&core_clk>".

> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> new file mode 100644
> index 000000000000..f3b49938812b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> @@ -0,0 +1,14 @@
> +Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
> +- clocksourc provider for UP SoC
> +
> +Required properties:
> +
> +- compatible : should be "snps,archs-rtc"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,arc-rtc";
> +		clocks = <&timer0_clk>;
> +	};
> diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
> index cfb5052239a1..f9f138efa92c 100644
> --- a/arch/arc/boot/dts/abilis_tb10x.dtsi
> +++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
> @@ -35,6 +35,18 @@
>  		};
>  	};
>  
> +	timer0: timer_clkevt {
> +		compatible = "snps,arc-timer0";
> +		interrupts = <3>;
> +		interrupt-parent = <&intc>;
> +		clocks = <&cpu_clk>;
>
> +	};
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,arc-timer1";
> +		clocks = <&cpu_clk>;
> +	};
> +

Hm now that's a question how to fix /proc/cpuinfo output
for Abilis? There's no "core_clk" DTS node for Abilis and so
show_cpuinfo() won't get proper clock value.

Probably we may fix it with modification of their "pll" node
from
------------------------>8----------------------
		pll0: oscillator {
			clock-frequency  = <1000000000>;
		};
------------------------>8----------------------

to
------------------------>8----------------------
		core_clk: oscillator {
			clock
-frequency  = <1000000000>;
		};
------------------------>8----------------------

-Alexey
