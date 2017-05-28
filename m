From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:52:07 +0300
Subject: [PATCH v2 10/11] ARC: enable platform specific mem_service
 implementation
In-Reply-To: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-11-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

For User Mode Memory Bus Error some platforms do not creat interrupt
level 2 e.g. nps400 creates machine check exception.
Turning mem_service into weak symbol allows each platform to override
mem_service with its own implementation.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/kernel/entry-compact.S |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arc/kernel/entry-compact.S b/arch/arc/kernel/entry-compact.S
index f285dbb..c5736d6 100644
--- a/arch/arc/kernel/entry-compact.S
+++ b/arch/arc/kernel/entry-compact.S
@@ -200,8 +200,9 @@ END(handle_interrupt_level2)
 ; ---------------------------------------------
 ; User Mode Memory Bus Error Interrupt Handler
 ; (Kernel mode memory errors handled via separate exception vectors)
+; Platforms can override this weak version if needed
 ; ---------------------------------------------
-ENTRY(mem_service)
+WEAK(mem_service)
 
 	INTERRUPT_PROLOGUE 2
 
-- 
1.7.1
