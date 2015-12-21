From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 21 Dec 2015 12:54:46 +0530
Subject: [PATCH] ARC: Fix linking errors with CONFIG_MODULE +
 CONFIG_CC_OPTIMIZE_FOR_SIZE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450682686-837-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

At -Os, ARC gcc generates millicode thunk for function prologue/epilogue,
which are served by libgcc.

Modules historically are NOT linked with libgcc to avoid code bloat, reducing
runtime relocation fixups etc. I even once tried doign that but got lost
in makefile intricacies.

However CONFIG_MODULE + CONFIG_CC_OPTIMIZE_FOR_SIZE causes link errors

| MODPOST 5 modules
| ERROR: "__ld_r13_to_r18" [crypto/sha256_generic.ko] undefined!
| ERROR: "__ld_r13_to_r18_ret" [crypto/sha256_generic.ko] undefined!
| ERROR: "__st_r13_to_r18" [crypto/sha256_generic.ko] undefined!
| ERROR: "__ld_r13_to_r17_ret" [crypto/sha256_generic.ko] undefined!
| ERROR: "__st_r13_to_r17" [crypto/sha256_generic.ko] undefined!
| ERROR: "__ld_r13_to_r16_ret" [crypto/sha256_generic.ko] undefined!
| ERROR: "__st_r13_to_r16" [crypto/sha256_generic.ko] undefined!
|....
|....

Workaround that by inhibiting millicode thunks for loadable modules

Fixes STAR 9000641864:
("Linux built with optimizations for size emits errors for modules")

Reported-by: Anton Kolesov <akolesov at synosys.com>
Cc: Michal Marek <mmarek at suse.cz>
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index cf0cf34eeb24..aeb19021099e 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -81,7 +81,7 @@ endif
 LIBGCC	:= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
 
 # Modules with short calls might break for calls into builtin-kernel
-KBUILD_CFLAGS_MODULE	+= -mlong-calls
+KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
 
 # Finally dump eveything into kernel build system
 KBUILD_CFLAGS	+= $(cflags-y)
-- 
1.9.1
