From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 21 Dec 2018 12:10:25 -0800
Subject: [PATCH] rt/tst-posix_spawn: fix random crash due to uninitialized var
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545423025-23698-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Seen on ARC when it passed in 1 setup, but segv on other

| Path: /sd/arc_initramfs_hs_1812-gnu-2018.09-BIG/uClibc-ng-testsuite-Os/rt/tst-posix_spawn
| CPU: 1 PID: 3313 Comm: tst-posix_spawn Not tainted
| 4.19.0-00003-ga4e0cf751ad3 #108
|
| [ECR   ]: 0x00050100 => Invalid Read @ 0x00000000 by insn @ 0x20060c84
| [EFA   ]: 0x00000000
| [BLINK ]: 0x20060bf4
| [ERET  ]: 0x20060c84
|     @off 0x52c84 in [/lib/libuClibc-1.0.29.so]
|     VMA: 0x2000e000 to 0x20072000

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 test/rt/tst-posix_spawn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/rt/tst-posix_spawn.c b/test/rt/tst-posix_spawn.c
index 28b6500c8e57..45cd325063f8 100644
--- a/test/rt/tst-posix_spawn.c
+++ b/test/rt/tst-posix_spawn.c
@@ -26,6 +26,7 @@ void run_cmd(char *cmd)
     posix_spawnattr_setflags(&attrs, POSIX_SPAWN_SETPGROUP | POSIX_SPAWN_SETSIGDEF);
     posix_spawnattr_setpgroup(&attrs, 0);
     posix_spawnattr_setsigdefault(&attrs, &defsignals);
+    posix_spawn_file_actions_init(&actions);
 
     printf("Run command: %s\n", cmd);
     status = posix_spawn(&pid, "/bin/sh", &actions, &attrs, argv, environ);
-- 
2.7.4
