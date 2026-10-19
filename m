Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF97CCF2DE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKUgSZIZ8Rg9AMMwzcmCL5dYf5I7UnVjhLJa5juKCCc=; b=FmWn4FDzuQXUv/
	dbSVfQMnzFfhx8nsGvUP+9ixoUUaewbZXxK/0JWZ0h3zOkhKeYdYzdJDb1MpbVWbxbYDS0i79h/cW
	Ctr6y7cbWN2+hQRKKrHi96OTgsUujezepnwYbW8XCFk/gBc0oXJ34Lt+0grCiVhMT37LkgKpI6IOs
	pNG9VekwWAjae3EIhjj2EQsLEQrQ84x1RkHhdPVtawcrCTVq2r75aUBBLOMPhiEWIytOwLuJRxvGa
	UYBOYbt8WJDvUXpmxnKRqz4jzg+5x6Jc1wBH/U262t/JM3Ss744mh6w7tQ7T32j31g/Tiw5OtheE1
	xzNohzQnEYXb0UuC/zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8S-00000007Tbn-2OT5;
	Mon, 19 Oct 2026 13:10:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8Q-00000007TZK-3VDT
	for linux-snps-arc@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96CFA40EFF;
	Mon, 19 Oct 2026 13:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429C31F000C5;
	Mon, 19 Oct 2026 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415438;
	bh=vushEdhWRPUWLc74YEYtHFujgyQzRnNdW4KguK0R+2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kt/sI9Tb67Dw/vkigmU/TMkei4jpYI0kqUNCilROCjm1OZDJVyo6AGkB2VPcfpFXw
	 mx8t07U1IEShXLuvkt9IHpO5vAvofXngJcgWEClnoeHG8xDtrCsQ+bWO3DKCemCMvQ
	 PpulC/n1w/j0kPahwvOF8x2fgkop7opRwGMIUOiDm0pp0XbcX2BhCwM39aaFfRaKyO
	 9rGE+XoVfHJTugREZIJgNg0ymRIyrEsgGlZ13Oled/w2B3H/1GUBJysRAzWl7IAheq
	 O6gq+ClXDTa37VqUzdCnKMy9wYZuhPOq7VL7Gq5iOwx6E12WsHJU/17PXyIoEm+o5K
	 ebVL6Vmf9+kJA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-snps-arc@lists.infradead.org
Subject: [RFC PATCH 33/49] clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:40 +0200
Message-ID: <20261019130856.49711-34-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
MIME-Version: 1.0
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index e648df00c6c1..75f4cae8971e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_MIPS_GIC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
