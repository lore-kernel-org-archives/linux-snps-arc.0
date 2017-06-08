From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu,  8 Jun 2017 18:24:57 +0300
Subject: [RFC] arc: Decouple linux kernel memory address and link address
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170608152457.9557-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We faced with problem when we tried to utilize 1G DRAM by linux on
HSDK.

We can't use our usual kernel memory address (0x80000000) like on
AXS103 because of DCCM memory bank located at exactly same
address (0x80000000)
But we can't simply move kernel memory address to another address (like
0x90000000) because IOC base address must be aligned to the
size of the aperture as specified in the IOC size register.

So we had to use 1G aligned address for kernel memory.

We can't use 0x00000000 or 0x40000000 addresses because addresses
lover then 0x80000000 are MMU-translated.
We can't use 0xB0000000 address because we can define a volatile
uncached region only from AUX_NON_VOLATILE_LIMIT to the
0xFFFFFFFF. (the end of region is hardcoded)

So, the decision is to link kernel to 0x90000000, but use
0x80000000-0xBFFFFFFF memory region and reallocate DCCM in our platform
code.
This patch only makes possible to set kernel memory address not equal to
kernel link address.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/Kconfig            | 5 +++++
 arch/arc/boot/dts/hsdk.dts  | 2 +-
 arch/arc/include/asm/page.h | 2 +-
 arch/arc/mm/cache.c         | 2 +-
 arch/arc/mm/init.c          | 4 ++--
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 92c9128..825a112 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -431,6 +431,11 @@ config LINUX_LINK_BASE
 	  However some customers have peripherals mapped at this addr, so
 	  Linux needs to be scooted a bit.
 	  If you don't know what the above means, leave this setting alone.
+
+config KERNEL_RAM_BASE_ADDRESS
+	hex "Linux ram base address"
+	default LINUX_LINK_BASE
+	help
 	  This needs to match memory start address specified in Device Tree
 
 config HIGHMEM
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index fb1a32f..57cb47d 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -145,6 +145,6 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		device_type = "memory";
-		reg = <0x90000000 0x40000000>;	/* 1 GB */
+		reg = <0x80000000 0x40000000>;	/* 1 GB */
 	};
 };
diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 296c342..777f676 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -85,7 +85,7 @@ typedef pte_t * pgtable_t;
  */
 #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
 
-#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_LINK_BASE)
+#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_KERNEL_RAM_BASE_ADDRESS)
 
 #ifdef CONFIG_FLATMEM
 #define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 3329d0d..9809e7e 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1093,7 +1093,7 @@ noinline void __init arc_ioc_setup(void)
 		slc_entire_op(OP_FLUSH_N_INV);
 
 	/* IOC Aperture start */
-	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, CONFIG_LINUX_LINK_BASE >> 12);
+	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, CONFIG_KERNEL_RAM_BASE_ADDRESS >> 12);
 
 	/*
 	 * IOC Aperture size:
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 8c9415e..d4ad9fc 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -26,7 +26,7 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __aligned(PAGE_SIZE);
 char empty_zero_page[PAGE_SIZE] __aligned(PAGE_SIZE);
 EXPORT_SYMBOL(empty_zero_page);
 
-static const unsigned long low_mem_start = CONFIG_LINUX_LINK_BASE;
+static const unsigned long low_mem_start = CONFIG_KERNEL_RAM_BASE_ADDRESS;
 static unsigned long low_mem_sz;
 
 #ifdef CONFIG_HIGHMEM
@@ -63,7 +63,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 
 	if (!low_mem_sz) {
 		if (base != low_mem_start)
-			panic("CONFIG_LINUX_LINK_BASE != DT memory { }");
+			panic("CONFIG_KERNEL_RAM_BASE_ADDRESS != DT memory { }");
 
 		low_mem_sz = size;
 		in_use = 1;
-- 
2.9.3
