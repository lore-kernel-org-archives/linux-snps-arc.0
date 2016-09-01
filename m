From: Julia.Lawall@lip6.fr (Julia Lawall)
Date: Thu,  1 Sep 2016 19:51:38 +0200
Subject: [PATCH 9/9] serial/arc: constify uart_ops structures
In-Reply-To: <1472752298-981-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1472752298-981-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1472752298-981-10-git-send-email-Julia.Lawall@lip6.fr>
To: linux-snps-arc@lists.infradead.org

Check for uart_ops structures that are only stored in the ops field of a
uart_port structure.  This field is declared const, so uart_ops structures
that have this property can be declared as const also.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct uart_ops i at p = { ... };

@ok@
identifier r.i;
struct uart_port e;
position p;
@@
e.ops = &i at p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct uart_ops e;
@@
e at i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct uart_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall at lip6.fr>

---
 drivers/tty/serial/arc_uart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 3a1de5c..5ac06fc 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -464,7 +464,7 @@ static int arc_serial_poll_getchar(struct uart_port *port)
 }
 #endif
 
-static struct uart_ops arc_serial_pops = {
+static const struct uart_ops arc_serial_pops = {
 	.tx_empty	= arc_serial_tx_empty,
 	.set_mctrl	= arc_serial_set_mctrl,
 	.get_mctrl	= arc_serial_get_mctrl,
