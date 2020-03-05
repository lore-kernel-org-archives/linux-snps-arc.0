Return-Path: <SRS0=flIm=4W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23EFC3F2D2
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Mar 2020 20:03:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A10F2072D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Mar 2020 20:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5QIhb9a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GMRfmb3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A10F2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7qBzLuAAuprYmjExr4uAbM4fpFqFxCZ9Z1wsf8NmOs=; b=e5QIhb9a1V4oqK
	F+CRnW67TimgT3XUSt4TUkArBJ6wP9qpj9ecgzKLFeBJvqGynFYlVcydV+D8uIdx+GtFEe3Xw/MUz
	kUuHlKPEW2Q21xWe7es95NGg5M4fjpgHAfmjnUnb7yRd5zH8WV9oSdLg4RUoU77hKYdwwSSBlnzLw
	awL0UU80+WiSgfA2duzIJ7tmYD98IEoxqMKGItuxRX+q2DsXSVQSSo8NFaAd9+zE4K2sGFJDra+Nz
	/e2oBCB1HeYKOkOYsZWY2Rx0PixnLUWLn/igCKOix7CfMgssCPoJlQElz47KGdq5aEhjaNr10bvrn
	9zIKG+WkrkMjWP28FItA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9wi3-0006iX-0H; Thu, 05 Mar 2020 20:03:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9wi0-0006gn-4v
 for linux-snps-arc@lists.infradead.org; Thu, 05 Mar 2020 20:03:05 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BA59743BE4;
 Thu,  5 Mar 2020 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583438583; bh=6Kn+jogkNbxRyuDA9blNb4Jqxpc1G+1Aq+3/kqJcy4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GMRfmb3i32ctC42jVO7m1Dix3tRQyuTPHRy6dAKOapCN5hRKqfGApF3C96O1oUV/i
 j9UMjjOuIulC8ibqZhCIKvO7BLcpX6WQVS8jYmFLR5JDlIv1FQv4onejgPfLos71kE
 ehsi/C3lJ9CTmWld9+Jbg4uAyjZ+Ib9/wOoO3SY0DuHeKCBlz5iXIiqj1rdyZeAPpH
 xMcqZsztUI3xuB9BzOwXxThKbHidL4KRRX5+4lyK1q+7Upte11l9vq8yx0rkw4Qh6L
 VkDWBUgObGWDTJdCXx906IDXfIAIsfwuwAVXOXugrxauyQBaTZ4ZZsUF/TN4hhdRTg
 y587lxYH2QwdQ==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id F3F71A0068;
 Thu,  5 Mar 2020 20:03:00 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 3/4] ARC: add support for DSP-enabled userspace applications
Date: Thu,  5 Mar 2020 23:02:51 +0300
Message-Id: <20200305200252.14278-4-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305200252.14278-1-Eugeniy.Paltsev@synopsys.com>
References: <20200305200252.14278-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_120304_203243_A865F3DA 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

To be able to run DSP-enabled userspace applications we need to
save and restore following DSP-related registers:
At IRQ/exception entry/exit:
 * DSP_CTRL (save it and reset to value suitable for kernel)
 * ACC0_LO, ACC0_HI (we already save them as r58, r59 pair)
At context switch:
 * ACC0_GLO, ACC0_GHI
 * DSP_BFLY0, DSP_FFT_CTRL

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/Kconfig                   | 12 +++++
 arch/arc/include/asm/arcregs.h     |  2 +
 arch/arc/include/asm/dsp-impl.h    | 74 +++++++++++++++++++++++++++++-
 arch/arc/include/asm/dsp.h         | 24 ++++++++++
 arch/arc/include/asm/entry-arcv2.h |  3 ++
 arch/arc/include/asm/processor.h   |  4 ++
 arch/arc/include/asm/ptrace.h      |  3 ++
 arch/arc/include/asm/switch_to.h   |  2 +
 arch/arc/kernel/asm-offsets.c      |  4 ++
 9 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 arch/arc/include/asm/dsp.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 55432a8fc20d..eb3bcb206882 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -411,6 +411,9 @@ config ARC_HAS_ACCL_REGS
 config ARC_DSP_HANDLED
 	def_bool n
 
+config ARC_DSP_SAVE_RESTORE_REGS
+	def_bool n
+
 choice
 	prompt "DSP support"
 	default ARC_DSP_NONE
@@ -433,6 +436,15 @@ config ARC_DSP_KERNEL
 	  DSP extension presence in HW, no support for DSP-enabled userspace
 	  applications. We don't save / restore DSP registers and only do
 	  some minimal preparations so userspace won't be able to break kernel
