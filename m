Return-Path: <SRS0=C9XM=5B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C187BC18E5B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2020 14:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF4F2051A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2020 14:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pu9Y/uzW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="GhvdHBWp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF4F2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1Sf4DFWxQfbRLaT495o5+Pchylfy6GdYY2PFltXUMQ=; b=pu9Y/uzWwuUXk7
	ZLmHxWJmagsCUtLAPzPtwr6riz8rz/HALDCUPt1ozNKs7vLGDROe3GOmUFhlSD+R8nGHtse0vCakS
	LnGI1CRz0l0cnJ89ITkYtU5lYJe+mM8EfRTvtqpWJ5dIZGKwRxvbjLpO5bdPe/4e5NgiWnEoNEGRx
	n2oPe88spGIX+/kHmHjplb7kN0WOoVUnhGDaGVnux+TVMajapGvWar36BFeETcyIAqoqoZt6LqkJE
	oatVczir5dWv1iUUocQKnKAZ+pCI0OXh/daFWxKctxIrfN9TPFsCBLML6C7QCDE2r2bwrMMdWmxDg
	Ezd67ngL6MjqGPk6eyCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDquM-0000aW-SU; Mon, 16 Mar 2020 14:39:58 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDquK-0000Z9-I9
 for linux-snps-arc@lists.infradead.org; Mon, 16 Mar 2020 14:39:58 +0000
Received: by mail-pj1-x1041.google.com with SMTP id ca13so8819976pjb.2
 for <linux-snps-arc@lists.infradead.org>; Mon, 16 Mar 2020 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BBUeXVxAq+EmN+1GPqITYbbNMUjqDoXzGs9Et5OlzcY=;
 b=GhvdHBWpXtpgR3Hhk8y3gEIvVK0GpET9RwyOt/734utRDOPRy8C48XmLph/E5fPHH1
 vqw6iGlTI3zGY/zgKwWIeMBjm5tqFxHHx5j9YmArUYSurDb8tt0yKzYB+bn6+ASKrV7b
 VoM2rf8YAh2mE13yQd2LPV+Zp8duQRDtTDo+qk6VONtfpXf5XdEoFptJ//4IATLdycEC
 gN4L5QfoHmGBW1zMdLjhwKzEeirbmOPzq35nbvrZ1I7VQpzlxl8yCxWko8kx4HOKV3XZ
 8YMUEtm8S+U/u5xUXamcqPDOZ0Z+nbZ2kvs2SrQ3loR6CbtpSyrou7LYJ/ruMbGh+ybg
 rzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBUeXVxAq+EmN+1GPqITYbbNMUjqDoXzGs9Et5OlzcY=;
 b=GR/5T/Cch1bO2rOgxBKrDX5TphwLTNGJJz+bhtZ0dlKifn37L0K2TFxes2caGJcOUY
 7QqoY71wx1OGjGWl5AOlJJMCLwJOReC/rtxrC9U6zoB3oqDmJ3lZlG9ZWYk5G/7pUl24
 sboNHWdxhFVvcmqiEAgahIG/iHprJJ3ClOcPvrt1g3oBgJ3kdT0cXeNoPRPS53PRbSh2
 ZMfofmuP5JTgZcOVjrLu/5VZxjfCBy0u/hSvmVwH42nEHeDKPdG/5xN5zbH8dpaMdqHM
 moppjOUBzMbXbvxKww6MLev7lW5jH+Sr14+6DzlpVjCPgKLMJWXIVe4ChLpzXQWIxDeM
 2QIQ==
X-Gm-Message-State: ANhLgQ0qJe0v9SMFFUhgv7aHB05es7ayxK4u4x2gQWDMUK+htCj1IUFJ
 UjNS2Q/6FGiajH6muMRQRWkeBg==
X-Google-Smtp-Source: ADFU+vuBUPHG35c4F1mbkDyxS1MGsWLQo0xMxqUa7tuBtwG1IKz6wWYMmb8olg23cVgOqQ/OVmznng==
X-Received: by 2002:a17:90a:394d:: with SMTP id
 n13mr27419698pjf.125.1584369595687; 
 Mon, 16 Mar 2020 07:39:55 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 07:39:55 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCHv2 03/50] arc: Add show_stack_loglvl()
Date: Mon, 16 Mar 2020 14:38:29 +0000
Message-Id: <20200316143916.195608-4-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_073956_603289_BCF5CD2A 
X-CRM114-Status: GOOD (  13.26  )
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
index d2999503fb8a..660681101523 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -242,5 +242,5 @@ void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
 
 	/* Show stack trace if this Fatality happened in kernel mode */
 	if (!user_mode(regs))
-		show_stacktrace(current, regs);
+		show_stacktrace(current, regs, KERN_DEFAULT);
 }
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
