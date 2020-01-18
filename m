Return-Path: <SRS0=ZCzF=3H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35950C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 01:05:14 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0555F24689
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 01:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1Tg94L+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SliZjIAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0555F24689
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p83VM/xfPpCxPKXMND35Ggxrzfhw7ZvlKw1+gGFDhZM=; b=f1Tg94L+cjjfiO
	cOUl0vDk59RGdbiQ+XDJYmuHw9JV2j1cxzu1Bb7Csq/3A1Jj4vfbdwrRSvPk50LNUHIgVZwjlhsfK
	CPR+3U71hFC0PW+WcCeKHn17ZdZg/DwO5Xq62oDO/SYV11B8Rd3q5kuJLz8Kht2UzX4RguRRcbVtZ
	rvBA1vHOJ7FLo5ZyITy/IKIKEgCBPgW5y8Y+HlXLtITu2q1Kvwrmg4VJ9WzZkUs3CKm0EoY7X/gwh
	SbHwqk2Rlvue/c5NqiSXjn8spnY+DdTzp/ytWrMUYWEFxRO+Iu2taJfYYPLboK+xP7bKknIh71Ftd
	cYAxiO//6Da+RgXpxDAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iscIg-0001hA-Ax; Sat, 18 Jan 2020 00:49:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iscId-0001fX-0D
 for linux-snps-arc@lists.infradead.org; Sat, 18 Jan 2020 00:49:16 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 848BBC00CC
 for <linux-snps-arc@lists.infradead.org>; Sat, 18 Jan 2020 00:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579308551; bh=euJCSm/lqDARP+dZzKMbbLq5OaeQs4jyKIY6Orus2XY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SliZjIAgIyhY86W2nIAu6j+Aq0OT7CN2SExb/v8Yer3KEPxEI5oFZf3jG4YrpKeMX
 SLumt9JglRvxXf/lMFF0Y8gWzj1UKp/YLeZOen09pGWOVoGiUO1WIwhnxEgeDC0dGr
 ecLhrjKNggZMvddVcm4HEsyjukwkhhDJAy0sxaYAPJg5lWfyz8W422ExgJA6fVJI82
 reKww7BBbwB4Xpa0USiwlB/nzdlI1I1se4HeYRAm4iFb70+HNvYiAUPwsIMM1AL+6L
 eQNExkioNIzpgz+SkLD7s4x6/ND3h0O7fH4EQQUH+B4AAnnYbuLtPyMW9CVQdeRn57
 BMej/dgTS4bpQ==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.29])
 by mailhost.synopsys.com (Postfix) with ESMTP id E73FFA0080;
 Sat, 18 Jan 2020 00:49:10 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH 2/2] ARCv2: fpu: preserve userspace fpu state
Date: Fri, 17 Jan 2020 16:49:05 -0800
Message-Id: <20200118004905.30201-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200118004905.30201-1-vgupta@synopsys.com>
References: <20200118004905.30201-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_164915_151942_91F92299 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/Kconfig               | 15 +++++----------
 arch/arc/include/asm/arcregs.h |  2 ++
 arch/arc/include/asm/fpu.h     | 28 +++++++++++++++++++++++++++-
 arch/arc/kernel/Makefile       |  2 ++
 arch/arc/kernel/fpu.c          | 27 +++++++++++++++++++++++++++
 arch/arc/kernel/process.c      |  6 +++++-
 6 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 3b074c4d31fb..2e56cd5277b7 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -352,9 +352,8 @@ config NODES_SHIFT
 	  Accessing memory beyond 1GB (with or w/o PAE) requires 2 memory
 	  zones.
 
-if ISA_ARCOMPACT
-
 config ARC_COMPACT_IRQ_LEVELS
+	depends on ISA_ARCOMPACT
 	bool "Setup Timer IRQ as high Priority"
 	# if SMP, LV2 enabled ONLY if ARC implementation has LV2 re-entrancy
 	depends on !SMP
@@ -362,14 +361,10 @@ config ARC_COMPACT_IRQ_LEVELS
 config ARC_FPU_SAVE_RESTORE
 	bool "Enable FPU state persistence across context switch"
 	help
-	  Double Precision Floating Point unit had dedicated regs which
-	  need to be saved/restored across context-switch.
-	  Note that ARC FPU is overly simplistic, unlike say x86, which has
-	  hardware pieces to allow software to conditionally save/restore,
-	  based on actual usage of FPU by a task. Thus our implemn does
-	  this for all tasks in system.
-
-endif #ISA_ARCOMPACT
+	  ARCompact FPU has internal registers to assist with Double precision
+	  Floating Point operations. There are control and stauts registers
+	  for floating point exceptions and rounding modes. These are
+	  preserved across task context switch when enabled.
 
 config ARC_CANT_LLSC
 	def_bool n
diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 5134f0baf33c..f7e432448e4b 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -39,6 +39,8 @@
 #define ARC_REG_CLUSTER_BCR	0xcf
 #define ARC_REG_AUX_ICCM	0x208	/* ICCM Base Addr (ARCv2) */
 #define ARC_REG_LPB_CTRL	0x488	/* ARCv2 Loop Buffer control */
