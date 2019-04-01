From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon,  1 Apr 2019 21:09:09 +0300
Subject: [PATCH trivial v2] MAINTAINERS: fix bad file pattern in SYNOPSYS
 DESIGNWARE AXI DMAC DRIVER
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190401180909.6288-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
added an incorrect file pattern. Fix it.

Reported-by: Joe Perches <joe at perches.com>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e5a5d263f29..be8285e81b6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14987,7 +14987,7 @@ F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
 S:	Maintained
-F:	drivers/dma/dwi-axi-dmac/
+F:	drivers/dma/dw-axi-dmac/
 F:	Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
 
 SYNOPSYS DESIGNWARE DMAC DRIVER
-- 
2.14.5
