From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Fri, 12 Oct 2018 18:31:59 -0700
Subject: [PATCH 3/4] arm64: select HAVE_MOVE_PMD for faster mremap (v1)
In-Reply-To: <20181013013200.206928-1-joel@joelfernandes.org>
References: <20181013013200.206928-1-joel@joelfernandes.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181013013200.206928-4-joel@joelfernandes.org>
To: linux-snps-arc@lists.infradead.org

Moving page-tables at the PMD-level on arm64 is known to be safe. Enable
this option so that we can do fast mremap when possible.

Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1b1a0e95c751..5d7c35c6f90c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -135,6 +135,7 @@ config ARM64
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP if NUMA
+	select HAVE_MOVE_PMD
 	select HAVE_NMI
 	select HAVE_PATA_PLATFORM
 	select HAVE_PERF_EVENTS
-- 
2.19.0.605.g01d371f741-goog
