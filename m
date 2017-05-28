From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:52:00 +0300
Subject: [PATCH v2 03/11] ARC: typo fix in mm/fault.c
In-Reply-To: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-4-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Liav Rehana <liavr@mellanox.com>

Signed-off-by: Liav Rehana <liavr at mellanox.com>
Signed-off-by: Noam Camus <noamca at mellanox.com>
Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/mm/fault.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 162c975..a0b7bd6 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -207,7 +207,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	/* Are we prepared to handle this kernel fault?
 	 *
 	 * (The kernel has valid exception-points in the source
-	 *  when it acesses user-memory. When it fails in one
+	 *  when it accesses user-memory. When it fails in one
 	 *  of those points, we find it in a table and do a jump
 	 *  to some fixup code that loads an appropriate error
 	 *  code)
-- 
1.7.1
