Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CF9C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:32:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D269206DD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQDMZo+R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FpvHwJm6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="02FwbJXl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D269206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=l29l7Rz2bOS0gXKrtDjQVVnaDTRHwF1Ft2b7ebt73+8=; b=sQDMZo+R7dL+twH/inDoojj1K
	xsaAl3Hc1Lgwoix1nFM64nC+6QdaAts1kvFp+jReDWTJiOee2lX8QPFdo2iIj7ep4HMXAna0dNOPA
	rcXIa0w6lfovukJv5oFvxEaGgiCzvjx56EFTJvspUITpR1BAPXJgFgHcQSEq3pgJmEsDkhyRMIMSh
	IHnvb4gEjojT4WBOdjjPAu109X65csoeABw70ndlyUHp6oxeerZm60MDxRnjkBUV3NvZHNUeWwZiQ
	CUUsM9am4oZKC4T9EAV9Cfs4LgZwQMtiaL6olITBOa4qCPdJmAeZZ4zAZODOyV8U2BNO8SCoProZc
	P2yeUFiHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGT2-0004is-VE; Thu, 29 Oct 2020 22:32:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGSq-0004b2-6C; Thu, 29 Oct 2020 22:32:14 +0000
Message-Id: <20201029222650.648971542@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=KaNIP+gHbCxEiFjMUXsw2ll/YULzf8E240MXoq9IavQ=;
 b=FpvHwJm6pm9/uI4al2h2FOCNdJpqPqZtax3Dclwt8IA/Oh5Ponv2lMvh1GZE/kMxwHRMcZ
 5Pj/25hwyvseGa2stRrQ6hWDY3/J9EfoBCubT4NV9cRLaJkPnkbul6TYsf2UE/bjO6nYqy
 MP3NqSdxEeVXzr2dPAJp2eN+544XjjCZzvysUGJFSV0DJ4F1x7pAoj62zoQgnVkHmJBzJv
 2aMoaV1jf69bT21PfPJ2XWc/VjbaCiFGLIpd8e3CUva0mbOXWUXlSMVPOsqCdikb0DRuKV
 GDHVG9u29UKonL0Qkb43DnDsJff/u2qboH5QLh+1dzup/h2AbZ3PDpxH1nrUVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=KaNIP+gHbCxEiFjMUXsw2ll/YULzf8E240MXoq9IavQ=;
 b=02FwbJXl3OAIrXjRtBQ0DicQZ2DyF6HHvJuRKCFGyMrTUHOwJHXKipX4ubGORyuMMUanCP
 7rAr7hNu3+xpCHBw==
Date: Thu, 29 Oct 2020 23:18:07 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 01/18] sched: Make migrate_disable/enable() independent of
 RT
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_183212_520165_06F1495F 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Now that the scheduler can deal with migrate disable properly, there is no
real compelling reason to make it only available for RT.

There are quite some code pathes which needlessly disable preemption in
order to prevent migration and some constructs like kmap_atomic() enforce
it implicitly.

Making it available independent of RT allows to provide a preemptible
variant of kmap_atomic() and makes the code more consistent in general.

FIXME: Rework the comment in preempt.h

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
---
 include/linux/preempt.h |   38 +++-----------------------------------
 include/linux/sched.h   |    2 +-
 kernel/sched/core.c     |   12 ++----------
 kernel/sched/sched.h    |    2 +-
 lib/smp_processor_id.c  |    2 +-
 5 files changed, 8 insertions(+), 48 deletions(-)

--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -322,7 +322,7 @@ static inline void preempt_notifier_init
 
 #endif
 
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 
 /*
  * Migrate-Disable and why it is undesired.
@@ -382,43 +382,11 @@ static inline void preempt_notifier_init
 extern void migrate_disable(void);
 extern void migrate_enable(void);
 
-#elif defined(CONFIG_PREEMPT_RT)
+#else
 
 static inline void migrate_disable(void) { }
 static inline void migrate_enable(void) { }
 
-#else /* !CONFIG_PREEMPT_RT */
-
-/**
- * migrate_disable - Prevent migration of the current task
- *
- * Maps to preempt_disable() which also disables preemption. Use
- * migrate_disable() to annotate that the intent is to prevent migration,
- * but not necessarily preemption.
- *
- * Can be invoked nested like preempt_disable() and needs the corresponding
- * number of migrate_enable() invocations.
- */
-static __always_inline void migrate_disable(void)
-{
-	preempt_disable();
-}
-
-/**
- * migrate_enable - Allow migration of the current task
- *
- * Counterpart to migrate_disable().
- *
- * As migrate_disable() can be invoked nested, only the outermost invocation
- * reenables migration.
- *
- * Currently mapped to preempt_enable().
- */
-static __always_inline void migrate_enable(void)
-{
-	preempt_enable();
-}
-
-#endif /* CONFIG_SMP && CONFIG_PREEMPT_RT */
+#endif /* CONFIG_SMP */
 
 #endif /* __LINUX_PREEMPT_H */
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -715,7 +715,7 @@ struct task_struct {
 	const cpumask_t			*cpus_ptr;
 	cpumask_t			cpus_mask;
 	void				*migration_pending;
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 	unsigned short			migration_disabled;
 #endif
 	unsigned short			migration_flags;
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1696,8 +1696,6 @@ void check_preempt_curr(struct rq *rq, s
 
 #ifdef CONFIG_SMP
 
-#ifdef CONFIG_PREEMPT_RT
-
 static void
 __do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask, u32 flags);
 
@@ -1772,8 +1770,6 @@ static inline bool rq_has_pinned_tasks(s
 	return rq->nr_pinned;
 }
 
-#endif
-
 /*
  * Per-CPU kthreads are allowed to run on !active && online CPUs, see
  * __set_cpus_allowed_ptr() and select_fallback_rq().
@@ -2841,7 +2837,7 @@ void sched_set_stop_task(int cpu, struct
 	}
 }
 
-#else
+#else /* CONFIG_SMP */
 
 static inline int __set_cpus_allowed_ptr(struct task_struct *p,
 					 const struct cpumask *new_mask,
@@ -2850,10 +2846,6 @@ static inline int __set_cpus_allowed_ptr
 	return set_cpus_allowed_ptr(p, new_mask);
 }
 
-#endif /* CONFIG_SMP */
-
-#if !defined(CONFIG_SMP) || !defined(CONFIG_PREEMPT_RT)
-
 static inline void migrate_disable_switch(struct rq *rq, struct task_struct *p) { }
 
 static inline bool rq_has_pinned_tasks(struct rq *rq)
@@ -2861,7 +2853,7 @@ static inline bool rq_has_pinned_tasks(s
 	return false;
 }
 
-#endif
+#endif /* !CONFIG_SMP */
 
 static void
 ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1056,7 +1056,7 @@ struct rq {
 	struct cpuidle_state	*idle_state;
 #endif
 
-#if defined(CONFIG_PREEMPT_RT) && defined(CONFIG_SMP)
+#if CONFIG_SMP
 	unsigned int		nr_pinned;
 #endif
 	unsigned int		push_busy;
--- a/lib/smp_processor_id.c
+++ b/lib/smp_processor_id.c
@@ -26,7 +26,7 @@ unsigned int check_preemption_disabled(c
 	if (current->nr_cpus_allowed == 1)
 		goto out;
 
-#if defined(CONFIG_SMP) && defined(CONFIG_PREEMPT_RT)
+#ifdef CONFIG_SMP
 	if (current->migration_disabled)
 		goto out;
 #endif


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
