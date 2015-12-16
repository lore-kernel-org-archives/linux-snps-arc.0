From: noamc@ezchip.com (Noam Camus)
Date: Wed, 16 Dec 2015 03:10:37 +0200
Subject: [PATCH v4 18/19] ARC: [plat-eznps] Use dedicated COMMAND_LINE_SIZE
In-Reply-To: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450228238-4499-19-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

The default 256 bytes sometimes is just not enough.
We usually provide earlycon=... and console=... and ip=...
All this and more may need more room.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/setup.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 3078466..48b37c6 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -12,7 +12,11 @@
 #include <linux/types.h>
 #include <uapi/asm/setup.h>
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+#define COMMAND_LINE_SIZE 2048
+#else
 #define COMMAND_LINE_SIZE 256
+#endif
 
 /*
  * Data structure to map a ID to string
-- 
1.7.1
