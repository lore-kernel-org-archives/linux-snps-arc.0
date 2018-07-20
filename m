From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 20 Jul 2018 16:43:36 -0700
Subject: [uclibc-ng-test] Revert "arc: disable deadlocking test"
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1532130216-22598-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This seems to work fine on ARC !

This reverts commit f0567d67075ff7a27ada8ab5bce750fe8a739763.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 test/nptl/Makefile.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/test/nptl/Makefile.in b/test/nptl/Makefile.in
index 761f52db8366..35859f944911 100644
--- a/test/nptl/Makefile.in
+++ b/test/nptl/Makefile.in
@@ -1,11 +1,6 @@
 # uClibc-ng NPTL tests
 # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 
-# deadlock
-ifeq ($(TARGET_ARCH),arc)
-TESTS_DISABLED := tst-cond16
-endif
-
 ifeq ($(TARGET_ARCH),metag)
 TESTS_DISABLED := tst-cleanup0 tst-cleanupx0
 endif
-- 
2.7.4
