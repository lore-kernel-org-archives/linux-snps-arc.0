From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 13 May 2016 18:40:15 +0530
Subject: [RESEND PATCH 2/2 v6] arc: axs10x: Add DT bindings for I2S PLL
 Clock
In-Reply-To: <57305472.2000507@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
 <57305472.2000507@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5735D237.1060700@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 09 May 2016 02:42 PM, Jose Abreu wrote:
> Can you apply this to arc-next? Main driver was already merged into clk-next. We
> still have to check how to deal with the parent clock frequency that will change
> in the next firmware release.

Done ! although note that this might *not* be bisectable if this goes ahead of
driver in 4.7-rc1 !
