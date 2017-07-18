From: jeffy.chen@rock-chips.com (Jeffy Chen)
Date: Tue, 18 Jul 2017 12:29:59 +0800
Subject: [RFC PATCH 1/5] serial: arc: Remove __init marking from early write
In-Reply-To: <1500352203-21513-1-git-send-email-jeffy.chen@rock-chips.com>
References: <1500352203-21513-1-git-send-email-jeffy.chen@rock-chips.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1500352203-21513-2-git-send-email-jeffy.chen@rock-chips.com>
To: linux-snps-arc@lists.infradead.org

The earlycon would be alive outside the init code in these cases:
1/ we have keep_bootcon in cmdline.
2/ we don't have a real console to switch to.

So remove the __init marking to avoid invalid memory access.

Signed-off-by: Jeffy Chen <jeffy.chen at rock-chips.com>
---

 drivers/tty/serial/arc_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 5ac06fc..77fe306 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -549,8 +549,8 @@ static struct console arc_console = {
 	.data	= &arc_uart_driver
 };
 
-static __init void arc_early_serial_write(struct console *con, const char *s,
-					  unsigned int n)
+static void arc_early_serial_write(struct console *con, const char *s,
+				   unsigned int n)
 {
 	struct earlycon_device *dev = con->data;
 
-- 
2.1.4
