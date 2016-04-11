From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 11 Apr 2016 16:47:51 +0000
Subject: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1460393270.5119.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2016-04-11@11:41 +0100, Jose Abreu wrote:
> The ARC SDP I2S clock can be programmed using a
> specific PLL.
> 
> This patch has the goal of adding a clock driver
> that programs this PLL.
> 
> At this moment the rate values are hardcoded in
> a table but in the future it would be ideal to
> use a function which determines the PLL values
> given the desired rate.
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> ---
> 
> Changes v3 -> v4:
> * Added binding document (as suggested by Stephen Boyd)
> * Minor code style fixes (as suggested by Stephen Boyd)
> * Use ioremap (as suggested by Stephen Boyd)
> * Implement round_rate (as suggested by Stephen Boyd)
> * Change to platform driver (as suggested by Stephen Boyd)
> * Use {readl/writel}_relaxed (as suggested by Vineet Gupta)
> 
> Changes v2 -> v3:
> * Implemented recalc_rate
> 
> Changes v1 -> v2:
> * Renamed folder to axs10x (as suggested by Alexey Brodkin)
> * Added more supported rates

[snip]

> diff --git a/Documentation/devicetree/bindings/clock/i2s-pll-clock.txt b/Documentation/devicetree/bindings/clock/i2s-
> pll-clock.txt
> new file mode 100644
> index 0000000..ff86a41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/i2s-pll-clock.txt
> @@ -0,0 +1,17 @@
> +Binding for the AXS10X I2S PLL clock
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible: shall be "snps,i2s-pll-clock"
> +- #clock-cells: from common clock binding; Should always be set to 0.
> +- reg : Address and length of the I2S PLL register set.
> +
> +Example:
> +	clock at 0x100a0 {

Please remove "0x" from node name.

> +		compatible = "snps,i2s-pll-clock";
> +		reg = <0x100a0 0x10>;
> +		#clock-cells = <0>;
> +	};
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 46869d6..2ca62dc6 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -84,3 +84,4 @@ obj-$(CONFIG_X86)			+= x86/
> ?obj-$(CONFIG_ARCH_ZX)			+= zte/
> ?obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
> ?obj-$(CONFIG_H8300)		+= h8300/
> +obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
> diff --git a/drivers/clk/axs10x/Makefile b/drivers/clk/axs10x/Makefile
> new file mode 100644
> index 0000000..01996b8
> --- /dev/null
> +++ b/drivers/clk/axs10x/Makefile
> @@ -0,0 +1 @@
> +obj-y += i2s_pll_clock.o
> diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pll_clock.c
> new file mode 100644
> index 0000000..3ba4e2f
> --- /dev/null
> +++ b/drivers/clk/axs10x/i2s_pll_clock.c
> @@ -0,0 +1,217 @@
> +/*
> + * Synopsys AXS10X SDP I2S PLL clock driver
> + *
> + * Copyright (C) 2016 Synopsys
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/device.h>

"linux/platform_device.h" includes "linux/device.h" so you may make this list of headers
a little bit shorter.

> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>

"linux/of_address.h" already includes "linux/of.h".

[snip]

> +
> +static const struct of_device_id i2s_pll_clk_id[] = {
> +	{ .compatible = "snps,i2s-pll-clock", },

I would think that it makes sense to add the board name in
this compatible string. So something like?"snps,axs10x-i2s-pll-clock"
IMHO looks much more informative.

Also adding Rob Herring and DT mailing list in Cc.
Please make sure Rod acks your bindings and corresponding docs.

-Alexey
