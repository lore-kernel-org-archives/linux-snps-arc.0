From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 16 May 2018 18:03:30 +0300
Subject: [PATCH] ARC: Explicitly add -mmedium-calls to CFLAGS
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180516150330.31182-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

GCC built for arc*-*-linux has "-mmedium-calls" implicitly enabled by default
thus we don't see any problems during Linux kernel compilation.
----------------------------->8------------------------
arc-linux-gcc -mcpu=arc700 -Q --help=target | grep calls
  -mlong-calls                          [disabled]
  -mmedium-calls                        [enabled]
----------------------------->8------------------------

But if we try to use so-called Elf32 toolchain with GCC configured for
arc*-*-elf* then we'd see the following failure:
----------------------------->8------------------------
init/do_mounts.o: In function 'init_rootfs':
do_mounts.c:(.init.text+0x108): relocation truncated to fit: R_ARC_S21W_PCREL
against symbol 'unregister_filesystem' defined in .text section in fs/filesystems.o

arc-elf32-ld: final link failed: Symbol needs debug section which does not exist
make: *** [vmlinux] Error 1
----------------------------->8------------------------

That happens because neither "-mmedium-calls" nor "-mlong-calls" are enabled in
Elf32 GCC:
----------------------------->8------------------------
arc-elf32-gcc -mcpu=arc700 -Q --help=target | grep calls
  -mlong-calls                          [disabled]
  -mmedium-calls                        [disabled]
----------------------------->8------------------------

Now to make it possible to use Elf32 toolchain for building Linux kernel
we're explicitly add "-mmedium-calls" to CFLAGS.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index d37f49d6a27f..db9ce90c3cc0 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -16,7 +16,7 @@ endif
 
 KBUILD_DEFCONFIG := nsim_700_defconfig
 
-cflags-y	+= -fno-common -pipe -fno-builtin -D__linux__
+cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
 cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=archs
 
-- 
2.16.2
