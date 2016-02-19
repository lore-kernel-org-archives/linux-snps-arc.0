From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Fri, 19 Feb 2016 09:40:18 +0000
Subject: [PATCH 4/4] ARC: axs10x: Update defconfigs so that I2S is enabled
In-Reply-To: <cover.1455872448.git.palminha@synopsys.com>
References: <cover.1455872448.git.palminha@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cf8d0dab3658c2f7641a69809ba409f93ce43f9c.1455872448.git.palminha@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Jose Abreu <joabreu@synopsys.com>

The defconfigs for the AXS boards were updated to
enable Designware I2S driver.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
---
 arch/arc/configs/axs101_defconfig     | 1 +
 arch/arc/configs/axs103_defconfig     | 1 +
 arch/arc/configs/axs103_smp_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 7c22163..dd38d03 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -116,3 +116,4 @@ CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
+CONFIG_SND_DESIGNWARE_I2S=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index d63aef0..ff7162e 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -119,3 +119,4 @@ CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
+CONFIG_SND_DESIGNWARE_I2S=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index f4b51ce..b9f4671 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -120,3 +120,4 @@ CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
+CONFIG_SND_DESIGNWARE_I2S=y
-- 
2.5.0
