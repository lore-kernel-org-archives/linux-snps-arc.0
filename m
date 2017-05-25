From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 20:24:05 +0300
Subject: [PATCH] arc: Remove sometimes misleading toolchain check
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495733045-18736-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Thinking of a toolchains for ARCompact and ARCv2 ISAs we implicitly
think about libgcc.a build for one of those ISAs which we're linking
with. And given there's no multiarch uClibc toolchain for ARC
(as probably for any other architecture) the assumption is the only way
to get libgcc.a for desired ISA is from a toolchain built right for that
same ISA.

So what we do we check what's GCC's default architecture ARC700 or not.
But generally speaking default arch makes not a lot of sense if explicit
command line option exist like "-mcpu=archs". In other words exactly the
same GCC might build executables for both ARC700 and ARC HS38.

But in real life libgcc could be easily built on a separate step
independently of the compiler and friends. And that really happens.

For example OpenEmbedded prefers to reuse the same toolchain for both
arches having libgcc built separately.

Anyways given we have plans to get rid of libgcc dependency that change
is sort of future proof.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Makefile | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 44ef35d33956..d8c99fefaebb 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -22,20 +22,6 @@ cflags-y	+= -fno-common -pipe -fno-builtin -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
 cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=archs
 
-is_700 = $(shell $(CC) -dM -E - < /dev/null | grep -q "ARC700" && echo 1 || echo 0)
-
-ifdef CONFIG_ISA_ARCOMPACT
-ifeq ($(is_700), 0)
-    $(error Toolchain not configured for ARCompact builds)
-endif
-endif
-
-ifdef CONFIG_ISA_ARCV2
-ifeq ($(is_700), 1)
-    $(error Toolchain not configured for ARCv2 builds)
-endif
-endif
-
 ifdef CONFIG_ARC_CURR_IN_REG
 # For a global register defintion, make sure it gets passed to every file
 # We had a customer reported bug where some code built in kernel was NOT using
-- 
2.7.4
