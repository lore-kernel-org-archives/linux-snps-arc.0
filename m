Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737FCC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6qBaGRIEwhdDxvdPuV6zLeCnRQUg4tWdX4IVvghRMw=; b=Z5+dfcXOodIY4T
	a8+RqWDvUNWcZnBmRL8nUu2jQ2o5RxvLHZ+CDcCP29m48qzH0TxmgjCKGj2aLvqd1UHnBXHRc4dE1
	pFJyy7mW6Fj6Q6t18GP7+CF1J2vXKWMoghzenQHyioAcS2iPPcPNs3y+dxlSSnUmx+tqQSBlqu1xe
	xLMAAqevOZ+kZxmF8zewLRLGdKI+JlTwqS/2nTqcLECatBgSYi2+VkzrYu+URXAWdhyUd1DDn+YEi
	KaAqrvEiGlpSIiutw9zuldWHwmVh8ZExX9qHw4+grUDDc2WYw5nU23Gx3bY4yt5Qug3V0Fj8CblHW
	t+DATxJg19GV2Btorh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHT-00GpVb-1C;
	Sat, 09 Dec 2023 00:33:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHQ-00GpTN-0N
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 220EBB82EF5;
	Sat,  9 Dec 2023 00:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA64C433C8;
	Sat,  9 Dec 2023 00:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702081993;
	bh=sn3/s5eqzySUKGS1ddAm2kM4t1Kwq/Rix4LJd9nOeYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JxWtAQe7FBidXtxqBSd7dVvZ6JlBRgBlavAN2Lbdeb1DB+gc4aV0J36CwTbtei0CT
	 yOSuCFAs6MxGfOEVW15HQToJRHG6wC6BvKzrAcERYh6rB2b1yD6rjiyTJJlYLxC3KM
	 lz95/H8hEA3o8fuunV+YjOMpJgwlqUB3OzMHe/RbZuJyH7+PevqfpuzWbyPRwGSHTT
	 vKT2xsmsaooVzkfoGvziceJqhTdnMsFrhiLdbwLEat4RqTWjQUHEkMNM3BlexEH9Vd
	 RgUlEeCiopcxQcB+PxtiNH6q7mDaS0x1JJfktFE5NDhgbV3prxyGaF1r5+gjJjn3j0
	 GMjlhuDuLjTWQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pavel.Kozlov@synopsys.com,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 1/5] ARC: entry: SAVE_ABI_CALLEE_REG: ISA/ABI specific helper
Date: Fri,  8 Dec 2023 16:33:03 -0800
Message-Id: <20231209003307.480051-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209003307.480051-1-vgupta@kernel.org>
References: <20231209003307.480051-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163316_436246_0F8846A8 
X-CRM114-Status: GOOD (  10.92  )
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

And for ARcompact variant replace the PUSH/POP macros with gas provided
push/pop pseudo-instructions

This allows ISA specific implementation

e.g. Current ARCv2 PUSH/POP could be replaced with STD/LDL to save 2
registers at a time (w/o bothering with SP update each time) or
perhaps use ENTER_S/LEAVE_S to reduce code size

For ARCv3 ABI changed so callee regs are now r14-r26 (vs. r13-r25)
thus would need a different implementation.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-arcv2.h   | 32 ++++++++++++++++++++
 arch/arc/include/asm/entry-compact.h | 32 ++++++++++++++++++++
 arch/arc/include/asm/entry.h         | 44 +++-------------------------
 arch/arc/include/asm/ptrace.h        | 14 +++++----
 4 files changed, 76 insertions(+), 46 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 4d13320e0c1b..3802a2daaf86 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -291,4 +291,36 @@
 				/* M = 8-1  N = 8 */
 .endm
 
+.macro SAVE_ABI_CALLEE_REGS
+	push	r13
+	push	r14
+	push	r15
+	push	r16
+	push	r17
+	push	r18
+	push	r19
+	push	r20
+	push	r21
+	push	r22
+	push	r23
+	push	r24
+	push	r25
+.endm
+
+.macro RESTORE_ABI_CALLEE_REGS
+	pop	r25
+	pop	r24
+	pop	r23
+	pop	r22
+	pop	r21
+	pop	r20
+	pop	r19
+	pop	r18
+	pop	r17
+	pop	r16
+	pop	r15
+	pop	r14
+	pop	r13
+.endm
+
 #endif
diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index a0e760eb35a8..9841f1186417 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -33,6 +33,38 @@
 #include <asm/irqflags-compact.h>
 #include <asm/thread_info.h>	/* For THREAD_SIZE */
 
+.macro SAVE_ABI_CALLEE_REGS
+	push	r13
+	push	r14
+	push	r15
+	push	r16
+	push	r17
+	push	r18
+	push	r19
+	push	r20
+	push	r21
+	push	r22
+	push	r23
+	push	r24
+	push	r25
+.endm
+
+.macro RESTORE_ABI_CALLEE_REGS
+	pop	r25
+	pop	r24
+	pop	r23
+	pop	r22
+	pop	r21
+	pop	r20
+	pop	r19
+	pop	r18
+	pop	r17
+	pop	r16
+	pop	r15
+	pop	r14
+	pop	r13
+.endm
+
 /*--------------------------------------------------------------
  * Switch to Kernel Mode stack if SP points to User Mode stack
  *
diff --git a/arch/arc/include/asm/entry.h b/arch/arc/include/asm/entry.h
index 49c2e090cb5c..8e4e40d2d54a 100644
--- a/arch/arc/include/asm/entry.h
+++ b/arch/arc/include/asm/entry.h
@@ -87,48 +87,12 @@
 
 .endm
 
-/*--------------------------------------------------------------
- * Helpers to save/restore callee-saved regs:
- * used by several macros below
- *-------------------------------------------------------------*/
-.macro SAVE_R13_TO_R25
-	PUSH	r13
-	PUSH	r14
-	PUSH	r15
-	PUSH	r16
-	PUSH	r17
-	PUSH	r18
-	PUSH	r19
-	PUSH	r20
-	PUSH	r21
-	PUSH	r22
-	PUSH	r23
-	PUSH	r24
-	PUSH	r25
-.endm
-
-.macro RESTORE_R25_TO_R13
-	POP	r25
-	POP	r24
-	POP	r23
-	POP	r22
-	POP	r21
-	POP	r20
-	POP	r19
-	POP	r18
-	POP	r17
-	POP	r16
-	POP	r15
-	POP	r14
-	POP	r13
-.endm
-
 /*
  * save user mode callee regs as struct callee_regs
  *  - needed by fork/do_signal/unaligned-access-emulation.
  */
 .macro SAVE_CALLEE_SAVED_USER
-	SAVE_R13_TO_R25
+	SAVE_ABI_CALLEE_REGS
 .endm
 
 /*
@@ -136,18 +100,18 @@
  *  - could have been changed by ptrace tracer or unaligned-access fixup
  */
 .macro RESTORE_CALLEE_SAVED_USER
-	RESTORE_R25_TO_R13
+	RESTORE_ABI_CALLEE_REGS
 .endm
 
 /*
  * save/restore kernel mode callee regs at the time of context switch
  */
 .macro SAVE_CALLEE_SAVED_KERNEL
-	SAVE_R13_TO_R25
+	SAVE_ABI_CALLEE_REGS
 .endm
 
 .macro RESTORE_CALLEE_SAVED_KERNEL
-	RESTORE_R25_TO_R13
+	RESTORE_ABI_CALLEE_REGS
 .endm
 
 /*--------------------------------------------------------------
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index 4a2b30fb5a98..00b9318e551e 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -54,6 +54,10 @@ struct pt_regs {
 	ecr_reg ecr;
 };
 
+struct callee_regs {
+	unsigned long r25, r24, r23, r22, r21, r20, r19, r18, r17, r16, r15, r14, r13;
+};
+
 #define MAX_REG_OFFSET offsetof(struct pt_regs, ecr)
 
 #else
@@ -92,16 +96,14 @@ struct pt_regs {
 	unsigned long status32;
 };
 
-#define MAX_REG_OFFSET offsetof(struct pt_regs, status32)
-
-#endif
-
-/* Callee saved registers - need to be saved only when you are scheduled out */
-
 struct callee_regs {
 	unsigned long r25, r24, r23, r22, r21, r20, r19, r18, r17, r16, r15, r14, r13;
 };
 
+#define MAX_REG_OFFSET offsetof(struct pt_regs, status32)
+
+#endif
+
 #define instruction_pointer(regs)	((regs)->ret)
 #define profile_pc(regs)		instruction_pointer(regs)
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
