Return-Path: <SRS0=73lZ=AI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E567C433DF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 14:36:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBF620757
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 14:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vBhzJS8I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmaDDCPU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBF620757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mvAugtgulihSGxebXwYUkDKjEU4/GAClxdtfVJHq+Wo=; b=vBhzJS8IaZCN5kDGZV16lgjEH
	f0DzQR9RI19WxcKHnIOVxX0rQgWw0Hg/IDKZbSywevQRNoVtnbUXrA+k/5+96G5LNPLb+6gY8VaqU
	+YYk8RmcGm9GHUPbe0mZILQJi9MTHgOmoINQsx/GjQpzxYJlkH7ulzfA0PAwAEE+Qc94sgUgXHIl0
	4iyNgAtW34rxB4Y3BsD8ldSiPPffXkSgJGKXWRN/+4mqiLHqrzrsne9QUQSfRa1B3j7174q3+DvEI
	e/jWaaBGjEv1o09KFHXeGzGrWhxRfyu67CKBphHjV6jgYf97HmyEbz6Lfrq8ALji9qqz1s8JZ1Ny6
	+VT1EGWOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBwg-0005Ix-Kg; Sat, 27 Jun 2020 14:36:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBvx-00051W-JR; Sat, 27 Jun 2020 14:36:05 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDBD620FC3;
 Sat, 27 Jun 2020 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268556;
 bh=nq/GJ3bVjcU32FBhL0HJSrQpHkiF2L5ZOjOgh+5/sMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cmaDDCPUOh46Hv/gc9MKJafkQGReoVe5ws4Jq6w91zZx+Tv/vEv/l3Mg33Iikh9vt
 GosBb+A3COpOB4igTMACJrHN7fTDwU990HxXA4AbcDtBmhnfG50/sv3HAQpj4hkzgG
 WFvYVhPppiVA/kvSqtVh7rNouXnmvS9M/mExbE30=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] asm-generic: pgalloc: provide generic pgd_free()
Date: Sat, 27 Jun 2020 17:34:51 +0300
Message-Id: <20200627143453.31835-7-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Most architectures define pgd_free() as a wrapper for free_page().

Provide a generic version in asm-generic/pgalloc.h and enable its use for
most architectures.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/include/asm/pgalloc.h      | 6 ------
 arch/arm/include/asm/pgalloc.h        | 1 +
 arch/arm64/include/asm/pgalloc.h      | 1 +
 arch/csky/include/asm/pgalloc.h       | 7 +------
 arch/hexagon/include/asm/pgalloc.h    | 7 +------
 arch/ia64/include/asm/pgalloc.h       | 5 -----
 arch/m68k/include/asm/sun3_pgalloc.h  | 7 +------
 arch/microblaze/include/asm/pgalloc.h | 6 ------
 arch/mips/include/asm/pgalloc.h       | 5 -----
 arch/nds32/mm/mm-nds32.c              | 2 ++
 arch/nios2/include/asm/pgalloc.h      | 7 +------
 arch/parisc/include/asm/pgalloc.h     | 1 +
 arch/riscv/include/asm/pgalloc.h      | 5 -----
 arch/sh/include/asm/pgalloc.h         | 1 +
 arch/um/include/asm/pgalloc.h         | 1 -
 arch/um/kernel/mem.c                  | 5 -----
 arch/x86/include/asm/pgalloc.h        | 1 +
 arch/xtensa/include/asm/pgalloc.h     | 5 -----
 include/asm-generic/pgalloc.h         | 7 +++++++
 19 files changed, 18 insertions(+), 62 deletions(-)

diff --git a/arch/alpha/include/asm/pgalloc.h b/arch/alpha/include/asm/pgalloc.h
index 4834cd52e9d0..9c6a24fe493d 100644
--- a/arch/alpha/include/asm/pgalloc.h
+++ b/arch/alpha/include/asm/pgalloc.h
@@ -34,10 +34,4 @@ pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-static inline void
-pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
 #endif /* _ALPHA_PGALLOC_H */
diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
index c5bdfd404ea5..15f4674715f8 100644
--- a/arch/arm/include/asm/pgalloc.h
+++ b/arch/arm/include/asm/pgalloc.h
@@ -65,6 +65,7 @@ static inline void clean_pte_table(pte_t *pte)
 
 #define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 #define __HAVE_ARCH_PTE_ALLOC_ONE
+#define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>
 
 static inline pte_t *
diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 0965945b595d..3c6a7f5988b1 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -13,6 +13,7 @@
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 
+#define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>
 
 #define PGD_SIZE	(PTRS_PER_PGD * sizeof(pgd_t))
diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index c7c1ed27e348..d58d8146b729 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -9,7 +9,7 @@
 #include <linux/sched.h>
 
 #define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
-#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
+#include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 					pte_t *pte)
@@ -42,11 +42,6 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 	return pte;
 }
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_pages((unsigned long)pgd, PGD_ORDER);
-}
-
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *ret;
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index cc9be514a676..f0c47e6a7427 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -11,7 +11,7 @@
 #include <asm/mem-layout.h>
 #include <asm/atomic.h>
 
-#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
+#include <asm-generic/pgalloc.h>
 
 extern unsigned long long kmap_generation;
 
