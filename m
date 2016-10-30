From: noamca@mellanox.com (Noam Camus)
Date: Sun, 30 Oct 2016 09:48:42 +0200
Subject: [PATCH] ARC: [SMP] avoid overriding present cpumask
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477813722-30832-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

At smp_prepare_cpus() we set present cpu mask as part of init
for all CPUs at range [0-max_cpus].
This is done without checking if this mask is already being set.
At platform of eznps this mask is already being initialized at
smp_init_cpus() by using hook plat_smp_ops.init_early_smp().
So to avoid overriding of present cpu mask we check the number of
bits which are set in this mask. At the begin only bit for boot CPU
is set so if number of bits already set is no more than one we can be
assure that there is no overriding of this mask.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/kernel/smp.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 03d5151..8c0eec9 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -71,8 +71,10 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * Initialise the present map, which describes the set of CPUs
 	 * actually populated at the present time.
 	 */
-	for (i = 0; i < max_cpus; i++)
-		set_cpu_present(i, true);
+	if (num_present_cpus() <= 1) {
+		for (i = 0; i < max_cpus; i++)
+			set_cpu_present(i, true);
+	}
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
-- 
1.7.1
