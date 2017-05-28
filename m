From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:52:03 +0300
Subject: [PATCH v2 06/11] ARC: [plat-eznps] Fix TLB Errata
In-Reply-To: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-7-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Due to a HW bug in NPS400 we get from time to time false TLB miss.
Workaround this by validating each miss.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/mm/tlbex.S |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index b30e4e3..0e1e47a 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -274,6 +274,13 @@ ex_saved_reg1:
 .macro COMMIT_ENTRY_TO_MMU
 #if (CONFIG_ARC_MMU_VER < 4)
 
+#ifdef CONFIG_EZNPS_MTM_EXT
+	/* verify if entry for this vaddr+ASID already exists */
+	sr    TLBProbe, [ARC_REG_TLBCOMMAND]
+	lr    r0, [ARC_REG_TLBINDEX]
+	bbit0 r0, 31, 88f
+#endif
+
 	/* Get free TLB slot: Set = computed from vaddr, way = random */
 	sr  TLBGetIndex, [ARC_REG_TLBCOMMAND]
 
@@ -287,6 +294,8 @@ ex_saved_reg1:
 #else
 	sr TLBInsertEntry, [ARC_REG_TLBCOMMAND]
 #endif
+
+88:
 .endm
 
 
-- 
1.7.1
