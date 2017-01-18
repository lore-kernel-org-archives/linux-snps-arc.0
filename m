From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 18 Jan 2017 14:56:50 +0300
Subject: [PATCH] ARC: fix allnoconfig builds
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170118115650.14591-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In case of allnoconfig HAVE_MOD_ARCH_SPECIFIC=no
because ARC_DW2_UNWIND=no as well.

This enables default "struct mod_arch_specific" from
./include/asm-generic/module.h which clashes with ARC's one.

Before e514943bbfe1 ("ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds")
ARC's "struct mod_arch_specific" was hidden for !CONFIG_ARC_DW2_UNWIND
builds but not anymore.

So to make our life easier and escape more complicated ifdeffed constructions in
sources let's unconditionally select CONFIG_HAVE_MOD_ARCH_SPECIFIC for ARC.

Reported-by: Anton Kolesov <akolesov at synopsys.com>
Fixes: e514943bbfe1 ("ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds")
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index c75d290..283099c 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -29,7 +29,7 @@ config ARC
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_MEMBLOCK
-	select HAVE_MOD_ARCH_SPECIFIC if ARC_DW2_UNWIND
+	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
 	select HANDLE_DOMAIN_IRQ
-- 
2.10.2
