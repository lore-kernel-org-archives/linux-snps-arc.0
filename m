From: sashal@kernel.org (Sasha Levin)
Date: Fri, 29 Mar 2019 20:54:03 -0400
Subject: [PATCH AUTOSEL 4.14 02/37] arc: hsdk_defconfig: Enable
 CONFIG_BLK_DEV_RAM
In-Reply-To: <20190330005441.27540-1-sashal@kernel.org>
References: <20190330005441.27540-1-sashal@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190330005441.27540-2-sashal@kernel.org>
To: linux-snps-arc@lists.infradead.org

From: Corentin Labbe <clabbe@baylibre.com>

[ Upstream commit 0728aeb7ead99a9b0dac2f3c92b3752b4e02ff97 ]

We have now a HSDK device in our kernelci lab, but kernel builded via
the hsdk_defconfig lacks ramfs supports, so it cannot boot kernelci jobs
yet.

So this patch enable CONFIG_BLK_DEV_RAM in hsdk_defconfig.

Signed-off-by: Corentin Labbe <clabbe at baylibre.com>
Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 arch/arc/configs/hsdk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 083560e9e571..4dac1169f528 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -9,6 +9,7 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_BLK_DEV_RAM=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-- 
2.19.1
