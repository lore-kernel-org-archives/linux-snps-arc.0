From: ldv@altlinux.org (Dmitry V. Levin)
Date: Fri, 9 Nov 2018 06:15:36 +0300
Subject: [PATCH 02/13] elf-em.h: add EM_ARC
In-Reply-To: <20181109031303.GA20906@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181109031536.GB21511@altlinux.org>
To: linux-snps-arc@lists.infradead.org

The uapi/linux/audit.h header is going to use EM_ARC in order
to define AUDIT_ARCH_ARC which is needed to implement
syscall_get_arch() which in turn is required to extend
the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

The value for EM_ARC has been taken from
http://www.sco.com/developers/gabi/2012-12-31/ch4.eheader.html

Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
---
 include/uapi/linux/elf-em.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
index ba3696e3d694..56ff3f9d9633 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -26,6 +26,7 @@
 #define EM_ARM		40	/* ARM 32 bit */
 #define EM_SH		42	/* SuperH */
 #define EM_SPARCV9	43	/* SPARC v9 64-bit */
+#define EM_ARC		45	/* Argonaut RISC Core */
 #define EM_H8_300	46	/* Renesas H8/300 */
 #define EM_IA_64	50	/* HP/Intel IA-64 */
 #define EM_X86_64	62	/* AMD x86-64 */
-- 
ldv
