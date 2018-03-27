From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Tue, 27 Mar 2018 18:26:53 +0200
Subject: [PATCH 4.14 021/101] mmc: dw_mmc: fix falling from idmac to PIO mode
 when dw_mci_reset occurs
In-Reply-To: <20180327162749.993880276@linuxfoundation.org>
References: <20180327162749.993880276@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180327162751.275889617@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>

commit 47b7de2f6c18f75d1f2716efe752cba43f32a626 upstream.

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
Cc: <stable at vger.kernel.org> # 4.4+
Signed-off-by: Ulf Hansson <ulf.hansson at linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 drivers/mmc/host/dw_mmc.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -564,6 +564,7 @@ static int dw_mci_idmac_init(struct dw_m
 					(sizeof(struct idmac_desc_64addr) *
 							(i + 1))) >> 32;
 			/* Initialize reserved and buffer size fields to "0" */
+			p->des0 = 0;
 			p->des1 = 0;
 			p->des2 = 0;
 			p->des3 = 0;
@@ -586,6 +587,7 @@ static int dw_mci_idmac_init(struct dw_m
 		     i++, p++) {
 			p->des3 = cpu_to_le32(host->sg_dma +
 					(sizeof(struct idmac_desc) * (i + 1)));
+			p->des0 = 0;
 			p->des1 = 0;
 		}
 
@@ -1801,8 +1803,8 @@ static bool dw_mci_reset(struct dw_mci *
 	}
 
 	if (host->use_dma == TRANS_MODE_IDMAC)
-		/* It is also recommended that we reset and reprogram idmac */
-		dw_mci_idmac_reset(host);
+		/* It is also required that we reinit idmac */
+		dw_mci_idmac_init(host);
 
 	ret = true;
 