+#define ARC_REG_FPU_CTRL	0x300
+#define ARC_REG_FPU_STATUS	0x301
 
 /* Common for ARCompact and ARCv2 status register */
 #define ARC_REG_STATUS32	0x0A
diff --git a/arch/arc/include/asm/fpu.h b/arch/arc/include/asm/fpu.h
index de467423d99b..64347250fdf5 100644
--- a/arch/arc/include/asm/fpu.h
+++ b/arch/arc/include/asm/fpu.h
@@ -11,6 +11,8 @@
 
 #include <asm/ptrace.h>
 
+#ifdef CONFIG_ISA_ARCOMPACT
+
 /* These DPFP regs need to be saved/restored across ctx-sw */
 struct arc_fpu {
 	struct {
@@ -18,11 +20,35 @@ struct arc_fpu {
 	} aux_dpfp[2];
 };
 
-extern void fpu_save_restore(struct task_struct *p, struct task_struct *n);
+#define fpu_init_task(regs)
 
 #else
 
+/*
+ * ARCv2 FPU Control aux register
+ *   - bits to enable Traps on Exceptions
+ *   - Rounding mode
+ *
+ * ARCv2 FPU Status aux register
+ *   - FPU exceptions flags (Inv, Div-by-Zero, overflow, underflow, inexact)
+ *   - Flag Write Enable to clear flags explicitly (vs. by fpu instructions
+ *     only
+ */
+
+struct arc_fpu {
+	unsigned int ctrl, status;
+};
+
+extern void fpu_init_task(struct pt_regs *regs);
+
+#endif	/* !CONFIG_ISA_ARCOMPACT */
+
+extern void fpu_save_restore(struct task_struct *p, struct task_struct *n);
+
+#else	/* !CONFIG_ARC_FPU_SAVE_RESTORE */
+
 #define fpu_save_restore(p, n)
+#define fpu_init_task(regs)
 
 #endif	/* CONFIG_ARC_FPU_SAVE_RESTORE */
 
diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index e784f5396dda..75539670431a 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -23,7 +23,9 @@ obj-$(CONFIG_PERF_EVENTS)		+= perf_event.o
 obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 
 obj-$(CONFIG_ARC_FPU_SAVE_RESTORE)	+= fpu.o
+ifdef CONFIG_ISA_ARCOMPACT
 CFLAGS_fpu.o   += -mdpfp
+endif
 
 ifdef CONFIG_ARC_DW2_UNWIND
 CFLAGS_ctx_sw.o += -fno-omit-frame-pointer
diff --git a/arch/arc/kernel/fpu.c b/arch/arc/kernel/fpu.c
index 7a3b56ce56bb..c67c0f0f5f77 100644
--- a/arch/arc/kernel/fpu.c
+++ b/arch/arc/kernel/fpu.c
@@ -8,6 +8,8 @@
 #include <linux/sched.h>
 #include <asm/fpu.h>
 
+#ifdef CONFIG_ISA_ARCOMPACT
+
 /*
  * To save/restore FPU regs, simplest scheme would use LR/SR insns.
  * However since SR serializes the pipeline, an alternate "hack" can be used
@@ -50,3 +52,28 @@ void fpu_save_restore(struct task_struct *prev, struct task_struct *next)
 		: "r" (zero), "r" (*(readfrom + 3)), "r" (*(readfrom + 2))
 	);
 }
+
+#else
+
+void fpu_init_task(struct pt_regs *regs)
+{
+	/* default rounding mode */
+	write_aux_reg(ARC_REG_FPU_CTRL, 0x100);
+
+	/* set "Write enable" to allow explicit write to exception flags */
+	write_aux_reg(ARC_REG_FPU_STATUS, 0x80000000);
+}
+
+void fpu_save_restore(struct task_struct *prev, struct task_struct *next)
+{
+	struct arc_fpu *save = &prev->thread.fpu;
+	struct arc_fpu *restore = &next->thread.fpu;
+
+	save->ctrl = read_aux_reg(ARC_REG_FPU_CTRL);
+	save->status = read_aux_reg(ARC_REG_FPU_STATUS);
+
+	write_aux_reg(ARC_REG_FPU_CTRL, restore->ctrl);
+	write_aux_reg(ARC_REG_FPU_STATUS, restore->status);
+}
+
+#endif
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index e1889ce3faf9..804065b887e4 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -20,6 +20,8 @@
 #include <linux/elf.h>
 #include <linux/tick.h>
 
+#include <asm/fpu.h>
+
 SYSCALL_DEFINE1(arc_settls, void *, user_tls_data_ptr)
 {
 	task_thread_info(current)->thr_ptr = (unsigned int)user_tls_data_ptr;
@@ -264,7 +266,7 @@ int copy_thread(unsigned long clone_flags,
 /*
  * Do necessary setup to start up a new user task
  */
-void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long usp)
+void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long usp)
 {
 	regs->sp = usp;
 	regs->ret = pc;
@@ -280,6 +282,8 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long usp)
 	regs->eflags = 0;
 #endif
 
+	fpu_init_task(regs);
+
 	/* bogus seed values for debugging */
 	regs->lp_start = 0x10;
 	regs->lp_end = 0x80;
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
