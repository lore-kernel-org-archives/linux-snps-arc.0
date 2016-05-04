From: robh@kernel.org (Rob Herring)
Date: Tue, 3 May 2016 21:34:13 -0500
Subject: [RESEND PATCH 1/2 v6] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160504023413.GA9595@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Mon, May 02, 2016@10:39:05AM +0100, Jose Abreu wrote:
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
> Changes v5 -> v6:
> * Use parent clock to determine PLL input rate instead of using hardcoded values
> * Documentation update (added 'clocks' field)
> 
> Changes v4 -> v5:
> * Documentation update (as suggested by Alexey Brodkin)
> * Changed compatible string to "snps,axs10x-i2s-pll-clock" (as suggested by Alexey Brodkin)
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
> 
> Cc: Carlos Palminha <palminha at synopsys.com>
> Cc: Rob Herring <robh at kernel.org>
> Cc: Pawel Moll <pawel.moll at arm.com>
> Cc: Mark Rutland <mark.rutland at arm.com>
> Cc: Ian Campbell <ijc+devicetree at hellion.org.uk>
> Cc: Kumar Gala <galak at codeaurora.org>
> Cc: Michael Turquette <mturquette at baylibre.com>
> Cc: Stephen Boyd <sboyd at codeaurora.org>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Cc: devicetree at vger.kernel.org
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-clk at vger.kernel.org
> 
>  .../bindings/clock/axs10x-i2s-pll-clock.txt        |  25 +++

Acked-by: Rob Herring <robh at kernel.org>

>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/axs10x/Makefile                        |   1 +
>  drivers/clk/axs10x/i2s_pll_clock.c                 | 228 +++++++++++++++++++++
>  4 files changed, 255 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
>  create mode 100644 drivers/clk/axs10x/Makefile
>  create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c
