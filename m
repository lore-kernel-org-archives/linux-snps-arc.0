From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  1 Jun 2018 13:49:04 +0300
Subject: [PATCH] ARC: Explicitly specify OUTPUT_FORMAT in the linker script
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180601104904.48481-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It might be a good idea to explicitly specify BFD format
depending on -EB/-EL option passed to the linker and not rely on
default behavior as we have now.

Description of the OUTPUT_FORMAT command is available here:
https://sourceware.org/binutils/docs/ld/Format-Commands.html#Format-Commands

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Cupertino Miranda <cmiranda at synopsys.com>
Cc: Claudiu Zissulescu <claziss at synopsys.com>
---
 arch/arc/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index f35ed578e007..0a1affc56d76 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -11,6 +11,7 @@
 #include <asm/page.h>
 #include <asm/thread_info.h>
 
+OUTPUT_FORMAT("elf32-littlearc", "elf32-bigarc", "elf32-littlearc")
 OUTPUT_ARCH(arc)
 ENTRY(res_service)
 
-- 
2.16.2
