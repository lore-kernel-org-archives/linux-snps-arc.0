Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAEDC5DF60
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 03:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5F9222C4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 03:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ybg+kqui";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="NNsMqgzi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5F9222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s2M3ptAhsXvyCGJ48KW6Z1BV9f8DX57zU11C27UlRE=; b=Ybg+kquifCwXGr
	M2fNjt5t5ndWMiX2X5aj+7jGC25cIJCOSxFJnvxitAAXBTnPzbInFkcsEO156D4dwi9aLaa1mnYAB
	aPsRnjBDnWgT1DAwZTivumMWSk0tjKybEgfnPLQbh1Wf4/9w1vCyx4qSQMXHsrZWiTCR+0k2BJOa7
	oSMyvcQEZx3EwvQWHXav8SUenSGJm3iyZqtlXXPLR1gK5kEYcyRJDAyfPk0GBkytf0E4rOghd4GkC
	fjA6Tx6iKp5aOIgmGcS3U8IqDg2v5yMr+k4UmCxRvInzwoPm68aNdssiV5LOCm0ZNKC94RoikiN62
	8/zUYRvT//sTCiwnw0mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSBeK-0001fX-51; Wed, 06 Nov 2019 03:06:24 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSBeH-0001eS-6N
 for linux-snps-arc@lists.infradead.org; Wed, 06 Nov 2019 03:06:22 +0000
Received: by mail-pg1-x543.google.com with SMTP id 29so4801423pgm.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 05 Nov 2019 19:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C8o6k5HWaBmjOtIiyLS1jMJRfXwPjLrMrjWhuU8k/BM=;
 b=NNsMqgziiD5TEdzTHs5dTOcWPVLiWT088RdD8H1NWbCgwJYQ7BYsKRQxF0fuAsnFST
 HXVPw9I8Dn1hvrpsc6xv9fDeZuSUi5M4GCryJJ3dUOtRKeFNa8qcjU9+XJdYPAYWX4AD
 APfHsYzdO+9V5PT0FgiH27mvseraRDwOLsY1FweIZPhgXw/qLRnYn++t/r32bMygeZjq
 JgfYLgNTlqT/WcVk6ZoPyRZn2w2PtBrM5gfvjTf/DapqwzqOXfVy7VcWP7xxXbyaaAGd
 TYDs0J9RVZ3NMPHu3wgllojn9Jqfx49jtZD9E2YX1qswngFFEeMvkgW6XHZre8EV8Lw9
 czdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C8o6k5HWaBmjOtIiyLS1jMJRfXwPjLrMrjWhuU8k/BM=;
 b=Fg7KYH89fDQ80rWgtJpygrsBsgkzNrIcvz3+GEEg2qCV9UvK8C+flps2LmEk1kPhyS
 PtvDV1m/VZ0yyMlQNa024VCXt5hciizX1r+b/FBI7Bbj9Dxpip91tnEA9GpQkjdOXqhu
 dUSNMuZ0AICY9JDPZ9P7dizEx6LM640KHLbJ1V6xob0hdOpnNRMep8VfJGLnVbn8s3Ur
 ny9hBCBvU0+LGqnz/r/1lHpP511dIf9pOm4DGfkgbXTEL8MPutDOEaU8Xpm+LLp0hb0e
 G6ynNxEZ4QIwsK2hwvIpD4xrMaOklDB79FEMFKM7+02l1lMDTIKtlbgloffXyWQDUxoL
 jgTA==
X-Gm-Message-State: APjAAAVvs+UbvbxzfpMHAMsq0r/lAoeG6JHxZPFlce0U5L25Es+fJK+S
 8BBotpgcgSJauQOzJNwJRgYPag==
X-Google-Smtp-Source: APXvYqyohr/a4KMIETeKCaTuNUm50JlxwfJtth6i4ALZ9N3BFDL5XthYfoNjHdGd1xd+voPRxQOr1g==
X-Received: by 2002:a63:3d8f:: with SMTP id k137mr167264pga.195.1573009580120; 
 Tue, 05 Nov 2019 19:06:20 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 19:06:18 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/50] arc: Add show_stack_loglvl()
Date: Wed,  6 Nov 2019 03:04:54 +0000
Message-Id: <20191106030542.868541-4-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_190621_238520_CB18B61B 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

As a good side-effect header "Stack Trace:" is now printed with the same
log level as the rest of backtrace.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/arc/include/asm/bug.h     |  3 ++-
 arch/arc/kernel/stacktrace.c   | 21 +++++++++++++++------
 arch/arc/kernel/troubleshoot.c |  2 +-
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arc/include/asm/bug.h b/arch/arc/include/asm/bug.h
index 0be19fd1a412..4c453ba96c51 100644
--- a/arch/arc/include/asm/bug.h
+++ b/arch/arc/include/asm/bug.h
@@ -13,7 +13,8 @@
 struct task_struct;
 
 void show_regs(struct pt_regs *regs);
-void show_stacktrace(struct task_struct *tsk, struct pt_regs *regs);
+void show_stacktrace(struct task_struct *tsk, struct pt_regs *regs,
+		     const char *loglvl);
 void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
 			    unsigned long address);
 void die(const char *str, struct pt_regs *regs, unsigned long address);
diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
index 1e440bbfa876..24f9cd8a12c9 100644
--- a/arch/arc/kernel/stacktrace.c
+++ b/arch/arc/kernel/stacktrace.c
@@ -158,9 +158,11 @@ arc_unwind_core(struct task_struct *tsk, struct pt_regs *regs,
 /* Call-back which plugs into unwinding core to dump the stack in
  * case of panic/OOPs/BUG etc
  */
-static int __print_sym(unsigned int address, void *unused)
+static int __print_sym(unsigned int address, void *arg)
 {
-	printk("  %pS\n", (void *)address);
+	const char *loglvl = arg;
+
+	printk("%s  %pS\n", loglvl, (void *)address);
 	return 0;
 }
 
@@ -217,17 +219,24 @@ static int __get_first_nonsched(unsigned int address, void *unused)
  *-------------------------------------------------------------------------
  */
 
-noinline void show_stacktrace(struct task_struct *tsk, struct pt_regs *regs)
+noinline void show_stacktrace(struct task_struct *tsk, struct pt_regs *regs,
+			      const char *loglvl)
 {
-	pr_info("\nStack Trace:\n");
-	arc_unwind_core(tsk, regs, __print_sym, NULL);
+	printk("%s\nStack Trace:\n", loglvl);
+	arc_unwind_core(tsk, regs, __print_sym, (void *)loglvl);
 }
 EXPORT_SYMBOL(show_stacktrace);
 
 /* Expected by sched Code */
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *sp,
+			const char *loglvl)
+{
+	show_stacktrace(tsk, NULL, loglvl);
+}
+
 void show_stack(struct task_struct *tsk, unsigned long *sp)
 {
-	show_stacktrace(tsk, NULL);
+	show_stack_loglvl(tsk, sp, KERN_DEFAULT);
 }
 
 /* Another API expected by schedular, shows up in "ps" as Wait Channel
diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index b79886a6cec8..3f8fc1efcb60 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -245,5 +245,5 @@ void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
 
 	/* Show stack trace if this Fatality happened in kernel mode */
 	if (!user_mode(regs))
-		show_stacktrace(current, regs);
+		show_stacktrace(current, regs, KERN_DEFAULT);
 }
-- 
2.23.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
