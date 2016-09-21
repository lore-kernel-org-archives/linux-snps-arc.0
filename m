From: noamca@mellanox.com (Noam Camus)
Date: Wed, 21 Sep 2016 13:51:48 +0300
Subject: [PATCH] ARC: CONFIG_NODES_SHIFT fix default values
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474455108-13550-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Seem like values assigned as absolute number and not and
shift value, i.e. should be 0 for one node (2^0) and 1 for
couple of nodes (2^1)

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 6af0b43..f347715 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -383,8 +383,8 @@ endchoice
 
 config NODES_SHIFT
 	int "Maximum NUMA Nodes (as a power of 2)"
-	default "1" if !DISCONTIGMEM
-	default "2" if DISCONTIGMEM
+	default "0" if !DISCONTIGMEM
+	default "1" if DISCONTIGMEM
 	depends on NEED_MULTIPLE_NODES
 	---help---
 	  Accessing memory beyond 1GB (with or w/o PAE) requires 2 memory
-- 
1.7.1
