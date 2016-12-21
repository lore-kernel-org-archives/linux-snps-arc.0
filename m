From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 21 Dec 2016 14:40:54 +0300
Subject: [PATCH] arc: enable unaligned access in kernel mode
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1482320454-5731-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This enables misaligned access handling even in kernel mode.
Some wireless drivers (ath9k-htc and mt7601u) use misaligned accesses
here and there and to cope with that without fixing stuff in the drivers
we're just gracefully handling it on ARC.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: John Crispin <john at phrozen.org>
---
 arch/arc/kernel/unaligned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index abd961f3e763..58b7415e47ca 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -205,8 +205,8 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 	struct disasm_state state;
 	char buf[TASK_COMM_LEN];
 
-	/* handle user mode only and only if enabled by sysadmin */
-	if (!user_mode(regs) || !unaligned_enabled)
+	/* handle only if enabled by sysadmin */
+	if (!unaligned_enabled)
 		return 1;
 
 	if (no_unaligned_warning) {
-- 
2.7.4
