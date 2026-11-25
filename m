Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DD606A336
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Nov 2026 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiMA+zYg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdwJb1xN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lz4Nd8fdP4sSpurT9GAj4gqD9OfcUVyy2llHB643Lr8=; b=fiMA+zYgv9p9ujkzki0lmMEIEi
	ta8y0/SLCHHfePenQNyjQsCeMvNj2h/gFXKzt4Gn7DtTPzcnmsSL1CpRjPtsYP/ACJSD0khvnORmD
	DH4E1loA3V1H5sW+nwCVEfOTPLOOekWrL4oLJCh8R7/d5ry0L0dc5qn51/I7Sfnr0WkmfiBxykY16
	5PnVoFyXRhqp7chWWL+xsWIkZ9bBUlJj+Mcp04vFSeHr2GPmmJJSk5I44Oa1FN/biQx7a7L/ZcK5E
	4unBgBNVGF0Hj4C9qjMaB7co928d2w9UvowDtnvx3yc2W/hF0aWY2GcqnNB0aQRxN17e8VBW9z3bt
	iXZjRIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRN-0000000BSms-2F33;
	Wed, 25 Nov 2026 22:26:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLPt-0000000BSLz-1bAq
	for linux-snps-arc@lists.infradead.org;
	Wed, 25 Nov 2026 22:24:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1FF56219E;
	Wed, 25 Nov 2026 22:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D9A1F000D8;
	Wed, 25 Nov 2026 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645480;
	bh=GypxCgrSGuakcSYm30KvvekU+/B96aMez0HNLTb7bn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LdwJb1xNj9tse3B3xT+FbXVT4u7a8JC3MkMPG+1YYTu6AY1R9PmXmknhfACiNmsbm
	 FqFyPYT5ff0Ro9BQ47u1SnpQrS35w0RIFh5SAmv8wAKHld9hKDKQs4aGhCTEw2D4VF
	 v7jygZquPf0N3hzPDv9Owc1vUBaxu+dNQnsIyDYs28hn34vmlrWRD/Ag1unXBu8laF
	 8kX1InEEDLUW6/NwppBmRDIPe1ltK5nDDOc4Kue44jknJYtF76AHTZEx7i0fWAxZdi
	 gAYN1QlK//wL1/5uGP2/e8AZZ6ARYv40gwXh4Lu+Hn4rlGrpN2bWd0UwZ+NArpK2/0
	 x4lrMus/wYW+g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 33/47] clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:16 +0100
Message-ID: <20261125222230.22508-34-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4451c5997cc6..3fb757c6bc7f 100644
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
2.56.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
