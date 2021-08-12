Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E1C43214
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16C6610A4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B16C6610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHwtZlfWb8eEajB+WslVfBF1szcrlDDzduxgiiJxMIM=; b=1YeuXXAqvL0M1l
	ENs1Tja5YKt70c6ee6hcvYT/1PgJlS26F6POPvmDhFdc65OveUh2cmwrxxV+u2VhYcKaAzxDGAd8y
	7CghCLeNv6QXKN8ATW4XypgC+wrnLACppS0Vdx5eUJhBusxLZ5stJ8nrJH4XdaIm6xd06D95mX3+X
	Yj6roroJ3zizpAo5Ekw2aBMEpIwe1I+g2m3mHEKdZZz8uHFwRTTpR1YdkOnil7v52OZwZ4qq5NqRw
	xtGphZZTDqZN/prsf1/MnLYFff5NOkgKIWoBPh8bOvZ64+cTLE+u2AJNE4JbVy/Og1ndBGnlSw/0q
	VfJCUMUpAWFEqD4mTwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH7-00BU7S-W1; Thu, 12 Aug 2021 23:38:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGy-00BTvc-1J
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FB61610FD;
 Thu, 12 Aug 2021 23:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811483;
 bh=2Fl+UaQd2LbBkvpg/DazzYYTlhrohlhzA+PnuOctBVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aPK0kff4ECHeCAQ5/7/T8RrOf3uCFlgE4teUXWOt0D32NUoOkPIkN5V9THIfZtjas
 kw1gv/ujim8O654BSs6OKq+uDfgJOQQSGzf1c8ii07AWLy+c9WLQqUcB9SM+sVZuxe
 0Y+XfnZRNZ0B7gbFefwxETwkm8QKVbl2AzPaAt72it1DgB3p27p26vPlUwDwG8SmCv
 VjdtYqTwVtYvTUtF0H+tseJNpFtqJp1QhNN9cSsJ1qB4aDdfqQs2RkggLFobtEatMn
 j83jsD5tMIau/9zOlhfvTOWHkD3DvRFtItE3nQvaZbw6bC9SpDHIDMUQ1xEpc0Vmac
 kNVgGqnboAfkw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 13/19] ARC: mm: disintegrate mmu.h (arcv2 bits out)
Date: Thu, 12 Aug 2021 16:37:47 -0700
Message-Id: <20210812233753.104217-14-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163804_214112_53D93306 
X-CRM114-Status: GOOD (  14.72  )
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

non functional change

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/mmu-arcv2.h | 103 +++++++++++++++++++++++++++++++
 arch/arc/include/asm/mmu.h       |  80 +-----------------------
 arch/arc/include/asm/pgtable.h   |   6 --
 3 files changed, 105 insertions(+), 84 deletions(-)
 create mode 100644 arch/arc/include/asm/mmu-arcv2.h

diff --git a/arch/arc/include/asm/mmu-arcv2.h b/arch/arc/include/asm/mmu-arcv2.h
new file mode 100644
index 000000000000..4c47dd3864d1
--- /dev/null
+++ b/arch/arc/include/asm/mmu-arcv2.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2004, 2007-2010, 2011-2012, 2019-20 Synopsys, Inc. (www.synopsys.com)
+ *
+ * MMUv3 (arc700) / MMUv4 (archs) are software page walked and software managed.
+ * This file contains the TLB access registers and commands
+ */
+
+#ifndef _ASM_ARC_MMU_ARCV2_H
+#define _ASM_ARC_MMU_ARCV2_H
+
+/*
+ * TLB Management regs
+ */
+#define ARC_REG_MMU_BCR		0x06f
+
+#ifdef CONFIG_ARC_MMU_V3
+#define ARC_REG_TLBPD0		0x405
+#define ARC_REG_TLBPD1		0x406
+#define ARC_REG_TLBPD1HI	0	/* Dummy: allows common code */
+#define ARC_REG_TLBINDEX	0x407
+#define ARC_REG_TLBCOMMAND	0x408
+#define ARC_REG_PID		0x409
+#define ARC_REG_SCRATCH_DATA0	0x418
+#else
+#define ARC_REG_TLBPD0		0x460
+#define ARC_REG_TLBPD1		0x461
+#define ARC_REG_TLBPD1HI	0x463
+#define ARC_REG_TLBINDEX	0x464
+#define ARC_REG_TLBCOMMAND	0x465
+#define ARC_REG_PID		0x468
+#define ARC_REG_SCRATCH_DATA0	0x46c
+#endif
+
+/* Bits in MMU PID reg */
+#define __TLB_ENABLE		(1 << 31)
+#define __PROG_ENABLE		(1 << 30)
+#define MMU_ENABLE		(__TLB_ENABLE | __PROG_ENABLE)
+
+/* Bits in TLB Index reg */
+#define TLB_LKUP_ERR		0x80000000
+
+#ifdef CONFIG_ARC_MMU_V3
+#define TLB_DUP_ERR		(TLB_LKUP_ERR | 0x00000001)
+#else
+#define TLB_DUP_ERR		(TLB_LKUP_ERR | 0x40000000)
+#endif
+
+/*
+ * TLB Commands
+ */
+#define TLBWrite    		0x1
+#define TLBRead     		0x2
+#define TLBGetIndex 		0x3
+#define TLBProbe    		0x4
+#define TLBWriteNI		0x5  /* write JTLB without inv uTLBs */
+#define TLBIVUTLB		0x6  /* explicitly inv uTLBs */
+
+#ifdef CONFIG_ARC_MMU_V4
+#define TLBInsertEntry		0x7
+#define TLBDeleteEntry		0x8
+#endif
+
+/* Masks for actual TLB "PD"s */
+#define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
+#define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
+
+#define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK_PHYS | _PAGE_CACHEABLE)
+
+#ifndef __ASSEMBLY__
+
+struct mm_struct;
+extern int pae40_exist_but_not_enab(void);
+
+static inline int is_pae40_enabled(void)
+{
+	return IS_ENABLED(CONFIG_ARC_HAS_PAE40);
+}
+
+static void inline mmu_setup_asid(struct mm_struct *mm, unsigned long asid)
+{
+	write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
+}
+
+static void inline mmu_setup_pgd(struct mm_struct *mm, void *pgd)
+{
+	/* PGD cached in MMU reg to avoid 3 mem lookups: task->mm->pgd */
+#ifdef CONFIG_ISA_ARCV2
+	write_aux_reg(ARC_REG_SCRATCH_DATA0, (unsigned int)pgd);
+#endif
+}
+
+#else
+
+.macro ARC_MMU_REENABLE reg
+	lr \reg, [ARC_REG_PID]
+	or \reg, \reg, MMU_ENABLE
+	sr \reg, [ARC_REG_PID]
+.endm
+
+#endif /* !__ASSEMBLY__ */
+
+#endif
diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 414a27e806b6..ca427c30f70e 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -7,91 +7,15 @@
 #define _ASM_ARC_MMU_H
 
 #ifndef __ASSEMBLY__
