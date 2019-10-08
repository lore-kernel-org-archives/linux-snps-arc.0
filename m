From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  8 Oct 2019 18:41:22 +0300
Subject: [PATCH] arc: emsdp: Increase max FAT cluster size
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191008154122.19972-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Some especially large SD-cards come from stock formatted with
larger FAT cluster size so to accommodate those we just increase
what we expect to have here in U-Boot given we have a plenty of
space on EM SDP (16 MiB).

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 configs/emsdp_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/emsdp_defconfig b/configs/emsdp_defconfig
index 42415ea713..09fe388e58 100644
--- a/configs/emsdp_defconfig
+++ b/configs/emsdp_defconfig
@@ -29,6 +29,6 @@ CONFIG_MMC_DW=y
 CONFIG_MMC_DW_SNPS=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
-CONFIG_FS_FAT_MAX_CLUSTSIZE=4096
+CONFIG_FS_FAT_MAX_CLUSTSIZE=32768
 CONFIG_USE_PRIVATE_LIBGCC=y
 CONFIG_PANIC_HANG=y
-- 
2.17.1
