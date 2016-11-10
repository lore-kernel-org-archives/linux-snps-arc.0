From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:49 +0100
Subject: [PATCH v2 06/11] [media] dib0700: fix nec repeat handling
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-7-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

From: Sean Young <sean@mess.org>

When receiving a nec repeat, ensure the correct scancode is repeated
rather than a random value from the stack. This removes the need
for the bogus uninitialized_var() and also fixes the warnings:

    drivers/media/usb/dvb-usb/dib0700_core.c: In function ?dib0700_rc_urb_completion?:
    drivers/media/usb/dvb-usb/dib0700_core.c:679: warning: ?protocol? may be used uninitialized in this function

[sean addon: So after writing the patch and submitting it, I've bought the
             hardware on ebay. Without this patch you get random scancodes
             on nec repeats, which the patch indeed fixes.]

Signed-off-by: Sean Young <sean at mess.org>
Tested-by: Sean Young <sean at mess.org>
Cc: stable at vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 drivers/media/usb/dvb-usb/dib0700_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 92d5408..47ce9d5 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -704,7 +704,7 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 	struct dvb_usb_device *d = purb->context;
 	struct dib0700_rc_response *poll_reply;
 	enum rc_type protocol;
-	u32 uninitialized_var(keycode);
+	u32 keycode;
 	u8 toggle;
 
 	deb_info("%s()\n", __func__);
@@ -745,7 +745,8 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 		    poll_reply->nec.data       == 0x00 &&
 		    poll_reply->nec.not_data   == 0xff) {
 			poll_reply->data_state = 2;
-			break;
+			rc_repeat(d->rc_dev);
+			goto resubmit;
 		}
 
 		if ((poll_reply->nec.data ^ poll_reply->nec.not_data) != 0xff) {
-- 
2.9.0
