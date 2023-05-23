Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCCDC7EE26
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFyQvqGRNHqQMpsJ0oiW9VD7Z8UWE9MQLOeoxHY939U=; b=U0rIPQUnZ3ZPBl
	WWbdIIxr4ED+U/Rte4tqoyRwGW9Y1pL/VUoj1iwrJbzfQ2hgKOHxpTOAzmhpT0SO5bxf7vr26Vvus
	vwAnBbuFWZx5grTwr0smQC289vugYPbD9EFJYPX45eIbVS7BZXHYGEXV/hzCRFG3FZilf/waJpg1A
	9oUZTB3V4e7s+KlmiVYjybX7/hK0qx7G2qnmnCDc3t3L0/6Eej2QWifCzZaABoMUekQAwDFGaU5F9
	HZJ5MGTSVFJicQsK8LdEdXhiexEYlgAvRJTi3I/PMybzxTs+LXKv3WJ6Q+Kbs4eC2AlO2SK54XxnT
	gM+XwBkXnZynwehyASag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Tnu-00AcNj-07;
	Tue, 23 May 2023 15:20:02 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf2-00ASJk-0H
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:49 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so3762415e87.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850747; x=1687442747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZAVHnI0RnVaS/2VmTowQqEKdQQ5rGu0g+MysdOCzRE=;
        b=CndnVf4Wz0L7DCgFoh3Gq+YOBOn/KSBOCbH8YksJupr6UUPOhddHJUufNJpsGX6RPn
         rTDP0CIM0yfz0E9z2hoqsv+IrS9bNsKCIWeoIiAKo1FLM6IUrHeaw016T1O9DEAo7W0s
         lGILyoagX94XkZQ+8x2RQCqAZfYySvk+7OvtomiQ5PLGb7k8yRkB5FQhQ10QmX0bg6eL
         s7Ko5smzRaiFKzMutWbf/9ftcS5cdW7GP0A5ukP7k6S25BdkMtlB9BCM9AQmGDpbZGdM
         uxU1fALRef1aE+fzPPwRaMJZVm/kLgAfXQLWcvxYyYtb7qAOO8RA1O1GAaM+1Cd9JyCz
         y/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850747; x=1687442747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZAVHnI0RnVaS/2VmTowQqEKdQQ5rGu0g+MysdOCzRE=;
        b=dpIFXSWX5xvL795mTNp4WQihUFHQwhRiv4NO7jZzFoaeDSWYMwaAn+dWItN3NIdNix
         rQMsH9Pqp8OS7rPlLboUxkuQeM6f3sfei59BzVjdAs8TDi6UtZh6jcqhysL63nf4iEZ1
         l3DZB+e+mceO4MMmW5H4vcVtMXp85ZD+3tra1RbxhzJkQ2cwF8tZWcjOV4Ec9c4DSX7d
         SMVFXTmNuoMSCzTVuY9iO1m00J1vfEUWbUPFeA/XWHogHgnlGfivfHIhjwLJz1qMixVA
         eYSH42r+omz1l7RnvaFg4hLZ4hRDxEvSR/XiRUab+ZNae+H4wbOnv/ybyFi2AtX+/i4I
         wK7A==
X-Gm-Message-State: AC+VfDzebfsPqa1fUEwlilvX0KfSYIHHV0RT5YwJ8x3DePydVB1jcbMs
	CLYYaLNAg3X+yGDjdPCICF/VZQ==
X-Google-Smtp-Source: ACHHUZ65J8Z3/JvqtcArdgyxfAPz6sl81M4hzs4N3aTQHnJRtGcRDM0SdUGRMB6f5OBhCMlJco5Hlw==
X-Received: by 2002:ac2:4c39:0:b0:4f1:2986:3920 with SMTP id u25-20020ac24c39000000b004f129863920mr4308136lfq.41.1684850746806;
        Tue, 23 May 2023 07:05:46 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:26 +0200
Subject: [PATCH v3 02/12] m68k: Pass a pointer to virt_to_pfn()
 virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-2-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_070648_140137_37324EA5 
X-CRM114-Status: GOOD (  19.08  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Functions that work on a pointer to virtual memory such as
virt_to_pfn() and users of that function such as
virt_to_page() are supposed to pass a pointer to virtual
memory, ideally a (void *) or other pointer. However since
many architectures implement virt_to_pfn() as a macro,
this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix up the offending calls in arch/m68k with explicit casts.

The page table include <asm/pgtable.h> will include different
variants of the defines depending on whether you build for
classic m68k, ColdFire or Sun3, so fix all variants.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Fix up versioning. This is v3.
- Let Coldfire __pte_page() return a (void *) instead of __va
- Delete Coldfire pte_pagenr() which was using unsigned long
  semantics from __pte_page()
- Drop ill-advised change to Coldfire pmd_page_vaddr()
ChangeLog v1->v2:
- Fix the sun3 pgtable macro to not cast to unsigned long.
- Make a similar change to the ColdFire include.
- Add an extra parens around the page argument to the
  PD_PTABLE() macro, as is normally required.
---
 arch/m68k/include/asm/mcf_pgtable.h  | 3 +--
 arch/m68k/include/asm/sun3_pgtable.h | 4 ++--
 arch/m68k/mm/mcfmmu.c                | 3 ++-
 arch/m68k/mm/motorola.c              | 4 ++--
 arch/m68k/mm/sun3mmu.c               | 2 +-
 arch/m68k/sun3/dvma.c                | 2 +-
 arch/m68k/sun3x/dvma.c               | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index d97fbb812f63..43e8da8465f9 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -115,7 +115,7 @@ static inline void pgd_set(pgd_t *pgdp, pmd_t *pmdp)
 	pgd_val(*pgdp) = virt_to_phys(pmdp);
 }
 
