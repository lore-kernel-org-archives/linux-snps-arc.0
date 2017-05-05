From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  5 May 2017 23:20:29 +0300
Subject: [PATCH] Revert "ARCv2: Allow enabling PAE40 w/o HIGHMEM"
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1494015629-19204-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This reverts commit 7cab91b87dd8eeee5911ec34be8bb0288ebba18b.

Now when we have a real hardware platform with PAE40 enabled
(here I mean axs103 with firmware v1.2) and 1 Gb of DDR mapped to
0x1_a000_0000-0x1_ffff_ffff we're really targeting memory above 4Gb
when PAE40 is enabled. This in its turn requires HIGHMEM to be enabled
otherwise user won't see any difference with enabling PAE in
kernel configuration as only lowmem will be used anyways.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 5d7fb3e7cb97..a5459698f0ee 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -444,6 +444,7 @@ config ARC_HAS_PAE40
 	bool "Support for the 40-bit Physical Address Extension"
 	default n
 	depends on ISA_ARCV2
+	select HIGHMEM
 	help
 	  Enable access to physical memory beyond 4G, only supported on
 	  ARC cores with 40 bit Physical Addressing support
-- 
2.7.4
