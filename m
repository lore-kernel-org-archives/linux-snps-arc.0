From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 19 Sep 2016 14:49:31 -0700
Subject: [PATCH 1/3] ARC: module: support R_ARC_32_PCREL relocation
In-Reply-To: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474321773-18166-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/elf.h | 3 +--
 arch/arc/kernel/module.c   | 6 ++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/elf.h b/arch/arc/include/asm/elf.h
index 51a99e25fe33..7096f97a1434 100644
--- a/arch/arc/include/asm/elf.h
+++ b/arch/arc/include/asm/elf.h
@@ -23,8 +23,7 @@
 /* ARC Relocations (kernel Modules only) */
 #define  R_ARC_32		0x4
 #define  R_ARC_32_ME		0x1B
-#define  R_ARC_S25H_PCREL	0x10
-#define  R_ARC_S25W_PCREL	0x11
+#define  R_ARC_32_PCREL		0x31
 
 /*to set parameters in the core dumps */
 #define ELF_ARCH		EM_ARCOMPACT
diff --git a/arch/arc/kernel/module.c b/arch/arc/kernel/module.c
index 376e04622962..576a238434a1 100644
--- a/arch/arc/kernel/module.c
+++ b/arch/arc/kernel/module.c
@@ -106,10 +106,12 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 		 */
 		relo_type = ELF32_R_TYPE(rel_entry[i].r_info);
 
-		if (likely(R_ARC_32_ME == relo_type))
+		if (likely(R_ARC_32_ME == relo_type))	/* ME ( S + A ) */
 			arc_write_me((unsigned short *)location, relocation);
-		else if (R_ARC_32 == relo_type)
+		else if (R_ARC_32 == relo_type)		/* ( S + A ) */
 			*((Elf32_Addr *) location) = relocation;
+		else if (R_ARC_32_PCREL == relo_type)	/* ( S + A ) - PDATA ) */
+			*((Elf32_Addr *) location) = relocation - location;
 		else
 			goto relo_err;
 
-- 
2.7.4
