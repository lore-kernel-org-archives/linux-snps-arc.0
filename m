From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Aug 2019 11:38:39 +0300
Subject: [PATCH] arc: emsdp: Add initialization of PSRAM
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190829083839.15515-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

If the "Page Mode" is not enabled on the device,
read operations from PSRAM may result in incorrect data.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 board/synopsys/emsdp/emsdp.c | 37 +++++++++++++++++++++++++++++++++++++
 configs/emsdp_defconfig      |  1 +
 2 files changed, 38 insertions(+)

diff --git a/board/synopsys/emsdp/emsdp.c b/board/synopsys/emsdp/emsdp.c
index c0770b58c1..3bf4a1879b 100644
--- a/board/synopsys/emsdp/emsdp.c
+++ b/board/synopsys/emsdp/emsdp.c
@@ -48,6 +48,43 @@ int mach_cpu_init(void)
 	return 0;
 }
 
+int board_early_init_r(void)
+{
+#define EMSDP_PSRAM_BASE		0xf2001000
+#define PSRAM_FLASH_CONFIG_REG_0	(void *)(EMSDP_PSRAM_BASE + 0x10)
+#define PSRAM_FLASH_CONFIG_REG_1	(void *)(EMSDP_PSRAM_BASE + 0x14)
+#define CRE_ENABLE			BIT(31)
+#define CRE_DRIVE_CMD			BIT(6)
+
+#define PSRAM_RCR_DPD			BIT(4)
+#define PSRAM_RCR_PAGE_MODE		BIT(7)
+
+/*
+ * PSRAM_FLASH_CONFIG_REG_x[30:15] to the address lines[16:1] of flash,
+ * thus "<< 1".
+ */
+#define PSRAM_RCR_SETUP		((PSRAM_RCR_DPD | PSRAM_RCR_PAGE_MODE) << 1)
+
+	// Switch PSRAM controller to command mode
+	writel(CRE_ENABLE | CRE_DRIVE_CMD, PSRAM_FLASH_CONFIG_REG_0);
+	// Program Refresh Configuration Register (RCR) for BANK0
+	writew(0, (void *)(0x10000000 + PSRAM_RCR_SETUP));
+	// Switch PSRAM controller back to memory mode
+	writel(0, PSRAM_FLASH_CONFIG_REG_0);
+
+
+	// Switch PSRAM controller to command mode
+	writel(CRE_ENABLE | CRE_DRIVE_CMD, PSRAM_FLASH_CONFIG_REG_1);
+	// Program Refresh Configuration Register (RCR) for BANK1
+	writew(0, (void *)(0x10800000 + PSRAM_RCR_SETUP));
+	// Switch PSRAM controller back to memory mode
+	writel(0, PSRAM_FLASH_CONFIG_REG_1);
+
+	printf("PSRAM initialized.\n");
+
+	return 0;
+}
+
 int board_mmc_init(bd_t *bis)
 {
 	struct dwmci_host *host = NULL;
diff --git a/configs/emsdp_defconfig b/configs/emsdp_defconfig
index 64281d0529..5e55e3e2b2 100644
--- a/configs/emsdp_defconfig
+++ b/configs/emsdp_defconfig
@@ -7,6 +7,7 @@ CONFIG_ENV_SIZE=0x1000
 CONFIG_SYS_CLK_FREQ=40000000
 # CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
 CONFIG_VERSION_VARIABLE=y
+CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="emsdp# "
 # CONFIG_CMD_BOOTD is not set
-- 
2.16.2