-#include <linux/threads.h>	/* NR_CPUS */
-#endif
-
-/* MMU Management regs */
-#define ARC_REG_MMU_BCR		0x06f
-
-#ifdef CONFIG_ARC_MMU_V3
-#define ARC_REG_TLBPD0		0x405
-#define ARC_REG_TLBPD1		0x406
-#define ARC_REG_TLBPD1HI	0	/* Dummy: allows code sharing with ARC700 */
-#define ARC_REG_TLBINDEX	0x407
-#define ARC_REG_TLBCOMMAND	0x408
-#define ARC_REG_PID		0x409
-#define ARC_REG_SCRATCH_DATA0	0x418
-#else
-#define ARC_REG_TLBPD0		0x460
-#define ARC_REG_TLBPD1		0x461
-#define ARC_REG_TLBPD1HI	0x463
-#define ARC_REG_TLBINDEX	0x464
-#define ARC_REG_TLBCOMMAND	0x465
-#define ARC_REG_PID		0x468
-#define ARC_REG_SCRATCH_DATA0	0x46c
-#endif
-
-/* Bits in MMU PID register */
-#define __TLB_ENABLE		(1 << 31)
-#define __PROG_ENABLE		(1 << 30)
-#define MMU_ENABLE		(__TLB_ENABLE | __PROG_ENABLE)
-
-/* Error code if probe fails */
-#define TLB_LKUP_ERR		0x80000000
-
-#ifdef CONFIG_ARC_MMU_V3
-#define TLB_DUP_ERR	(TLB_LKUP_ERR | 0x00000001)
-#else
-#define TLB_DUP_ERR	(TLB_LKUP_ERR | 0x40000000)
-#endif
-
-/* TLB Commands */
-#define TLBWrite    0x1
-#define TLBRead     0x2
-#define TLBGetIndex 0x3
-#define TLBProbe    0x4
-#define TLBWriteNI  0x5		/* write JTLB without inv uTLBs */
-#define TLBIVUTLB   0x6		/* explicitly inv uTLBs */
 
-#ifdef CONFIG_ARC_MMU_V4
-#define TLBInsertEntry	0x7
-#define TLBDeleteEntry	0x8
-#endif
-
-#ifndef __ASSEMBLY__
+#include <linux/threads.h>	/* NR_CPUS */
 
 typedef struct {
 	unsigned long asid[NR_CPUS];	/* 8 bit MMU PID + Generation cycle */
 } mm_context_t;
 
-static void inline mmu_setup_asid(struct mm_struct *mm, unsigned int asid)
-{
-	write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
-}
-
-static void inline mmu_setup_pgd(struct mm_struct *mm, void *pgd)
-{
-	/* PGD cached in MMU reg to avoid 3 mem lookups: task->mm->pgd */
-#ifdef CONFIG_ISA_ARCV2
-	write_aux_reg(ARC_REG_SCRATCH_DATA0, (unsigned int)pgd);
 #endif
-}
-
-static inline int is_pae40_enabled(void)
-{
-	return IS_ENABLED(CONFIG_ARC_HAS_PAE40);
-}
-
-extern int pae40_exist_but_not_enab(void);
-
-#else
-
-.macro ARC_MMU_REENABLE reg
-	lr \reg, [ARC_REG_PID]
-	or \reg, \reg, MMU_ENABLE
-	sr \reg, [ARC_REG_PID]
-.endm
 
-#endif	/* !__ASSEMBLY__ */
+#include <asm/mmu-arcv2.h>
 
 #endif
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index f762bacb2358..de4576e8d17a 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -103,12 +103,6 @@
  */
 #define PAGE_KERNEL          __pgprot(_K_PAGE_PERMS | _PAGE_CACHEABLE)
 
-/* Masks for actual TLB "PD"s */
-#define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
-#define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
-
-#define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK_PHYS | _PAGE_CACHEABLE)
-
 /**************************************************************************
  * Mapping of vm_flags (Generic VM) to PTE flags (arch specific)
  *
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
