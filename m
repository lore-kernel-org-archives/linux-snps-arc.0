From: colin.king@canonical.com (Colin King)
Date: Mon, 24 Oct 2016 11:47:14 +0100
Subject: [PATCH] ARC: return -EFAULT on failed access_ok for arc_usr_cmpxchg
 syscall
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161024104714.10047-1-colin.king@canonical.com>
To: linux-snps-arc@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

arc_usr_cmpxchg currently returns an uninitialized value in ret
on a failed access_ok call. Instead, return -EFAULT.

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 arch/arc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index a746008..9ae3e1c 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -47,7 +47,7 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
 	int ret;
 
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
-		return ret;
+		return -EFAULT;
 
 	preempt_disable();
 
-- 
2.9.3
