From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:52:04 +0300
Subject: [PATCH v2 07/11] ARC: [plat-eznps] disabled stall counter due to a HW
 bug
In-Reply-To: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-8-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

This counter represents threshold for consecutive stall that which
trigger HW threads scheduling.
When this feature is enabled low values of this counter cause
downgrade in performance and in the worst case even a livelock.

Remove those couple of lines and resort to HW reset value i.e.
this feature is disabled (.sten field equals 0).

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/plat-eznps/mtm.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c
index aaaaffd..e0cb36b 100644
--- a/arch/arc/plat-eznps/mtm.c
+++ b/arch/arc/plat-eznps/mtm.c
@@ -119,8 +119,6 @@ void mtm_enable_core(unsigned int cpu)
 	mt_ctrl.value = 0;
 	mt_ctrl.hsen = 1;
 	mt_ctrl.hs_cnt = MT_CTRL_HS_CNT;
-	mt_ctrl.sten = 1;
-	mt_ctrl.st_cnt = MT_CTRL_ST_CNT;
 	mt_ctrl.mten = 1;
 	write_aux_reg(CTOP_AUX_MT_CTRL, mt_ctrl.value);
 
-- 
1.7.1
