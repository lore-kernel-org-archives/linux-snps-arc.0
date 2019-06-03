From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  3 Jun 2019 09:31:19 +0300
Subject: [PATCH] ARC: build: Try to guess CROSS_COMPILE with cc-cross-prefix
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190603063119.36544-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For a long time we used to hard-code CROSS_COMPILE prefix
for ARC until it started to cause problems, so we decided to
solely rely on CROSS_COMPILE externally set by a user:
commit 40660f1fcee8 ("ARC: build: Don't set CROSS_COMPILE in arch's Makefile").

While it works perfectly fine for build-systems where the prefix
gets defined anyways for us human beings it's quite an annoying
requirement especially given most of time the same one prefix
"arc-linux-" is all what we need.

It looks like finally we're getting the best of both worlds:
 1. W/o cross-toolchain we still may install headers, build .dtb etc
 2. W/ cross-toolchain get the kerne built with only ARCH=arc

Inspired by [1] & [2].

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-May/005788.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc2b47b55f17

A side note: even though "cc-cross-prefix" does its job it pollutes
console with output of "which" for all the prefixes it didn't manage to find
a matching cross-compiler for like that:
| # ARCH=arc make defconfig
| which: no arceb-linux-gcc in (~/.local/bin:~/bin:/usr/bin:/usr/sbin)
| *** Default configuration is based on 'nsim_hs_defconfig'

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index e2b991f75bc5..9cfd2ba7a12d 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -8,6 +8,10 @@
 
 KBUILD_DEFCONFIG := nsim_hs_defconfig
 
+ifeq ($(CROSS_COMPILE),)
+CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
+endif
+
 cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
 cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=hs38
-- 
2.16.2
