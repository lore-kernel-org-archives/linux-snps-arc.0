From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 14:41:41 +0530
Subject: [PATCH 4/5] ARCv2: Elide sending new cross core intr if receiver
 didn't ack prev
In-Reply-To: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
References: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456218702-11911-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARConnect/MCIP IPI sending has a retry-wait loop in case caller had
not seen a previous such interrupt. Turns out that it is not needed at
all. Linux cross core calling allows coalescing multiple IPIs to same
receiver - it is fine as long as there is one.

This logic is built into upper layer already, at a higher level of
abstraction. ipi_send_msg_one() sets the actual msg payload, but it only
calls MCIP IPI sending if msg holder was empty (using
atomic-set-new-and-get-old construct). Thus it is unlikely that the
retry-wait looping was ever getting exercised at all.

Cc: Chuck Jordan <cjordan at synopsys.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/mcip.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index e30d5d428330..7afc3c703ed1 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -40,26 +40,19 @@ static void mcip_ipi_send(int cpu)
 		return;
 	}
 
+	raw_spin_lock_irqsave(&mcip_lock, flags);
+
 	/*
-	 * NOTE: We must spin here if the other cpu hasn't yet
-	 * serviced a previous message. This can burn lots
-	 * of time, but we MUST follows this protocol or
-	 * ipi messages can be lost!!!
-	 * Also, we must release the lock in this loop because
-	 * the other side may get to this same loop and not
-	 * be able to ack -- thus causing deadlock.
+	 * If receiver already has a pending interrupt, elide sending this one.
+	 * Linux cross core calling works well with concurrent IPIs
+	 * coalesced into one
+	 * see arch/arc/kernel/smp.c: ipi_send_msg_one()
 	 */
+	__mcip_cmd(CMD_INTRPT_READ_STATUS, cpu);
+	ipi_was_pending = read_aux_reg(ARC_REG_MCIP_READBACK);
+	if (!ipi_was_pending)
+		__mcip_cmd(CMD_INTRPT_GENERATE_IRQ, cpu);
 
-	do {
-		raw_spin_lock_irqsave(&mcip_lock, flags);
-		__mcip_cmd(CMD_INTRPT_READ_STATUS, cpu);
-		ipi_was_pending = read_aux_reg(ARC_REG_MCIP_READBACK);
-		if (ipi_was_pending == 0)
-			break; /* break out but keep lock */
-		raw_spin_unlock_irqrestore(&mcip_lock, flags);
-	} while (1);
-
-	__mcip_cmd(CMD_INTRPT_GENERATE_IRQ, cpu);
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 
 #ifdef CONFIG_ARC_IPI_DBG
-- 
2.5.0
