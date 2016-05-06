From: sboyd@codeaurora.org (Stephen Boyd)
Date: Fri, 6 May 2016 10:35:31 -0700
Subject: [RESEND PATCH 1/2 v6] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160506173531.GU3492@codeaurora.org>
To: linux-snps-arc@lists.infradead.org

On 05/02, Jose Abreu wrote:
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

Applied to clk-next

I'm not applying the arc dts file (patch #2 in this series).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
