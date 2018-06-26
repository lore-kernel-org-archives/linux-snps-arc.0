From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 26 Jun 2018 17:28:51 +0200
Subject: [PATCH] arc: configs: remove no longer needed config option
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180626152851.32674-1-anders.roxell@linaro.org>
To: linux-snps-arc@lists.infradead.org

Since commit eedf265aa003 ("devpts: Make each mount of devpts an
independent filesystem.") CONFIG_DEVPTS_MULTIPLE_INSTANCES isn't needed
in the defconfig anymore.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 arch/arc/configs/tb10x_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 1aca2e8fd1ba..2cc87f909747 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -56,7 +56,6 @@ CONFIG_STMMAC_ETH=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
-CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
-- 
2.18.0
