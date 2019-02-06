From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  6 Feb 2019 16:02:33 +0300
Subject: [PATCH] don't check console device file on fs when booting with
 initrd/initramfs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190206130233.43745-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In case of initrd/initramfs /dev/console might not exist that early
as devtmpfs is mounted a bit later by /init process so disable this
check in that case.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 init/main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 387a2d7dc90b..5b904bc78fa4 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1112,7 +1112,9 @@ static int __ref kernel_init(void *unused)
 
 static noinline void __init kernel_init_freeable(void)
 {
+#ifndef CONFIG_BLK_DEV_INITRD
 	struct kstat console_stat;
+#endif
 	/*
 	 * Wait until kthreadd is all set-up.
 	 */
@@ -1144,11 +1146,17 @@ static noinline void __init kernel_init_freeable(void)
 
 	do_basic_setup();
 
-	/* Use /dev/console to infer if the rootfs is setup properly */
+#ifndef CONFIG_BLK_DEV_INITRD
+       /*
+        * Use /dev/console to infer if the rootfs is setup properly.
+        * In case of initrd or initramfs /dev/console might be instantiated
+        * later by /init so don't do this check for CONFIG_BLK_DEV_INITRD
+        */
 	if (vfs_lstat((char __user *) "/dev/console", (struct kstat __user *) &console_stat)
 			|| !S_ISCHR(console_stat.mode)) {
 		panic("/dev/console is missing or not a character device!\nPlease ensure your rootfs is properly configured\n");
 	}
+#endif
 
 	/* Open the /dev/console on the rootfs, this should never fail */
 	if (ksys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
-- 
2.16.2
