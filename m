From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:53 +0100
Subject: [PATCH v2 10/11] pcmcia: fix return value of soc_pcmcia_regulator_set
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-11-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

The newly introduced soc_pcmcia_regulator_set() function sometimes returns
without setting its return code, as shown by this warning:

drivers/pcmcia/soc_common.c: In function 'soc_pcmcia_regulator_set':
drivers/pcmcia/soc_common.c:112:5: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This changes it to propagate the regulator_disable() result instead.

Fixes: ac61b6001a63 ("pcmcia: soc_common: add support for Vcc and Vpp regulators")
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 drivers/pcmcia/soc_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 153f312..b6b316d 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -107,7 +107,7 @@ int soc_pcmcia_regulator_set(struct soc_pcmcia_socket *skt,
 
 		ret = regulator_enable(r->reg);
 	} else {
-		regulator_disable(r->reg);
+		ret = regulator_disable(r->reg);
 	}
 	if (ret == 0)
 		r->on = on;
-- 
2.9.0
