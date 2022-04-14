Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C455C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlFMSotRR8QMwMHyuxdUfaZQz0Zqc2UykjolE7b1uvw=; b=uxsph+gqQxCSJh
	jhR8cy2o0N9/6wRkgvML64hGBzSJvPNo3dL1VTCTX71wyci60/uhQzrefdu/eo6M63LP32xYMJVOE
	PYWur1ct1fu1A/3odGMjPGRnM54f+eFUrwtadTtJT4Q1UeAu3Cpj4zKPmfjnvvlJhmg7/6IKoNfnn
	ULbwi032NwQJjpl1KKzln9gTvu6nokJ65xXuXPRdF8TqNi/LhDcHl0G1dmHwbMSaRx/kfs2ZOP+VU
	9IyoF7DrQI1xB+AjTHtkpAk2ALUlQcP30Q6seNVn9ABJtCf1ffOjDND1ofAYu6OWblYaaJzjqwSvE
	IIyWF1uwjo1kxubbSIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neufY-004VGk-Ea; Thu, 14 Apr 2022 08:17:36 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neufU-004VCn-CO
 for linux-snps-arc@lists.infradead.org; Thu, 14 Apr 2022 08:17:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id 17so5094051lji.1
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Apr 2022 01:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ok57uHtbOiq3OdGSevyQ4O6t5TDKu9QFX6kVIS2Yuvs=;
 b=NVS4s0Zxdyxod/eLsVWei+rsc/pBTOh2c2GyW5TpBT+qgQyKlwsD2ScoyVaN4sxlu9
 bD0t0z6cGn5frgZFuy4NBxbzXBWTHORNFDmq1ruvGZoHFZV1P00W8QwAulNh0cGX05F/
 UviTC2TLKcKBtArNYmT0SYn87n7oeGAS9uE+cVFt3Dt0+WXRV+Z+QR6EHShtZs4gNYwM
 aaiNXFC1WhVhFGVCtbR0xFBpFyALaowcBCVyY+JOmG7rUqckg5LoJkqjVyB/A78BxRIs
 eSiha33N5WOy0VmNWCCy/Kl32G2v2HyLFRqO64Q79pFrUN2eJ6zwbxLneoOq1apsEH8z
 T6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ok57uHtbOiq3OdGSevyQ4O6t5TDKu9QFX6kVIS2Yuvs=;
 b=kvpU9UNKeA2EWvka3RNx4hRYD4YctP/7L+6Nr9tLUi/DYG3H1RVA+6jLLymFIMejIB
 wWnPmhpfnNdrmgICAilaT0iBrlAASwAuG2aS23R1iT3ROjeTJEvVYdzHB5sXLxej9bMg
 qvjSN2wtD5TOLKtP/G7KT+dUvIDJVSUF23C3xmvXLh3igN3VFxJzhSya1ulrfqpUfffc
 DRv1dLP2HvKAQVbGHyD6FXWUVq1KAycIaPWQhqJSfsJuPsyyY9svA6Qq+ZSzSCRf+ziq
 kQeDmk35XhkrYCMbWtWfjNl3BGVes+q+Jr+Ww5D0qZRKw9REc7K2rkGC76B1/OLDot03
 uf7Q==
X-Gm-Message-State: AOAM532UzC15R/aMtpwrFS2+Jq8x6JxSuMx9GJIzjZR32ghF+TPdMlbP
 oRPx/PEX87w2vbZLHoMFPr+QDgqPERaZcH9c
X-Google-Smtp-Source: ABdhPJyx5SsrPKKKfmixbuT8k2voaM4JDaDqeclWKwRR5jzK2777wSYny1nMuKCoaZ4ljzGN6mAHEQ==
X-Received: by 2002:a2e:82cd:0:b0:24b:4a69:790b with SMTP id
 n13-20020a2e82cd000000b0024b4a69790bmr943651ljh.326.1649924249662; 
 Thu, 14 Apr 2022 01:17:29 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v20-20020a2e87d4000000b0024b638069b1sm117116ljj.39.2022.04.14.01.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:17:29 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH v2 3/4] ARC: implement syscall tracepoints
