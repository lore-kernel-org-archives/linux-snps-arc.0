From: claudiu.beznea@microchip.com (Claudiu Beznea)
Date: Tue, 10 Sep 2019 16:47:15 +0300
Subject: [PATCH 6/7] drivers/clocksource/timer-of: keep declaration on one line
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1568123236-767-7-git-send-email-claudiu.beznea@microchip.com>
To: linux-snps-arc@lists.infradead.org

timer_of_init() declaration could be kept on one line (80 chars per
line rule is not broken).

Signed-off-by: Claudiu Beznea <claudiu.beznea at microchip.com>
---
 drivers/clocksource/timer-of.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 9fb8c5523150..af72e29e2ea4 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -84,8 +84,7 @@ static inline unsigned int timer_of_is_clockevent(struct timer_of *to)
 		 (TIMER_OF_TYPE_CE | TIMER_OF_TYPE_CE_AND_CS));
 }
 
-extern int __init timer_of_init(struct device_node *np,
-				struct timer_of *to);
+extern int __init timer_of_init(struct device_node *np, struct timer_of *to);
 
 extern void __init timer_of_cleanup(struct timer_of *to);
 
-- 
2.7.4
