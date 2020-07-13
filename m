Return-Path: <SRS0=Uylt=AY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CB1C433E4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jul 2020 03:24:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5E020722
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jul 2020 03:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dkj8DGzg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5E020722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xzuzBuM15rYhqfSudTzSCIkNfzVPXfmdebGTwBz4Sc=; b=Dkj8DGzg67Hr8ARHYNF6yAleLz
	AcsDHt6UqF5YWy2ThBXNKCF7Ho4zlevYwcYqPVYiaXmXsM74/5SK+LsZ9p25I/FeYfQ64GEY9pLHT
	d+lVq4aZ+VnmUPgvtfl8jCdC6Dcl8iGYe5SueZG5NBI0aPBqcZxNszrlq91dEItLFlUUPWqIRUjj/
	RkKwr/YKbtrNzokPPVfxtxxaYK6t5ZqPCh083APOekGNLAWrh20EpBDr8c5LHXGsEJPoQ060INXK9
	qCy3zTbiiJSLPpeDHmfBRK9YHB78XWwwBD5oFVyye3D8OBVS2COe0VsJr2r5CSwNUpR//hF+TO5ty
	NnojCDnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jup4u-00029n-ML; Mon, 13 Jul 2020 03:24:28 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jup4h-00024F-Ux; Mon, 13 Jul 2020 03:24:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 362B81FB;
 Sun, 12 Jul 2020 20:24:14 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.87.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B5423F7D8;
 Sun, 12 Jul 2020 20:24:02 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V5 2/4] mm/debug_vm_pgtable: Add tests validating advanced
 arch page table helpers
Date: Mon, 13 Jul 2020 08:53:05 +0530
Message-Id: <1594610587-4172-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
References: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_232416_146027_180296B9 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, agordeev@linux.ibm.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 christophe.leroy@csgroup.eu, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, ziy@nvidia.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, cai@lca.pw,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, gerald.schaefer@de.ibm.com,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 aneesh.kumar@linux.ibm.com, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This adds new tests validating for these following arch advanced page table
helpers. These tests create and test specific mapping types at various page
table levels.

1. pxxp_set_wrprotect()
2. pxxp_get_and_clear()
3. pxxp_set_access_flags()
4. pxxp_get_and_clear_full()
5. pxxp_test_and_clear_young()
6. pxx_leaf()
7. pxx_set_huge()
8. pxx_(clear|mk)_savedwrite()
9. huge_pxxp_xxx()

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Vineet Gupta <vgupta@synopsys.com>	#arc
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/debug_vm_pgtable.c | 312 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 2fac47db3eb7..9c7c11eecf17 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/pfn_t.h>
 #include <linux/printk.h>
+#include <linux/pgtable.h>
 #include <linux/random.h>
 #include <linux/spinlock.h>
 #include <linux/swap.h>
@@ -28,6 +29,7 @@
 #include <linux/start_kernel.h>
 #include <linux/sched/mm.h>
 #include <asm/pgalloc.h>
+#include <asm/tlbflush.h>
 
 #define VMFLAGS	(VM_READ|VM_WRITE|VM_EXEC)
 
@@ -55,6 +57,55 @@ static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte))));
 }
 
