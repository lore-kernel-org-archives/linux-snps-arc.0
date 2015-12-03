From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:04 +0530
Subject: [PATCH 06/17] ARC: dw2 unwind: Don't verify Main FDE Table size
 everytime
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-7-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This is already done at boot time in setup_unwind_table()

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 2bb3c1c048bb..f57a0d50185c 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -892,8 +892,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 #endif
 
 	table = find_table(pc);
-	if (table != NULL
-	    && !(table->size & (sizeof(*fde) - 1))) {
+	if (table != NULL) {
 		const u8 *hdr = table->header;
 		unsigned long tableSize;
 
-- 
1.9.1
