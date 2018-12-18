From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:24 -0800
Subject: [PATCH 02/21] ARC: add definitions to elf/elf.h
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog |  1 +
 elf/elf.h | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/ChangeLog b/ChangeLog
index 456e4b670c23..3ec6eb82d2fe 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -3,6 +3,7 @@
 	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
 	syscall-template file.
 	* stdlib/longlong.h: Fix asm constraints for ARC code.
+	* elf/elf.h: add defines for ARC.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/elf/elf.h b/elf/elf.h
index d57313e9bbc7..57d7c717784e 100644
--- a/elf/elf.h
+++ b/elf/elf.h
@@ -330,7 +330,7 @@ typedef struct
 #define EM_CLOUDSHIELD	192	/* CloudShield */
 #define EM_COREA_1ST	193	/* KIPO-KAIST Core-A 1st gen. */
 #define EM_COREA_2ND	194	/* KIPO-KAIST Core-A 2nd gen. */
-#define EM_ARC_COMPACT2	195	/* Synopsys ARCompact V2 */
+#define EM_ARCV2	195	/* Synopsys ARCv2 ISA */
 #define EM_OPEN8	196	/* Open8 RISC */
 #define EM_RL78		197	/* Renesas RL78 */
 #define EM_VIDEOCORE5	198	/* Broadcom VideoCore V */
@@ -3996,6 +3996,74 @@ enum
 #define R_NDS32_TLS_TPOFF	102
 #define R_NDS32_TLS_DESC	119
 
+/* ARCompact/ARCv2 specific relocs */
+#define R_ARC_NONE		0x0
+#define R_ARC_8			0x1
+#define R_ARC_16		0x2
+#define R_ARC_24		0x3
+#define R_ARC_32		0x4
+#define R_ARC_B26		0x5
+#define R_ARC_B22_PCREL		0x6
+#define R_ARC_H30		0x7
+#define R_ARC_N8		0x8
+#define R_ARC_N16		0x9
+#define R_ARC_N24		0xA
+#define R_ARC_N32		0xB
+#define R_ARC_SDA		0xC
+#define R_ARC_SECTOFF		0xD
+#define R_ARC_S21H_PCREL	0xE
+#define R_ARC_S21W_PCREL	0xF
+#define R_ARC_S25H_PCREL	0x10
+#define R_ARC_S25W_PCREL	0x11
+#define R_ARC_SDA32		0x12
+#define R_ARC_SDA_LDST		0x13
+#define R_ARC_SDA_LDST1		0x14
+#define R_ARC_SDA_LDST2		0x15
+#define R_ARC_SDA16_LD		0x16
+#define R_ARC_SDA16_LD1		0x17
+#define R_ARC_SDA16_LD2		0x18
+#define R_ARC_S13_PCREL		0x19
+#define R_ARC_W			0x1A
+#define R_ARC_32_ME		0x1B
+#define R_ARC_N32_ME		0x1C
+#define R_ARC_SECTOFF_ME	0x1D
+#define R_ARC_SDA32_ME		0x1E
+#define R_ARC_W_ME		0x1F
+#define R_ARC_H30_ME		0x20
+#define R_ARC_SECTOFF_U8	0x21
+#define R_ARC_SECTOFF_S9	0x22
+#define R_AC_SECTOFF_U8		0x23
+#define R_AC_SECTOFF_U8_1	0x24
+#define R_AC_SECTOFF_U8_2	0x25
+#define R_AC_SECTOFF_S9		0x26
+#define R_AC_SECTOFF_S9_1	0x27
+#define R_AC_SECTOFF_S9_2	0x28
+#define R_ARC_SECTOFF_ME_1	0x29
+#define R_ARC_SECTOFF_ME_2	0x2A
+#define R_ARC_SECTOFF_1		0x2B
+#define R_ARC_SECTOFF_2		0x2C
+#define R_ARC_PC32		0x32
+#define R_ARC_GOTPC32		0x33
+#define R_ARC_PLT32		0x34
+#define R_ARC_COPY		0x35
+#define R_ARC_GLOB_DAT		0x36
+#define R_ARC_JUMP_SLOT		0x37
+#define R_ARC_RELATIVE		0x38
+#define R_ARC_GOTOFF		0x39
+#define R_ARC_GOTPC		0x3A
+#define R_ARC_GOT32		0x3B
+
+#define R_ARC_TLS_DTPMOD	0x42
+#define R_ARC_TLS_DTPOFF	0x43
+#define R_ARC_TLS_TPOFF		0x44
+#define R_ARC_TLS_GD_GOT	0x45
+#define R_ARC_TLS_GD_LD	        0x46
+#define R_ARC_TLS_GD_CALL	0x47
+#define R_ARC_TLS_IE_GOT	0x48
+#define R_ARC_TLS_DTPOFF_S9	0x4a
+#define R_ARC_TLS_LE_S9		0x4a
+#define R_ARC_TLS_LE_32		0x4b
+
 __END_DECLS
 
 #endif	/* elf.h */
-- 
2.7.4
