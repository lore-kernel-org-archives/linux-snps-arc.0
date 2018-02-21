From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Wed, 21 Feb 2018 20:57:33 +0300
Subject: [PATCH] mmc: dw_mmc: Fix the DTO timeout overflow calculation for
 32-bit systems
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180221175734.39114-1-Evgeniy.Didin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In commit 9d9491a7da2a ("mmc: dw_mmc: Fix the DTO timeout calculation") have been made
changes which can cause multiply overflow for 32-bit systems. It was caught on arc/hsdk board
when "drto_ms" should be 671, but it was 70 and that caused a flow of stack-traces just copying
file from mmc.

Lets cast this multiply to long long int which prevents overflow.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
CC: Alexey Brodkin <abrodkin at synopsys.com>
CC: Douglas Anderson <dianders at chromium.org>
CC: Ulf Hansson <ulf.hansson at linaro.org>
CC: linux-kernel at vger.kernel.org
CC: linux-snps-arc at lists.infradead.org
---
 drivers/mmc/host/dw_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 0aa39975f33b..1a0b9751c67c 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1944,7 +1944,7 @@ static void dw_mci_set_drto(struct dw_mci *host)
 	drto_div = (mci_readl(host, CLKDIV) & 0xff) * 2;
 	if (drto_div == 0)
 		drto_div = 1;
-	drto_ms = DIV_ROUND_UP(MSEC_PER_SEC * drto_clks * drto_div,
+	drto_ms = DIV_ROUND_UP((uint64_t)MSEC_PER_SEC * drto_clks * drto_div,
 			       host->bus_hz);
 
 	/* add a bit spare time */
-- 
2.11.0