+
+config ARC_DSP_USERSPACE
+	bool "Support DSP for userspace apps"
+	select ARC_HAS_ACCL_REGS
+	select ARC_DSP_HANDLED
+	select ARC_DSP_SAVE_RESTORE_REGS
+	help
+	  DSP extension presence in HW, support save / restore DSP registers to
+	  run DSP-enabled userspace applications
 endchoice
 
 config ARC_IRQ_NO_AUTOSAVE
diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 135f6ec08a69..aee1ee263065 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -120,6 +120,8 @@
 
 /*
  * DSP-related registers
+ * Registers names must correspond to dsp_callee_regs structure fields names
+ * for automatic offset calculation in DSP_AUX_SAVE_RESTORE macros.
  */
 #define ARC_AUX_DSP_BUILD	0x7A
 #define ARC_AUX_ACC0_LO		0x580
diff --git a/arch/arc/include/asm/dsp-impl.h b/arch/arc/include/asm/dsp-impl.h
index 606620383eca..8380f7bede81 100644
--- a/arch/arc/include/asm/dsp-impl.h
+++ b/arch/arc/include/asm/dsp-impl.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARC_DSP_IMPL_H
 #define __ASM_ARC_DSP_IMPL_H
 
+#include <asm/dsp.h>
+
 #define DSP_CTRL_DISABLED_ALL		0
 
 #ifdef __ASSEMBLY__
@@ -30,12 +32,82 @@
 	 */
 	mov	r10, DSP_CTRL_DISABLED_ALL
 	sr	r10, [ARC_AUX_DSP_CTRL]
-#endif /* ARC_DSP_KERNEL */
+
+#elif defined(CONFIG_ARC_DSP_SAVE_RESTORE_REGS)
+	/*
+	 * Save DSP_CTRL register and reset it to value suitable for kernel
+	 * (DSP_CTRL_DISABLED_ALL)
+	 */
+	mov	r10, DSP_CTRL_DISABLED_ALL
+	aex	r10, [ARC_AUX_DSP_CTRL]
+	st	r10, [sp, PT_DSP_CTRL]
+
+#endif
+.endm
+
+/* clobbers r10, r11 registers pair */
+.macro DSP_RESTORE_REGFILE_IRQ
+#if defined(CONFIG_ARC_DSP_SAVE_RESTORE_REGS)
+	ld	r10, [sp, PT_DSP_CTRL]
+	sr	r10, [ARC_AUX_DSP_CTRL]
+
+#endif
 .endm
 
 #else /* __ASEMBLY__ */
 
+#include <linux/sched.h>
 #include <asm/asserts.h>