-#define __pte_page(pte)	((unsigned long) (pte_val(pte) & PAGE_MASK))
+#define __pte_page(pte)	((void *) (pte_val(pte) & PAGE_MASK))
 #define pmd_page_vaddr(pmd)	((unsigned long) (pmd_val(pmd)))
 
 static inline int pte_none(pte_t pte)
@@ -134,7 +134,6 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
 	pte_val(*ptep) = 0;
 }
 
-#define pte_pagenr(pte)	((__pte_page(pte) - PAGE_OFFSET) >> PAGE_SHIFT)
 #define pte_page(pte)	virt_to_page(__pte_page(pte))
 
 static inline int pmd_none2(pmd_t *pmd) { return !pmd_val(*pmd); }
diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index e582b0484a55..f428f73125d5 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -91,7 +91,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define pmd_set(pmdp,ptep) do {} while (0)
 
 #define __pte_page(pte) \
-((unsigned long) __va ((pte_val (pte) & SUN3_PAGE_PGNUM_MASK) << PAGE_SHIFT))
+(__va ((pte_val (pte) & SUN3_PAGE_PGNUM_MASK) << PAGE_SHIFT))
 
 static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 {
@@ -111,7 +111,7 @@ static inline void pte_clear (struct mm_struct *mm, unsigned long addr, pte_t *p
 
 #define pte_page(pte)		virt_to_page(__pte_page(pte))
 #define pmd_pfn(pmd)		(pmd_val(pmd) >> PAGE_SHIFT)
-#define pmd_page(pmd)		virt_to_page(pmd_page_vaddr(pmd))
+#define pmd_page(pmd)		virt_to_page((void  *)pmd_page_vaddr(pmd))
 
 
 static inline int pmd_none2 (pmd_t *pmd) { return !pmd_val (*pmd); }
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 70aa0979e027..278e85fcecd4 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -69,7 +69,8 @@ void __init paging_init(void)
 
 		/* now change pg_table to kernel virtual addresses */
 		for (i = 0; i < PTRS_PER_PTE; ++i, ++pg_table) {
-			pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+			pte_t pte = pfn_pte(virt_to_pfn((void *)address),
+					    PAGE_INIT);
 			if (address >= (unsigned long) high_memory)
 				pte_val(pte) = 0;
 
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 911301224078..c75984e2d86b 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -102,7 +102,7 @@ static struct list_head ptable_list[2] = {
 	LIST_HEAD_INIT(ptable_list[1]),
 };
 
-#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page(page)->lru))
+#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)(page))->lru))
 #define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
 #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
 
@@ -201,7 +201,7 @@ int free_pointer_table(void *table, int type)
 		list_del(dp);
 		mmu_page_dtor((void *)page);
 		if (type == TABLE_PTE)
-			pgtable_pte_page_dtor(virt_to_page(page));
+			pgtable_pte_page_dtor(virt_to_page((void *)page));
 		free_page (page);
 		return 1;
 	} else if (ptable_list[type].next != dp) {
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index b619d0d4319c..c5e6a23e0262 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -75,7 +75,7 @@ void __init paging_init(void)
 		/* now change pg_table to kernel virtual addresses */
 		pg_table = (pte_t *) __va ((unsigned long) pg_table);
 		for (i=0; i<PTRS_PER_PTE; ++i, ++pg_table) {
-			pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+			pte_t pte = pfn_pte(virt_to_pfn((void *)address), PAGE_INIT);
 			if (address >= (unsigned long)high_memory)
 				pte_val (pte) = 0;
 			set_pte (pg_table, pte);
diff --git a/arch/m68k/sun3/dvma.c b/arch/m68k/sun3/dvma.c
index f15ff16b9997..83fcae6a0e79 100644
--- a/arch/m68k/sun3/dvma.c
+++ b/arch/m68k/sun3/dvma.c
@@ -29,7 +29,7 @@ static unsigned long dvma_page(unsigned long kaddr, unsigned long vaddr)
 	j = *(volatile unsigned long *)kaddr;
 	*(volatile unsigned long *)kaddr = j;
 
-	ptep = pfn_pte(virt_to_pfn(kaddr), PAGE_KERNEL);
+	ptep = pfn_pte(virt_to_pfn((void *)kaddr), PAGE_KERNEL);
 	pte = pte_val(ptep);
 //	pr_info("dvma_remap: addr %lx -> %lx pte %08lx\n", kaddr, vaddr, pte);
 	if(ptelist[(vaddr & 0xff000) >> PAGE_SHIFT] != pte) {
diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index 08bb92113026..a6034ba05845 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -125,7 +125,7 @@ inline int dvma_map_cpu(unsigned long kaddr,
 			do {
 				pr_debug("mapping %08lx phys to %08lx\n",
 					 __pa(kaddr), vaddr);
-				set_pte(pte, pfn_pte(virt_to_pfn(kaddr),
+				set_pte(pte, pfn_pte(virt_to_pfn((void *)kaddr),
 						     PAGE_KERNEL));
 				pte++;
 				kaddr += PAGE_SIZE;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
