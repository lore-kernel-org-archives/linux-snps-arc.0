Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60D9C3A5A0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 20:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 750CA22242
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 20:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUmIXQw7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="hLdw1dgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 750CA22242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t73FF2NjSS5Vp3OmR0I49/VrvAopkSdRBvAWvQ8GWP0=; b=YUmIXQw7axX1lO
	HRiYjQL9qKQdgPwFdd5ZnxkmC9It1HaQnbBGzuOII6nlp9D29G5r77vWDK5/PaiXQuB6vC8gbhebi
	3d0HsQFPabrj/fdqJh660RizoVYQop+wCvR1LXoPcM79friOiK5hYqsmCP2yPyS6tevc/7sStvi3C
	qs6wfrFG8+qhTan7HI/QJUDTcelGCVA+8ix+yGxj3KIHLXbxOITdbol3i2/KdSc7lWg+0fQRI2cKP
	gVwneHc+BpFX4lDSuwJGVtEdL24qSYreZm0+Xvx2AzJ4jW4l1JGXBilFSa6lB0mxmysTO3FpQfDY2
	Nj3tPTbPRFBmR3WjCNuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPtwi-0002jJ-2p; Sat, 18 Apr 2020 20:20:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPtwR-0001Sl-Ta
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 20:19:57 +0000
Received: by mail-wm1-x344.google.com with SMTP id v4so1390626wme.1
 for <linux-snps-arc@lists.infradead.org>; Sat, 18 Apr 2020 13:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXu2EOFwJavz3sK6MiIiM003uWlBfkQUW8XMZdi2rI4=;
 b=hLdw1dgXD8QL7F9IN8HjsdFrjRGya2Qu8Nt4XumpRlA0bBqDdSBqiKGPaq3qZ7ALgL
 37sEETZubQPijQtPgdKOclqxjMX8srzDounku684TU+5Hsk3JoSm9MRkAM1P6IcTtnQO
 fkG8/6FNAyJV8CljgnyqbXRz4FXg3+vKLL2Sfek5oRoQ5LL+H4FwToztD9CSV52RmOb0
 iF77J6yvfMGFpe5/wFBWMaxLcay6tFkA3UwXnW5+8o8YyTdgCCs+mU/+Tz54GxEgpSFa
 CXrGBfT5/Tq8DoADw19+8J5Z43rRHnyJJYregcIaqjoZ1hGnoMBRkYgdWpj3PqhchHGl
 vz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXu2EOFwJavz3sK6MiIiM003uWlBfkQUW8XMZdi2rI4=;
 b=arqLdVhjxN4l/HzFKGSbswacGQpxBbv8eycJq7R9ttPZ1qVOVceIox1Y71MgGYmmtW
 h+DEDiZQ5riEXgoZEy3d/z9PSL0RfSwKxtxlYxvllp183UR9YUIPPfbbODyppvrVnjgD
 dmHZddb4yVpY0lJGiyg/Dj3/Lu5E9tl2SOUC+b72I3l8WqFBIzZtwwYuG/jlhccaVJ6x
 MnBqJPfxyxjw51/l9uDg8oCHgSTKFG0NjKGa2FcrkpWKHX0/4J6uDT6r7HlfLnAA+6Zm
 68/t5qC06DKZEEZqR7gT1hnnMBWnKVXwe2XViEmMvcQlhxI0mggXQE7BafDlbRg0N8D+
 8+6g==
X-Gm-Message-State: AGi0PubIJgf0ObzCSIA/5zOgWY3luiu4JBjLwlht7SSauPVdWACv2gAh
 By55cX/LKxoLBP5rVD/4EuP90ylEd9w=
X-Google-Smtp-Source: APiQypJ1Cx2HyQcpiB0vGYBK/9Eka/kgnic/uwCXfZXsEXX4WDIKQFvneOrQbabjbpyl2HHgVAzBMA==
X-Received: by 2002:a1c:e284:: with SMTP id z126mr10038438wmg.32.1587241194635; 
 Sat, 18 Apr 2020 13:19:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id
 m1sm31735255wro.64.2020.04.18.13.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 13:19:54 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCHv3 03/50] arc: Add show_stack_loglvl()
Date: Sat, 18 Apr 2020 21:18:57 +0100
Message-Id: <20200418201944.482088-4-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_131955_950817_53373C65 
X-CRM114-Status: GOOD (  13.81  )
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
2.26.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
