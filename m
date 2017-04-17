From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 17 Apr 2017 19:13:17 +0300
Subject: [PATCH] ehci-ppc4xx: Prepare for usage of readl()/writel() accessors
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492445597-32034-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We used to have opencoded ehci_readl()/writel() which required no
external functions to be called.

Now with attempt to switch to generic readl()/writel() accessors
we see a missing declaration of those accessors in ehci-ppc4xx.
Something like that happens if applied
http://patchwork.ozlabs.org/patch/726714/:
---------------->8---------------
  CC      drivers/usb/host/ehci-ppc4xx.o
drivers/usb/host/ehci-ppc4xx.c: In function 'ehci_hcd_init':
drivers/usb/host/ehci-ppc4xx.c:23:3: warning: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
   HC_LENGTH(ehci_readl(&(*hccr)->cr_capbase)));
   ^
---------------->8---------------

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Tom Rini <trini at konsulko.com>
Cc: Marek Vasut <marex at denx.de>
Cc: Stefan Roese <sr at denx.de>
---
 drivers/usb/host/ehci-ppc4xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ehci-ppc4xx.c b/drivers/usb/host/ehci-ppc4xx.c
index 9aee3ff786cb..9d235776428e 100644
--- a/drivers/usb/host/ehci-ppc4xx.c
+++ b/drivers/usb/host/ehci-ppc4xx.c
@@ -8,6 +8,7 @@
  */
 #include <common.h>
 #include <usb.h>
+#include <asm/io.h>
 
 #include "ehci.h"
 
-- 
2.7.4