+static void __init pte_advanced_tests(struct mm_struct *mm,
+				      struct vm_area_struct *vma, pte_t *ptep,
+				      unsigned long pfn, unsigned long vaddr,
+				      pgprot_t prot)
+{
+	pte_t pte = pfn_pte(pfn, prot);
+
+	pte = pfn_pte(pfn, prot);
+	set_pte_at(mm, vaddr, ptep, pte);
+	ptep_set_wrprotect(mm, vaddr, ptep);
+	pte = ptep_get(ptep);
+	WARN_ON(pte_write(pte));
+
+	pte = pfn_pte(pfn, prot);
+	set_pte_at(mm, vaddr, ptep, pte);
+	ptep_get_and_clear(mm, vaddr, ptep);
+	pte = ptep_get(ptep);
+	WARN_ON(!pte_none(pte));
+
+	pte = pfn_pte(pfn, prot);
+	pte = pte_wrprotect(pte);
+	pte = pte_mkclean(pte);
+	set_pte_at(mm, vaddr, ptep, pte);
+	pte = pte_mkwrite(pte);
+	pte = pte_mkdirty(pte);
+	ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
+	pte = ptep_get(ptep);
+	WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
+
+	pte = pfn_pte(pfn, prot);
+	set_pte_at(mm, vaddr, ptep, pte);
+	ptep_get_and_clear_full(mm, vaddr, ptep, 1);
+	pte = ptep_get(ptep);
+	WARN_ON(!pte_none(pte));
+
+	pte = pte_mkyoung(pte);
+	set_pte_at(mm, vaddr, ptep, pte);
+	ptep_test_and_clear_young(vma, vaddr, ptep);
+	pte = ptep_get(ptep);
+	WARN_ON(pte_young(pte));
+}
+
+static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
+{
+	pte_t pte = pfn_pte(pfn, prot);
+
+	WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
+	WARN_ON(pte_savedwrite(pte_clear_savedwrite(pte_mk_savedwrite(pte))));
+}
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
 {
@@ -77,6 +128,90 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(!pmd_bad(pmd_mkhuge(pmd)));
 }
 
+static void __init pmd_advanced_tests(struct mm_struct *mm,
+				      struct vm_area_struct *vma, pmd_t *pmdp,
+				      unsigned long pfn, unsigned long vaddr,
+				      pgprot_t prot)
+{
+	pmd_t pmd = pfn_pmd(pfn, prot);
+
+	if (!has_transparent_hugepage())
+		return;
+
+	/* Align the address wrt HPAGE_PMD_SIZE */
+	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
+
+	pmd = pfn_pmd(pfn, prot);
+	set_pmd_at(mm, vaddr, pmdp, pmd);
+	pmdp_set_wrprotect(mm, vaddr, pmdp);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(pmd_write(pmd));
+
+	pmd = pfn_pmd(pfn, prot);
+	set_pmd_at(mm, vaddr, pmdp, pmd);
+	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(!pmd_none(pmd));
+
+	pmd = pfn_pmd(pfn, prot);
+	pmd = pmd_wrprotect(pmd);
+	pmd = pmd_mkclean(pmd);
+	set_pmd_at(mm, vaddr, pmdp, pmd);
+	pmd = pmd_mkwrite(pmd);
+	pmd = pmd_mkdirty(pmd);
+	pmdp_set_access_flags(vma, vaddr, pmdp, pmd, 1);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(!(pmd_write(pmd) && pmd_dirty(pmd)));
+
+	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
+	set_pmd_at(mm, vaddr, pmdp, pmd);
+	pmdp_huge_get_and_clear_full(vma, vaddr, pmdp, 1);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(!pmd_none(pmd));
+
+	pmd = pmd_mkyoung(pmd);
+	set_pmd_at(mm, vaddr, pmdp, pmd);
+	pmdp_test_and_clear_young(vma, vaddr, pmdp);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(pmd_young(pmd));
+}
+
+static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
+{
+	pmd_t pmd = pfn_pmd(pfn, prot);
+
+	/*
+	 * PMD based THP is a leaf entry.
+	 */
+	pmd = pmd_mkhuge(pmd);
+	WARN_ON(!pmd_leaf(pmd));
+}
+
+static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
+{
+	pmd_t pmd;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return;
+	/*
+	 * X86 defined pmd_set_huge() verifies that the given
+	 * PMD is not a populated non-leaf entry.
+	 */
+	WRITE_ONCE(*pmdp, __pmd(0));
+	WARN_ON(!pmd_set_huge(pmdp, __pfn_to_phys(pfn), prot));
+	WARN_ON(!pmd_clear_huge(pmdp));
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(!pmd_none(pmd));
+}
+
+static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
+{
+	pmd_t pmd = pfn_pmd(pfn, prot);
+
+	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
+	WARN_ON(pmd_savedwrite(pmd_clear_savedwrite(pmd_mk_savedwrite(pmd))));
+}
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
 {
@@ -100,12 +235,119 @@ static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
 	 */
 	WARN_ON(!pud_bad(pud_mkhuge(pud)));
 }
