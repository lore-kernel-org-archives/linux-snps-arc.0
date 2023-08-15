Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412F5C001DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ua1fY+SJH0dDUxbqUh5Aam08U0DAaDBt4FRSy5hcE7g=; b=OxwVsCnAHPJSku
	HYlTTwbkyNd2ixpv1xpsAefu9Yjn+HeUlozSGUtR0w8USI/um9nOAvKtR5Q+Xu9YMgqHCFL2Bc0wn
	ObKUKwjmDsYK4JEfplfabRIkj3auUALKjtFBd8xe2UdcW6F4qZhZA0sUNLrSfxQpgTB2E17YDqEnZ
	1AiMd7Md1aKuz0iQu7L72chX+zLRJcCHb190+Une48O8atoasfKGXphGsbRBhwSnXFppWsbLyYmI9
	GuHkcYXQ3FVtUtrpolfWSuKcMsNiHrry1A9f5SCry65uxiTt95zEow9yQ44mQHTMLaSvmRTN6fe+9
	z/1PzMYMkYzFXpfevTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEX-000ceE-2r;
	Tue, 15 Aug 2023 00:48:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViES-000cXK-1Z
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE59E63C12;
	Tue, 15 Aug 2023 00:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688D1C433CC;
	Tue, 15 Aug 2023 00:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060503;
	bh=lz9Xbt2pIM+wlhtUOQLjEgvHMc8ZUwQY9IxV1Z3dysI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2veBvhqA9Z5n37BDVb5IeOyiO2dL8X+PUCyzC8dMAz1TLXEWC4f28/kkyWsldXEl
	 hU+JwEP2W40YKQI6VrRs8vqoPUIKag5lDbi8fuLnXiUmSZtHdiJwrujRqSCRB94KC2
	 5+K8uV9N0Mb05RCuzXIeNqMAeaquTVMXC3XW30Y800PEBY2DFPbNqnoceN914KIaeo
	 TpqwP0rGEytV3jKWGJMhK/1lrEpUajOngBkPai7FGAnvKdESft50UbjGPORwVDkI5Z
	 Ye3F/Ix2Oh8IadPkgby4gEyIwp3bez5/kCSOoGWcELEOcwtXKs8apt/6ZCogY2ap8q
	 ajk7EQEn/TtNA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 13/20] ARC: entry: rework (non-functional)
Date: Mon, 14 Aug 2023 17:48:06 -0700
Message-Id: <20230815004813.555115-14-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174824_637027_379D2C6D 
X-CRM114-Status: GOOD (  15.92  )
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

 - comments update
 - rename syscall_trace_entry
 - use PT_xxx in entry code

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-arcv2.h   | 23 ++++++++------
 arch/arc/include/asm/entry-compact.h |  3 +-
 arch/arc/include/asm/ptrace.h        |  2 +-
 arch/arc/kernel/asm-offsets.c        |  1 +
 arch/arc/kernel/entry.S              | 45 +++++++++++++---------------
 arch/arc/kernel/ptrace.c             |  2 +-
 6 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 858742feab71..a38ed505b3de 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -48,14 +48,18 @@
 /*------------------------------------------------------------------------*/
 .macro INTERRUPT_PROLOGUE
 
-	; (A) Before jumping to Interrupt Vector, hardware micro-ops did following:
+	; Before jumping to Interrupt Vector, hardware micro-ops did following:
 	;   1. SP auto-switched to kernel mode stack
 	;   2. STATUS32.Z flag set if in U mode at time of interrupt (U:1,K:0)
 	;   3. Auto save: (mandatory) Push PC and STAT32 on stack
 	;                 hardware does even if CONFIG_ARC_IRQ_NO_AUTOSAVE
-	;   4. Auto save: (optional) r0-r11, blink, LPE,LPS,LPC, JLI,LDI,EI
+	;  4a. Auto save: (optional) r0-r11, blink, LPE,LPS,LPC, JLI,LDI,EI
 	;
