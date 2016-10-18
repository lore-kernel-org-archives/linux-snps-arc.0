From: noamca@mellanox.com (Noam Camus)
Date: Tue, 18 Oct 2016 16:47:15 +0300
Subject: [PATCH] ARC: Adjust cpuinfo for non-continuous cpu ids
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1476798435-8357-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

num_possible_cpus() returns how many CPUs may be present on system.
However we want the highest possible CPU number.
This may be differ in a sparsed possible CPUs map.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/setup.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index f52a0d0..d13ce84 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -506,7 +506,7 @@ static void *c_start(struct seq_file *m, loff_t *pos)
 	 * way to pass it w/o having to kmalloc/free a 2 byte string.
 	 * Encode cpu-id as 0xFFcccc, which is decoded by show routine.
 	 */
-	return *pos < num_possible_cpus() ? cpu_to_ptr(*pos) : NULL;
+	return *pos < nr_cpu_ids ? cpu_to_ptr(*pos) : NULL;
 }
 
 static void *c_next(struct seq_file *m, void *v, loff_t *pos)
-- 
1.7.1
