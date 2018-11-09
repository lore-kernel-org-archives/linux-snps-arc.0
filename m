From: ldv@altlinux.org (Dmitry V. Levin)
Date: Sat, 10 Nov 2018 02:33:23 +0300
Subject: [PATCH 02/13 v2] Move EM_ARCOMPACT and EM_ARCV2 to uapi/linux/elf-em.h
In-Reply-To: <20181109214422.GB1907@altlinux.org>
References: <20181109031536.GB21511@altlinux.org>
 <C2D7FE5348E1B147BCA15975FBA23075013A59237C@us01wembx1.internal.synopsys.com>
 <20181109214422.GB1907@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181109233323.GB2710@altlinux.org>
To: linux-snps-arc@lists.infradead.org

These should never have been defined in the arch tree to begin with, and
now uapi/linux/audit.h header is going to use EM_ARCOMPACT and EM_ARCV2 in
order to define AUDIT_ARCH_ARCOMPACT and AUDIT_ARCH_ARCV2 which are needed
to implement syscall_get_arch() which in turn is required to extend the
generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
---
v2: do not add EM_ARC, move EM_ARCOMPACT and EM_ARCV2 instead.

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
index ba3696e3d694..91b33833630b 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -34,6 +34,7 @@
 #define EM_M32R		88	/* Renesas M32R */
 #define EM_MN10300	89	/* Panasonic/MEI MN10300, AM33 */
 #define EM_OPENRISC     92     /* OpenRISC 32-bit embedded processor */
+#define EM_ARCOMPACT	93	/* ARCompact processor */
 #define EM_BLACKFIN     106     /* ADI Blackfin Processor */
 #define EM_ALTERA_NIOS2	113	/* Altera Nios II soft-core processor */
 #define EM_TI_C6000	140	/* TI C6X DSPs */
@@ -42,6 +43,7 @@
 #define EM_TILEPRO	188	/* Tilera TILEPro */
 #define EM_MICROBLAZE	189	/* Xilinx MicroBlaze */
 #define EM_TILEGX	191	/* Tilera TILE-Gx */
+#define EM_ARCV2	195	/* ARCv2 Cores */
 #define EM_RISCV	243	/* RISC-V */
 #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
 #define EM_FRV		0x5441	/* Fujitsu FR-V */
-- 
ldv
