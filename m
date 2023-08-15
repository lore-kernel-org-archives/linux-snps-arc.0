Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9E4C04FE0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwJIcoqTdfeBbwEzVUxXgKvipLvO1SW6xzHwp+47uGY=; b=1S/cYKu4Z4a+FX
	rRbmpXFPHGklUHFNnQKrNS5aBuVX5ueFBwc79nBxZgIrc6Ew+RboNzTl3yZTkuhFPXg8FicsJtvXN
	I+s0nFQQ5dAcLeflfUrfYKGqpfpkkL+VslIWOfQY/BmT7mLMfH8USRYmzfs7SRgdSGbNoZFuYRCuk
	5Lv0FuXTNusU+hwj5kwL3NM1QMcB3xTGtqfZVCM5yE9w0DPyQ0Ip9VGKEjNOSwbld9T1vOwKrOJYG
	fcY6X0g99miBg6AW/pcM+OlZ+Q2p/enVgkuQmdaejK3w7LTLcqs1SBC4y1j4ZsLUQ0wIh4b7FXKD5
	skla6iDRElfBFS+1mvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEc-000cht-0S;
	Tue, 15 Aug 2023 00:48:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEV-000cUd-12
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EF7C64582;
	Tue, 15 Aug 2023 00:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF11C433C9;
	Tue, 15 Aug 2023 00:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060506;
	bh=QEDl/IHEChN9kap/CMDzsElMt/XGCzh6+0rqR7kcifs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SbX1hBMpvpq0DzM119asALPJPEMun258wift5k5TvzhnFzI6aenEsMcZYv8vWj9pg
	 fD0tSYaAoc7RbF53FWrdropZrPKXIDgPH+gulFKX1ojHO0Fu1PCdr2sOWR/HZpQLBw
	 uBYdGVN9ovqgsZnV+m6Myr4LqayiDKlJn0YsajAwC6B9oxJ1vr9s/gZ/Evhyb7BBNW
	 zD0KTZm58jDqgjBPpIOBC7N67F5TVzXX2hqoM14MgWut6/E4D+jJo0xvj/ajnHzwxe
	 U5q3BnbcQoIvinTHvROJblhjEB368NYhZjstiWkz3CNFM+AOfIyIDdd2ega+ssESYc
	 QAmUSXGfzkFLw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
Date: Mon, 14 Aug 2023 17:48:13 -0700
Message-Id: <20230815004813.555115-21-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174827_459550_09B763B6 
X-CRM114-Status: GOOD (  18.85  )
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

Reduces duplication in each ISA specific pt_regs

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/ptrace.h  | 45 +++++++++++++---------------------
 arch/arc/kernel/asm-offsets.c  |  2 +-
 arch/arc/kernel/kgdb.c         |  2 +-
 arch/arc/kernel/ptrace.c       |  4 +--
 arch/arc/kernel/traps.c        |  4 +--
 arch/arc/kernel/troubleshoot.c | 13 +++++-----
 arch/arc/mm/fault.c            |  6 ++---
 7 files changed, 32 insertions(+), 44 deletions(-)

diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index 3a054b695f28..724e3fe31ed5 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -12,6 +12,17 @@
 
 #ifndef __ASSEMBLY__
 
+typedef union {
+	struct {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+		unsigned long state:8, vec:8, cause:8, param:8;
+#else
+		unsigned long param:8, cause:8, vec:8, state:8;
+#endif
+	};
+	unsigned long full;
+} ecr_reg;
+
 /* THE pt_regs: Defines how regs are saved during entry into kernel */
 
 #ifdef CONFIG_ISA_ARCOMPACT
@@ -40,18 +51,7 @@ struct pt_regs {
 	 * 	Last word used by Linux for extra state mgmt (syscall-restart)
 	 * For interrupts, use artificial ECR values to note current prio-level
 	 */
-	union {
-		struct {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-			unsigned long state:8, ecr_vec:8,
-				      ecr_cause:8, ecr_param:8;
-#else
-			unsigned long ecr_param:8, ecr_cause:8,
-				      ecr_vec:8, state:8;
-#endif
-		};
-		unsigned long event;
-	};
+	ecr_reg ecr;
 };
 
 #define MAX_REG_OFFSET offsetof(struct pt_regs, event)
