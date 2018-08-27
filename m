From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Mon, 27 Aug 2018 12:07:37 +0900
Subject: [PATCH] arc: remove redundant GCC version checks
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535339257-17620-1-git-send-email-yamada.masahiro@socionext.com>
To: linux-snps-arc@lists.infradead.org

Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
bumped the minimum GCC version to 4.6 for all architectures.

With GCC >= 4.6 assumed, 'upto_gcc44' is empty, 'atleast_gcc44' is y.

Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
---

 arch/arc/Makefile | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index fb02619..99cce77 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -43,10 +43,7 @@ ifdef CONFIG_ARC_CURR_IN_REG
 LINUXINCLUDE	+=  -include ${src}/arch/arc/include/asm/current.h
 endif
 
-upto_gcc44    :=  $(call cc-ifversion, -le, 0404, y)
-atleast_gcc44 :=  $(call cc-ifversion, -ge, 0404, y)
-
-cflags-$(atleast_gcc44)			+= -fsection-anchors
+cflags-y				+= -fsection-anchors
 
 cflags-$(CONFIG_ARC_HAS_LLSC)		+= -mlock
 cflags-$(CONFIG_ARC_HAS_SWAPE)		+= -mswape
@@ -82,11 +79,6 @@ cflags-$(disable_small_data)		+= -mno-sdata -fcall-used-gp
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -mbig-endian
 ldflags-$(CONFIG_CPU_BIG_ENDIAN)	+= -EB
 
-# STAR 9000518362: (fixed with binutils shipping with gcc 4.8)
-# arc-linux-uclibc-ld (buildroot) or arceb-elf32-ld (EZChip) don't accept
-# --build-id w/o "-marclinux". Default arc-elf32-ld is OK
-ldflags-$(upto_gcc44)			+= -marclinux
-
 LIBGCC	:= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
 
 # Modules with short calls might break for calls into builtin-kernel
-- 
2.7.4
