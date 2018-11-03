From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri,  2 Nov 2018 21:00:41 -0700
Subject: [PATCH -next 3/3] mm: select HAVE_MOVE_PMD in x86 for faster mremap
In-Reply-To: <20181103040041.7085-1-joelaf@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181103040041.7085-4-joelaf@google.com>
To: linux-snps-arc@lists.infradead.org

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

Moving page-tables at the PMD-level on x86 is known to be safe. Enable
this option so that we can do fast mremap when possible.

Suggested-by: Kirill A. Shutemov <kirill at shutemov.name>
Acked-by: Kirill A. Shutemov <kirill at shutemov.name>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index ba7e3464ee92..48aef01a0bd1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -173,6 +173,7 @@ config X86
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
+	select HAVE_MOVE_PMD
 	select HAVE_NMI
 	select HAVE_OPROFILE
 	select HAVE_OPTPROBES
-- 
2.19.1.930.g4563a0d9d0-goog