@@ -62,18 +62,7 @@ struct pt_regs {
 
 	unsigned long orig_r0;
 
-	union {
-		struct {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-			unsigned long state:8, ecr_vec:8,
-				      ecr_cause:8, ecr_param:8;
-#else
-			unsigned long ecr_param:8, ecr_cause:8,
-				      ecr_vec:8, state:8;
-#endif
-		};
-		unsigned long event;
-	};
+	ecr_reg ecr;		/* Exception Cause Reg */
 
 	unsigned long bta;	/* erbta */
 
@@ -131,13 +120,13 @@ struct callee_regs {
 /* return 1 if PC in delay slot */
 #define delay_mode(regs) ((regs->status32 & STATUS_DE_MASK) == STATUS_DE_MASK)
 
-#define in_syscall(regs)    ((regs->ecr_vec == ECR_V_TRAP) && !regs->ecr_param)
-#define in_brkpt_trap(regs) ((regs->ecr_vec == ECR_V_TRAP) && regs->ecr_param)
+#define in_syscall(regs)    ((regs->ecr.vec == ECR_V_TRAP) && !regs->ecr.param)
+#define in_brkpt_trap(regs) ((regs->ecr.vec == ECR_V_TRAP) && regs->ecr.param)
 
 #define STATE_SCALL_RESTARTED	0x01
 
-#define syscall_wont_restart(reg) (reg->state |= STATE_SCALL_RESTARTED)
-#define syscall_restartable(reg) !(reg->state &  STATE_SCALL_RESTARTED)
+#define syscall_wont_restart(regs) (regs->ecr.state |= STATE_SCALL_RESTARTED)
+#define syscall_restartable(regs) !(regs->ecr.state &  STATE_SCALL_RESTARTED)
 
 #define current_pt_regs()					\
 ({								\
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index 478768c88f46..f77deb799175 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -46,7 +46,7 @@ int main(void)
 	BLANK();
 
 	DEFINE(PT_status32, offsetof(struct pt_regs, status32));
-	DEFINE(PT_event, offsetof(struct pt_regs, event));
+	DEFINE(PT_event, offsetof(struct pt_regs, ecr));
 	DEFINE(PT_bta, offsetof(struct pt_regs, bta));
 	DEFINE(PT_sp, offsetof(struct pt_regs, sp));
 	DEFINE(PT_r0, offsetof(struct pt_regs, r0));
diff --git a/arch/arc/kernel/kgdb.c b/arch/arc/kernel/kgdb.c
index 345a0000554c..4f2b5951454f 100644
--- a/arch/arc/kernel/kgdb.c
+++ b/arch/arc/kernel/kgdb.c
@@ -175,7 +175,7 @@ void kgdb_trap(struct pt_regs *regs)
 	 * with trap_s 4 (compiled) breakpoints, continuation needs to
 	 * start after the breakpoint.
 	 */
-	if (regs->ecr_param == 3)
+	if (regs->ecr.param == 3)
 		instruction_pointer(regs) -= BREAK_INSTR_SIZE;
 
 	kgdb_handle_exception(1, SIGTRAP, 0, regs);
diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index 14ea7406f5cd..e0c233c178b1 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -46,7 +46,7 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_NAME(r0),
 	REG_OFFSET_NAME(sp),
 	REG_OFFSET_NAME(orig_r0),
-	REG_OFFSET_NAME(event),
+	REG_OFFSET_NAME(ecr),
 	REG_OFFSET_END,
 };
 
@@ -54,7 +54,7 @@ static const struct pt_regs_offset regoffset_table[] = {
 
 static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_NAME(orig_r0),
-	REG_OFFSET_NAME(event),
+	REG_OFFSET_NAME(ecr),
 	REG_OFFSET_NAME(bta),
 	REG_OFFSET_NAME(r26),
 	REG_OFFSET_NAME(fp),
diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index 2f7eb786695b..9b9570b79362 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -110,9 +110,7 @@ void do_machine_check_fault(unsigned long address, struct pt_regs *regs)
  */
 void do_non_swi_trap(unsigned long address, struct pt_regs *regs)
 {
-	unsigned int param = regs->ecr_param;
-
-	switch (param) {
+	switch (regs->ecr.param) {
 	case 1:
 		trap_is_brkpt(address, regs);
 		break;
diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index 7654c2e42dc0..d5b3ed2c58f5 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -115,8 +115,8 @@ static void show_ecr_verbose(struct pt_regs *regs)
 	/* For Data fault, this is data address not instruction addr */
 	address = current->thread.fault_address;
 
-	vec = regs->ecr_vec;
-	cause_code = regs->ecr_cause;
+	vec = regs->ecr.vec;
+	cause_code = regs->ecr.cause;
 
 	/* For DTLB Miss or ProtV, display the memory involved too */
 	if (vec == ECR_V_DTLB_MISS) {
@@ -154,7 +154,7 @@ static void show_ecr_verbose(struct pt_regs *regs)
 		pr_cont("Misaligned r/w from 0x%08lx\n", address);
 #endif
 	} else if (vec == ECR_V_TRAP) {
-		if (regs->ecr_param == 5)
+		if (regs->ecr.param == 5)
 			pr_cont("gcc generated __builtin_trap\n");
 	} else {
 		pr_cont("Check Programmer's Manual\n");
@@ -184,9 +184,10 @@ void show_regs(struct pt_regs *regs)
 	if (user_mode(regs))
 		show_faulting_vma(regs->ret); /* faulting code, not data */
 
-	pr_info("ECR: 0x%08lx EFA: 0x%08lx ERET: 0x%08lx\nSTAT: 0x%08lx",
-		regs->event, current->thread.fault_address, regs->ret,
-		regs->status32);
+	pr_info("ECR: 0x%08lx EFA: 0x%08lx ERET: 0x%08lx\n",
+		regs->ecr.full, current->thread.fault_address, regs->ret);
+
+	pr_info("STAT32: 0x%08lx", regs->status32);
 
 #define STS_BIT(r, bit)	r->status32 & STATUS_##bit##_MASK ? #bit" " : ""
 
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 26e5823c5710..95119a5e7761 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -100,10 +100,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	if (faulthandler_disabled() || !mm)
 		goto no_context;
 
-	if (regs->ecr_cause & ECR_C_PROTV_STORE)	/* ST/EX */
+	if (regs->ecr.cause & ECR_C_PROTV_STORE)	/* ST/EX */
 		write = 1;
-	else if ((regs->ecr_vec == ECR_V_PROTV) &&
-	         (regs->ecr_cause == ECR_C_PROTV_INST_FETCH))
+	else if ((regs->ecr.vec == ECR_V_PROTV) &&
+	         (regs->ecr.cause == ECR_C_PROTV_INST_FETCH))
 		exec = 1;
 
 	flags = FAULT_FLAG_DEFAULT;
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
