From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 30 Jan 2019 19:32:42 +0300
Subject: [PATCH v2 3/5] ARCv2: use unaligned access in SW
In-Reply-To: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
References: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190130163244.10870-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Select HAVE_EFFICIENT_UNALIGNED_ACCESS and allow GCC to generate
unaligned data if we enable enable unaligned access in HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/Kconfig  | 1 +
 arch/arc/Makefile | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 37c8aeefa3a5..a1d976c612a6 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -390,6 +390,7 @@ if ISA_ARCV2
 config ARC_USE_UNALIGNED_MEM_ACCESS
 	bool "Handle unaligned access in HW and use it"
 	default y
+	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	help
 	  The ARC HS architecture supports unaligned memory access
 	  which is disabled by default. Enable unaligned access in
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index df00578c279d..e2b991f75bc5 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -28,6 +28,12 @@ cflags-$(CONFIG_ARC_HAS_SWAPE)		+= -mswape
 
 ifdef CONFIG_ISA_ARCV2
 
+ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
+cflags-y				+= -munaligned-access
+else
+cflags-y				+= -mno-unaligned-access
+endif
+
 ifndef CONFIG_ARC_HAS_LL64
 cflags-y				+= -mno-ll64
 endif
-- 
2.14.5
