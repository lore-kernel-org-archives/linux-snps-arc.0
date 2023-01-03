Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD8C4708E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Jan 2023 08:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A25HSH0sZcsdV6in1vJRNm+vVoGBRKnvt5FR3dC76U0=; b=RKY4pp+8BwPJmA
	9p16qlQ0Ot2Kksk2kv5Z09LbcPnalPF0XCRWBT4YgbDPhJzwOCzAJEHL1qGsYcV+7xKaN+d0kWFyl
	a+0Q//Hol96QwmKLtTzgvP78pXxSIxliviE+pgUrfgmHtQctPrOCSdFXzAxvUYqecqIlLRyZKRDZB
	RVONIwbLI9cbmTe+s9xTv0x9LUWRDVxSQcQQJDWqGurO+k6JT7HdIQ8punnXUsmPhrM3cgwNKOTqN
	jDFQpTIai1aYhIHtBc2BrrhPj5SjzhNlXHzZ9KSC8GFxS1o7PyapfBUdJzzwaHWt8IuhgTNxMjAwN
	lBbRFWWtcCDSDfKgEjFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcYs-00093K-SJ; Tue, 03 Jan 2023 08:22:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcT3-0007Q7-9o
	for linux-snps-arc@lists.infradead.org; Tue, 03 Jan 2023 08:16:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD8C2611DD;
	Tue,  3 Jan 2023 08:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6A0C433EF;
	Tue,  3 Jan 2023 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672733776;
	bh=vil6BYasED75jkWjAbJEHnhmMUqKl6TcRjI4ZiApwMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wiDSU32rKc1XBuc+PTG4wRyz2OcdsWNFlICQYrrE6wEIXWUwYRoTFrxlxFT4hwsi0
	 FEhAN5Y/gat2ZpBAmjnDkGhwFOVgW1P0uReCpK8SwnZmFXVLb2qUIjXFQ6AzDFYff+
	 qj9s/2KRQ0/2B1gEFVoiVBEC0sFVTfppHyW2dZd8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@synopsys.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 5.10 18/63] arc: add support for TIF_NOTIFY_SIGNAL
Date: Tue,  3 Jan 2023 09:13:48 +0100
Message-Id: <20230103081309.660230284@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103081308.548338576@linuxfoundation.org>
References: <20230103081308.548338576@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_001617_429139_2931C45A 
X-CRM114-Status: GOOD (  13.55  )
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

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit 53855e12588743ea128ee31f913d1c6e2f1d32c8 ]

Wire up TIF_NOTIFY_SIGNAL handling for arc.

Cc: linux-snps-arc@lists.infradead.org
Acked-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arc/include/asm/thread_info.h |    4 +++-
 arch/arc/kernel/entry.S            |    3 ++-
 arch/arc/kernel/signal.c           |    2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -79,6 +79,7 @@ static inline __attribute_const__ struct
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall auditing active */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
 
 /* true if poll_idle() is polling TIF_NEED_RESCHED */
@@ -89,11 +90,12 @@ static inline __attribute_const__ struct
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_MEMDIE		(1<<TIF_MEMDIE)
 
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
-				 _TIF_NOTIFY_RESUME)
+				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
 /*
  * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -308,7 +308,8 @@ resume_user_mode_begin:
 	mov r0, sp	; pt_regs for arg to do_signal()/do_notify_resume()
 
 	GET_CURR_THR_INFO_FLAGS   r9
-	bbit0  r9, TIF_SIGPENDING, .Lchk_notify_resume
+	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL
+	bz .Lchk_notify_resume
 
 	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
 	; in pt_reg since the "C" ABI (kernel code) will automatically
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -405,7 +405,7 @@ void do_signal(struct pt_regs *regs)
 
 	restart_scall = in_syscall(regs) && syscall_restartable(regs);
 
-	if (get_signal(&ksig)) {
+	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
 		if (restart_scall) {
 			arc_restart_syscall(&ksig.ka, regs);
 			syscall_wont_restart(regs);	/* No more restarts */



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
