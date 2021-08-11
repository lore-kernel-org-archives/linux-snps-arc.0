Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3F3C19F35
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D4D96056C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D4D96056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXJf8XOuSuzASsvUaEf04L0aCtbcpQBlb+E+SBSTVw0=; b=wf5Rg7YctgyvC1
	ZEInA2/R+JTQ+ZaXg1EO2ElnHdHr7umWpRUwUmyPlTgyUNcPkoEcSuvIWH5fYpqy54EGzM2qzJ7s9
	j0+/bv0t9ccpVLuYhfqRoiK9wFG/eTqw/IsRs5OIC8SApzx+RIxwYFOEIXKRGPJTsqdTrGs4Ya1oq
	t3ltWk2Y+43DKEGBhEyadqslTSphWADyWQR1ubA0oEdafN++G+9wjCPRHlFFLOayr5SgOyMvT8BJ4
	IAqRsNRh+a1smkNQ1Qx7eK32Ttyz3WqRZ7j2NeIi+bqk/K6pDpAosgYqjnF2SInd/tugwITecRsen
	B41nOwfK/t9vvEMyx/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL3-0056fp-QL; Wed, 11 Aug 2021 00:43:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcKz-0056bo-Du
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8A1860EB9;
 Wed, 11 Aug 2021 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642597;
 bh=Sa6jMMUF++eFjzZYBgaSDDh1YfwHQ1O6NoBVOUIDx/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uMxUxQgx1jgTzlvGIW04vLHOiuyIkTT6O6VD7SWGFbbuke4VTOsJg4wyRQdAAhFoG
 xQjGGzOOEizjooOwacnj5Zvnlkr7ozFvpGV8uZYF1/Eux50OJmSn1Ot6AVgxp2lo9f
 FJJ7wgHeJHPLCHjnCh3NyI67yJRDkiCtgCaQlkkkH/U0YX70ZZACMUwgdZOdNT6RSy
 5Ash1i70JjBkvTZdaV4T87bSdkfUXmmlLd7Ku81CA1hQhTdvvhEGAMxT7Mp9C6jjLa
 uKAZIxRmhIk7p7Ly02C59FJcSLE62HS7a/tP56gKlOy1DLKbJzed0AmRM/ItoYES0+
 4eMVYfU2uv3Bg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Vineet Gupta <vgupta@kernel.com>
Subject: [PATCH 02/18] ARC: mm: remove tlb paranoid code
Date: Tue, 10 Aug 2021 17:42:42 -0700
Message-Id: <20210811004258.138075-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174317_544499_2FD81CA9 
X-CRM114-Status: GOOD (  15.39  )
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

This was used way back when in arc700 debugging when ASID allocator was
still bit flaky. Not needed in last 5 years

Signed-off-by: Vineet Gupta <vgupta@kernel.com>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig           |  3 ---
 arch/arc/include/asm/mmu.h |  6 -----
 arch/arc/mm/tlb.c          | 40 ------------------------------
 arch/arc/mm/tlbex.S        | 50 --------------------------------------
 4 files changed, 99 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 0680b1de0fc3..59d5b2a179f6 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -537,9 +537,6 @@ config ARC_DW2_UNWIND
 	  If you don't debug the kernel, you can say N, but we may not be able
 	  to solve problems without frame unwind information
 
-config ARC_DBG_TLB_PARANOIA
-	bool "Paranoia Checks in Low Level TLB Handlers"
-
 config ARC_DBG_JUMP_LABEL
 	bool "Paranoid checks in Static Keys (jump labels) code"
 	depends on JUMP_LABEL
diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 4065335a7922..38a036508699 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -64,12 +64,6 @@ typedef struct {
 	unsigned long asid[NR_CPUS];	/* 8 bit MMU PID + Generation cycle */
 } mm_context_t;
 
-#ifdef CONFIG_ARC_DBG_TLB_PARANOIA
-void tlb_paranoid_check(unsigned int mm_asid, unsigned long address);
-#else
-#define tlb_paranoid_check(a, b)
-#endif
-
 void arc_mmu_init(void);
 extern char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len);
 void read_decode_mmu_bcr(void);
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 349fb7a75d1d..6079dfd129b9 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -400,7 +400,6 @@ void create_tlb(struct vm_area_struct *vma, unsigned long vaddr, pte_t *ptep)
 	 *
 	 * Removing the assumption involves
 	 * -Using vma->mm->context{ASID,SASID}, as opposed to MMU reg.
