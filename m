From: claudiu.beznea@microchip.com (Claudiu Beznea)
Date: Tue, 10 Sep 2019 16:47:12 +0300
Subject: [PATCH 3/7] clocksource/timer_of: use BIT() macro
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1568123236-767-4-git-send-email-claudiu.beznea@microchip.com>
To: linux-snps-arc@lists.infradead.org

Use BIT() macro for timer_of flags.

Signed-off-by: Claudiu Beznea <claudiu.beznea at microchip.com>
---
 drivers/clocksource/timer-of.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index ee467bb16ca3..df861ea2ec42 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -4,9 +4,9 @@
 
 #include <linux/clockchips.h>
 
-#define TIMER_OF_BASE	0x1
-#define TIMER_OF_CLOCK	0x2
-#define TIMER_OF_IRQ	0x4
+#define TIMER_OF_BASE		BIT(0)
+#define TIMER_OF_CLOCK		BIT(1)
+#define TIMER_OF_IRQ		BIT(2)
 
 struct of_timer_irq {
 	int irq;
-- 
2.7.4
