From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 28 May 2019 11:54:44 +0300
Subject: [PATCH] ARC: [plat-hsdk]: unify memory apertures configuration
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190528085444.3813-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

HSDK SOC has memory bridge which allows to configure memory map
for different AXI masters in runtime.
As of today we adjust memory apertures configuration in U-boot
so we have different configuration in case of loading kernel
via U-boot and JTAG.

It isn't really critical in case of existing platform configuration
as configuration differs for <currently> unused address space
regions or unused AXI masters. However we may face with this
issue when we'll bringup new peripherals or touch their address
space.

Fix that by copy memory apertures configuration from U-boot to
HSDK platform code.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
This should be done a long time ago and this could save me from a lot
of debugging while bringing up GPU on HSDKv2...

 arch/arc/plat-hsdk/platform.c | 144 ++++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 8 deletions(-)

diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index 2588b842407c..e336e34925b7 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -35,8 +35,6 @@ static void __init hsdk_init_per_cpu(unsigned int cpu)
 
 #define ARC_PERIPHERAL_BASE	0xf0000000
 #define CREG_BASE		(ARC_PERIPHERAL_BASE + 0x1000)
-#define CREG_PAE		(CREG_BASE + 0x180)
-#define CREG_PAE_UPDATE		(CREG_BASE + 0x194)
 
 #define SDIO_BASE		(ARC_PERIPHERAL_BASE + 0xA000)
 #define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
@@ -102,20 +100,150 @@ static void __init hsdk_enable_gpio_intc_wire(void)
 	iowrite32(GPIO_INT_CONNECTED_MASK, (void __iomem *) GPIO_INTEN);
 }
 
