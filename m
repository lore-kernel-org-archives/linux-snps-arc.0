From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 25 Aug 2017 11:16:35 -0700
Subject: [PATCH v4] ARC: clk: introduce HSDK pll driver
In-Reply-To: <20170825173914.32121-1-Eugeniy.Paltsev@synopsys.com>
References: <20170825173914.32121-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <808b0f38-f899-268a-94f9-f73885896b5d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/25/2017 10:39 AM, Eugeniy Paltsev wrote:
> HSDK board manages its clocks using various PLLs. These PLL have same
> dividers and corresponding control registers mapped to different addresses.
> So we add one common driver for such PLLs.
>
> Each PLL on HSDK board consists of three dividers: IDIV, FBDIV and
> ODIV. Output clock value is managed using these dividers.
>
> We add pre-defined tables with supported rate values and appropriate
> configurations of IDIV, FBDIV and ODIV for each value.
>
> As of today we add support for PLLs that generate clock for the
> HSDK arc cpus, system, ddr, AXI tunnel and hdmi.
>
> By this patch we add support for several plls (arc cpus pll and others),
> so we had to use two different init types: CLK_OF_DECLARE for arc cpus pll
> and regular probing for others plls.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v3 -> v4:
>   * Rename HSDKv1 to HSDK
>
> Changes v2 -> v3:
>   * Add special management of arc core interface divider.
>
> Changes v1 -> v2:
>   * Remove all MODULE* defines as this driver can't be build as module.
>   * Simplified hsdk_pll_is_err and hsdk_pll_is_locked functions.
>   * Use unsigned long fo best_rate in hsdk_pll_round_rate.
>   * Use of_clk_get_parent_count to get num_parents.
>   * Other small changes.
>
>   .../bindings/clock/snps,hsdk-pll-clock.txt         |  28 ++
>   MAINTAINERS                                        |   6 +
>   drivers/clk/Kconfig                                |   7 +
>   drivers/clk/Makefile                               |   1 +
>   drivers/clk/clk-hsdk-pll.c                         | 431 +++++++++++++++++++++
>   5 files changed, 473 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/snps,hsdk-pll-clock.txt
>   create mode 100644 drivers/clk/clk-hsdk-pll.c

Reviewed-by: Vineet Gupta <vgupta at synopsys.com>

P.S. Stephen I'd be nice if this can make it into 4.14 as we are slated to add the 
hasdk platform support in there.

Thx,
-Vineet