+#include <asm/switch_to.h>
+
+#ifdef CONFIG_ARC_DSP_SAVE_RESTORE_REGS
+
+/*
+ * As we save new and restore old AUX register value in the same place we
+ * can optimize a bit and use AEX instruction (swap contents of an auxiliary
+ * register with a core register) instead of LR + SR pair.
+ */
+#define AUX_SAVE_RESTORE(_saveto, _readfrom, _offt, _aux)		\
+do {									\
+	long unsigned int _scratch;					\
+									\
+	__asm__ __volatile__(						\
+		"ld	%0, [%2, %4]			\n"		\
+		"aex	%0, [%3]			\n"		\
+		"st	%0, [%1, %4]			\n"		\
+		:							\
+		  "=&r" (_scratch)	/* must be early clobber */	\
+		:							\
+		   "r" (_saveto),					\
+		   "r" (_readfrom),					\
+		   "Ir" (_aux),						\
+		   "Ir" (_offt)						\
+		:							\
+		  "memory"						\
+	);								\
+} while (0)
+
+#define DSP_AUX_SAVE_RESTORE(_saveto, _readfrom, _aux)			\
+	AUX_SAVE_RESTORE(_saveto, _readfrom,				\
+		offsetof(struct dsp_callee_regs, _aux),			\
+		ARC_AUX_##_aux)
+
+static inline void dsp_save_restore(struct task_struct *prev,
+					struct task_struct *next)
+{
+	long unsigned int *saveto = &prev->thread.dsp.ACC0_GLO;
+	long unsigned int *readfrom = &next->thread.dsp.ACC0_GLO;
+
+	DSP_AUX_SAVE_RESTORE(saveto, readfrom, ACC0_GLO);
+	DSP_AUX_SAVE_RESTORE(saveto, readfrom, ACC0_GHI);
+
+	DSP_AUX_SAVE_RESTORE(saveto, readfrom, DSP_BFLY0);
+	DSP_AUX_SAVE_RESTORE(saveto, readfrom, DSP_FFT_CTRL);
+}
+
+#else /* !CONFIG_ARC_DSP_SAVE_RESTORE_REGS */
+#define dsp_save_restore(p, n)
+#endif /* CONFIG_ARC_DSP_SAVE_RESTORE_REGS */
 
 static inline bool dsp_exist(void)
 {
diff --git a/arch/arc/include/asm/dsp.h b/arch/arc/include/asm/dsp.h
new file mode 100644
index 000000000000..b016f4d2a09f
--- /dev/null
+++ b/arch/arc/include/asm/dsp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
+ *
+ * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+ */
+#ifndef __ASM_ARC_DSP_H
+#define __ASM_ARC_DSP_H
+
+#ifndef __ASSEMBLY__
+
+/*
+ * DSP-related saved registers - need to be saved only when you are
+ * scheduled out.
+ * structure fields name must correspond to aux register defenitions for
+ * automatic offset calculation in DSP_AUX_SAVE_RESTORE macros
+ */
+struct dsp_callee_regs {
+	unsigned long ACC0_GLO, ACC0_GHI, DSP_BFLY0, DSP_FFT_CTRL;
+};
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __ASM_ARC_DSP_H */
diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index dd6aa18b51ca..ae0aa5323be1 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -192,6 +192,9 @@
 	ld	r25, [sp, PT_user_r25]
 #endif
 
+	/* clobbers r10, r11 registers pair */
+	DSP_RESTORE_REGFILE_IRQ
+
 #ifdef CONFIG_ARC_HAS_ACCL_REGS
 	LD2	r58, r59, PT_r58
 #endif
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index ec532d1e0725..0fcea5bad343 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -14,6 +14,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/ptrace.h>
+#include <asm/dsp.h>
 #include <asm/fpu.h>
 
 #ifdef CONFIG_ARC_PLAT_EZNPS
@@ -31,6 +32,9 @@ struct thread_struct {
 	unsigned long ksp;	/* kernel mode stack pointer */
 	unsigned long callee_reg;	/* pointer to callee regs */
 	unsigned long fault_address;	/* dbls as brkpt holder as well */
+#ifdef CONFIG_ARC_DSP_SAVE_RESTORE_REGS
+	struct dsp_callee_regs dsp;
+#endif
 #ifdef CONFIG_ARC_FPU_SAVE_RESTORE
 	struct arc_fpu fpu;
 #endif
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index ba9854ef39e8..2fdb87addadc 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -91,6 +91,9 @@ struct pt_regs {
 #ifdef CONFIG_ARC_HAS_ACCL_REGS
 	unsigned long r58, r59;	/* ACCL/ACCH used by FPU / DSP MPY */
 #endif
+#ifdef CONFIG_ARC_DSP_SAVE_RESTORE_REGS
+	unsigned long DSP_CTRL;
+#endif
 
 	/*------- Below list auto saved by h/w -----------*/
 	unsigned long r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;
diff --git a/arch/arc/include/asm/switch_to.h b/arch/arc/include/asm/switch_to.h
index aadf65b2b56c..4a3d67989d19 100644
--- a/arch/arc/include/asm/switch_to.h
+++ b/arch/arc/include/asm/switch_to.h
@@ -9,6 +9,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/sched.h>
+#include <asm/dsp-impl.h>
 #include <asm/fpu.h>
 
 #ifdef CONFIG_ARC_PLAT_EZNPS
@@ -24,6 +25,7 @@ struct task_struct *__switch_to(struct task_struct *p, struct task_struct *n);
 #define switch_to(prev, next, last)	\
 do {					\
 	ARC_EZNPS_DP_PREV(prev, next);	\
+	dsp_save_restore(prev, next);	\
 	fpu_save_restore(prev, next);	\
 	last = __switch_to(prev, next);\
 	mb();				\
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index c783bcd35eb8..0e884036ab74 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -12,6 +12,7 @@
 #include <asm/hardirq.h>
 #include <asm/page.h>
 
+
 int main(void)
 {
 	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
@@ -75,6 +76,9 @@ int main(void)
 	OFFSET(PT_r58, pt_regs, r58);
 	OFFSET(PT_r59, pt_regs, r59);
 #endif
+#ifdef CONFIG_ARC_DSP_SAVE_RESTORE_REGS
+	OFFSET(PT_DSP_CTRL, pt_regs, DSP_CTRL);
+#endif
 
 	return 0;
 }
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
