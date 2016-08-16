From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 16 Aug 2016 15:13:48 -0700
Subject: [PATCH] ARC: Support syscall ABI v4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471385628-2037-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The syscall ABI includes the gcc functional calling ABI since a syscall
implies userland caller and kernel callee.

The current gcc ABI (v3) for ARCv2 ISA required 64-bit data be passed in
even-odd register pairs, (potentially punching reg holes when passing such
values as args). This was partly driven by the fact that the double-word
LDD/STD instructions in ARCv2 expect the register alignment and thus gcc
forcing this avoids extra MOV at the cost of a few unused register (which we
have plenty anyways).

This however was rejected as part of upstreaming gcc port to HS. So the new
ABI v4 doesn't enforce the even-odd reg restriction.

Do note that for ARCompact ISA builds v3 and v4 are practically the same in
terms of gcc code generation.

In terms of change management, we infer the new ABI if gcc 6.x onwards
is used for building the kernel.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/uapi/asm/elf.h | 11 +++++++++--
 arch/arc/kernel/process.c       |  2 +-
 arch/arc/kernel/setup.c         |  6 ++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/uapi/asm/elf.h b/arch/arc/include/uapi/asm/elf.h
index 0f99ac8fcbb2..0037a587320d 100644
--- a/arch/arc/include/uapi/asm/elf.h
+++ b/arch/arc/include/uapi/asm/elf.h
@@ -13,8 +13,15 @@
 
 /* Machine specific ELF Hdr flags */
 #define EF_ARC_OSABI_MSK	0x00000f00
-#define EF_ARC_OSABI_ORIG	0x00000000   /* MUST be zero for back-compat */
-#define EF_ARC_OSABI_CURRENT	0x00000300   /* v3 (no legacy syscalls) */
+
+#define EF_ARC_OSABI_V3		0x00000300   /* v3 (no legacy syscalls) */
+#define EF_ARC_OSABI_V4		0x00000400   /* v4 (64bit data any reg align) */
+
+#if __GNUC__ < 6
+#define EF_ARC_OSABI_CURRENT	EF_ARC_OSABI_V3
+#else
+#define EF_ARC_OSABI_CURRENT	EF_ARC_OSABI_V4
+#endif
 
 typedef unsigned long elf_greg_t;
 typedef unsigned long elf_fpregset_t;
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index b5db9e7fd649..be1972bd2729 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -199,7 +199,7 @@ int elf_check_arch(const struct elf32_hdr *x)
 	}
 
 	eflags = x->e_flags;
-	if ((eflags & EF_ARC_OSABI_MSK) < EF_ARC_OSABI_CURRENT) {
+	if ((eflags & EF_ARC_OSABI_MSK) != EF_ARC_OSABI_CURRENT) {
 		pr_err("ABI mismatch - you need newer toolchain\n");
 		force_sigsegv(SIGSEGV, current);
 		return 0;
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index a946400a86d0..f52a0d0dc462 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -291,8 +291,10 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
 			       cpu->dccm.base_addr, TO_KB(cpu->dccm.sz),
 			       cpu->iccm.base_addr, TO_KB(cpu->iccm.sz));
 
-	n += scnprintf(buf + n, len - n,
-		       "OS ABI [v3]\t: no-legacy-syscalls\n");
+	n += scnprintf(buf + n, len - n, "OS ABI [v%d]\t: %s\n",
+			EF_ARC_OSABI_CURRENT >> 8,
+			EF_ARC_OSABI_CURRENT == EF_ARC_OSABI_V3 ?
+			"no-legacy-syscalls" : "64-bit data any register aligned");
 
 	return buf;
 }
-- 
2.7.4
