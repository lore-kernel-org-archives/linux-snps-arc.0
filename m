From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu,  4 Oct 2018 16:12:12 +0300
Subject: [PATCH] ARC: IOC: panic if kernel was started with previously enabled
 IOC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181004131212.16405-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Disabling and reconfiguring of IOC are quite a tricky actions because
nobody knows what happens if there're IOC-ahndled tarnsactions in flight
when we're disabling IOC.

And the problem is external DMA masters [that were initialized and set
in a bootlaoder that was executed before we got here] might continue
to send data to memory even at this point and we have no way to prevent
that.

That said it's much safer to not enable IOC at all anywhere before Linux
kernel.

As we can build u-boot with IOC support (mostly for debugging purposes)
let's check that kernel was started with disabled IOC regardless of
our plans to use it or not.

Also while I'm at it, replace hardcoded bits in ARC_REG_IO_COH_PARTIAL
and ARC_REG_IO_COH_ENABLE registers by definitions.

Inspired by: https://lkml.org/lkml/2018/1/19/557

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/cache.h |  2 ++
 arch/arc/mm/cache.c          | 25 ++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index ff7d3232764a..f393b663413e 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -113,7 +113,9 @@ extern unsigned long perip_base, perip_end;
 
 /* IO coherency related Auxiliary registers */
 #define ARC_REG_IO_COH_ENABLE	0x500
+#define ARC_IO_COH_ENABLE_BIT	BIT(0)
 #define ARC_REG_IO_COH_PARTIAL	0x501
+#define ARC_IO_COH_PARTIAL_BIT	BIT(0)
 #define ARC_REG_IO_COH_AP0_BASE	0x508
 #define ARC_REG_IO_COH_AP0_SIZE	0x509
 
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index f2701c13a66b..ee7b63e9c5e3 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1144,6 +1144,25 @@ noinline void __init arc_ioc_setup(void)
 {
 	unsigned int ioc_base, mem_sz;
 
+	/*
+	 * Disabling and reconfiguring of IOC are quite a tricky actions because
+	 * nobody knows what happens if there're IOC-ahndled tarnsactions in
+	 * flight when we're disabling IOC.
+	 *
+	 * And the problem is external DMA masters [that were initialized and
+	 * set in a bootlaoder that was executed before we got here] might
+	 * continue to send data to memory even at this point and we have
+	 * no way to prevent that.
+	 *
+	 * That said it's much safer to not enable IOC at all anywhere before
+	 * Linux kernel.
+	 */
+	if (read_aux_reg(ARC_REG_IO_COH_ENABLE) & ARC_IO_COH_ENABLE_BIT)
+		panic("kernel was started with previously enabled IOC!\n");
+
+	if (!ioc_enable)
+		return;
+
 	/*
 	 * As for today we don't support both IOC and ZONE_HIGHMEM enabled
 	 * simultaneously. This happens because as of today IOC aperture covers
@@ -1187,8 +1206,8 @@ noinline void __init arc_ioc_setup(void)
 		panic("IOC Aperture start must be aligned to the size of the aperture");
 
 	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, ioc_base >> 12);
-	write_aux_reg(ARC_REG_IO_COH_PARTIAL, 1);
-	write_aux_reg(ARC_REG_IO_COH_ENABLE, 1);
+	write_aux_reg(ARC_REG_IO_COH_PARTIAL, ARC_IO_COH_PARTIAL_BIT);
+	write_aux_reg(ARC_REG_IO_COH_ENABLE, ARC_IO_COH_ENABLE_BIT);
 
 	/* Re-enable L1 dcache */
 	__dc_enable();
@@ -1265,7 +1284,7 @@ void __init arc_cache_init_master(void)
 	if (is_isa_arcv2() && l2_line_sz && !slc_enable)
 		arc_slc_disable();
 
-	if (is_isa_arcv2() && ioc_enable)
+	if (is_isa_arcv2())
 		arc_ioc_setup();
 
 	if (is_isa_arcv2() && l2_line_sz && slc_enable) {
-- 
2.14.4
