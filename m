From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 30 Jul 2018 18:28:44 +0300
Subject: [PATCH] tst-tzset: raise timeout to 10 seconds
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180730152844.21999-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On ARC HSDK board even though it operates @ 1GHz this test runs
~7 seconds which gives us failures all the time.

That's what happens now:
| # time .../build/timezone/tst-tzset
| Timed out: killed the child process
| Command exited with non-zero status 1
| real    0m 5.11s
| user    0m 3.59s
| sys     0m 1.45s

And that's what happens with longer time-out:
| # time .../build/timezone/tst-tzset
| real    0m 6.95s
| user    0m 4.97s
| sys     0m 1.99s
|
| # echo $?
| 0
---
 timezone/tst-tzset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/timezone/tst-tzset.c b/timezone/tst-tzset.c
index 27f986b56dab..534f7acdf75f 100644
--- a/timezone/tst-tzset.c
+++ b/timezone/tst-tzset.c
@@ -25,7 +25,7 @@
 #include <time.h>
 #include <unistd.h>
 
-#define TIMEOUT 5
+#define TIMEOUT 10
 static int do_test (void);
 #define TEST_FUNCTION do_test ()
 #include "../test-skeleton.c"
-- 
2.17.1
