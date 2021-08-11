Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6554C43214
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C52760F11
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C52760F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwuTeULN9GmNsvHIFlo9mxtOJ5rNCwCBrp3N+WV9PO8=; b=ig5I/U3v4Npm29
	c9DH+wZSRG1TOOM98TkpO9muygwA01RFhzbrRSe8KLKfVZ3inG1m2mx2fFpGMopq31cqy6DPL9jHq
	yM1x+gjdb51HfCMX3HbeJzJ7ICWGiLRhxt0kAZ4fPPJdt+pVm1hmPwd/cr5EaGqKRBw18qslRfB8W
	Jv0go5P6y2K3GYaUzW3v4HI0CBePaa1wfmbvDwexMTBO+7rpJIrZ2VpVTR4Bfo1FIEJoX/DI476kw
	94Qh6Nltlhia4T3d5W7fFClcA5X9QlOpiUf50hITHCq2J2MtiK6HNsIiMn04PJdnRuBkqO1IyXGK6
	Jx6gPf3UiixE5RhogwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcLD-0056sF-Ux; Wed, 11 Aug 2021 00:43:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL6-0056jU-Ht
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0079660EFF;
 Wed, 11 Aug 2021 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642604;
 bh=VtfgJOO1qpNWVqGWqU8ugb4GoIQJlSXlTdOyk1vLDs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bCR/GFLnYPmnn66Ttg8iFKgVMi00kwUX/TMFPZKzieY2MZZBOK77ZOjK8pYUDACvn
 YaDPIkxIGZtGMYO0XB8HQsIPku4XbMiFDUs6YhZgkI0Pdb47LOLEqX/562FkmzHs2z
 aokCZiU4s7LV3iejsSLLovnTmZmRweEcMsl9yf2XTySeRAmKOqhCxmAFtPLponYUwU
 NtR5T21tbhmCI2u90Q6X0KgwDacUEVxNjEkY3ITzJiFNyUnkBUEkgOZtWhUF3qR4oE
 hZd/f5OIv5cqskq3H1vprHmeT5LYjE21L5y+qFwBQLt1C/Fcx6RZfURy4gx5ujqBCs
 AjqdN0/dmStKQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 18/18] ARC: mm: introduce _PAGE_TABLE to explicitly link pgd,
 pud, pmd entries
Date: Tue, 10 Aug 2021 17:42:58 -0700
Message-Id: <20210811004258.138075-19-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174324_674633_52953F09 
X-CRM114-Status: GOOD (  12.36  )
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

ARCv3 hardware walker expects Table Descriptors to have b'11 in LSB bits
to continue moving to next level.

This commits adds that (to ARCv2 code) and ensures that it works in
software walked regime.

The pte entries stil need tagging, but that is not possible in ARCv2
since the LSB 2 bits are currently used.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/pgalloc.h            | 6 +++---
 arch/arc/include/asm/pgtable-bits-arcv2.h | 2 ++
 arch/arc/include/asm/pgtable-levels.h     | 6 +++---
 arch/arc/mm/tlbex.S                       | 4 +++-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index e99c724d9235..230d43a998af 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -47,7 +47,7 @@ pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
 	 *
 	 * The cast itself is needed given simplistic definition of set_pmd()
 	 */
-	set_pmd(pmdp, __pmd((unsigned long)ptep));
+	set_pmd(pmdp, __pmd((unsigned long)ptep | _PAGE_TABLE));
 }
 
 /*
@@ -90,7 +90,7 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
 {
-	set_p4d(p4dp, __p4d((unsigned long)pudp));
+	set_p4d(p4dp, __p4d((unsigned long)pudp | _PAGE_TABLE));
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
@@ -112,7 +112,7 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pudp)
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
 {
-	set_pud(pudp, __pud((unsigned long)pmdp));
+	set_pud(pudp, __pud((unsigned long)pmdp | _PAGE_TABLE));
 }
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long addr)
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 183d23bc1e00..54aba0d3ae34 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -32,6 +32,8 @@
 #define _PAGE_HW_SZ		0
 #endif
 
+#define _PAGE_TABLE		0x3
+
 /* Defaults for every user page */
 #define ___DEF		(_PAGE_PRESENT | _PAGE_CACHEABLE)
 
diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index 2da3c4e52a91..6c7a8360d986 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -98,7 +98,7 @@
 
 /* In 4 level paging, p4d_* macros work on pgd */
 #define p4d_none(x)		(!p4d_val(x))
-#define p4d_bad(x)		((p4d_val(x) & ~PAGE_MASK))
+#define p4d_bad(x)		(!(p4d_val(x) & _PAGE_TABLE))
 #define p4d_present(x)		(p4d_val(x))
 #define p4d_clear(xp)		do { p4d_val(*(xp)) = 0; } while (0)
 #define p4d_pgtable(p4d)	((pud_t *)(p4d_val(p4d) & PAGE_MASK))
@@ -120,7 +120,7 @@
  * In 4 level paging, pud_* macros work on pud
  */
 #define pud_none(x)		(!pud_val(x))
-#define pud_bad(x)		((pud_val(x) & ~PAGE_MASK))
+#define pud_bad(x)		(!(pud_val(x) & _PAGE_TABLE))
 #define pud_present(x)		(pud_val(x))
 #define pud_clear(xp)		do { pud_val(*(xp)) = 0; } while (0)
 #define pud_pgtable(pud)	((pmd_t *)(pud_val(pud) & PAGE_MASK))
@@ -147,7 +147,7 @@
  * In 3+ level paging (pgd -> pmd -> pte), pmd_* macros work on pmd
  */
 #define pmd_none(x)		(!pmd_val(x))
-#define pmd_bad(x)		((pmd_val(x) & ~PAGE_MASK))
+#define pmd_bad(pmd)		(!(pmd_val(pmd) & _PAGE_TABLE))
 #define pmd_present(x)		(pmd_val(x))
 #define pmd_clear(xp)		do { pmd_val(*(xp)) = 0; } while (0)
 #define pmd_page_vaddr(pmd)	(pmd_val(pmd) & PAGE_MASK)
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index e1831b6fafa9..24a9670186b3 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -171,11 +171,12 @@ ex_saved_reg1:
 	lsr     r0, r2, PGDIR_SHIFT     ; Bits for indexing into PGD
 	ld.as   r3, [r1, r0]            ; PGD entry corresp to faulting addr
 	tst	r3, r3
-	bz	do_slow_path_pf         ; if no Page Table, do page fault
+	bz	do_slow_path_pf         ; next level table missing, handover to linux vm code
 
 #if CONFIG_PGTABLE_LEVELS > 3
 	lsr     r0, r2, PUD_SHIFT	; Bits for indexing into PUD
 	and	r0, r0, (PTRS_PER_PUD - 1)
+	bmskn	r3, r3, 1		; clear _PAGE_TABLE bits
 	ld.as	r1, [r3, r0]		; PMD entry
 	tst	r1, r1
 	bz	do_slow_path_pf
@@ -185,6 +186,7 @@ ex_saved_reg1:
 #if CONFIG_PGTABLE_LEVELS > 2
 	lsr     r0, r2, PMD_SHIFT	; Bits for indexing into PMD
 	and	r0, r0, (PTRS_PER_PMD - 1)
+	bmskn	r3, r3, 1		; clear _PAGE_TABLE bits
 	ld.as	r1, [r3, r0]		; PMD entry
 	tst	r1, r1
 	bz	do_slow_path_pf
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
