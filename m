From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  1 Aug 2017 12:58:47 +0300
Subject: [PATCH] arc: arcv2: cache: Explicitly set MSB counterpart of region
 ops addresses
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170801095847.6425-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It is necessary to explicitly set both SLC_AUX_RGN_START1 and SLC_AUX_RGN_END1
which hold MSB bits of the physical address correspondingly of region start
and end otherwise SLC region operation is executed in unpredictable manner,
for example on HSDK platform where PAE40 support exists in hardware
we saw each and every SLC region op to take seconds (sic!).

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Reported-by: Vladimir Kondratiev <vladimir.kondratiev at intel.com>
---
 arch/arc/include/asm/cache.h | 2 ++
 arch/arc/mm/cache.c          | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index 35127ad95124..1f3c2f967471 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -91,7 +91,9 @@ extern unsigned long perip_base, perip_end;
 #define ARC_REG_SLC_FLUSH	0x904
 #define ARC_REG_SLC_INVALIDATE	0x905
 #define ARC_REG_SLC_RGN_START	0x914
+#define ARC_REG_SLC_RGN_START1	0x915
 #define ARC_REG_SLC_RGN_END	0x916
+#define ARC_REG_SLC_RGN_END1	0x917
 
 /* Bit val in SLC_CONTROL */
 #define SLC_CTRL_DIS		0x001
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index b7a1face1584..0b4e2650c5de 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -580,6 +580,7 @@ noinline void slc_op(phys_addr_t paddr, unsigned long sz, const int op)
 	static DEFINE_SPINLOCK(lock);
 	unsigned long flags;
 	unsigned int ctrl;
+	phys_addr_t end;
 
 	spin_lock_irqsave(&lock, flags);
 
@@ -609,8 +610,11 @@ noinline void slc_op(phys_addr_t paddr, unsigned long sz, const int op)
 	 * END needs to be setup before START (latter triggers the operation)
 	 * END can't be same as START, so add (l2_line_sz - 1) to sz
 	 */
-	write_aux_reg(ARC_REG_SLC_RGN_END, (paddr + sz + l2_line_sz - 1));
-	write_aux_reg(ARC_REG_SLC_RGN_START, paddr);
+	end = paddr + sz + l2_line_sz - 1;
+	write_aux_reg(ARC_REG_SLC_RGN_END1, upper_32_bits(end));
+	write_aux_reg(ARC_REG_SLC_RGN_END, lower_32_bits(end));
+	write_aux_reg(ARC_REG_SLC_RGN_START1, upper_32_bits(paddr));
+	write_aux_reg(ARC_REG_SLC_RGN_START, lower_32_bits(paddr));
 
 	/* Make sure "busy" bit reports correct stataus, see STAR 9001165532 */
 	read_aux_reg(ARC_REG_SLC_CTRL);
-- 
2.11.0