-	; (B) Manually saved some regs: r12,r30, sp,fp,gp, ACCL pair
+	; Now
+	;  4b. If Auto-save (optional) not enabled in hw, manually save them
+	;   5. Manually save: r12,r30, sp,fp,gp, ACCL pair
+	;
+	; At the end, SP points to pt_regs
 
 #ifdef CONFIG_ARC_IRQ_NO_AUTOSAVE
 	; carve pt_regs on stack (case #3), PC/STAT32 already on stack
@@ -73,13 +77,14 @@
 /*------------------------------------------------------------------------*/
 .macro EXCEPTION_PROLOGUE
 
-	; (A) Before jumping to Exception Vector, hardware micro-ops did following:
+	; Before jumping to Exception Vector, hardware micro-ops did following:
 	;   1. SP auto-switched to kernel mode stack
 	;   2. STATUS32.Z flag set if in U mode at time of exception (U:1,K:0)
 	;
-	; (B) Manually save the complete reg file below
+	; Now manually save rest of reg file
+	; At the end, SP points to pt_regs
 
-	sub	sp, sp, SZ_PT_REGS	; carve pt_regs
+	sub	sp, sp, SZ_PT_REGS	; carve space for pt_regs
 
 	; _HARD saves r10 clobbered by _SOFT as scratch hence comes first
 
@@ -136,8 +141,8 @@
 
 	ST2	gp, fp, PT_r26		; gp (r26), fp (r27)
 
-	st	r12, [sp, PT_sp + 4]
-	st	r30, [sp, PT_sp + 8]
+	st	r12, [sp, PT_r12]
+	st	r30, [sp, PT_r30]
 
 	; Saving pt_regs->sp correctly requires some extra work due to the way
 	; Auto stack switch works
@@ -244,7 +249,7 @@
 
 	btst	r0, STATUS_U_BIT	; Z flag set if K, used in restoring SP
 
-	ld	r10, [sp, PT_event + 4]
+	ld	r10, [sp, PT_bta]
 	sr	r10, [erbta]
 
 	LD2	r10, r11, PT_ret
diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index e3383e1cb040..4e2ae82779ed 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -170,12 +170,13 @@
 	PUSHAX	erbta
 
 	lr	r10, [ecr]
-	st      r10, [sp, PT_event]    /* EV_Trap expects r10 to have ECR */
+	st      r10, [sp, PT_event]
 
 #ifdef CONFIG_ARC_CURR_IN_REG
 	/* gp already saved on stack: now load with "current" */
 	GET_CURR_TASK_ON_CPU   gp
 #endif
+	; OUTPUT: r10 has ECR expected by EV_Trap
 .endm
 
 /*--------------------------------------------------------------
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index e9798f46cdc4..2bf8ea96ea21 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -75,7 +75,7 @@ struct pt_regs {
 		unsigned long event;
 	};
 
-	unsigned long bta;	/* bta_l1, bta_l2, erbta */
+	unsigned long bta;	/* erbta */
 
 	unsigned long r26;	/* gp */
 	unsigned long fp;
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index 5b47d09b925e..e46688975868 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -47,6 +47,7 @@ int main(void)
 
 	DEFINE(PT_status32, offsetof(struct pt_regs, status32));
 	DEFINE(PT_event, offsetof(struct pt_regs, event));
+	DEFINE(PT_bta, offsetof(struct pt_regs, bta));
 	DEFINE(PT_sp, offsetof(struct pt_regs, sp));
 	DEFINE(PT_r0, offsetof(struct pt_regs, r0));
 	DEFINE(PT_r1, offsetof(struct pt_regs, r1));
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index cd26e0fa5044..f291fc8476d7 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -160,20 +160,19 @@ END(EV_Extension)
 ; syscall Tracing
 ; ---------------------------------------------
 tracesys:
-	; save EFA in case tracer wants the PC of traced task
-	; using ERET won't work since next-PC has already committed
+	; safekeep EFA (r12) if syscall tracer wanted PC
+	; for traps, ERET is pre-commit so points to next-PC
 	GET_CURR_TASK_FIELD_PTR   TASK_THREAD, r11
 	st  r12, [r11, THREAD_FAULT_ADDR]	; thread.fault_address
 
-	; PRE Sys Call Ptrace hook
-	mov r0, sp			; pt_regs needed
-	bl  @syscall_trace_entry
+	; PRE syscall trace hook
+	mov r0, sp				; pt_regs
+	bl  @syscall_trace_enter
 
 	; Tracing code now returns the syscall num (orig or modif)
 	mov r8, r0
 
 	; Do the Sys Call as we normally would.
-	; Validate the Sys Call number
 	cmp     r8,  NR_syscalls - 1
 	mov.hi  r0, -ENOSYS
 	bhi     tracesys_exit
@@ -190,36 +189,36 @@ tracesys:
 	ld  r6, [sp, PT_r6]
 	ld  r7, [sp, PT_r7]
 	ld.as   r9, [sys_call_table, r8]
-	jl      [r9]        ; Entry into Sys Call Handler
+	jl      [r9]
 
 tracesys_exit:
-	st  r0, [sp, PT_r0]     ; sys call return value in pt_regs
+	st  r0, [sp, PT_r0]
 
-	;POST Sys Call Ptrace Hook
+	; POST syscall trace hook
 	mov r0, sp		; pt_regs needed
 	bl  @syscall_trace_exit
-	b   ret_from_exception ; NOT ret_from_system_call at is saves r0 which
-	; we'd done before calling post hook above
+
+	; don't call ret_from_system_call as it saves r0, already done above
+	b   ret_from_exception
 
 ; ---------------------------------------------
 ; Breakpoint TRAP
 ; ---------------------------------------------
 trap_with_param:
 	mov r0, r12	; EFA in case ptracer/gdb wants stop_pc
-	mov r1, sp
+	mov r1, sp	; pt_regs
 
-	; Save callee regs in case gdb wants to have a look
-	; SP will grow up by size of CALLEE Reg-File
+	; save callee regs in case tracer/gdb wants to peek
 	SAVE_CALLEE_SAVED_USER
 
-	; save location of saved Callee Regs @ thread_struct->pc
+	; safekeep ref to callee regs
 	GET_CURR_TASK_FIELD_PTR   TASK_THREAD, r10
 	st  sp, [r10, THREAD_CALLEE_REG]
 
-	; Call the trap handler
+	; call the non syscall trap handler
 	bl  do_non_swi_trap
 
-	; unwind stack to discard Callee saved Regs
+	; unwind stack to discard callee regs
 	DISCARD_CALLEE_SAVED_USER
 
 	b   ret_from_exception
@@ -237,31 +236,27 @@ ENTRY(EV_Trap)
 
 	FAKE_RET_FROM_EXCPN
 
-	;============ TRAP 1   :breakpoints
-	; Check ECR for trap with arg (PROLOGUE ensures r10 has ECR)
+	;============ TRAP N : breakpoints, kprobes etc
 	bmsk.f 0, r10, 7
 	bnz    trap_with_param
 
-	;============ TRAP  (no param): syscall top level
+	;============ TRAP 0 (no param): syscall
 
-	; If syscall tracing ongoing, invoke pre-post-hooks
+	; syscall tracing ongoing, invoke pre-post-hooks around syscall
 	GET_CURR_THR_INFO_FLAGS   r10
 	and.f 0, r10, _TIF_SYSCALL_WORK
 	bnz   tracesys  ; this never comes back
 
 	;============ Normal syscall case
 
-	; syscall num shd not exceed the total system calls avail
 	cmp     r8,  NR_syscalls - 1
 	mov.hi  r0, -ENOSYS
 	bhi     .Lret_from_system_call
 
-	; Offset into the syscall_table and call handler
 	ld.as   r9,[sys_call_table, r8]
-	jl      [r9]        ; Entry into Sys Call Handler
+	jl      [r9]
 
 .Lret_from_system_call:
-
 	st  r0, [sp, PT_r0]     ; sys call return value in pt_regs
 
 	; fall through to ret_from_exception
diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index 8226df3163fe..14ea7406f5cd 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -339,7 +339,7 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-asmlinkage int syscall_trace_entry(struct pt_regs *regs)
+asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 {
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		if (ptrace_report_syscall_entry(regs))
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
