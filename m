Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BB2C43463
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE2D21D42
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ycs4x1IV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nfDVGOAg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EmzU/Ha7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3MSiTX3/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE2D21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=h6L7Ku166bcTZ8Yq9wnFwfOF1JjcShD/F/5zjqi4F/8=; b=ycs4x1IVG9/Z2gajrFrWAWhdq
	78Qbg2ppaOLz+rBP4fRJB7LZ+TRFwUba9cyuiilr8pVaapQrcS7jbSQ+agp3Q01ZHpmNj274Xgps+
	GDIYPh0XsrTOrjhCFM9Z/Ly2rLJnr3h+jOli1iFgHXw9G4mfjIEU9oSeBJbqtlJwfR3f7sEPqe9x/
	X6pci6I8doOlsdSBGgiaLwzLZWH/IqL3HXxvD4nIKMOoP0wMBygjIWK3flqr5zYr5cz3xmevSk4yW
	xfvCaVkbHPithvt0uRTfa7VRCH0dCRvBA1a63IfQlBomzLfrMF0/Uv1lFcVZuCDXv/1fEwtpgYw/Z
	SkDz/DMEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZqB-0006dw-SC; Sat, 19 Sep 2020 10:11:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZq8-0006cm-HR; Sat, 19 Sep 2020 10:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=CYFZGC5XFXwIeIdTxBbBsuptLpgHnLvRMVVfnfU0Lek=; b=nfDVGOAg7EZz5rIQfu1yzDX14x
 4xiccpKi6SzJHMgLktL6eoLKyc/sxrwSnTFKAADY/TTzWJMDFkuknmttsPUhvCcIWXUELB9u4qOV2
 MsTNjwIknpfTcTC9yd9eZ7tnzdvYJkwcGnijMQUslTbb/f9e0Lmn5KvwNXlsCUe+x5Q1pCCstA9kX
 tkQEANhTZ4Ed1LotqW6Ncsa1/SziHaTeDSnBGUFY/5m631HFC3TfyfA+6Wum+dyLDanx7GlYP0wvB
 IBTGiqwPB6Oe8hU4s3vjkg/GeE6yRykAi3kT0/wZTv9Ack2Zerh56OJEWe0Jm03MU5Bnl1oNKSxlF
 vMkJxUcA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZVb-00060v-FQ; Sat, 19 Sep 2020 09:50:35 +0000
Message-Id: <20200919092617.279626264@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=CYFZGC5XFXwIeIdTxBbBsuptLpgHnLvRMVVfnfU0Lek=;
 b=EmzU/Ha7VTgCHPh+OPwMMAxl1vQw2EZbgMLA0QK5w0tgoNA9cK5GrZ+iRnxTLUvFmO6uvT
 5xni0RQrFsvKWLEwnxRXfnK1ZoluDBJkq1/t4BopRLVlWdsZl8LGtkYO5VPQeJOAVh0loT
 3pxfhX7Xzg7eD/HDkG7ZRFVEUuI8wNqIatH3iT0c6USltX67MnShz/PRGAOuuY98QpJcJF
 RKzxtBefOl4frfc7PbgyYDsbLhAgIw9uUlbWv2A+h4Ox5jUUab+vAsmRMaNniDuggLqVCk
 2DATRO4G8SXRfgThVN15NoLylHOz2CDJg97svW/xOW73oUnocZFgU2gqrFZxtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=CYFZGC5XFXwIeIdTxBbBsuptLpgHnLvRMVVfnfU0Lek=;
 b=3MSiTX3/QibrqvIYfxIqARkPAbMeHtlldJHdL2IUUoOqwRf5x+Ph+DQIW8CwuSUBjdR486
 DKAgHE+Y4cwJC9Ag==
Date: Sat, 19 Sep 2020 11:18:05 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 14/15] sched: highmem: Store temporary kmaps in task struct
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_105019_758688_4C598905 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Instead of storing the map per CPU provide and use per task storage. That
prepares for temporary kmaps which are preemptible.

The context switch code is preparatory and not yet in use because
kmap_atomic() runs with preemption disabled. Will be made usable in the
next step.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/highmem.h |    1 
 include/linux/sched.h   |    9 +++++++
 kernel/sched/core.c     |   10 ++++++++
 mm/highmem.c            |   59 ++++++++++++++++++++++++++++++++++++++++++------
 4 files changed, 72 insertions(+), 7 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -38,6 +38,7 @@ static inline void invalidate_kernel_vma
 void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
 void *kmap_atomic_page_prot(struct page *page, pgprot_t prot);
 void kunmap_atomic_indexed(void *vaddr);
