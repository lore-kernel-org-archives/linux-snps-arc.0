From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:12 +0530
Subject: [PATCH 14/17] ARC: dw2 unwind: No need for __get_user
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-15-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index b2053b55d076..4f739716f908 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -1056,7 +1056,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 			    || addr + sizeof(unsigned long) > endLoc)
 					return -EIO;
 
-			__get_user(FRAME_REG(i, unsigned long), (unsigned long __user *)addr);
+			FRAME_REG(i, unsigned long) = *(unsigned long *)addr;
 			break;
 		}
 		unw_debug("r%d: 0x%lx\n", i, *fptr);
-- 
1.9.1
