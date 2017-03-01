From: ynorov@caviumnetworks.com (Yury Norov)
Date: Thu,  2 Mar 2017 00:49:11 +0530
Subject: [PATCH 03/20] asm-generic: Drop getrlimit and setrlimit syscalls from
 default list
In-Reply-To: <1488395968-14313-1-git-send-email-ynorov@caviumnetworks.com>
References: <1488395968-14313-1-git-send-email-ynorov@caviumnetworks.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488395968-14313-4-git-send-email-ynorov@caviumnetworks.com>
To: linux-snps-arc@lists.infradead.org

The newer prlimit64 syscall provides all the functionality provided by
the getrlimit and setrlimit syscalls and adds the pid of target process,
so future architectures won't need to include getrlimit and setrlimit.

Therefore drop getrlimit and setrlimit syscalls from the generic syscall
list unless __ARCH_WANT_SET_GET_RLIMIT is defined by the architecture's
unistd.h prior to including asm-generic/unistd.h, and adjust all architectures
using the generic syscall list to define it so that no in-tree architectures
are affected.

Cc: Arnd Bergmann <arnd at arndb.de>
Cc: James Hogan <james.hogan at imgtec.com>
Cc: linux-arch at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Cc: linux-arm-kernel at lists.infradead.org
Cc: Mark Salter <msalter at redhat.com>
Cc: Aurelien Jacquiot <a-jacquiot at ti.com>
Cc: linux-c6x-dev at linux-c6x.org
Cc: Richard Kuo <rkuo at codeaurora.org>
Cc: linux-hexagon at vger.kernel.org
Cc: linux-metag at vger.kernel.org
Cc: Jonas Bonn <jonas at southpole.se>
Cc: linux at lists.openrisc.net
Cc: Chen Liqin <liqin.linux at gmail.com>
Cc: Lennox Wu <lennox.wu at gmail.com>
Cc: Chris Metcalf <cmetcalf at mellanox.com>
Cc: Guan Xuetao <gxt at mprc.pku.edu.cn>
Cc: Ley Foon Tan <lftan at altera.com>
Cc: nios2-dev at lists.rocketboards.org
Cc: Yoshinori Sato <ysato at users.sourceforge.jp>
Cc: uclinux-h8-devel at lists.sourceforge.jp
Acked-by: Arnd Bergmann <arnd at arndb.de>
Acked-by: Mark Salter <msalter at redhat.com> [c6x]
Acked-by: James Hogan <james.hogan at imgtec.com> [metag]
Acked-by: Ley Foon Tan <lftan at altera.com> [nios2]
Acked-by: Stafford Horne <shorne at gmail.com> [openrisc]
Acked-by: Vineet Gupta <vgupta at synopsys.com> #arch/arc bits
Signed-off-by: Yury Norov <ynorov at caviumnetworks.com>
---
 arch/arc/include/uapi/asm/unistd.h       | 1 +
 arch/arm64/include/uapi/asm/unistd.h     | 1 +
 arch/c6x/include/uapi/asm/unistd.h       | 1 +
 arch/h8300/include/uapi/asm/unistd.h     | 1 +
 arch/hexagon/include/uapi/asm/unistd.h   | 1 +
 arch/metag/include/uapi/asm/unistd.h     | 1 +
 arch/nios2/include/uapi/asm/unistd.h     | 1 +
 arch/openrisc/include/uapi/asm/unistd.h  | 1 +
 arch/score/include/uapi/asm/unistd.h     | 1 +
 arch/tile/include/uapi/asm/unistd.h      | 1 +
 arch/unicore32/include/uapi/asm/unistd.h | 1 +
 include/uapi/asm-generic/unistd.h        | 5 +++++
 12 files changed, 16 insertions(+)

diff --git a/arch/arc/include/uapi/asm/unistd.h b/arch/arc/include/uapi/asm/unistd.h
index 9a34136..ac64965 100644
--- a/arch/arc/include/uapi/asm/unistd.h
+++ b/arch/arc/include/uapi/asm/unistd.h
@@ -16,6 +16,7 @@
 #define _UAPI_ASM_ARC_UNISTD_H
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_SYS_EXECVE
 #define __ARCH_WANT_SYS_CLONE
 #define __ARCH_WANT_SYS_VFORK
diff --git a/arch/arm64/include/uapi/asm/unistd.h b/arch/arm64/include/uapi/asm/unistd.h
index 043d17a..48355a6 100644
--- a/arch/arm64/include/uapi/asm/unistd.h
+++ b/arch/arm64/include/uapi/asm/unistd.h
@@ -15,5 +15,6 @@
  */
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 
 #include <asm-generic/unistd.h>
diff --git a/arch/c6x/include/uapi/asm/unistd.h b/arch/c6x/include/uapi/asm/unistd.h
index 12d73d9..f676231 100644
--- a/arch/c6x/include/uapi/asm/unistd.h
+++ b/arch/c6x/include/uapi/asm/unistd.h
@@ -15,6 +15,7 @@
  */
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_SYS_CLONE
 
 /* Use the standard ABI for syscalls. */
