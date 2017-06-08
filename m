From: krzk@kernel.org (Krzysztof Kozlowski)
Date: Thu,  8 Jun 2017 18:10:28 +0200
Subject: [PATCH 17/35] ARC: defconfig: Cleanup from old Kconfig options
In-Reply-To: <20170608160836.12196-1-krzk@kernel.org>
References: <20170608160836.12196-1-krzk@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170608161049.12421-17-krzk@kernel.org>
To: linux-snps-arc@lists.infradead.org

Remove old, dead Kconfig option INET_LRO. It is gone since
commit 7bbf3cae65b6 ("ipv4: Remove inet_lro library").

Signed-off-by: Krzysztof Kozlowski <krzk at kernel.org>
---
 arch/arc/configs/nps_defconfig   | 1 -
 arch/arc/configs/tb10x_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
index ede625c76216..7c9c706ae7f6 100644
--- a/arch/arc/configs/nps_defconfig
+++ b/arch/arc/configs/nps_defconfig
@@ -39,7 +39,6 @@ CONFIG_IP_PNP=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 4c5118384eb5..f30182549395 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -38,7 +38,6 @@ CONFIG_IP_MULTICAST=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
-- 
2.9.3
