From: ldv@altlinux.org (Dmitry V. Levin)
Date: Wed, 9 Jan 2019 15:42:32 +0300
Subject: [PATCH 01/14] Move EM_ARCOMPACT and EM_ARCV2 to uapi/linux/elf-em.h
References: <20190109124044.GA11935@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190109124232.GA11981@altlinux.org>
To: linux-snps-arc@lists.infradead.org

These should never have been defined in the arch tree to begin with, and
now uapi/linux/audit.h header is going to use EM_ARCOMPACT and EM_ARCV2
in order to define AUDIT_ARCH_ARCOMPACT and AUDIT_ARCH_ARCV2 which are
needed to implement syscall_get_arch() which in turn is required to
extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Acked-by: Vineet Gupta <vgupta at synopsys.com>
Acked-by: Paul Moore <paul at paul-moore.com>
Cc: Elvira Khabirova <lineprinter at altlinux.org>
Cc: Eugene Syromyatnikov <esyr at redhat.com>
Cc: Alexey Brodkin <alexey.brodkin at synopsys.com>
Cc: Oleg Nesterov <oleg at redhat.com>
Cc: Andy Lutomirski <luto at kernel.org>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-audit at redhat.com
Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
---
 arch/arc/include/asm/elf.h  | 6 +-----
 include/uapi/linux/elf-em.h | 2 ++
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/elf.h b/arch/arc/include/asm/elf.h
index aa2d6da9d187..2b80c184c9c8 100644
--- a/arch/arc/include/asm/elf.h
+++ b/arch/arc/include/asm/elf.h
@@ -10,13 +10,9 @@
 #define __ASM_ARC_ELF_H
 
 #include <linux/types.h>
+#include <linux/elf-em.h>
 #include <uapi/asm/elf.h>
 
-/* These ELF defines belong to uapi but libc elf.h already defines them */
-#define EM_ARCOMPACT		93
-
-#define EM_ARCV2		195	/* ARCv2 Cores */
-
 #define EM_ARC_INUSE		(IS_ENABLED(CONFIG_ISA_ARCOMPACT) ? \
 					EM_ARCOMPACT : EM_ARCV2)
 
diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
index 0c3000faedba..081675ed89cb 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -34,6 +34,7 @@
 #define EM_M32R		88	/* Renesas M32R */
 #define EM_MN10300	89	/* Panasonic/MEI MN10300, AM33 */
 #define EM_OPENRISC     92     /* OpenRISC 32-bit embedded processor */
+#define EM_ARCOMPACT	93	/* ARCompact processor */
 #define EM_XTENSA	94	/* Tensilica Xtensa Architecture */
 #define EM_BLACKFIN     106     /* ADI Blackfin Processor */
 #define EM_ALTERA_NIOS2	113	/* Altera Nios II soft-core processor */
@@ -42,6 +43,7 @@
 #define EM_TILEPRO	188	/* Tilera TILEPro */
 #define EM_MICROBLAZE	189	/* Xilinx MicroBlaze */
 #define EM_TILEGX	191	/* Tilera TILE-Gx */
+#define EM_ARCV2	195	/* ARCv2 Cores */
 #define EM_RISCV	243	/* RISC-V */
 #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
 #define EM_CSKY		252	/* C-SKY */
-- 
ldv
