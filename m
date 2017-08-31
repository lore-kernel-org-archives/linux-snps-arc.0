From: sboyd@codeaurora.org (Stephen Boyd)
Date: Wed, 30 Aug 2017 22:38:00 -0700
Subject: [PATCH v4] ARC: clk: introduce HSDK pll driver
In-Reply-To: <20170825173914.32121-1-Eugeniy.Paltsev@synopsys.com>
References: <20170825173914.32121-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170831053800.GC21656@codeaurora.org>
To: linux-snps-arc@lists.infradead.org

On 08/25, Eugeniy Paltsev wrote:
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

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
