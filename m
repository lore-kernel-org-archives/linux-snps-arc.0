From: noamca@mellanox.com (Noam Camus)
Date: Wed, 19 Oct 2016 14:25:03 +0300
Subject: [PATCH v2] ARC: Adjust cpuinfo for non-continuous cpu ids
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1476876303-18768-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

num_possible_cpus() returns how many CPUs may be present on system.
However we want the highest possible CPU number.
This may be differ in a sparsed possible CPUs map.
Such map achived by OF for plat-eznps.

For example if we have:
possible cpus mask 0,3

Then:
num_possible_cpus() is equal 2
	while
nr_cpu_ids is equal 4.

Only for value 4 c_start() will provide correct cpuinfo at procfs.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/kernel/setup.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 64907de..bd2e3a4 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -512,7 +512,7 @@ static void *c_start(struct seq_file *m, loff_t *pos)
 	 * way to pass it w/o having to kmalloc/free a 2 byte string.
 	 * Encode cpu-id as 0xFFcccc, which is decoded by show routine.
 	 */
-	return *pos < num_possible_cpus() ? cpu_to_ptr(*pos) : NULL;
+	return *pos < nr_cpu_ids ? cpu_to_ptr(*pos) : NULL;
 }
 
 static void *c_next(struct seq_file *m, void *v, loff_t *pos)
-- 
1.7.1
