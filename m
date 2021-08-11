Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E461C4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DB6610A2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15DB6610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRAGn+GQQbFpQasrSLdNzqE58DTOm22TH+ZDGVFyQuk=; b=EIlhoOrauaCjCz
	WJvVTQaz59Q4FpLYq5hGnhinvKpwvz2i9BeiNJEfmY0fIa81wRdvc5IeRYkoj80OlUhUoqUoT9om3
	26MAEFCRDg87ORTgTGOFyPQxgcYIzPxcoh48CTJKbpINhhWpMJI7cnBft7IelzbtT2WzdBCkZ2DGS
	WvgHL4pbTjp8Ke4BLL8+bO9/kQYDJl4i0uvfHbtkLPn6Ad9lD7aLWulsjZn6RG65aDU6CbJxsH4rO
	ftjYSf18aLGLifvqQmDWo55/n/Q0ieJGhjzirNRKgUIny31cRXdtCAICtu7TO4f6T71ONHJBlPLiI
	u0KryVk2EIkp+oPRHm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL2-0056dv-4s; Wed, 11 Aug 2021 00:43:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcKz-0056bU-5f
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79F7D60EB7;
 Wed, 11 Aug 2021 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642596;
 bh=uXKpbJ3Z+SCcgPMWkmhiiIS5hjgeCpPYAif1Yg1470w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOckdQAWP8L66RAfndqODARBsukOFxCZBMKgNgH91dKQaKdxiM3TLCU+uZl6uXL1x
 yQjfObCGS7o5G47ZbSvb0ihA7HNydt9nUxmRT9y/RoS4Q0U5XFpSO9R1FG2y7qhyrZ
 XhO7t2hthYh1+APgpkz+WPBM2GuyWlVe7Kv6SH29eZ281EP1RanLcfEmMP61hxTypL
 vribWhUobrP0VJMHuwWdT90s2mA+nOSE9Mw41050ahdwVx8kIYuMammiEd1ftiAblA
 BZexw66vM+Fvd36A1I4tFgUubRGJm64YH3nFJS+RghPw8wHs0WxqA8ip6Na9NTK9Yw
 bApR84zlo8YgA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 01/18] ARC: mm: simplify mmu scratch register assingment to
 mmu needs
Date: Tue, 10 Aug 2021 17:42:41 -0700
Message-Id: <20210811004258.138075-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174317_288487_42A85C04 
X-CRM114-Status: GOOD (  12.65  )
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

ARC700 SMP uses MMU scratch reg for re-entrant interrupt handling (as
opposed to the canonical usage for task pgd pointer caching for ARCv2
and ARC700 UP builds). However this requires fabricating a #define in a
header which has usual issues of dependency nesting and ugliness.

So clean this up and just use it as intended for ARCv2 only.
For ARC700 just don't use it for mmu needs (even for UP which it
potentially can (degrades it slightly) but that config it not a
big deal in this day and age.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-compact.h | 8 --------
 arch/arc/include/asm/mmu.h           | 4 ----
 arch/arc/include/asm/mmu_context.h   | 2 +-
 arch/arc/mm/tlb.c                    | 4 ++--
 arch/arc/mm/tlbex.S                  | 2 +-
 5 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 6dbf5cecc8cc..5aab4f93ab8a 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -126,19 +126,11 @@
  * to be saved again on kernel mode stack, as part of pt_regs.
  *-------------------------------------------------------------*/
 .macro PROLOG_FREEUP_REG	reg, mem
-#ifndef ARC_USE_SCRATCH_REG
-	sr  \reg, [ARC_REG_SCRATCH_DATA0]
-#else
 	st  \reg, [\mem]
-#endif
 .endm
 
 .macro PROLOG_RESTORE_REG	reg, mem
-#ifndef ARC_USE_SCRATCH_REG
-	lr  \reg, [ARC_REG_SCRATCH_DATA0]
-#else
 	ld  \reg, [\mem]
-#endif
 .endm
 
 /*--------------------------------------------------------------
diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index a81d1975866a..4065335a7922 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -31,10 +31,6 @@
 #define ARC_REG_SCRATCH_DATA0	0x46c
 #endif
 
-#if defined(CONFIG_ISA_ARCV2) || !defined(CONFIG_SMP)
-#define	ARC_USE_SCRATCH_REG
-#endif
-
 /* Bits in MMU PID register */
 #define __TLB_ENABLE		(1 << 31)
 #define __PROG_ENABLE		(1 << 30)
diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
index df164066e172..49318a126879 100644
--- a/arch/arc/include/asm/mmu_context.h
+++ b/arch/arc/include/asm/mmu_context.h
@@ -146,7 +146,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 */
 	cpumask_set_cpu(cpu, mm_cpumask(next));
 
-#ifdef ARC_USE_SCRATCH_REG
+#ifdef CONFIG_ISA_ARCV2
 	/* PGD cached in MMU reg to avoid 3 mem lookups: task->mm->pgd */
 	write_aux_reg(ARC_REG_SCRATCH_DATA0, next->pgd);
 #endif
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 8696829d37c0..349fb7a75d1d 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -719,8 +719,8 @@ void arc_mmu_init(void)
 	/* Enable the MMU */
 	write_aux_reg(ARC_REG_PID, MMU_ENABLE);
 
-	/* In smp we use this reg for interrupt 1 scratch */
-#ifdef ARC_USE_SCRATCH_REG
+	/* In arc700/smp needed for re-entrant interrupt handling */
+#ifdef CONFIG_ISA_ARCV2
 	/* swapper_pg_dir is the pgd for the kernel, used by vmalloc */
 	write_aux_reg(ARC_REG_SCRATCH_DATA0, swapper_pg_dir);
 #endif
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 96c3a5de9dd4..bcd2909c691f 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -202,7 +202,7 @@ ex_saved_reg1:
 
 	lr  r2, [efa]
 
-#ifdef ARC_USE_SCRATCH_REG
+#ifdef CONFIG_ISA_ARCV2
 	lr  r1, [ARC_REG_SCRATCH_DATA0] ; current pgd
 #else
 	GET_CURR_TASK_ON_CPU  r1
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
