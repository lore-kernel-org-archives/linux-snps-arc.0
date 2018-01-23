From: luisbg@kernel.org (Luis de Bethencourt)
Date: Tue, 23 Jan 2018 15:16:09 +0000
Subject: [PATCH 2/2] ARC: boot log: Fix trailing semicolon
In-Reply-To: <20180123151609.23555-1-luisbg@kernel.org>
References: <20180123151609.23555-1-luisbg@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180123151609.23555-2-luisbg@kernel.org>
To: linux-snps-arc@lists.infradead.org

The trailing semicolon is an empty statement that does no operation.
Removing it since it doesn't do anything.

Signed-off-by: Luis de Bethencourt <luisbg at kernel.org>
---
 arch/arc/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 9d27331fe69a..ec12fe1c2f07 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -373,7 +373,7 @@ static void arc_chk_core_config(void)
 {
 	struct cpuinfo_arc *cpu = &cpuinfo_arc700[smp_processor_id()];
 	int saved = 0, present = 0;
-	char *opt_nm = NULL;;
+	char *opt_nm = NULL;
 
 	if (!cpu->extn.timer0)
 		panic("Timer0 is not present!\n");
-- 
2.15.1
