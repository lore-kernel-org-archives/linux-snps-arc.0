From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:43 -0800
Subject: [PATCH 21/21] NEWS: mention ARC port
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-22-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog | 1 +
 NEWS      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index 46d288808153..92e19ac45df2 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,6 +1,7 @@
 2018-12-17  Vineet Gupta <vgupta at synopsys.com>
 
 	* scripts/build-many-glibcs.py: Enable building for ARC.
+	* NEW: Mention ARC port.
 
 2018-12-17  Cupertino Miranda <cmiranda at synopsys.com>
 
diff --git a/NEWS b/NEWS
index ae80818df4b3..56b21c3b9336 100644
--- a/NEWS
+++ b/NEWS
@@ -1078,6 +1078,8 @@ Version 2.26
 
 Major new features:
 
+* Port to ARC HS cores has been contributed by Synopsys.
+
 * A per-thread cache has been added to malloc. Access to the cache requires
   no locks and therefore significantly accelerates the fast path to allocate
   and free small amounts of memory. Refilling an empty cache requires locking
-- 
2.7.4