-	 * -Fix the TLB paranoid debug code to not trigger false negatives.
 	 * -More importantly it makes this handler inconsistent with fast-path
 	 *  TLB Refill handler which always deals with "current"
 	 *
@@ -423,8 +422,6 @@ void create_tlb(struct vm_area_struct *vma, unsigned long vaddr, pte_t *ptep)
 
 	local_irq_save(flags);
 
-	tlb_paranoid_check(asid_mm(vma->vm_mm, smp_processor_id()), vaddr);
-
 	vaddr &= PAGE_MASK;
 
 	/* update this PTE credentials */
@@ -818,40 +815,3 @@ void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
 
 	local_irq_restore(flags);
 }
-
-/***********************************************************************
- * Diagnostic Routines
- *  -Called from Low Level TLB Handlers if things don;t look good
- **********************************************************************/
-
-#ifdef CONFIG_ARC_DBG_TLB_PARANOIA
-
-/*
- * Low Level ASM TLB handler calls this if it finds that HW and SW ASIDS
- * don't match
- */
-void print_asid_mismatch(int mm_asid, int mmu_asid, int is_fast_path)
-{
-	pr_emerg("ASID Mismatch in %s Path Handler: sw-pid=0x%x hw-pid=0x%x\n",
-	       is_fast_path ? "Fast" : "Slow", mm_asid, mmu_asid);
-
-	__asm__ __volatile__("flag 1");
-}
-
-void tlb_paranoid_check(unsigned int mm_asid, unsigned long addr)
-{
-	unsigned int mmu_asid;
-
-	mmu_asid = read_aux_reg(ARC_REG_PID) & 0xff;
-
-	/*
-	 * At the time of a TLB miss/installation
-	 *   - HW version needs to match SW version
-	 *   - SW needs to have a valid ASID
-	 */
-	if (addr < 0x70000000 &&
-	    ((mm_asid == MM_CTXT_NO_ASID) ||
-	      (mmu_asid != (mm_asid & MM_CTXT_ASID_MASK))))
-		print_asid_mismatch(mm_asid, mmu_asid, 0);
-}
-#endif
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index bcd2909c691f..0b4bb62fa0ab 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -93,11 +93,6 @@ ex_saved_reg1:
 	st_s  r1, [r0, 4]
 	st_s  r2, [r0, 8]
 	st_s  r3, [r0, 12]
-
-	; VERIFY if the ASID in MMU-PID Reg is same as
-	; one in Linux data structures
-
-	tlb_paranoid_check_asm
 .endm
 
 .macro TLBMISS_RESTORE_REGS
@@ -146,51 +141,6 @@ ex_saved_reg1:
 
 #endif
 
-;============================================================================
-;  Troubleshooting Stuff
-;============================================================================
-
-; Linux keeps ASID (Address Space ID) in task->active_mm->context.asid
-; When Creating TLB Entries, instead of doing 3 dependent loads from memory,
-; we use the MMU PID Reg to get current ASID.
-; In bizzare scenrios SW and HW ASID can get out-of-sync which is trouble.
-; So we try to detect this in TLB Mis shandler
-
-.macro tlb_paranoid_check_asm
-
-#ifdef CONFIG_ARC_DBG_TLB_PARANOIA
-
-	GET_CURR_TASK_ON_CPU  r3
-	ld r0, [r3, TASK_ACT_MM]
-	ld r0, [r0, MM_CTXT+MM_CTXT_ASID]
-	breq r0, 0, 55f	; Error if no ASID allocated
-
-	lr r1, [ARC_REG_PID]
-	and r1, r1, 0xFF
-
-	and r2, r0, 0xFF	; MMU PID bits only for comparison
-	breq r1, r2, 5f
-
-55:
-	; Error if H/w and S/w ASID don't match, but NOT if in kernel mode
-	lr  r2, [erstatus]
-	bbit0 r2, STATUS_U_BIT, 5f
-
-	; We sure are in troubled waters, Flag the error, but to do so
-	; need to switch to kernel mode stack to call error routine
-	GET_TSK_STACK_BASE   r3, sp
-
-	; Call printk to shoutout aloud
-	mov r2, 1
-	j print_asid_mismatch
-
-5:	; ASIDs match so proceed normally
-	nop
-
-#endif
-
-.endm
-
 ;============================================================================
 ;TLB Miss handling Code
 ;============================================================================
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
