From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri,  7 Apr 2017 17:04:14 +0300
Subject: [PATCH v2 1/2] dt-bindings: Document the Synopsys DW AXI DMA bindings
In-Reply-To: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1491573855-1039-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch adds documentation of device tree bindings for the Synopsys
DesignWare AXI DMA controller.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Acked-by: Rob Herring <robh at kernel.org>
---
 .../devicetree/bindings/dma/snps,axi-dw-dmac.txt   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt

diff --git a/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
new file mode 100644
index 0000000..21666fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
@@ -0,0 +1,34 @@
+* Synopsys DesignWare AXI DMA Controller
+
+Required properties:
+- compatible: "snps,axi-dma-1.01a"
+- reg: Address range of the DMAC registers. This should include
+  all of the per-channel registers.
+- interrupt: Should contain the DMAC interrupt number.
+- interrupt-parent: Should be the phandle for the interrupt controller
+  that services interrupts for this device.
+- dma-channels: Number of channels supported by hardware.
+- snps,dma-masters: Number of AXI masters supported by the hardware.
+- snps,data-width: Maximum AXI data width supported by hardware.
+  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)
+- snps,priority: Priority of channel. Array size is equal to the number of
+  dma-channels. Priority value must be programmed within [0:dma-channels-1]
+  range. (0 - minimum priority)
+- snps,block-size: Maximum block size supported by the controller channel.
+  Array size is equal to the number of dma-channels.
+
+Example:
+
+dmac: dma-controller at 80000 {
+	compatible = "snps,axi-dma-1.01a";
+	reg = <0x80000 0x400>;
+	clocks = <&core_clk>;
+	interrupt-parent = <&intc>;
+	interrupts = <27>;
+
+	dma-channels = <4>;
+	snps,dma-masters = <2>;
+	snps,data-width = <3>;
+	snps,block-size = <4096 4096 4096 4096>;
+	snps,priority = <0 1 2 3>;
+};
-- 
2.5.5
