Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D517C433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Apr 2022 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlFMSotRR8QMwMHyuxdUfaZQz0Zqc2UykjolE7b1uvw=; b=gtfL6yQ25iMf5T
	17giJfNmJOxwan1rFiY9FjL9kqyIuZVMVL2G7IVXbf8bxBOa64HTLEFa8c0BRGGQ+YTXVWXKmmBee
	2bXfrZ0pYJjF5IxVIZdEpRjnD4dd1cZUnHBzR7OscWzcgYF+aifQZ20b0tl31HB8dBcjkVte4WfqZ
	/aKLRfXYaEzfRmelIBtpEpfn4qEXk+5VTDYg3MYBz2K1YrEl3GLn8jYiIMH1u4k5WivGgnOevkjqQ
	D/2gtJtyPPfrlbBWbY+DrYhooT9PYAq3iFq8lezbS+vIGzD48a0oW9BzEmtp07hlxgJuPhdW+BnvO
	PCVGvi2VPdfkTZqRJSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncr07-000OBl-0H; Fri, 08 Apr 2022 15:58:19 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncr03-000O8P-51
 for linux-snps-arc@lists.infradead.org; Fri, 08 Apr 2022 15:58:17 +0000
Received: by mail-lj1-x22b.google.com with SMTP id a30so12010611ljq.13
 for <linux-snps-arc@lists.infradead.org>; Fri, 08 Apr 2022 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ok57uHtbOiq3OdGSevyQ4O6t5TDKu9QFX6kVIS2Yuvs=;
 b=ZvWA7UvXH3V6dl8PIQkyNFMwig7IJ9iwScGs2XZ2x/WdIN9nouh6dDINIxzjD5rZTo
 LaTlhJds9lk2lnsvgnImYoqCgnFYEJVVzv75XWTsFSewF9mmL8syp+L2d+Wymb0COJC6
 pqO7DgS+dwrYUI0NT4zXCmMtzV+WntQ2eRC1CXLSnB2cZY7dK53act9A1qXSu9M4Cdnx
 y2brYGdF3CdnZqgRKB5GSXWLKaIV4UAYMEL0npMGvUcZR8hw9fu15NqPokENy7zxl+f6
 3fF2INWLrDoSO2DOrWX6ZkOc4sbSdfSv4NhKUsuik52WYI3qcyY8xG6tx6sdeWtcFxHg
 IHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ok57uHtbOiq3OdGSevyQ4O6t5TDKu9QFX6kVIS2Yuvs=;
 b=IZTMvPbGgXimlKr4VVC87X1+v2k1Ic+85c3JgUcPpYJNH7s6WdXuc5u9Z8XdkxFe9R
 L3uz6oj2cY5jfr/ON2gAg8lprb9JC5mdRYAsoaFHQbJLnFAgyeURiMn9x8DY+CJbrLbY
 /XtnUrBbcfDpCFMDd4E55IB8mvBoiIWI18Mt8Mhz2wXjhe9Xm6K+IbKdNw6UU1QqCtKv
 15m2NApi0/jHUQGoU/pyceyyicsUFCBO9GPh4uUAUuYVygGtfwwbEw13mEFnhjsGHN4n
 1DBcHXq45Y0Lf7VM2Mz8/yMo2faYyd2pPKJw32sHUxXMaklHz0sR+kQFgmLcx13gYmcm
 ifOQ==
X-Gm-Message-State: AOAM530dVWqt8q/fClx3Slg8yRU3Z7JEBcZI45fEgVBOySmjTYLaGCzO
 7BvHLpqWBnijolu1j8bbqFsHNFmrkjgxDw==
X-Google-Smtp-Source: ABdhPJw0wcCL2rwcmOW3HH1l8MfxgRORBQRrzPLp3pujUNV9FHkmNa1KCJGgwq3C56GWLGLH2h1R2Q==
X-Received: by 2002:a2e:b8d6:0:b0:24a:c582:3a19 with SMTP id
 s22-20020a2eb8d6000000b0024ac5823a19mr11937177ljp.195.1649433491567; 
 Fri, 08 Apr 2022 08:58:11 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r9-20020a2e9949000000b0024b46eef85bsm461826ljj.127.2022.04.08.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:58:11 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 4/4] ARC: implement syscall tracepoints
Date: Fri,  8 Apr 2022 18:58:04 +0300
Message-Id: <20220408155804.587197-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408155804.587197-1-geomatsi@gmail.com>
References: <20220408155804.587197-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_085815_234241_D54255B6 
X-CRM114-Status: GOOD (  14.78  )
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