+void kmap_switch_temporary(struct task_struct *prev, struct task_struct *next);
 # ifndef ARCH_NEEDS_KMAP_HIGH_GET
 static inline void *arch_kmap_temporary_high_get(struct page *page)
 {
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -34,6 +34,7 @@
 #include <linux/rseq.h>
 #include <linux/seqlock.h>
 #include <linux/kcsan.h>
+#include <asm/kmap_types.h>
 
 /* task_struct member predeclarations (sorted alphabetically): */
 struct audit_context;
@@ -628,6 +629,13 @@ struct wake_q_node {
 	struct wake_q_node *next;
 };
 
+struct kmap_ctrl {
+#ifdef CONFIG_KMAP_ATOMIC_GENERIC
+	int				idx;
+	pte_t				pteval[KM_TYPE_NR];
+#endif
+};
+
 struct task_struct {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/*
@@ -1280,6 +1288,7 @@ struct task_struct {
 	unsigned int			sequential_io;
 	unsigned int			sequential_io_avg;
 #endif
+	struct kmap_ctrl		kmap_ctrl;
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	unsigned long			task_state_change;
 #endif
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3529,6 +3529,15 @@ static inline void finish_lock_switch(st
 # define finish_arch_post_lock_switch()	do { } while (0)
 #endif
 
+static inline void kmap_temp_switch(struct task_struct *prev,
+				    struct task_struct *next)
+{
+#ifdef CONFIG_HIGHMEM
+	if (unlikely(prev->kmap_ctrl.idx || next->kmap_ctrl.idx))
+		kmap_switch_temporary(prev, next);
+#endif
+}
+
 /**
  * prepare_task_switch - prepare to switch tasks
  * @rq: the runqueue preparing to switch
@@ -3551,6 +3560,7 @@ prepare_task_switch(struct rq *rq, struc
 	perf_event_task_sched_out(prev, next);
 	rseq_preempt(prev);
 	fire_sched_out_preempt_notifiers(prev, next);
+	kmap_temp_switch(prev, next);
 	prepare_task(next);
 	prepare_arch_switch(next);
 }
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -370,6 +370,7 @@ void kunmap_high(struct page *page)
 	if (need_wakeup)
 		wake_up(pkmap_map_wait);
 }
+
 EXPORT_SYMBOL(kunmap_high);
 #else
 static inline void kmap_high_unmap_temporary(unsigned long vaddr) { }
@@ -377,11 +378,9 @@ static inline void kmap_high_unmap_tempo
 
 #ifdef CONFIG_KMAP_ATOMIC_GENERIC
 
-static DEFINE_PER_CPU(int, __kmap_atomic_idx);
-
 static inline int kmap_atomic_idx_push(void)
 {
-	int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
+	int idx = current->kmap_ctrl.idx++;
 
 	WARN_ON_ONCE(in_irq() && !irqs_disabled());
 	BUG_ON(idx >= KM_TYPE_NR);
@@ -390,14 +389,13 @@ static inline int kmap_atomic_idx_push(v
 
 static inline int kmap_atomic_idx(void)
 {
-	return __this_cpu_read(__kmap_atomic_idx) - 1;
+	return current->kmap_ctrl.idx - 1;
 }
 
 static inline void kmap_atomic_idx_pop(void)
 {
-	int idx = __this_cpu_dec_return(__kmap_atomic_idx);
-
-	BUG_ON(idx < 0);
+	current->kmap_ctrl.idx--;
+	BUG_ON(current->kmap_ctrl.idx < 0);
 }
 
 #ifndef arch_kmap_temp_post_map
@@ -447,6 +445,7 @@ static void *__kmap_atomic_pfn_prot(unsi
 	pteval = pfn_pte(pfn, prot);
 	set_pte(kmap_pte - idx, pteval);
 	arch_kmap_temp_post_map(vaddr, pteval);
+	current->kmap_ctrl.pteval[kmap_atomic_idx()] = pteval;
 	preempt_enable();
 
 	return (void *)vaddr;
@@ -499,11 +498,57 @@ void kunmap_atomic_indexed(void *vaddr)
 	arch_kmap_temp_pre_unmap(addr);
 	pte_clear(&init_mm, addr, kmap_pte - idx);
 	arch_kmap_temp_post_unmap(addr);
+	current->kmap_ctrl.pteval[kmap_atomic_idx()] = __pte(0);
 	kmap_atomic_idx_pop();
 	preempt_enable();
 	pagefault_enable();
 }
 EXPORT_SYMBOL(kunmap_atomic_indexed);
+
+void kmap_switch_temporary(struct task_struct *prev, struct task_struct *next)
+{
+	pte_t *kmap_pte = kmap_get_pte();
+	int i;
+
+	/* Clear @prev's kmaps */
+	for (i = 0; i < prev->kmap_ctrl.idx; i++) {
+		pte_t pteval = prev->kmap_ctrl.pteval[i];
+		unsigned long addr;
+		int idx;
+
+		if (WARN_ON_ONCE(pte_none(pteval)))
+			continue;
+
+		/*
+		 * This is a horrible hack for XTENSA to calculate the
+		 * coloured PTE index. Uses the PFN encoded into the pteval
+		 * and the map index calculation because the actual mapped
+		 * virtual address is not stored in task::kmap_ctrl.
+		 *
+		 * For any sane architecture that address calculation is
+		 * optimized out.
+		 */
+		idx = arch_kmap_temp_map_idx(i, pte_pfn(pteval));
+
+		arch_kmap_temp_pre_unmap(addr);
+		pte_clear(&init_mm, addr, kmap_pte - idx);
+		arch_kmap_temp_post_unmap(addr);
+	}
+
+	/* Restore @next's kmaps */
+	for (i = 0; i < next->kmap_ctrl.idx; i++) {
+		pte_t pteval = next->kmap_ctrl.pteval[i];
+		int idx;
+
+		if (WARN_ON_ONCE(pte_none(pteval)))
+			continue;
+
+		idx = arch_kmap_temp_map_idx(i, pte_pfn(pteval));
+		set_pte(kmap_pte - idx, pteval);
+		arch_kmap_temp_post_map(addr, pteval);
+	}
+}
+
 #endif
 
 #if defined(HASHED_PAGE_VIRTUAL)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
