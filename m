From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 29 Mar 2019 17:57:02 +0300
Subject: [PATCH] trivial: MAINTAINERS: fix bad file pattern
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190329145702.1894-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Fix bad file pattern in MAINTAINERS section 'SYNOPSYS DESIGNWARE
AXI DMAC DRIVER'

Reported-by: Joe Perches <joe at perches.com>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e5a5d263f29..30f5156336ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14987,7 +14987,7 @@ F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
 S:	Maintained
-F:	drivers/dma/dwi-axi-dmac/
+F:	drivers/dma/dwi-axi-dmac/*
 F:	Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
 
 SYNOPSYS DESIGNWARE DMAC DRIVER
-- 
2.14.5
