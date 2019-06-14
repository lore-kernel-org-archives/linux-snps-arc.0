From: sashal@kernel.org (Sasha Levin)
Date: Fri, 14 Jun 2019 16:27:56 -0400
Subject: [PATCH AUTOSEL 5.1 12/59] ARC: [plat-hsdk]: Add missing FIFO size
 entry in GMAC node
In-Reply-To: <20190614202843.26941-1-sashal@kernel.org>
References: <20190614202843.26941-1-sashal@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190614202843.26941-12-sashal@kernel.org>
To: linux-snps-arc@lists.infradead.org

From: Jose Abreu <joabreu@synopsys.com>

[ Upstream commit 4c70850aeb2e40016722cd1abd43c679666d3ca0 ]

Add the binding for RX/TX fifo size of GMAC node.

Cc: Joao Pinto <jpinto at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Tested-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 arch/arc/boot/dts/hsdk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 699f372b2a6f..6219b372e9c1 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -196,6 +196,9 @@
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 			dma-coherent;
 
+			tx-fifo-depth = <4096>;
+			rx-fifo-depth = <4096>;
+
 			mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.20.1
