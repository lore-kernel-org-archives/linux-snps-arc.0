From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Jan 2019 19:31:57 +0300
Subject: [PATCH] etnaviv: allow to build on ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190114163157.20114-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC HSDK SoC has Vivante GPU IP so allow build etnaviv for ARC.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/gpu/drm/etnaviv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index 342591a1084e..49a9957c3373 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -2,7 +2,7 @@
 config DRM_ETNAVIV
 	tristate "ETNAVIV (DRM support for Vivante GPU IP cores)"
 	depends on DRM
-	depends on ARCH_MXC || ARCH_DOVE || ARM || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_DOVE || ARM || ARC || COMPILE_TEST
 	depends on MMU
 	select SHMEM
 	select SYNC_FILE
-- 
2.14.5
