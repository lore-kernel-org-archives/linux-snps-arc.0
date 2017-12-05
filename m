From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  5 Dec 2017 13:19:02 +0300
Subject: [PATCH] ARC: Force disable IOC if ioc_enable=0
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512469142-5916-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

U-Boot enables and uses IOC so if we don't want to use it in the kernel
we need to _disable_ it for real. This is in comparison to what we do
today based on "ioc_enable" flag - if it is set to 0 we just
_dont_enable_ IOC which effectively keeps IOC alive and kicking.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/mm/cache.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index eee924dfffa6..b763c34aa6bc 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1149,6 +1149,10 @@ noinline void __init arc_ioc_setup(void)
 {
 	unsigned int ioc_base, mem_sz;
 
+	/* Force disable IOC if it exists but we don't want to use it */
+	if (ioc_exists && !ioc_enable)
+		write_aux_reg(ARC_REG_IO_COH_ENABLE, 0);
+
 	/* Flush + invalidate + disable L1 dcache */
 	__dc_disable();
 
@@ -1156,31 +1160,34 @@ noinline void __init arc_ioc_setup(void)
 	if (read_aux_reg(ARC_REG_SLC_BCR))
 		slc_entire_op(OP_FLUSH_N_INV);
 
-	/*
-	 * currently IOC Aperture covers entire DDR
-	 * TBD: fix for PGU + 1GB of low mem
-	 * TBD: fix for PAE
-	 */
-	mem_sz = arc_get_mem_sz();
+	/* Only setup IOC if we really want to use it */
+	if (ioc_exists && ioc_enable) {
+		/*
+		 * currently IOC Aperture covers entire DDR
+		 * TBD: fix for PGU + 1GB of low mem
+		 * TBD: fix for PAE
+		 */
+		mem_sz = arc_get_mem_sz();
 
-	if (!is_power_of_2(mem_sz) || mem_sz < 4096)
-		panic("IOC Aperture size must be power of 2 larger than 4KB");
+		if (!is_power_of_2(mem_sz) || mem_sz < 4096)
+			panic("IOC Aperture size must be power of 2 larger than 4KB");
 
-	/*
-	 * IOC Aperture size decoded as 2 ^ (SIZE + 2) KB,
-	 * so setting 0x11 implies 512MB, 0x12 implies 1GB...
-	 */
-	write_aux_reg(ARC_REG_IO_COH_AP0_SIZE, order_base_2(mem_sz >> 10) - 2);
+		/*
+		 * IOC Aperture size decoded as 2 ^ (SIZE + 2) KB,
+		 * so setting 0x11 implies 512MB, 0x12 implies 1GB...
+		 */
+		write_aux_reg(ARC_REG_IO_COH_AP0_SIZE, order_base_2(mem_sz >> 10) - 2);
 
-	/* for now assume kernel base is start of IOC aperture */
-	ioc_base = CONFIG_LINUX_RAM_BASE;
+		/* for now assume kernel base is start of IOC aperture */
+		ioc_base = CONFIG_LINUX_RAM_BASE;
 
-	if (ioc_base % mem_sz != 0)
-		panic("IOC Aperture start must be aligned to the size of the aperture");
+		if (ioc_base % mem_sz != 0)
+			panic("IOC Aperture start must be aligned to the size of the aperture");
 
-	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, ioc_base >> 12);
-	write_aux_reg(ARC_REG_IO_COH_PARTIAL, 1);
-	write_aux_reg(ARC_REG_IO_COH_ENABLE, 1);
+		write_aux_reg(ARC_REG_IO_COH_AP0_BASE, ioc_base >> 12);
+		write_aux_reg(ARC_REG_IO_COH_PARTIAL, 1);
+		write_aux_reg(ARC_REG_IO_COH_ENABLE, 1);
+	}
 
 	/* Re-enable L1 dcache */
 	__dc_enable();
-- 
2.7.5
