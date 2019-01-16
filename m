From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 16 Jan 2019 11:27:19 +0300
Subject: [PATCH] wic: sdimage-bootpart: Use mmcblk0 drive instead of bogus
 mmcblk
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190116082719.36093-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Apparently either nobody ever used sdimage-bootpart.wks
or fstab was kept untouched due to "--no-fstab-update" usage as
some boards like IMX may have, see [1].

Otherwise addition of the following line to the target's fstab:
---------------------->8-----------------
/dev/mmcblkp1   /boot   vfat    defaults        0       0
---------------------->8-----------------

gets us unusable target:
---------------------->8-----------------
[*     ] A start job is running for dev-mmcblkp1.device (23s / 1min 30s)
[ TIME ] Timed out waiting for device dev-mmcblkp1.device.
[DEPEND] Dependency failed for /boot.
[DEPEND] Dependency failed for Local File Systems.

You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
to boot into default mode.
Press Enter for maintenance
---------------------->8-----------------

Fix it with use of "mmcblk0" device name.

[1] https://lists.yoctoproject.org/pipermail/meta-freescale/2018-February/022156.html

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Maciej Borzecki <maciej.borzecki at open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki at gmail.com>
Cc: Richard Purdie <richard.purdie at linuxfoundation.org>

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 scripts/lib/wic/canned-wks/sdimage-bootpart.wks | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/sdimage-bootpart.wks b/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
index 7ffd632f4a..63bc4dab6a 100644
--- a/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
+++ b/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
@@ -2,5 +2,5 @@
 # long-description: Creates a partitioned SD card image. Boot files
 # are located in the first vfat partition.
 
-part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16
-part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16
+part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 4
-- 
2.16.2
