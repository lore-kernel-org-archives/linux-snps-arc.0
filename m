From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:16 +0200
Subject: [PATCH v1 09/20] ARC: add CONFIG_CLKSRC_OF support to time_init()
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-10-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

External clock source can be used if included by one of
DTS file of a chosen platform.
Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/kernel/time.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index dfad287..5313961 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -283,6 +283,10 @@ void __init time_init(void)
 		 */
 		clocksource_register_hz(&arc_counter, arc_get_core_freq());
 
+#ifdef CONFIG_CLKSRC_OF
+	clocksource_of_init();
+#endif
+
 	/* sets up the periodic event timer */
 	arc_local_timer_setup();
 }
-- 
1.7.1
