Return-Path: <SRS0=ZCzF=3H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3BEC33C9E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 01:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDAD2464B
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jan 2020 01:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rUy2k0vV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FbpYdMuF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EDAD2464B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIdMfr5mkMWaiiBad3c8dcfUraiU6l5/pk5OjP+cRRc=; b=rUy2k0vVDAuBH7
	L/43KKgyKaZlVUQMo05I2siFBWwHGny6l49ca+6miKWOSg3HmIoOvTBTZrP3IyRyXoMrKNwx8wBw1
	w3+Tr6XsR90rAGnF4GIp4dlcG9eB6eS2F2Q2GiV5p6tpsjZuDL3VH0nOJu6r7gYv9z+1pvYijrwr+
	vV3Ud7RBjuYoltSLAgWbFma5ik73DLemk5qIo5aCY9oF9Zft272VmKzAV62ALWALSEQYhMrGgx+NW
	sjWFofpm0TfkWTVfnZh7kPd8c4O4N0/LfNOze/NIZE1Ev2/Y0FeB4hRxGqIPdNtlX+aivKtQTo5cp
	+Zf9QOul0GRNspUQtwHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iscIh-0001ho-HB; Sat, 18 Jan 2020 00:49:19 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iscId-0001fe-0E
 for linux-snps-arc@lists.infradead.org; Sat, 18 Jan 2020 00:49:18 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4DCA4C00D4
 for <linux-snps-arc@lists.infradead.org>; Sat, 18 Jan 2020 00:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579308552; bh=jbhMr8e6s9SXc2zrmTZZvh+RHHll9HCIZKSvJ4ViuQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FbpYdMuFdlNMrdDTzAEiTD6VToDhPIIvZi6Pxwf000yx1N7w4e4gPXEIcHnc0cCKg
 bmTjp5lvRRy7JaaZ00SX3fm7gAy+PmOKHzrdIACxFsTJCBtEWAXFZO/EHpl9eRGrLw
 OJL3P+AUY7Hfn1DlSh0S6lSKNse9qMam477/5WMSkX/BKHiX4cTchWRycTBo3YtqMG
 Y4gHXB0XCRbdQwdf4LqDvGWKP0VbaPsIYXWzt7+Op9jKdFc64HWVTdV4l0fukDok8M
 IGqSJ0LfMT3MUJpcTp5LzCoiUguV8LCY2wZ5gnxqL5xhZWhLKb6EXrLYAAX43LVLfC
 uytpoDdqiM1gw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.29])
 by mailhost.synopsys.com (Postfix) with ESMTP id DEE2AA007D;
 Sat, 18 Jan 2020 00:49:10 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: fpu: preserve userspace fpu state
Date: Fri, 17 Jan 2020 16:49:04 -0800
Message-Id: <20200118004905.30201-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200118004905.30201-1-vgupta@synopsys.com>
References: <20200118004905.30201-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_164915_152395_343735A4 
X-CRM114-Status: GOOD (  16.62  )
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
 arch/arc/Kconfig                 | 15 +++------
 arch/arc/include/asm/arcregs.h   |  2 ++
 arch/arc/include/asm/fpu.h       | 54 ++++++++++++++++++++++++++++++++
 arch/arc/include/asm/processor.h | 10 +-----
 arch/arc/include/asm/switch_to.h | 17 ++--------
 arch/arc/kernel/Makefile         |  2 ++
 arch/arc/kernel/fpu.c            | 28 +++++++++++++++++
 arch/arc/kernel/process.c        |  8 ++++-
 8 files changed, 101 insertions(+), 35 deletions(-)
 create mode 100644 arch/arc/include/asm/fpu.h

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
new file mode 100644
index 000000000000..d0e51b863f4c
--- /dev/null
+++ b/arch/arc/include/asm/fpu.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
+ *
+ */
+
+#ifndef _ASM_ARC_FPU_H
+#define _ASM_ARC_FPU_H
+
+#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
+
+#include <asm/ptrace.h>
+
+#ifdef CONFIG_ISA_ARCOMPACT
+
+/* These DPFP regs need to be saved/restored across ctx-sw */
+struct arc_fpu {
+	struct {
+		unsigned int l, h;
+	} aux_dpfp[2];
+};
+
+#define fpu_init_task(regs)
+
+#else
+
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
+#else
+
+#define fpu_save_restore(p, n)
+
+#endif	/* CONFIG_ARC_FPU_SAVE_RESTORE */
+
+#endif	/* _ASM_ARC_FPU_H */
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 706edeaa5583..ec532d1e0725 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -14,15 +14,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/ptrace.h>
-
-#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
-/* These DPFP regs need to be saved/restored across ctx-sw */
-struct arc_fpu {
-	struct {
-		unsigned int l, h;
-	} aux_dpfp[2];
-};
-#endif
+#include <asm/fpu.h>
 
 #ifdef CONFIG_ARC_PLAT_EZNPS
 struct eznps_dp {
diff --git a/arch/arc/include/asm/switch_to.h b/arch/arc/include/asm/switch_to.h
index 77f123385e96..aadf65b2b56c 100644
--- a/arch/arc/include/asm/switch_to.h
+++ b/arch/arc/include/asm/switch_to.h
@@ -9,19 +9,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/sched.h>
-
-#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
-
-extern void fpu_save_restore(struct task_struct *p, struct task_struct *n);
-#define ARC_FPU_PREV(p, n)	fpu_save_restore(p, n)
-#define ARC_FPU_NEXT(t)
-
-#else
-
-#define ARC_FPU_PREV(p, n)
-#define ARC_FPU_NEXT(n)
-
-#endif /* !CONFIG_ARC_FPU_SAVE_RESTORE */
+#include <asm/fpu.h>
 
 #ifdef CONFIG_ARC_PLAT_EZNPS
 extern void dp_save_restore(struct task_struct *p, struct task_struct *n);
@@ -36,9 +24,8 @@ struct task_struct *__switch_to(struct task_struct *p, struct task_struct *n);
 #define switch_to(prev, next, last)	\
 do {					\
 	ARC_EZNPS_DP_PREV(prev, next);	\
-	ARC_FPU_PREV(prev, next);	\
+	fpu_save_restore(prev, next);	\
 	last = __switch_to(prev, next);\
-	ARC_FPU_NEXT(next);		\
 	mb();				\
 } while (0)
 
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
index 07e22b563fbb..7bc534a7cd20 100644
--- a/arch/arc/kernel/fpu.c
+++ b/arch/arc/kernel/fpu.c
@@ -7,6 +7,9 @@
 
 #include <linux/sched.h>
 #include <asm/switch_to.h>
+#include <asm/fpu.h>
+
+#ifdef CONFIG_ISA_ARCOMPACT
 
 /*
  * To save/restore FPU regs, simplest scheme would use LR/SR insns.
@@ -50,3 +53,28 @@ void fpu_save_restore(struct task_struct *prev, struct task_struct *next)
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
index e1889ce3faf9..0ecde4405aaf 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -5,6 +5,8 @@
  * Amit Bhor, Kanika Nema: Codito Technologies 2004
  */
 
+#include <asm/fpu.h>
+
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
@@ -264,7 +266,7 @@ int copy_thread(unsigned long clone_flags,
 /*
  * Do necessary setup to start up a new user task
  */
-void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long usp)
+void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long usp)
 {
 	regs->sp = usp;
 	regs->ret = pc;
@@ -280,6 +282,10 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long usp)
 	regs->eflags = 0;
 #endif
 
+#ifdef CONFIG_ARC_FPU_SAVE_RESTORE
+	fpu_init_task(regs);
+#endif
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