Date: Thu, 14 Apr 2022 11:17:23 +0300
Message-Id: <20220414081724.3177956-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414081724.3177956-1-geomatsi@gmail.com>
References: <20220414081724.3177956-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011732_470914_EC28AFCE 
X-CRM114-Status: GOOD (  14.31  )
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Implement all the bits required to support HAVE_SYSCALL_TRACEPOINTS
according to Documentation/trace/ftrace-design.rst.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/Kconfig                   |  1 +
 arch/arc/include/asm/syscall.h     |  2 ++
 arch/arc/include/asm/thread_info.h |  5 ++++-
 arch/arc/kernel/entry.S            | 12 ++++++------
 arch/arc/kernel/ptrace.c           | 21 ++++++++++++++++++---
 5 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 3c850d0f431c..9e3653253ef2 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -39,6 +39,7 @@ config ARC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_PERF_EVENTS
+	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
 	select MODULES_USE_ELF_RELA
 	select OF
diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
index 94529e89dff0..9709256e31c8 100644
--- a/arch/arc/include/asm/syscall.h
+++ b/arch/arc/include/asm/syscall.h
@@ -12,6 +12,8 @@
 #include <asm/unistd.h>
 #include <asm/ptrace.h>		/* in_syscall() */
 
+extern void *sys_call_table[];
+
 static inline long
 syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 {
diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 1e0b2e3914d5..6ba7fe417095 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -78,9 +78,9 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 #define TIF_SYSCALL_AUDIT	4	/* syscall auditing active */
 #define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
-
 /* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_MEMDIE		16
+#define TIF_SYSCALL_TRACEPOINT	17	/* syscall tracepoint instrumentation */
 
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
@@ -89,11 +89,14 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
 #define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_MEMDIE		(1<<TIF_MEMDIE)
+#define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
 
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
 				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
+#define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT)
+
 /*
  * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
  * SYSCALL_TRACE is anyway separately/unconditionally tested right after a
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 66ba549b520f..54e91df678dd 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -29,8 +29,8 @@ ENTRY(sys_clone_wrapper)
 	DISCARD_CALLEE_SAVED_USER
 
 	GET_CURR_THR_INFO_FLAGS   r10
-	btst r10, TIF_SYSCALL_TRACE
-	bnz  tracesys_exit
+	and.f 0, r10, _TIF_SYSCALL_WORK
+	bnz   tracesys_exit
 
 	b .Lret_from_system_call
 END(sys_clone_wrapper)
@@ -41,8 +41,8 @@ ENTRY(sys_clone3_wrapper)
 	DISCARD_CALLEE_SAVED_USER
 
 	GET_CURR_THR_INFO_FLAGS   r10
-	btst r10, TIF_SYSCALL_TRACE
-	bnz  tracesys_exit
+	and.f 0, r10, _TIF_SYSCALL_WORK
+	bnz   tracesys_exit
 
 	b .Lret_from_system_call
 END(sys_clone3_wrapper)
@@ -247,8 +247,8 @@ ENTRY(EV_Trap)
 
 	; If syscall tracing ongoing, invoke pre-post-hooks
 	GET_CURR_THR_INFO_FLAGS   r10
-	btst r10, TIF_SYSCALL_TRACE
-	bnz tracesys  ; this never comes back
+	and.f 0, r10, _TIF_SYSCALL_WORK
+	bnz   tracesys  ; this never comes back
 
 	;============ Normal syscall case
 
diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index 5fa5bceb83f3..da7542cea0d8 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -9,6 +9,9 @@
 #include <linux/unistd.h>
 #include <linux/elf.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/syscalls.h>
+
 struct pt_regs_offset {
 	const char *name;
 	int offset;
@@ -340,15 +343,27 @@ long arch_ptrace(struct task_struct *child, long request,
 
 asmlinkage int syscall_trace_entry(struct pt_regs *regs)
 {
-	if (ptrace_report_syscall_entry(regs))
-		return ULONG_MAX;
+	if (test_thread_flag(TIF_SYSCALL_TRACE))
+		if (ptrace_report_syscall_entry(regs))
+			return ULONG_MAX;
+
+#ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
+	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
+		trace_sys_enter(regs, syscall_get_nr(current, regs));
+#endif
 
 	return regs->r8;
 }
 
 asmlinkage void syscall_trace_exit(struct pt_regs *regs)
 {
-	ptrace_report_syscall_exit(regs, 0);
+	if (test_thread_flag(TIF_SYSCALL_TRACE))
+		ptrace_report_syscall_exit(regs, 0);
+
+#ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
+	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
+		trace_sys_exit(regs, regs_return_value(regs));
+#endif
 }
 
 int regs_query_register_offset(const char *name)
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
