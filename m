From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Dec 2017 09:47:56 -0800
Subject: [PATCH] Fix subtle race in tst-cancel2 / tst-cancelx2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512755276-1705-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

When ran on ARC, these tests would ocassionally fail

| [ARCLinux]# for i in 1 2 3 4 5 ; do ./tst-cancel2; echo $?; done
| write succeeded
| result is wrong: expected 0xffffffff, got 0x1
| 1							<-- fail
| 0							<-- pass
| 0							<--- pass
| 0							<-- pass
| write succeeded
| result is wrong: expected 0xffffffff, got 0x1
| 1							<-- fail

Same test (which originated form glibc) doesn't fail in glibc builds.
Turns out there's a subtle race in uclibc version

The test creates a new thread, makes it do a looong write call, and
parent then cancels the thread, expecting it to unwind out of write
call cleanly. However the write (even for 10k bytes) could fnish befor
eparent gets a chance ti run and/or cancel - causing the occasional
failire.

Cc: Cupertino Miranda <cmiranda at synopsys.com>
Fix this subtelty by making it write not just once but forever.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 test/nptl/tst-cancel2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/test/nptl/tst-cancel2.c b/test/nptl/tst-cancel2.c
index 45c9e8ea957a..08dd13b10f37 100644
--- a/test/nptl/tst-cancel2.c
+++ b/test/nptl/tst-cancel2.c
@@ -32,11 +32,7 @@ tf (void *arg)
      write blocks.  */
   char buf[100000];
 
-  if (write (fd[1], buf, sizeof (buf)) == sizeof (buf))
-    {
-      puts ("write succeeded");
-      return (void *) 1l;
-    }
+  while (write (fd[1], buf, sizeof (buf)) > 0);
 
   return (void *) 42l;
 }
-- 
2.7.4
