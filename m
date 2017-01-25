From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 25 Jan 2017 18:34:16 +0300
Subject: [PATCH 1/2] dt-bindings: Document the Synopsys DW AXI DMA bindings
In-Reply-To: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485358457-22957-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch adds documentation of device tree bindings for the Synopsys
DesignWare AXI DMA controller.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 .../devicetree/bindings/dma/snps,axi-dw-dmac.txt   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt

diff --git a/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
new file mode 100644
index 0000000..21318a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
@@ -0,0 +1,33 @@
+* Synopsys DesignWare AXI DMA Controller
+
+Required properties:
+- compatible: "snps,axi-dma"
+- reg: Address range of the DMAC registers. This should include
+  all of the per-channel registers.
+- interrupt: Should contain the DMAC interrupt number.
+- interrupt-parent: Should be the phandle for the interrupt controller
+  that services interrupts for this device.
+- dma-channels: Number of channels supported by hardware.
+- dma-masters: Number of AXI masters supported by the hardware.
+- data-width: Maximum AXI data width supported by hardware.
+  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)
+- priority: Priority of channel. Array property. Priority value must be
+  programmed within [0:dma-channels-1] range. (0 - minimum priority)
+- block-size: Maximum block size supported by the controller channel. Array
+  property.
+
+Example:
+
+dmac: dmac at 80000 {
+	compatible = "snps,axi-dma";
+	reg = <0x80000 0x400>;
+	clocks = <&core_clk>;
+	interrupt-parent = <&intc>;
+	interrupts = <27>;
+
+	dma-channels = <4>;
+	dma-masters = <2>;
+	data-width = <3>;
+	block-size = <4096 4096 4096 4096>;
+	priority = <0 1 2 3>;
+};
-- 
2.5.5
