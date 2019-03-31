From: st5pub@yandex.ru (Andrey Abramov)
Date: Sun, 31 Mar 2019 21:35:59 +0300
Subject: [PATCH v2 2/5] powerpc: module_[32|64].c: replace swap function with
 built-in one
In-Reply-To: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <14019281554057359@sas1-87f9feb8d943.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

Replace relaswap with built-in one, because relaswap
does a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
Reviewed by: George Spelvin <lkml at sdf.org>
---
 arch/powerpc/kernel/module_32.c | 17 +----------------
 arch/powerpc/kernel/module_64.c | 17 +----------------
 2 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index 88d83771f462..c311e8575d10 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -79,21 +79,6 @@ static int relacmp(const void *_x, const void *_y)
 		return 0;
 }
 
-static void relaswap(void *_x, void *_y, int size)
-{
-	uint32_t *x, *y, tmp;
-	int i;
-
-	y = (uint32_t *)_x;
-	x = (uint32_t *)_y;
-
-	for (i = 0; i < sizeof(Elf32_Rela) / sizeof(uint32_t); i++) {
-		tmp = x[i];
-		x[i] = y[i];
-		y[i] = tmp;
-	}
-}
-
 /* Get the potential trampolines size required of the init and
    non-init sections */
 static unsigned long get_plt_size(const Elf32_Ehdr *hdr,
@@ -130,7 +115,7 @@ static unsigned long get_plt_size(const Elf32_Ehdr *hdr,
 			 */
 			sort((void *)hdr + sechdrs[i].sh_offset,
 			     sechdrs[i].sh_size / sizeof(Elf32_Rela),
-			     sizeof(Elf32_Rela), relacmp, relaswap);
+			     sizeof(Elf32_Rela), relacmp, NULL);
 
 			ret += count_relocs((void *)hdr
 					     + sechdrs[i].sh_offset,
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 8661eea78503..0c833d7f36f1 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -231,21 +231,6 @@ static int relacmp(const void *_x, const void *_y)
 		return 0;
 }
 
-static void relaswap(void *_x, void *_y, int size)
-{
-	uint64_t *x, *y, tmp;
-	int i;
-
-	y = (uint64_t *)_x;
-	x = (uint64_t *)_y;
-
-	for (i = 0; i < sizeof(Elf64_Rela) / sizeof(uint64_t); i++) {
-		tmp = x[i];
-		x[i] = y[i];
-		y[i] = tmp;
-	}
-}
-
 /* Get size of potential trampolines required. */
 static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 				    const Elf64_Shdr *sechdrs)
@@ -269,7 +254,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 			 */
 			sort((void *)sechdrs[i].sh_addr,
 			     sechdrs[i].sh_size / sizeof(Elf64_Rela),
-			     sizeof(Elf64_Rela), relacmp, relaswap);
+			     sizeof(Elf64_Rela), relacmp, NULL);
 
 			relocs += count_relocs((void *)sechdrs[i].sh_addr,
 					       sechdrs[i].sh_size
-- 
2.21.0
