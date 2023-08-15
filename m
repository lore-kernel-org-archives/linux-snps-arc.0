Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37C9C04E69
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo0Cw+67/aZEf/MmbaE8+/ht9m0XS0w0LtrIZT598+0=; b=enVfSxm8w7dka6
	ESSj22q/MF4OIBi86wQpjqUnPCu7MVKKBsJshpCP3PXGBam4QaWPKFzzb04rUKBOum95dEpHGjPLB
	qHyRYDGqVhOKOQ/o2Wmonl57I5L25EtFpd1I324izCzxALlujYuCPv6o4uFUp84eEsTsJ86k0V2vP
	G8RmIy/YTc1Al6jl3ztbbc2bqj7+ZV1edez/l3dszMMpOvh9iMuPi20dZjLmSc+SgGh8rdoNwzooJ
	njPeoECNbPHKBPu7uQ3Bdal1J4k8/hsE3IEwHNPaJviVna/VVJVz/yfWJy0LUl9EJTfRbET+Tfnza
	kZ4litTIQbwcGQ3nMDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEW-000cdD-2P;
	Tue, 15 Aug 2023 00:48:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViER-000cUT-3C
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF959647C1;
	Tue, 15 Aug 2023 00:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B27DC433C8;
	Tue, 15 Aug 2023 00:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060503;
	bh=p90a7Qg6Ptt+87HfozDxeBWnT7x0j/a/uXJ7Xzg5jo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPICftR2uoctpaTDC/uhVMjqyaTUTkdnhquXsWf5JuTEaW/04J0vvIbR5NQcoD6zM
	 MxLbfQDuAbVZldH771jELVhSIB+7U7P79aImi0S/N67GgRR8E8NWBGW2eru9vS59Rf
	 NwIwskkCEek0z1pXsHQ4g8Y2xRyHfnUIqCtSr9ZXESwHFP78jArvFWOUTthzzwrlzy
	 917qNzQxgVdUnPHY5R3XwutN7x+tg0/y69nqwTabPogZ6vwU9f3EkxUX8h+oBEjCJV
	 8HTKc8FwY+kSu4riLOG2lAcxFUrMPppyFuRBkNFLqH+rKJZpcondMNCodmVQjozvh0
	 KLj49eljVAxoQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 12/20] ARC: __switch_to: move ksp to thread_info from thread_struct
Date: Mon, 14 Aug 2023 17:48:05 -0700
Message-Id: <20230815004813.555115-13-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174824_148219_B33B5451 
X-CRM114-Status: GOOD (  22.17  )
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

task's arch specific bits are carried in 2 places
 - embedded thread_struct in task_struct
 - associated thread_info (hoisted in task's stack page) and
   syntactically: (thread_info *)(task_struct->stack)

ksp (dynamic kernel stack top) currently lives in thread_struct but
given its deep location in task struct likely to cache miss when
accessed from  __switch_to(). Moving it to thread_info would be more
efficient given proximity to frequently accessed items such as
preempt_count thus very likely to be in cache, specially in schedular
code.

Note however that currently tsk.thread.ksp takes 1 memory access (off
of tsk pointer) while new code tsk->stack.ksp would take 2, but likely
to be in cache. Moreover if task is current the 2nd reference can be
elided and instead derived from SP as (SP & ~(THREAD_SIZE - 1))

All of this also makes __switch_to() code simpler and we can see the 2
ways of retirving ksp (descrobed above) in new code.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/processor.h   |  3 +--
 arch/arc/include/asm/thread_info.h | 10 +++++-----
 arch/arc/kernel/asm-offsets.c      |  2 +-
 arch/arc/kernel/ctx_sw_asm.S       | 22 ++++++++++------------
 arch/arc/kernel/process.c          |  6 +++---
 5 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 82ddc929d6e7..d606658e2fe7 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -22,7 +22,6 @@
  * struct thread_info
  */
 struct thread_struct {
-	unsigned long ksp;	/* kernel mode stack pointer */
 	unsigned long callee_reg;	/* pointer to callee regs */
 	unsigned long fault_address;	/* dbls as brkpt holder as well */
 #ifdef CONFIG_ARC_DSP_SAVE_RESTORE_REGS
@@ -54,7 +53,7 @@ struct task_struct;
  * Where about of Task's sp, fp, blink when it was last seen in kernel mode.
  * Look in process.c for details of kernel stack layout
  */
-#define TSK_K_ESP(tsk)		(tsk->thread.ksp)
+#define TSK_K_ESP(tsk)		(task_thread_info(tsk)->ksp)
 
 #define TSK_K_REG(tsk, off)	(*((unsigned long *)(TSK_K_ESP(tsk) + \
 					sizeof(struct callee_regs) + off)))
diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 6ba7fe417095..4c530cf131f3 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -37,16 +37,16 @@
  */
 struct thread_info {
 	unsigned long flags;		/* low level flags */
+	unsigned long ksp;		/* kernel mode stack top in __switch_to */
 	int preempt_count;		/* 0 => preemptable, <0 => BUG */
-	struct task_struct *task;	/* main task structure */
-	__u32 cpu;			/* current CPU */
+	int cpu;			/* current CPU */
 	unsigned long thr_ptr;		/* TLS ptr */
+	struct task_struct *task;	/* main task structure */
 };
 
 /*
- * macros/functions for gaining access to the thread information structure
- *
- * preempt_count needs to be 1 initially, until the scheduler is functional.
+ * initilaize thread_info for any @tsk
+ *  - this is not related to init_task per se
  */
 #define INIT_THREAD_INFO(tsk)			\
 {						\
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index 37324fd9a72f..5b47d09b925e 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -20,13 +20,13 @@ int main(void)
 
 	BLANK();
 
-	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
 	DEFINE(THREAD_CALLEE_REG, offsetof(struct thread_struct, callee_reg));
 	DEFINE(THREAD_FAULT_ADDR,
 	       offsetof(struct thread_struct, fault_address));
 
 	BLANK();
 
+	DEFINE(THREAD_INFO_KSP, offsetof(struct thread_info, ksp));
 	DEFINE(THREAD_INFO_FLAGS, offsetof(struct thread_info, flags));
 	DEFINE(THREAD_INFO_PREEMPT_COUNT,
 	       offsetof(struct thread_info, preempt_count));
diff --git a/arch/arc/kernel/ctx_sw_asm.S b/arch/arc/kernel/ctx_sw_asm.S
index 59d779004e64..48e1f21976ed 100644
--- a/arch/arc/kernel/ctx_sw_asm.S
+++ b/arch/arc/kernel/ctx_sw_asm.S
@@ -11,8 +11,6 @@
 #include <asm/entry.h>       /* For the SAVE_* macros */
 #include <asm/asm-offsets.h>
 
-#define KSP_WORD_OFF 	((TASK_THREAD + THREAD_KSP) / 4)
-
 ; IN
 ;  - r0: prev task (also current)
 ;  - r1: next task
@@ -37,19 +35,19 @@ ENTRY_CFI(__switch_to)
 	/* kernel mode callee regs of @prev */
 	SAVE_CALLEE_SAVED_KERNEL
 
-	/* save final SP to @prev->thread.ksp */
-#if KSP_WORD_OFF  <= 255
-	st.as  sp, [r0, KSP_WORD_OFF]
-#else
-	/* Workaround for NR_CPUS=4k as ST.as can only take s9 offset */
-	add2	r10, r0, KSP_WORD_OFF
-	st	sp, [r10]
-#endif
+	/*
+	 * save final SP to @prev->thread_info.ksp
+	 * @prev is "current" so thread_info derived from SP
+	 */
+	GET_CURR_THR_INFO_FROM_SP  r10
+	st	sp,  [r10, THREAD_INFO_KSP]
+
 	/* update @next in _current_task[] and GP register caching it */
 	SET_CURR_TASK_ON_CPU  r1, r10
 
-	/* load SP from @next->thread.ksp */
-	ld.as	sp, [r1, KSP_WORD_OFF]
+	/* load SP from @next->thread_info.ksp */
+	ld	r10, [r1, TASK_THREAD_INFO]
+	ld	sp,  [r10, THREAD_INFO_KSP]
 
 	/* restore callee regs, stack frame regs of @next */
 	RESTORE_CALLEE_SAVED_KERNEL
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 96f591508142..186ceab661eb 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -141,7 +141,7 @@ asmlinkage void ret_from_fork(void);
  * |    unused      |
  * |                |
  * ------------------
- * |     r25        |   <==== top of Stack (thread.ksp)
+ * |     r25        |   <==== top of Stack (thread_info.ksp)
  * ~                ~
  * |    --to--      |   (CALLEE Regs of kernel mode)
  * |     r13        |
@@ -181,14 +181,14 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	c_callee = ((struct callee_regs *)childksp) - 1;
 
 	/*
-	 * __switch_to() uses thread.ksp to start unwinding stack
+	 * __switch_to() uses thread_info.ksp to start unwinding stack
 	 * For kernel threads we don't need to create callee regs, the
 	 * stack layout nevertheless needs to remain the same.
 	 * Also, since __switch_to anyways unwinds callee regs, we use
 	 * this to populate kernel thread entry-pt/args into callee regs,
 	 * so that ret_from_kernel_thread() becomes simpler.
 	 */
-	p->thread.ksp = (unsigned long)c_callee;	/* THREAD_KSP */
+	task_thread_info(p)->ksp = (unsigned long)c_callee;	/* THREAD_INFO_KSP */
 
 	/* __switch_to expects FP(0), BLINK(return addr) at top */
 	childksp[0] = 0;			/* fp */
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
