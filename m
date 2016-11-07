From: noamca@mellanox.com (Noam Camus)
Date: Mon, 7 Nov 2016 09:34:21 +0200
Subject: [PATCH] ARC: [plat-eznps] remove IPI clear from SMP operations
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478504061-4668-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Generic IRQ mechanism is already acknowledge the IPI IRQ.
Doing this once more time in IPI handler is not needed.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/plat-eznps/smp.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arc/plat-eznps/smp.c b/arch/arc/plat-eznps/smp.c
index 5e901f8..56a4c85 100644
--- a/arch/arc/plat-eznps/smp.c
+++ b/arch/arc/plat-eznps/smp.c
@@ -140,16 +140,10 @@ static void eznps_init_per_cpu(int cpu)
 	mtm_enable_core(cpu);
 }
 
-static void eznps_ipi_clear(int irq)
-{
-	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
-}
-
 struct plat_smp_ops plat_smp_ops = {
 	.info		= smp_cpuinfo_buf,
 	.init_early_smp	= eznps_init_cpumasks,
 	.cpu_kick	= eznps_smp_wakeup_cpu,
 	.ipi_send	= eznps_ipi_send,
 	.init_per_cpu	= eznps_init_per_cpu,
-	.ipi_clear	= eznps_ipi_clear,
 };
-- 
1.7.1
