From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 2 Feb 2016 12:48:28 +0000
Subject: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
In-Reply-To: <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454417306.25997.5.camel@synopsys.com>
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

> +Required properties:
> +
> +- compatible : should be "snps,arc-timer0"
> +- interrupts : single Interrupt going into parent intc
> +	       (16 for ARCHS cores, 3 for ARC700 cores)
> +- clocks     : phandle to the source clock
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

Even though this is an example maybe we may
use the same "core_clk" as in real .dts below?

-Alexey
