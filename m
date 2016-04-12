From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Tue, 12 Apr 2016 13:56:28 +0100
Subject: [PATCH 2/2 v5] ASoC: dwc: Update DOCUMENTATION for I2S Driver
In-Reply-To: <cover.1460384521.git.joabreu@synopsys.com>
References: <cover.1460384521.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a922e60747eb00182eba573baf9497fff8772337.1460384521.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch updates documentation for the Designware I2S
driver.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
---

Changes v4 -> v5:
* interrupts is now required property
* Drop 'snps-use-dmaengine' property

This patch was only introduced in v4.

 Documentation/devicetree/bindings/sound/designware-i2s.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
index 7bb5424..9c1fecd 100644
--- a/Documentation/devicetree/bindings/sound/designware-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/designware-i2s.txt
@@ -3,14 +3,18 @@ DesignWare I2S controller
 Required properties:
  - compatible : Must be "snps,designware-i2s"
  - reg : Must contain the I2S core's registers location and length
+ - interrupts: <IRQ> where IRQ is the interrupt number.
  - clocks : Pairs of phandle and specifier referencing the controller's
    clocks. The controller expects one clock: the clock used as the sampling
    rate reference clock sample.
  - clock-names : "i2sclk" for the sample rate reference clock.
+
+Optional properties:
  - dmas: Pairs of phandle and specifier for the DMA channels that are used by
    the core. The core expects one or two dma channels: one for transmit and
-   one for receive.
- - dma-names : "tx" for the transmit channel, "rx" for the receive channel.
+   one for receive. Set this parameter if the I2S DMA block is enabled.
+ - dma-names : "tx" for the transmit channel, "rx" for the receive channel. Set
+   this parameter if the I2S DMA block is enabled.
 
 For more details on the 'dma', 'dma-names', 'clock' and 'clock-names'
 properties please check:
@@ -23,6 +27,7 @@ Example:
 	soc_i2s: i2s at 7ff90000 {
 		compatible = "snps,designware-i2s";
 		reg = <0x0 0x7ff90000 0x0 0x1000>;
+		interrupts = <15>;
 		clocks = <&scpi_i2sclk 0>;
 		clock-names = "i2sclk";
 		#sound-dai-cells = <0>;
-- 
1.9.1
