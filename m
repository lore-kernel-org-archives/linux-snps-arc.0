From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 5 Jul 2016 12:20:08 +0000
Subject: ath9k-htc on OHCI -> bogus usb xfer
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467721137.3144.81.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

Looks like this is another manifestation of already seen problem with ath9k-htc
and OHCI controller.

I'm trying to get USB Wi-Fi dongle based on Atheros AR9271 to work with our
development board (this is Synopsys AXS103) and seeing a picture very similar to
what was discussed here?http://thread.gmane.org/gmane.linux.usb.general/110847

Below is what I see on insertion of the dongle.
Note I have the most recent ath9k-htc firmware (see "ath9k_htc/htc_9271-1.4.0.fw"
in the log below) and Linux kernel is 4.6.3 (latest stable as of today) but the same
happens even on 4.4.

Interesting enough if I simply remove or disable the warning like that
------------------------>8---------------------------
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 3d27477..a317e1e 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -443,11 +443,6 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
?????????* cause problems in HCDs if they get it wrong.
?????????*/
?
-???????/* Check that the pipe's type matches the endpoint's type */
-???????if (usb_pipetype(urb->pipe) != pipetypes[xfertype])
-???????????????dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
-???????????????????????usb_pipetype(urb->pipe), pipetypes[xfertype]);
-
????????/* Check against a simple/standard policy */
????????allowed = (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |
????????????????????????URB_FREE_BUFFER);
------------------------>8---------------------------
everything seem to work quite nice.

Any thoughts are much appreciated.

That's the log itself:
------------------------>8---------------------------
usb 1-1: new full-speed USB device number 2 using ohci-platform
usb 1-1: ath9k_htc: Firmware ath9k_htc/htc_9271-1.4.0.fw requested
usb 1-1: ath9k_htc: Transferred FW: ath9k_htc/htc_9271-1.4.0.fw, size: 51008
------------[ cut here ]------------
WARNING: CPU: 0 PID: 4 at drivers/usb/core/urb.c:450 usb_submit_urb+0x162/0x404
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
Modules linked in:
CPU: 0 PID: 4 Comm: kworker/0:0 Not tainted 4.6.3 #10
Workqueue: events request_firmware_work_func

Stack Trace:
? arc_unwind_core.constprop.1+0x94/0x10c
---[ end trace 2249b79eac9991d1 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 4 at drivers/usb/core/urb.c:450 usb_submit_urb+0x162/0x404
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
Modules linked in:
CPU: 0 PID: 4 Comm: kworker/0:0 Tainted: G????????W???????4.6.3 #10
Workqueue: events request_firmware_work_func

Stack Trace:
? arc_unwind_core.constprop.1+0x94/0x10c
---[ end trace 2249b79eac9991d2 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 4 at drivers/usb/core/urb.c:450 usb_submit_urb+0x162/0x404
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
Modules linked in:
CPU: 0 PID: 4 Comm: kworker/0:0 Tainted: G????????W???????4.6.3 #10
Workqueue: events request_firmware_work_func

Stack Trace:
? arc_unwind_core.constprop.1+0x94/0x10c
---[ end trace 2249b79eac9991d3 ]---

...
------------------------>8---------------------------

-Alexey
