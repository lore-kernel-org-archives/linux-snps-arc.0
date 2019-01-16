From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 16 Jan 2019 14:29:51 +0300
Subject: [PATCH 2/2] ARCv2: enable HAVE_EFFICIENT_UNALIGNED_ACCESS
In-Reply-To: <20190116112951.10641-1-Eugeniy.Paltsev@synopsys.com>
References: <20190116112951.10641-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190116112951.10641-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Select HAVE_EFFICIENT_UNALIGNED_ACCESS for ARCv2 as we unconditionally
enable unaligned access in HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 376366a7db81..20ba916c50a3 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -117,6 +117,7 @@ config ISA_ARCOMPACT
 config ISA_ARCV2
 	bool "ARC ISA v2"
 	select ARC_TIMERS_64BIT
+	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	help
 	  ISA for the Next Generation ARC-HS cores
 
-- 
2.14.5
