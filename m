From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Mon, 26 Feb 2018 17:34:13 +0300
Subject: [PATCH 2/2 v3] mmc: dw_mmc: Fix the CTO overflow calculation for
 32-bit systems
In-Reply-To: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
References: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180226143413.44134-3-Evgeniy.Didin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In commit 4c2357f57dd5 ("mmc: dw_mmc: Fix the CTO timeout calculation")
have been made changes which can cause multiply overflow for 32-bit systems.
The value of cto_ms is lower the drto_ms, but nevertheless overflow can occur.
Lets cast this multiply to u64 type which prevents overflow.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>

CC: Alexey Brodkin <abrodkin at synopsys.com>
CC: Eugeniy Paltsev <paltsev at synopsys.com>
CC: Douglas Anderson <dianders at chromium.org>
CC: Ulf Hansson <ulf.hansson at linaro.org>
CC: linux-kernel at vger.kernel.org
CC: linux-snps-arc at lists.infradead.org
Cc: <stable at vger.kernel.org> #  4c2357f57dd5 mmc: dw_mmc: Fix the CTO timeout calculation
---
 drivers/mmc/host/dw_mmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 194159219b32..775fb3ae1443 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -409,7 +409,8 @@ static inline void dw_mci_set_cto(struct dw_mci *host)
 	cto_div = (mci_readl(host, CLKDIV) & 0xff) * 2;
 	if (cto_div == 0)
 		cto_div = 1;
-	cto_ms = DIV_ROUND_UP(MSEC_PER_SEC * cto_clks * cto_div, host->bus_hz);
+
+	cto_ms = DIV_ROUND_UP((u64)MSEC_PER_SEC * cto_clks * cto_div, host->bus_hz);
 
 	/* add a bit spare time */
 	cto_ms += 10;
-- 
2.11.0
