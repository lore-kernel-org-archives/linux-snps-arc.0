From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Fri, 12 Oct 2018 18:32:00 -0700
Subject: [PATCH 4/4] x86: select HAVE_MOVE_PMD for faster mremap (v1)
In-Reply-To: <20181013013200.206928-1-joel@joelfernandes.org>
References: <20181013013200.206928-1-joel@joelfernandes.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181013013200.206928-5-joel@joelfernandes.org>
To: linux-snps-arc@lists.infradead.org

Moving page-tables at the PMD-level on x86 is known to be safe. Enable
this option so that we can do fast mremap when possible.

Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1a0be022f91d..01c02a9d7825 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -171,6 +171,7 @@ config X86
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
+	select HAVE_MOVE_PMD
 	select HAVE_NMI
 	select HAVE_OPROFILE
 	select HAVE_OPTPROBES
-- 
2.19.0.605.g01d371f741-goog
