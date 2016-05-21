From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:50 +0200
Subject: [PATCH 0076/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114650.3174-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index f63b8bf..2ee7a4d 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -392,7 +392,7 @@ void __init setup_arch(char **cmdline_p)
 		/*
 		 * If we are here, it is established that @uboot_arg didn't
 		 * point to DT blob. Instead if u-boot says it is cmdline,
-		 * Appent to embedded DT cmdline.
+		 * append to embedded DT cmdline.
 		 * setup_machine_fdt() would have populated @boot_command_line
 		 */
 		if (uboot_tag == 1) {
-- 
2.8.2.534.g1f66975
