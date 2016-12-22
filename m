From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 22 Dec 2016 17:09:09 +0300
Subject: [PATCH 1/2] arc: rename xCCM sections so they are not merged in
 global .data/.text
In-Reply-To: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
References: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1482415750-5471-2-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

If Linux kernel is compiled with "-ffunction-sections" each function is placed in
its own section named ".text.function_name". This is required for
discarding of not-used functions during final linkage. But in the end
all ".text.XXX" sections are merged in the global ".text" section of
vmlinux Elf.

The same happens with data sections when "-fdata-sections" are used.

That means our ".data.arcfp" and ".text.arcfp" sections get silently
merged in global ".data" and ".text" sections even though we want to
put them in separate memory regions in case ICCM and/or DCCM exist in
the ARC core.

Solution is as simple as addition of one extra period in section name.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Igor Guryanov <guryanov at synopsys.com>
Cc: stable at vger.kernel.org
---
 arch/arc/include/asm/linkage.h | 6 +++---
 arch/arc/kernel/vmlinux.lds.S  | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
index b29f1a9fd6f7..3a5f13d65ee1 100644
--- a/arch/arc/include/asm/linkage.h
+++ b/arch/arc/include/asm/linkage.h
@@ -28,7 +28,7 @@
 /* annotation for data we want in DCCM - if enabled in .config */
 .macro ARCFP_CODE
 #ifdef CONFIG_ARC_HAS_ICCM
-	.section .text.arcfp, "ax", at progbits
+	.section .text..arcfp, "ax", at progbits
 #else
 	.section .text, "ax", at progbits
 #endif
@@ -47,13 +47,13 @@
 #else	/* !__ASSEMBLY__ */
 
 #ifdef CONFIG_ARC_HAS_ICCM
-#define __arcfp_code __attribute__((__section__(".text.arcfp")))
+#define __arcfp_code __attribute__((__section__(".text..arcfp")))
 #else
 #define __arcfp_code __attribute__((__section__(".text")))
 #endif
 
 #ifdef CONFIG_ARC_HAS_DCCM
-#define __arcfp_data __attribute__((__section__(".data.arcfp")))
+#define __arcfp_data __attribute__((__section__(".data..arcfp")))
 #else
 #define __arcfp_data __attribute__((__section__(".data")))
 #endif
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index f35ed578e007..f69ae479ee73 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -37,8 +37,8 @@ SECTIONS
 	}
 
 #ifdef CONFIG_ARC_HAS_ICCM
-	.text.arcfp : {
-		*(.text.arcfp)
+	.text..arcfp : {
+		*(.text..arcfp)
 		. = ALIGN(CONFIG_ARC_ICCM_SZ * 1024);
 	}
 #endif
@@ -151,8 +151,8 @@ SECTIONS
 #ifdef CONFIG_ARC_HAS_DCCM
 	. = CONFIG_ARC_DCCM_BASE;
 	__arc_dccm_base = .;
-	.data.arcfp : {
-		*(.data.arcfp)
+	.data..arcfp : {
+		*(.data..arcfp)
 	}
 	. = ALIGN(CONFIG_ARC_DCCM_SZ * 1024);
 #endif
-- 
2.7.4
