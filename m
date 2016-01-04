From: CARLOS.PALMINHA@synopsys.com (CARLOS.PALMINHA@synopsys.com)
Date: Mon, 4 Jan 2016 14:55:15 +0000
Subject: [PATCH] arc: Removed local initramfs source file from axs101
 configuration.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Carlos Palminha <palminha@synopsys.com>

Cannot compile kernel with INITRAMFS SOURCE option.
Please move this option to a buildroot patch.

---
 arch/arc/configs/axs101_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index f1ac981..3d14cf8 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -12,7 +12,6 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="../arc_initramfs/"
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-- 
2.5.0
