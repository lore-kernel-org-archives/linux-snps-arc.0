From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 30 Jun 2017 16:14:14 +0300
Subject: [PATCH] ARC: Fix wrong access to "sp" member in user_regs_struct
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170630131414.32627-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

"sp" register is member of "scratch" structure (which is nested
in user_regs_struct)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 linux/arc/arch_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/arc/arch_regs.c b/linux/arc/arch_regs.c
index 9a5c2df..88bb799 100644
--- a/linux/arc/arch_regs.c
+++ b/linux/arc/arch_regs.c
@@ -1,4 +1,4 @@
 static struct user_regs_struct arc_regs;
-unsigned long *const arc_sp_ptr = &arc_regs.sp;
+unsigned long *const arc_sp_ptr = &arc_regs.scratch.sp;
 #define ARCH_REGS_FOR_GETREGSET arc_regs
 #define ARCH_PC_REG arc_regs.efa
-- 
2.9.3
