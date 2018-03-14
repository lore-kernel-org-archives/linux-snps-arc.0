From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Wed, 14 Mar 2018 22:30:51 +0300
Subject: [PATCH] mmc: dw_mmc: fix falling from idmac to PIO mode when
 dw_mci_reset occurs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180314193051.16791-1-Evgeniy.Didin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It was found that in IDMAC mode after soft-reset driver switches 
to PIO mode.

That's what happens in case of DTO timeout overflow calculation failure:
1. soft-reset is called
2. driver restarts dma
3. descriptors states are checked, one of descriptor is owned by the IDMAC.
4. driver can't use DMA and then switches to PIO mode.

Failure was already fixed in: 
https://www.spinics.net/lists/linux-mmc/msg48125.html.

Behaviour while soft-reset is not something we except or 
even want to happen. So we switch from dw_mci_idmac_reset
to dw_mci_idmac_init, so descriptors are cleaned before starting dma. 

And while at it explicitly zero des0 which otherwise might
contain garbage as being allocated by dmam_alloc_coherent().

Signed-off-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
Cc: Jaehoon Chung <jh80.chung at samsung.com>
Cc: Ulf Hansson <ulf.hansson at linaro.org>
Cc: Andy Shevchenko <andy.shevchenko at gmail.com>
Cc: Jisheng Zhang <Jisheng.Zhang at synaptics.com>
Cc: Shawn Lin <shawn.lin at rock-chips.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
---
 drivers/mmc/host/dw_mmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 0aa39975f33b..26f2ac107702 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -558,6 +558,7 @@ static int dw_mci_idmac_init(struct dw_mci *host)
 					(sizeof(struct idmac_desc_64addr) *
 							(i + 1))) >> 32;
 			/* Initialize reserved and buffer size fields to "0" */
+			p->des0 = 0;
 			p->des1 = 0;
 			p->des2 = 0;
 			p->des3 = 0;
@@ -580,6 +581,7 @@ static int dw_mci_idmac_init(struct dw_mci *host)
 		     i++, p++) {
 			p->des3 = cpu_to_le32(host->sg_dma +
 					(sizeof(struct idmac_desc) * (i + 1)));
+			p->des0 = 0;
 			p->des1 = 0;
 		}
 
@@ -1795,8 +1797,8 @@ static bool dw_mci_reset(struct dw_mci *host)
 	}
 
 	if (host->use_dma == TRANS_MODE_IDMAC)
-		/* It is also recommended that we reset and reprogram idmac */
-		dw_mci_idmac_reset(host);
+		/* It is also required that we reinit idmac */
+		dw_mci_idmac_init(host);
 
 	ret = true;
 
-- 
2.11.0
