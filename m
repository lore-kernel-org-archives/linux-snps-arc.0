From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Mon, 12 Sep 2016 18:55:03 +0300
Subject: [PATCH] ARCv2: intc: Use kflag if STATUS32.IE must be reset
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473695703-29547-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In the end of "arc_init_IRQ" STATUS32.IE flag is going to be affected by
"flag" instruction but "flag" never touches IE flag on ARCv2. So "kflag"
instruction must be used instead of "flag".

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 6c24faf..62b59409 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -74,7 +74,7 @@ void arc_init_IRQ(void)
 	tmp = read_aux_reg(0xa);
 	tmp |= STATUS_AD_MASK | (irq_prio << 1);
 	tmp &= ~STATUS_IE_MASK;
-	asm volatile("flag %0	\n"::"r"(tmp));
+	asm volatile("kflag %0	\n"::"r"(tmp));
 }
 
 static void arcv2_irq_mask(struct irq_data *data)
-- 
2.7.4
