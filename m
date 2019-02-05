From: clabbe@baylibre.com (Corentin Labbe)
Date: Tue,  5 Feb 2019 08:32:14 +0000
Subject: [PATCH 1/2] arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM
In-Reply-To: <1549355535-22052-1-git-send-email-clabbe@baylibre.com>
References: <1549355535-22052-1-git-send-email-clabbe@baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1549355535-22052-2-git-send-email-clabbe@baylibre.com>
To: linux-snps-arc@lists.infradead.org

We have now a HSDK device in our kernelci lab, but kernel builded via
the hsdk_defconfig lacks ramfs supports, so it cannot boot kernelci jobs
yet.

So this patch enable CONFIG_BLK_DEV_RAM in hsdk_defconfig.

Signed-off-by: Corentin Labbe <clabbe at baylibre.com>
---
 arch/arc/configs/hsdk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 6fd3d29546af..0e5fd29ed238 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -8,6 +8,7 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_BLK_DEV_RAM=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-- 
2.19.2
