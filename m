Return-Path: <SRS0=73lZ=AI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9394BC433DF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 14:36:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ADCA20FC3
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 14:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlR/TYXX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVVvqNa9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ADCA20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xah8TeiwLkQS9v6l0v3KRhhsZ2Mszc0WozdLz5lRVcg=; b=MlR/TYXXBEMPZJ/2/vJRjtmii
	Uz6jki1qO4hPjgd7b5GNhqTL/o7BVdR897ACDH6BUnvVfDtO71KVPCyO39ZkFMKMNhrDOFTPpGZjN
	xveNR0svB/j/7kqDrtAxHdYJ2XiDIEyktpypjHFgDkM1JlqRaTuqrHSD12jzbMBhMZoPWGj6nOYz5
	Y2QeB92o1n5FVvFs2/CsyupMSM7cU6V4oCZGTQb9dcmdISU/DQvo8LaDHN42PzCPWfi6ELJHO1sHZ
	5MlrsmybE/vVedV6Rcu8t8r+DO6djC0Y1FndOmDGQ/hp8u6rKX3oMfmC45e4JzSJEOt8aaUoVpEFi
	INmOdkfAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBwR-0005Cf-IW; Sat, 27 Jun 2020 14:36:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBvo-0004yx-TG; Sat, 27 Jun 2020 14:35:53 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B21421924;
 Sat, 27 Jun 2020 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268548;
 bh=4zLQnkDzVvl7CnPz5Ef9F0uViqB2xn6tl67WrwnG42E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NVVvqNa90ykWnheABq+B8c38h67OG6nTbzT8Z2XO4RabHV8O2TdYOOrgDgGYtd0Ez
 zFB95kCYiPhfqCMwza00ZFzoy7xr5PgKgYcg3noOCo7XJkYtZX3nzb2fFOINd5+iVr
 gj5C4cluc45jk88vfVH2liEtwnGvhSYuGYcE0Pzo=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] asm-generic: pgalloc: provide generic pud_alloc_one() and
 pud_free_one()
Date: Sat, 27 Jun 2020 17:34:50 +0300
Message-Id: <20200627143453.31835-6-rppt@kernel.org>
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

Several architectures define pud_alloc_one() as a wrapper for
__get_free_page() and pud_free() as a wrapper for free_page().

Provide a generic implementation in asm-generic/pgalloc.h and use it where
appropriate.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm64/include/asm/pgalloc.h | 11 -----------
 arch/ia64/include/asm/pgalloc.h  |  9 ---------
 arch/mips/include/asm/pgalloc.h  |  6 +-----
 arch/x86/include/asm/pgalloc.h   | 15 ---------------
 include/asm-generic/pgalloc.h    | 30 ++++++++++++++++++++++++++++++
 5 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 7246d0a662e1..0965945b595d 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -37,17 +37,6 @@ static inline void __pud_populate(pud_t *pudp, phys_addr_t pmdp, pudval_t prot)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	return (pud_t *)__get_free_page(GFP_PGTABLE_USER);
-}
-
-static inline void pud_free(struct mm_struct *mm, pud_t *pudp)
-{
-	BUG_ON((unsigned long)pudp & (PAGE_SIZE-1));
-	free_page((unsigned long)pudp);
-}
-
 static inline void __p4d_populate(p4d_t *p4dp, phys_addr_t pudp, p4dval_t prot)
 {
 	set_p4d(p4dp, __p4d(__phys_to_p4d_val(pudp) | prot));
diff --git a/arch/ia64/include/asm/pgalloc.h b/arch/ia64/include/asm/pgalloc.h
index 5da1fc76477b..06f80358e20f 100644
--- a/arch/ia64/include/asm/pgalloc.h
+++ b/arch/ia64/include/asm/pgalloc.h
@@ -41,15 +41,6 @@ p4d_populate(struct mm_struct *mm, p4d_t * p4d_entry, pud_t * pud)
 	p4d_val(*p4d_entry) = __pa(pud);
 }
 
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	return (pud_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
-}
-
-static inline void pud_free(struct mm_struct *mm, pud_t *pud)
-{
-	free_page((unsigned long)pud);
-}
 #define __pud_free_tlb(tlb, pud, address)	pud_free((tlb)->mm, pud)
 #endif /* CONFIG_PGTABLE_LEVELS == 4 */
 
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index eed1b3e8c642..e5a840910ce0 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
+#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
@@ -87,11 +88,6 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 	return pud;
 }
 
-static inline void pud_free(struct mm_struct *mm, pud_t *pud)
-{
-	free_pages((unsigned long)pud, PUD_ORDER);
-}
-
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	set_p4d(p4d, __p4d((unsigned long)pud));
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index 25feaa117c40..3d1085a14347 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -123,21 +123,6 @@ static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d, pud_t *pu
 	set_p4d_safe(p4d, __p4d(_PAGE_TABLE | __pa(pud)));
 }
 
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	gfp_t gfp = GFP_KERNEL_ACCOUNT;
-
-	if (mm == &init_mm)
-		gfp &= ~__GFP_ACCOUNT;
-	return (pud_t *)get_zeroed_page(gfp);
-}
-
-static inline void pud_free(struct mm_struct *mm, pud_t *pud)
-{
-	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	free_page((unsigned long)pud);
-}
-
 extern void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud);
 
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 1bc027891a00..d361574aaadf 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -145,6 +145,36 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 #endif /* CONFIG_PGTABLE_LEVELS > 2 */
 
+#if CONFIG_PGTABLE_LEVELS > 3
+
+#ifndef __HAVE_ARCH_PUD_FREE
+/**
+ * pud_alloc_one - allocate a page for PUD-level page table
+ * @mm: the mm_struct of the current context
+ *
+ * Allocates a page using %GFP_PGTABLE_USER for user context and
+ * %GFP_PGTABLE_KERNEL for kernel context.
+ *
+ * Return: pointer to the allocated memory or %NULL on error
+ */
+static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
+{
+	gfp_t gfp = GFP_PGTABLE_USER;
+
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (pud_t *)get_zeroed_page(gfp);
+}
+#endif
+
+static inline void pud_free(struct mm_struct *mm, pud_t *pud)
+{
+	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
+	free_page((unsigned long)pud);
+}
+
+#endif /* CONFIG_PGTABLE_LEVELS > 3 */
+
 #endif /* CONFIG_MMU */
 
 #endif /* __ASM_GENERIC_PGALLOC_H */
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
