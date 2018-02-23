From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Fri, 23 Feb 2018 14:38:35 +0100
Subject: [PATCH v2 7/9] serial: sh-sci: Fix out-of-bounds access through DT
 alias
In-Reply-To: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
References: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1519393117-31998-8-git-send-email-geert+renesas@glider.be>
To: linux-snps-arc@lists.infradead.org

The sci_ports[] array is indexed using a value derived from the
"serialN" alias in DT, which may lead to an out-of-bounds access.

Fix this by adding a range check.

Note that the array size is defined by a Kconfig symbol
(CONFIG_SERIAL_SH_SCI_NR_UARTS), so this can even be triggered using a
legitimate DTB.

Fixes: 97ed9790c514066b ("serial: sh-sci: Remove unused platform data capabilities field")
Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
v2:
  - Fix Fixes reference,
  - Use ARRAY_SIZE().
---
 drivers/tty/serial/sh-sci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4d14f321cbec95e0..f6a6610d434efc33 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3096,6 +3096,10 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to get alias id (%d)\n", id);
 		return NULL;
 	}
+	if (id >= ARRAY_SIZE(sci_ports)) {
+		dev_err(&pdev->dev, "serial%d out of range\n", id);
+		return NULL;
+	}
 
 	sp = &sci_ports[id];
 	*dev_id = id;
-- 
2.7.4
