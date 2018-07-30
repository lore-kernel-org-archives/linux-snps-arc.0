From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 30 Jul 2018 19:13:34 +0300
Subject: [PATCH v2] tst-tzset: Use default timeout (20 seconds as of now)
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180730161334.26026-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The timeout was set to 5 seconds in commit
112f28e88c4e ("tst-tzset: raise timeout to 5 seconds") to increase it
from a default 2 seconds.

That was before the default timeout was changed to 20 seconds in commit
a28605b22946 (" test-skeleton: increase default TIMEOUT to 20 seconds").

If there's no good reason to limit execution time to less than default
we shouldn't specify random values. That said in tst-tzset we'll be
using default 20 seconds from now on.

Cc: Joseph Myers <joseph at codesourcery.com>
Cc: Andreas Schwab <schwab at suse.de>
---

 Changes v1 -> v2:
  * Rely on default timeout instead of test-specific one

 timezone/tst-tzset.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/timezone/tst-tzset.c b/timezone/tst-tzset.c
index 27f986b56dab..fca704c2ad2d 100644
--- a/timezone/tst-tzset.c
+++ b/timezone/tst-tzset.c
@@ -25,7 +25,6 @@
 #include <time.h>
 #include <unistd.h>
 
-#define TIMEOUT 5
 static int do_test (void);
 #define TEST_FUNCTION do_test ()
 #include "../test-skeleton.c"
-- 
2.17.1