+
+static void __init pud_advanced_tests(struct mm_struct *mm,
+				      struct vm_area_struct *vma, pud_t *pudp,
+				      unsigned long pfn, unsigned long vaddr,
+				      pgprot_t prot)
+{
+	pud_t pud = pfn_pud(pfn, prot);
+
+	if (!has_transparent_hugepage())
+		return;
+
+	/* Align the address wrt HPAGE_PUD_SIZE */
+	vaddr = (vaddr & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE;
+
+	set_pud_at(mm, vaddr, pudp, pud);
+	pudp_set_wrprotect(mm, vaddr, pudp);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(pud_write(pud));
+
+#ifndef __PAGETABLE_PMD_FOLDED
+	pud = pfn_pud(pfn, prot);
+	set_pud_at(mm, vaddr, pudp, pud);
+	pudp_huge_get_and_clear(mm, vaddr, pudp);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(!pud_none(pud));
+
+	pud = pfn_pud(pfn, prot);
+	set_pud_at(mm, vaddr, pudp, pud);
+	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(!pud_none(pud));
+#endif /* __PAGETABLE_PMD_FOLDED */
+	pud = pfn_pud(pfn, prot);
+	pud = pud_wrprotect(pud);
+	pud = pud_mkclean(pud);
+	set_pud_at(mm, vaddr, pudp, pud);
+	pud = pud_mkwrite(pud);
+	pud = pud_mkdirty(pud);
+	pudp_set_access_flags(vma, vaddr, pudp, pud, 1);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
+
+	pud = pud_mkyoung(pud);
+	set_pud_at(mm, vaddr, pudp, pud);
+	pudp_test_and_clear_young(vma, vaddr, pudp);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(pud_young(pud));
+}
+
+static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
+{
+	pud_t pud = pfn_pud(pfn, prot);
+
+	/*
+	 * PUD based THP is a leaf entry.
+	 */
+	pud = pud_mkhuge(pud);
+	WARN_ON(!pud_leaf(pud));
+}
+
+static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
+{
+	pud_t pud;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return;
+	/*
+	 * X86 defined pud_set_huge() verifies that the given
+	 * PUD is not a populated non-leaf entry.
+	 */
+	WRITE_ONCE(*pudp, __pud(0));
+	WARN_ON(!pud_set_huge(pudp, __pfn_to_phys(pfn), prot));
+	WARN_ON(!pud_clear_huge(pudp));
+	pud = READ_ONCE(*pudp);
+	WARN_ON(!pud_none(pud));
+}
 #else  /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pud_advanced_tests(struct mm_struct *mm,
+				      struct vm_area_struct *vma, pud_t *pudp,
+				      unsigned long pfn, unsigned long vaddr,
+				      pgprot_t prot)
+{
+}
+static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
+{
+}
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 #else  /* !CONFIG_TRANSPARENT_HUGEPAGE */
 static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot) { }
 static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pmd_advanced_tests(struct mm_struct *mm,
+				      struct vm_area_struct *vma, pmd_t *pmdp,
+				      unsigned long pfn, unsigned long vaddr,
+				      pgprot_t prot)
+{
+}
+static void __init pud_advanced_tests(struct mm_struct *mm,
+				      struct vm_area_struct *vma, pud_t *pudp,
+				      unsigned long pfn, unsigned long vaddr,
+				      pgprot_t prot)
+{
+}
+static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
+{
+}
+static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
+{
+}
+static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot) { }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 static void __init p4d_basic_tests(unsigned long pfn, pgprot_t prot)
@@ -495,8 +737,56 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(!pte_huge(pte_mkhuge(pte)));
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 }
+
+static void __init hugetlb_advanced_tests(struct mm_struct *mm,
+					  struct vm_area_struct *vma,
+					  pte_t *ptep, unsigned long pfn,
+					  unsigned long vaddr, pgprot_t prot)
+{
+	struct page *page = pfn_to_page(pfn);
+	pte_t pte = ptep_get(ptep);
+	unsigned long paddr = __pfn_to_phys(pfn) & PMD_MASK;
+
+	pte = pte_mkhuge(mk_pte(pfn_to_page(PHYS_PFN(paddr)), prot));
+	set_huge_pte_at(mm, vaddr, ptep, pte);
+	barrier();
+	WARN_ON(!pte_same(pte, huge_ptep_get(ptep)));
+	huge_pte_clear(mm, vaddr, ptep, PMD_SIZE);
+	pte = huge_ptep_get(ptep);
+	WARN_ON(!huge_pte_none(pte));
+
+	pte = mk_huge_pte(page, prot);
+	set_huge_pte_at(mm, vaddr, ptep, pte);
+	barrier();
+	huge_ptep_set_wrprotect(mm, vaddr, ptep);
+	pte = huge_ptep_get(ptep);
+	WARN_ON(huge_pte_write(pte));
+
+	pte = mk_huge_pte(page, prot);
+	set_huge_pte_at(mm, vaddr, ptep, pte);
+	barrier();
+	huge_ptep_get_and_clear(mm, vaddr, ptep);
+	pte = huge_ptep_get(ptep);
+	WARN_ON(!huge_pte_none(pte));
+
+	pte = mk_huge_pte(page, prot);
+	pte = huge_pte_wrprotect(pte);
+	set_huge_pte_at(mm, vaddr, ptep, pte);
+	barrier();
+	pte = huge_pte_mkwrite(pte);
+	pte = huge_pte_mkdirty(pte);
+	huge_ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
+	pte = huge_ptep_get(ptep);
+	WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
+}
 #else  /* !CONFIG_HUGETLB_PAGE */
 static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init hugetlb_advanced_tests(struct mm_struct *mm,
+					  struct vm_area_struct *vma,
+					  pte_t *ptep, unsigned long pfn,
+					  unsigned long vaddr, pgprot_t prot)
+{
+}
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -568,6 +858,7 @@ static unsigned long __init get_random_vaddr(void)
 
 static int __init debug_vm_pgtable(void)
 {
+	struct vm_area_struct *vma;
 	struct mm_struct *mm;
 	pgd_t *pgdp;
 	p4d_t *p4dp, *saved_p4dp;
@@ -596,6 +887,12 @@ static int __init debug_vm_pgtable(void)
 	 */
 	protnone = __P000;
 
+	vma = vm_area_alloc(mm);
+	if (!vma) {
+		pr_err("vma allocation failed\n");
+		return 1;
+	}
+
 	/*
 	 * PFN for mapping at PTE level is determined from a standard kernel
 	 * text symbol. But pfns for higher page table levels are derived by
@@ -644,6 +941,20 @@ static int __init debug_vm_pgtable(void)
 	p4d_clear_tests(mm, p4dp);
 	pgd_clear_tests(mm, pgdp);
 
+	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
+	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
+	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
+	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
+
+	pmd_leaf_tests(pmd_aligned, prot);
+	pud_leaf_tests(pud_aligned, prot);
+
+	pmd_huge_tests(pmdp, pmd_aligned, prot);
+	pud_huge_tests(pudp, pud_aligned, prot);
+
+	pte_savedwrite_tests(pte_aligned, prot);
+	pmd_savedwrite_tests(pmd_aligned, prot);
+
 	pte_unmap_unlock(ptep, ptl);
 
 	pmd_populate_tests(mm, pmdp, saved_ptep);
@@ -678,6 +989,7 @@ static int __init debug_vm_pgtable(void)
 	pmd_free(mm, saved_pmdp);
 	pte_free(mm, saved_ptep);
 
+	vm_area_free(vma);
 	mm_dec_nr_puds(mm);
 	mm_dec_nr_pmds(mm);
 	mm_dec_nr_ptes(mm);
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
