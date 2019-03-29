From: joe@perches.com (Joe Perches)
Date: Fri, 29 Mar 2019 08:18:33 -0700
Subject: [PATCH] trivial: MAINTAINERS: fix bad file pattern
In-Reply-To: <20190329145702.1894-1-Eugeniy.Paltsev@synopsys.com>
References: <20190329145702.1894-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <983c78e8648eb9c21e35eee77a73caccaed1617b.camel@perches.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2019-03-29@17:57 +0300, Eugeniy Paltsev wrote:
> Fix bad file pattern in MAINTAINERS section 'SYNOPSYS DESIGNWARE
> AXI DMAC DRIVER'

NAK

> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -14987,7 +14987,7 @@ F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
>  SYNOPSYS DESIGNWARE AXI DMAC DRIVER
>  M:	Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
>  S:	Maintained
> -F:	drivers/dma/dwi-axi-dmac/
> +F:	drivers/dma/dwi-axi-dmac/*

This is not correct.

The original patch added these files:

 drivers/dma/dw-axi-dmac/Makefile               |    1 +
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 1008 ++++++++++++++++++++++++
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  334 ++++++++

The pattern should not be dwi- but dw-

F:	drivers/dma/dw-axi-dmac/

(no i after dw)

Also the patch subject and commit description should reference the
MAINTAINERS section.

So your patch should be something like
---
Subject: [PATCH] MAINTAINERS: Fix bad file pattern in SYNOPSYS DESIGNWARE AXI DMAC DRIVER

commit 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
added an incorrect file pattern.  Fix it.

Signed-off-by: <you>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e5a5d263f29..30f5156336ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14987,7 +14987,7 @@ F:      Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
 S:	Maintained
-F:	drivers/dma/dwi-axi-dmac/
+F:	drivers/dma/dw-axi-dmac/
 F:	Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
 
 SYNOPSYS DESIGNWARE DMAC DRIVER