@@ -41,11 +41,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return pgd;
 }
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long) pgd);
-}
-
 static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 				pgtable_t pte)
 {
diff --git a/arch/ia64/include/asm/pgalloc.h b/arch/ia64/include/asm/pgalloc.h
index 06f80358e20f..9601cfe83c94 100644
--- a/arch/ia64/include/asm/pgalloc.h
+++ b/arch/ia64/include/asm/pgalloc.h
@@ -29,11 +29,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return (pgd_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
 }
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
 #if CONFIG_PGTABLE_LEVELS == 4
 static inline void
 p4d_populate(struct mm_struct *mm, p4d_t * p4d_entry, pud_t * pud)
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index 11b95dadf7c0..000f64869b91 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -13,7 +13,7 @@
 
 #include <asm/tlb.h>
 
-#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
+#include <asm-generic/pgalloc.h>
 
 extern const char bad_pmd_string[];
 
@@ -40,11 +40,6 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t page
  */
 #define pmd_free(mm, x)			do { } while (0)
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-        free_page((unsigned long) pgd);
-}
-
 static inline pgd_t * pgd_alloc(struct mm_struct *mm)
 {
      pgd_t *new_pgd;
diff --git a/arch/microblaze/include/asm/pgalloc.h b/arch/microblaze/include/asm/pgalloc.h
index ebb6b7939bb8..8839ce00ea05 100644
--- a/arch/microblaze/include/asm/pgalloc.h
+++ b/arch/microblaze/include/asm/pgalloc.h
@@ -28,12 +28,6 @@ static inline pgd_t *get_pgd(void)
 	return (pgd_t *)__get_free_pages(GFP_KERNEL|__GFP_ZERO, 0);
 }
 
-static inline void free_pgd(pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
-#define pgd_free(mm, pgd)	free_pgd(pgd)
 #define pgd_alloc(mm)		get_pgd()
 
 #define pmd_pgtable(pmd)	pmd_page(pmd)
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index e5a840910ce0..8b18424b3120 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -49,11 +49,6 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 extern void pgd_init(unsigned long page);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_pages((unsigned long)pgd, PGD_ORDER);
-}
-
 #define __pte_free_tlb(tlb,pte,address)			\
 do {							\
 	pgtable_pte_page_dtor(pte);			\
diff --git a/arch/nds32/mm/mm-nds32.c b/arch/nds32/mm/mm-nds32.c
index 8503bee882d1..55bec50ccc03 100644
--- a/arch/nds32/mm/mm-nds32.c
+++ b/arch/nds32/mm/mm-nds32.c
@@ -2,6 +2,8 @@
 // Copyright (C) 2005-2017 Andes Technology Corporation
 
 #include <linux/init_task.h>
+
+#define __HAVE_ARCH_PGD_FREE
 #include <asm/pgalloc.h>
 
 #define FIRST_KERNEL_PGD_NR	(USER_PTRS_PER_PGD)
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index 0b146d773c85..e6600d2a5ae0 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -12,7 +12,7 @@
 
 #include <linux/mm.h>
 
-#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
+#include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 	pte_t *pte)
@@ -34,11 +34,6 @@ extern void pmd_init(unsigned long page, unsigned long pagetable);
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_pages((unsigned long)pgd, PGD_ORDER);
-}
-
 #define __pte_free_tlb(tlb, pte, addr)				\
 	do {							\
 		pgtable_pte_page_dtor(pte);			\
diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index 689766b914ed..cc7ecc2ef55d 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -11,6 +11,7 @@
 #include <asm/cache.h>
 
 #define __HAVE_ARCH_PMD_FREE
+#define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>
 
 /* Allocate the top level pgd (page directory)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 8d3135f05b8e..23b1544e0ca5 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -55,11 +55,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return pgd;
 }
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
 #ifndef __PAGETABLE_PMD_FOLDED
 
 #define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 59263df76f51..3d832472cbab 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -6,6 +6,7 @@
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
 #define __HAVE_ARCH_PMD_FREE
+#define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>
 
 extern pgd_t *pgd_alloc(struct mm_struct *);
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index bdde433dbdec..5393e13e07e0 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,7 +25,6 @@
  * Allocate and free page tables.
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
-extern void pgd_free(struct mm_struct *mm, pgd_t *pgd);
 
 #define __pte_free_tlb(tlb,pte, address)		\
 do {							\
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index a4accb14cbd5..9242dc91d751 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -196,11 +196,6 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 	return pgd;
 }
 
-void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long) pgd);
-}
-
 void *uml_kmalloc(int size, int flags)
 {
 	return kmalloc(size, flags);
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index 3d1085a14347..62ad61d6fefc 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -7,6 +7,7 @@
 #include <linux/pagemap.h>
 
 #define __HAVE_ARCH_PTE_ALLOC_ONE
+#define __HAVE_ARCH_PGD_FREE
 #include <asm-generic/pgalloc.h>
 
 static inline int  __paravirt_pgd_alloc(struct mm_struct *mm) { return 0; }
diff --git a/arch/xtensa/include/asm/pgalloc.h b/arch/xtensa/include/asm/pgalloc.h
index 60ee94b42850..699a8fdf9005 100644
--- a/arch/xtensa/include/asm/pgalloc.h
+++ b/arch/xtensa/include/asm/pgalloc.h
@@ -33,11 +33,6 @@ pgd_alloc(struct mm_struct *mm)
 	return (pgd_t*) __get_free_pages(GFP_KERNEL | __GFP_ZERO, PGD_ORDER);
 }
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
 static inline void ptes_clear(pte_t *ptep)
 {
 	int i;
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index d361574aaadf..6f44810921aa 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -175,6 +175,13 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 
 #endif /* CONFIG_PGTABLE_LEVELS > 3 */
 
+#ifndef __HAVE_ARCH_PGD_FREE
+static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
+{
+	free_page((unsigned long)pgd);
+}
+#endif
+
 #endif /* CONFIG_MMU */
 
 #endif /* __ASM_GENERIC_PGALLOC_H */
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
