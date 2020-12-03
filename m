Return-Path: <SRS0=5ghb=FH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F17C4CC64
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 14:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E8922CB9
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 14:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54E8922CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QiVWFtR8kali3rYVxzxg+zVuiQcnjZm54+bKa3pkPKM=; b=DQzjco+DkRYEJhcWdwlW2tUXX
	Oeo4zOeAd9zE6u+Dybhqv6JMdMjlFdCxZy9dBItJvfzq4sCs7CGyPY97+ECHbp7Yn+R1CmETkUfr+
	B/aCFIKfBT+tYJ2apWzs/umv++Tlhj8Px3TEAMIi+lum0TjFFy1/6OweZURP4f7qDaAMRR5XoRivJ
	NJzSVNXHjk00+yrkuvEi+sr8AUBRhO6B5HfuKw0lT5ys5beZC2HwEOOqNbN/YwlJabMPNgYodRiaG
	Uwqh5M7KQVAkYAA0WLZRYrPU39bTfxbmMS5J/nHkGQFlakA+3UJ8xmoFqY8d1gAPoeMc9mC263E7H
	LxyT9eyBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkome-0006Wp-69; Thu, 03 Dec 2020 13:36:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkogy-0003Rm-4i
 for linux-snps-arc@lists.infradead.org; Thu, 03 Dec 2020 13:31:00 +0000
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 4/9] ARC: stack unwinding: don't assume
 non-current task is sleeping
Date: Thu,  3 Dec 2020 08:30:26 -0500
Message-Id: <20201203133031.931763-4-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203133031.931763-1-sashal@kernel.org>
References: <20201203133031.931763-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_083040_667917_5E67782C 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit e42404fa10fd11fe72d0a0e149a321d10e577715 ]

To start stack unwinding (SP, PC and BLINK) are needed. When the
explicit execution context (pt_regs etc) is not available, unwinder
assumes the task is sleeping (in __switch_to()) and fetches SP and BLINK
from kernel mode stack.

But this assumption is not true, specially in a SMP system, when top
runs on 1 core, there may be active running processes on all cores.

So when unwinding non courrent tasks, ensure they are NOT running.

And while at it, handle the self unwinding case explicitly.

This came out of investigation of a customer reported hang with
rcutorture+top

Link: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/31
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/kernel/stacktrace.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
index b007c06efbea9..35d418cde03b5 100644
--- a/arch/arc/kernel/stacktrace.c
+++ b/arch/arc/kernel/stacktrace.c
@@ -41,15 +41,15 @@
 
 #ifdef CONFIG_ARC_DW2_UNWIND
 
-static void seed_unwind_frame_info(struct task_struct *tsk,
-				   struct pt_regs *regs,
-				   struct unwind_frame_info *frame_info)
+static int
+seed_unwind_frame_info(struct task_struct *tsk, struct pt_regs *regs,
+		       struct unwind_frame_info *frame_info)
 {
 	/*
 	 * synchronous unwinding (e.g. dump_stack)
 	 *  - uses current values of SP and friends
 	 */
-	if (tsk == NULL && regs == NULL) {
+	if (regs == NULL && (tsk == NULL || tsk == current)) {
 		unsigned long fp, sp, blink, ret;
 		frame_info->task = current;
 
@@ -68,11 +68,15 @@ static void seed_unwind_frame_info(struct task_struct *tsk,
 		frame_info->call_frame = 0;
 	} else if (regs == NULL) {
 		/*
-		 * Asynchronous unwinding of sleeping task
-		 *  - Gets SP etc from task's pt_regs (saved bottom of kernel
-		 *    mode stack of task)
+		 * Asynchronous unwinding of a likely sleeping task
+		 *  - first ensure it is actually sleeping
+		 *  - if so, it will be in __switch_to, kernel mode SP of task
+		 *    is safe-kept and BLINK at a well known location in there
 		 */
 
+		if (tsk->state == TASK_RUNNING)
+			return -1;
+
 		frame_info->task = tsk;
 
 		frame_info->regs.r27 = TSK_K_FP(tsk);
@@ -106,6 +110,8 @@ static void seed_unwind_frame_info(struct task_struct *tsk,
 		frame_info->regs.r63 = regs->ret;
 		frame_info->call_frame = 0;
 	}
+
+	return 0;
 }
 
 #endif
@@ -119,7 +125,8 @@ arc_unwind_core(struct task_struct *tsk, struct pt_regs *regs,
 	unsigned int address;
 	struct unwind_frame_info frame_info;
 
-	seed_unwind_frame_info(tsk, regs, &frame_info);
+	if (seed_unwind_frame_info(tsk, regs, &frame_info))
+		return 0;
 
 	while (1) {
 		address = UNW_PC(&frame_info);
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