diff --git a/arch/h8300/include/uapi/asm/unistd.h b/arch/h8300/include/uapi/asm/unistd.h
index 7dd20ef..2f98394 100644
--- a/arch/h8300/include/uapi/asm/unistd.h
+++ b/arch/h8300/include/uapi/asm/unistd.h
@@ -1,5 +1,6 @@
 #define __ARCH_NOMMU
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 
 #include <asm-generic/unistd.h>
diff --git a/arch/hexagon/include/uapi/asm/unistd.h b/arch/hexagon/include/uapi/asm/unistd.h
index 2151760..52d585c 100644
--- a/arch/hexagon/include/uapi/asm/unistd.h
+++ b/arch/hexagon/include/uapi/asm/unistd.h
@@ -28,6 +28,7 @@
 
 #define sys_mmap2 sys_mmap_pgoff
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_SYS_EXECVE
 #define __ARCH_WANT_SYS_CLONE
 #define __ARCH_WANT_SYS_VFORK
diff --git a/arch/metag/include/uapi/asm/unistd.h b/arch/metag/include/uapi/asm/unistd.h
index 459b6ec..16b5cb3 100644
--- a/arch/metag/include/uapi/asm/unistd.h
+++ b/arch/metag/include/uapi/asm/unistd.h
@@ -8,6 +8,7 @@
  */
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 
 /* Use the standard ABI for syscalls. */
 #include <asm-generic/unistd.h>
diff --git a/arch/nios2/include/uapi/asm/unistd.h b/arch/nios2/include/uapi/asm/unistd.h
index 51a32c7..b0dda4d 100644
--- a/arch/nios2/include/uapi/asm/unistd.h
+++ b/arch/nios2/include/uapi/asm/unistd.h
@@ -18,6 +18,7 @@
  #define sys_mmap2 sys_mmap_pgoff
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 
 /* Use the standard ABI for syscalls */
 #include <asm-generic/unistd.h>
diff --git a/arch/openrisc/include/uapi/asm/unistd.h b/arch/openrisc/include/uapi/asm/unistd.h
index 471905b..6812d81 100644
--- a/arch/openrisc/include/uapi/asm/unistd.h
+++ b/arch/openrisc/include/uapi/asm/unistd.h
@@ -21,6 +21,7 @@
 #define sys_mmap2 sys_mmap_pgoff
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_CLONE
 
diff --git a/arch/score/include/uapi/asm/unistd.h b/arch/score/include/uapi/asm/unistd.h
index d4008c3..7ad1bdc 100644
--- a/arch/score/include/uapi/asm/unistd.h
+++ b/arch/score/include/uapi/asm/unistd.h
@@ -1,6 +1,7 @@
 #define __ARCH_HAVE_MMU
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_SYSCALL_NO_AT
 #define __ARCH_WANT_SYSCALL_NO_FLAGS
 #define __ARCH_WANT_SYSCALL_OFF_T
diff --git a/arch/tile/include/uapi/asm/unistd.h b/arch/tile/include/uapi/asm/unistd.h
index 24e9187..cf0505f 100644
--- a/arch/tile/include/uapi/asm/unistd.h
+++ b/arch/tile/include/uapi/asm/unistd.h
@@ -13,6 +13,7 @@
  */
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 #if !defined(__LP64__) || defined(__SYSCALL_COMPAT)
 /* Use the flavor of this syscall that matches the 32-bit API better. */
 #define __ARCH_WANT_SYNC_FILE_RANGE2
diff --git a/arch/unicore32/include/uapi/asm/unistd.h b/arch/unicore32/include/uapi/asm/unistd.h
index 9cf71c7..76ece52 100644
--- a/arch/unicore32/include/uapi/asm/unistd.h
+++ b/arch/unicore32/include/uapi/asm/unistd.h
@@ -11,6 +11,7 @@
  */
 
 #define __ARCH_WANT_RENAMEAT
+#define __ARCH_WANT_SET_GET_RLIMIT
 
 #ifndef CONFIG_UNICORE32_OLDABI
 
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index a6062be..d65e232 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -465,10 +465,15 @@ __SYSCALL(__NR_uname, sys_newuname)
 __SYSCALL(__NR_sethostname, sys_sethostname)
 #define __NR_setdomainname 162
 __SYSCALL(__NR_setdomainname, sys_setdomainname)
+
+#ifdef __ARCH_WANT_SET_GET_RLIMIT
+/* getrlimit and setrlimit are superseded with prlimit64 */
 #define __NR_getrlimit 163
 __SC_COMP(__NR_getrlimit, sys_getrlimit, compat_sys_getrlimit)
 #define __NR_setrlimit 164
 __SC_COMP(__NR_setrlimit, sys_setrlimit, compat_sys_setrlimit)
+#endif
+
 #define __NR_getrusage 165
 __SC_COMP(__NR_getrusage, sys_getrusage, compat_sys_getrusage)
 #define __NR_umask 166
-- 
2.7.4
