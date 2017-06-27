From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:51 +0300
Subject: [RFC 3/6] ARC: add definitions to elf/elf.h
In-Reply-To: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 elf/elf.h | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/elf/elf.h b/elf/elf.h
index 3900b4c9f0ca..8b58818228ba 100644
--- a/elf/elf.h
+++ b/elf/elf.h
@@ -3757,6 +3757,74 @@ enum
 #define R_METAG_TLS_LE_HI16	60
 #define R_METAG_TLS_LE_LO16	61
 
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
