From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:50 +0100
Subject: [PATCH v2 07/11] [media] rc: print correct variable for z8f0811
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-8-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

A recent rework accidentally left a debugging printk untouched
while changing the meaning of the variables, leading to an
uninitialized variable being printed:

drivers/media/i2c/ir-kbd-i2c.c: In function 'get_key_haup_common':
drivers/media/i2c/ir-kbd-i2c.c:62:2: error: 'toggle' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This prints the correct one instead, as we did before the patch.

Fixes: 00bb820755ed ("[media] rc: Hauppauge z8f0811 can decode RC6")
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 drivers/media/i2c/ir-kbd-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I submitted this repeatedly as it is a v4.9 regression, but
I never saw a reply for it.

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index f95a6bc..cede397 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -118,7 +118,7 @@ static int get_key_haup_common(struct IR_i2c *ir, enum rc_type *protocol,
 			*protocol = RC_TYPE_RC6_MCE;
 			dev &= 0x7f;
 			dprintk(1, "ir hauppauge (rc6-mce): t%d vendor=%d dev=%d code=%d\n",
-						toggle, vendor, dev, code);
+						*ptoggle, vendor, dev, code);
 		} else {
 			*ptoggle = 0;
 			*protocol = RC_TYPE_RC6_6A_32;
-- 
2.9.0