-static void __init hsdk_init_early(void)
+enum hsdk_axi_masters {
+	M_HS_CORE = 0,
+	M_HS_RTT,
+	M_AXI_TUN,
+	M_HDMI_VIDEO,
+	M_HDMI_AUDIO,
+	M_USB_HOST,
+	M_ETHERNET,
+	M_SDIO,
+	M_GPU,
+	M_DMAC_0,
+	M_DMAC_1,
+	M_DVFS
+};
+
+#define UPDATE_VAL	1
+
+/*
+ * m	master		AXI_M_m_SLV0	AXI_M_m_SLV1	AXI_M_m_OFFSET0	AXI_M_m_OFFSET1
+ * 0	HS (CBU)	0x11111111	0x63111111	0xFEDCBA98	0x0E543210
+ * 1	HS (RTT)	0x77777777	0x77777777	0xFEDCBA98	0x76543210
+ * 2	AXI Tunnel	0x88888888	0x88888888	0xFEDCBA98	0x76543210
+ * 3	HDMI-VIDEO	0x77777777	0x77777777	0xFEDCBA98	0x76543210
+ * 4	HDMI-ADUIO	0x77777777	0x77777777	0xFEDCBA98	0x76543210
+ * 5	USB-HOST	0x77777777	0x77999999	0xFEDCBA98	0x76DCBA98
+ * 6	ETHERNET	0x77777777	0x77999999	0xFEDCBA98	0x76DCBA98
+ * 7	SDIO		0x77777777	0x77999999	0xFEDCBA98	0x76DCBA98
+ * 8	GPU		0x77777777	0x77777777	0xFEDCBA98	0x76543210
+ * 9	DMAC (port #1)	0x77777777	0x77777777	0xFEDCBA98	0x76543210
+ * 10	DMAC (port #2)	0x77777777	0x77777777	0xFEDCBA98	0x76543210
+ * 11	DVFS		0x00000000	0x60000000	0x00000000	0x00000000
+ *
+ * Please read ARC HS Development IC Specification, section 17.2 for more
+ * information about apertures configuration.
+ * NOTE: we intentionally modify default settings in U-boot. Default settings
+ * are specified in "Table 111 CREG Address Decoder register reset values".
+ */
+
+#define CREG_AXI_M_SLV0(m)  ((void __iomem *)(CREG_BASE + 0x020 * (m)))
+#define CREG_AXI_M_SLV1(m)  ((void __iomem *)(CREG_BASE + 0x020 * (m) + 0x004))
+#define CREG_AXI_M_OFT0(m)  ((void __iomem *)(CREG_BASE + 0x020 * (m) + 0x008))
+#define CREG_AXI_M_OFT1(m)  ((void __iomem *)(CREG_BASE + 0x020 * (m) + 0x00C))
+#define CREG_AXI_M_UPDT(m)  ((void __iomem *)(CREG_BASE + 0x020 * (m) + 0x014))
+
+#define CREG_AXI_M_HS_CORE_BOOT	((void __iomem *)(CREG_BASE + 0x010))
+
+#define CREG_PAE		((void __iomem *)(CREG_BASE + 0x180))
+#define CREG_PAE_UPDT		((void __iomem *)(CREG_BASE + 0x194))
+
+static void __init hsdk_init_memory_bridge(void)
 {
+	u32 reg;
+
+	/*
+	 * M_HS_CORE has one unic register - BOOT.
+	 * We need to clean boot mirror (BOOT[1:0]) bits in them.
+	 */
+	reg = readl(CREG_AXI_M_HS_CORE_BOOT) & (~0x3);
+	writel(reg, CREG_AXI_M_HS_CORE_BOOT);
+	writel(0x11111111, CREG_AXI_M_SLV0(M_HS_CORE));
+	writel(0x63111111, CREG_AXI_M_SLV1(M_HS_CORE));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_HS_CORE));
+	writel(0x0E543210, CREG_AXI_M_OFT1(M_HS_CORE));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_HS_CORE));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_HS_RTT));
+	writel(0x77777777, CREG_AXI_M_SLV1(M_HS_RTT));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_HS_RTT));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_HS_RTT));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_HS_RTT));
+
+	writel(0x88888888, CREG_AXI_M_SLV0(M_AXI_TUN));
+	writel(0x88888888, CREG_AXI_M_SLV1(M_AXI_TUN));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_AXI_TUN));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_AXI_TUN));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_AXI_TUN));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_HDMI_VIDEO));
+	writel(0x77777777, CREG_AXI_M_SLV1(M_HDMI_VIDEO));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_HDMI_VIDEO));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_HDMI_VIDEO));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_HDMI_VIDEO));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_HDMI_AUDIO));
+	writel(0x77777777, CREG_AXI_M_SLV1(M_HDMI_AUDIO));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_HDMI_AUDIO));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_HDMI_AUDIO));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_HDMI_AUDIO));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_USB_HOST));
+	writel(0x77999999, CREG_AXI_M_SLV1(M_USB_HOST));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_USB_HOST));
+	writel(0x76DCBA98, CREG_AXI_M_OFT1(M_USB_HOST));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_USB_HOST));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_ETHERNET));
+	writel(0x77999999, CREG_AXI_M_SLV1(M_ETHERNET));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_ETHERNET));
+	writel(0x76DCBA98, CREG_AXI_M_OFT1(M_ETHERNET));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_ETHERNET));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_SDIO));
+	writel(0x77999999, CREG_AXI_M_SLV1(M_SDIO));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_SDIO));
+	writel(0x76DCBA98, CREG_AXI_M_OFT1(M_SDIO));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_SDIO));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_GPU));
+	writel(0x77777777, CREG_AXI_M_SLV1(M_GPU));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_GPU));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_GPU));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_GPU));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_DMAC_0));
+	writel(0x77777777, CREG_AXI_M_SLV1(M_DMAC_0));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_DMAC_0));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_DMAC_0));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_DMAC_0));
+
+	writel(0x77777777, CREG_AXI_M_SLV0(M_DMAC_1));
+	writel(0x77777777, CREG_AXI_M_SLV1(M_DMAC_1));
+	writel(0xFEDCBA98, CREG_AXI_M_OFT0(M_DMAC_1));
+	writel(0x76543210, CREG_AXI_M_OFT1(M_DMAC_1));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_DMAC_1));
+
+	writel(0x00000000, CREG_AXI_M_SLV0(M_DVFS));
+	writel(0x60000000, CREG_AXI_M_SLV1(M_DVFS));
+	writel(0x00000000, CREG_AXI_M_OFT0(M_DVFS));
+	writel(0x00000000, CREG_AXI_M_OFT1(M_DVFS));
+	writel(UPDATE_VAL, CREG_AXI_M_UPDT(M_DVFS));
+
 	/*
 	 * PAE remapping for DMA clients does not work due to an RTL bug, so
 	 * CREG_PAE register must be programmed to all zeroes, otherwise it
 	 * will cause problems with DMA to/from peripherals even if PAE40 is
 	 * not used.
 	 */
+	writel(0x00000000, CREG_PAE);
+	writel(UPDATE_VAL, CREG_PAE_UPDT);
+}
 
-	/* Default is 1, which means "PAE offset = 4GByte" */
-	writel_relaxed(0, (void __iomem *) CREG_PAE);
-
-	/* Really apply settings made above */
-	writel(1, (void __iomem *) CREG_PAE_UPDATE);
+static void __init hsdk_init_early(void)
+{
+	hsdk_init_memory_bridge();
 
 	/*
 	 * Switch SDIO external ciu clock divider from default div-by-8 to
-- 
2.21.0
