From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  8 Oct 2019 18:51:54 +0300
Subject: [PATCH v2] arc: emsdp/iotdk: Switch to DM_MMC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191008155154.24829-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Somehow EMSDP & IoT DK boards were skipped on ARC boads conversion
to DM MMC. So doing it now.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

Changes v1 -> v2:

 * FIFO size on IoTDK is 128 bytes as compared to 256 on EM SDP.
   That gave us timeouts on data read with some cards. Fixed now.

 arch/arc/dts/emsdp.dts                 | 23 ++++++++++++++++++
 arch/arc/dts/iot_devkit.dts            | 22 ++++++++++++++++++
 board/synopsys/emsdp/emsdp.c           | 29 -----------------------
 board/synopsys/iot_devkit/iot_devkit.c | 32 --------------------------
 configs/emsdp_defconfig                |  2 ++
 configs/iot_devkit_defconfig           |  2 ++
 6 files changed, 49 insertions(+), 61 deletions(-)

diff --git a/arch/arc/dts/emsdp.dts b/arch/arc/dts/emsdp.dts
index d307b95d8e..77362354d5 100644
--- a/arch/arc/dts/emsdp.dts
+++ b/arch/arc/dts/emsdp.dts
@@ -32,4 +32,27 @@
 		reg-shift = <2>;
 		reg-io-width = <4>;
 	};
+
+	mmcclk_biu: mmcclk-biu {
+		compatible = "fixed-clock";
+		clock-frequency = <100000000>;
+		#clock-cells = <0>;
+	};
+
+	mmcclk_ciu: mmcclk-ciu {
+		compatible = "fixed-clock";
+		clock-frequency = <100000000>;
+		#clock-cells = <0>;
+	};
+
+	mmc: mmc0 at f0010000 {
+		compatible = "snps,dw-mshc";
+		reg = <0xf0010000 0x400>;
+		bus-width = <4>;
+		fifo-depth = <256>;
+		clocks = <&mmcclk_biu>, <&mmcclk_ciu>;
+		clock-names = "biu", "ciu";
+		max-frequency = <25000000>;
+	};
+
 };
diff --git a/arch/arc/dts/iot_devkit.dts b/arch/arc/dts/iot_devkit.dts
index ebf5a950f0..c0173fa5ab 100644
--- a/arch/arc/dts/iot_devkit.dts
+++ b/arch/arc/dts/iot_devkit.dts
@@ -42,4 +42,26 @@
 		compatible = "nop-phy";
 		#phy-cells = <0>;
 	};
+
+	mmcclk_biu: mmcclk-biu {
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+		#clock-cells = <0>;
+	};
+
+	mmcclk_ciu: mmcclk-ciu {
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+		#clock-cells = <0>;
+	};
+
+	mmc: mmc0 at f000b000 {
+		compatible = "snps,dw-mshc";
+		reg = <0xf000b000 0x400>;
+		bus-width = <4>;
+		fifo-depth = <128>;
+		clocks = <&mmcclk_biu>, <&mmcclk_ciu>;
+		clock-names = "biu", "ciu";
+		max-frequency = <25000000>;
+	};
 };
diff --git a/board/synopsys/emsdp/emsdp.c b/board/synopsys/emsdp/emsdp.c
index 7a3fd5b7f2..5ba9f862e1 100644
--- a/board/synopsys/emsdp/emsdp.c
+++ b/board/synopsys/emsdp/emsdp.c
@@ -85,35 +85,6 @@ int board_early_init_r(void)
 	return 0;
 }
 
-int board_mmc_init(bd_t *bis)
-{
-	struct dwmci_host *host = NULL;
-
-	host = malloc(sizeof(struct dwmci_host));
-	if (!host) {
-		printf("dwmci_host malloc fail!\n");
-		return 1;
-	}
-
-	memset(host, 0, sizeof(struct dwmci_host));
-	host->name = "Synopsys Mobile storage";
-	host->ioaddr = SDIO_BASE;
-	host->buswidth = 4;
-	host->dev_index = 0;
-	host->bus_hz = 50000000;
-
-	add_dwmci(host, host->bus_hz / 2, 400000);
-
-	return 0;
-}
-
-int board_mmc_getcd(struct mmc *mmc)
-{
-	struct dwmci_host *host = mmc->priv;
-
-	return !(dwmci_readl(host, DWMCI_CDETECT) & 1);
-}
-
 #define CREG_BASE		0xF0001000
 #define CREG_BOOT		(void *)(CREG_BASE + 0x0FF0)
 #define CREG_IP_SW_RESET	(void *)(CREG_BASE + 0x0FF0)
diff --git a/board/synopsys/iot_devkit/iot_devkit.c b/board/synopsys/iot_devkit/iot_devkit.c
index 8424e09bd3..9dbdc128f8 100644
--- a/board/synopsys/iot_devkit/iot_devkit.c
+++ b/board/synopsys/iot_devkit/iot_devkit.c
@@ -145,38 +145,6 @@ int mach_cpu_init(void)
 	return set_cpu_freq(gd->cpu_clk);
 }
 
-#define ARC_PERIPHERAL_BASE	0xF0000000
-#define SDIO_BASE		(ARC_PERIPHERAL_BASE + 0xB000)
-
-int board_mmc_init(bd_t *bis)
-{
-	struct dwmci_host *host = NULL;
-
-	host = malloc(sizeof(struct dwmci_host));
-	if (!host) {
-		printf("dwmci_host malloc fail!\n");
-		return -ENOMEM;
-	}
-
-	memset(host, 0, sizeof(struct dwmci_host));
-	host->name = "Synopsys Mobile storage";
-	host->ioaddr = (void *)SDIO_BASE;
-	host->buswidth = 4;
-	host->dev_index = 0;
-	host->bus_hz = 50000000;
-
-	add_dwmci(host, host->bus_hz / 2, 400000);
-
-	return 0;
-}
-
-int board_mmc_getcd(struct mmc *mmc)
-{
-	struct dwmci_host *host = mmc->priv;
-
-	return !(dwmci_readl(host, DWMCI_CDETECT) & 1);
-}
-
 #define IOTDK_RESET_SEQ		0x55AA6699
 
 void reset_cpu(ulong addr)
diff --git a/configs/emsdp_defconfig b/configs/emsdp_defconfig
index 1eca23fa95..09fe388e58 100644
--- a/configs/emsdp_defconfig
+++ b/configs/emsdp_defconfig
@@ -24,7 +24,9 @@ CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
 # CONFIG_NET is not set
 CONFIG_DM=y
 CONFIG_MMC=y
+CONFIG_DM_MMC=y
 CONFIG_MMC_DW=y
+CONFIG_MMC_DW_SNPS=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_FS_FAT_MAX_CLUSTSIZE=32768
diff --git a/configs/iot_devkit_defconfig b/configs/iot_devkit_defconfig
index 24bbe3fc5d..42278d4fb1 100644
--- a/configs/iot_devkit_defconfig
+++ b/configs/iot_devkit_defconfig
@@ -29,7 +29,9 @@ CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
 # CONFIG_NET is not set
 CONFIG_DM=y
 CONFIG_MMC=y
+CONFIG_DM_MMC=y
 CONFIG_MMC_DW=y
+CONFIG_MMC_DW_SNPS=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_USB=y
-- 
2.17.1
