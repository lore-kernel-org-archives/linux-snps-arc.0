Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCB1C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:52:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB2C820782
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfAqNhHb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ebm/lBM+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Uqj5unVY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o9n2jAfx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB2C820782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=lfRSiqtGhDUQ4hBzm4zLZ5A9uUupSpuwrCfpD9BJRyY=; b=yfAqNhHbi2M/XAU1CUI1kssHr
	OvVWovHbdKGf88d5RJnbTroEn+n4L3X22WlNunzuzpq6ifh/xFSwP6aF5C1bNOmuo9jb+VFrA/l7e
	6WzaGBLWWeyBF55T1v03B5eqP4zqFsLOkL20iUNL+/GK6Lj/HXv9ADQ8cstW1F+b+I4b+XUhUV1QM
	QRa8Ay76dXA2nFVpQ92EyVj9nNP1d5aIEMHSHu3gzib6zhGNpO5T4ubGSnGwrlmBFZmgAQQeYMjcc
	RNc2DsSjcQJR3BzupN4Y7lolhPHOVC0vEC1HSKrx5rh1ygmjABM2fzYJVWDqFqEca71ASmsx39kVx
	WMiFnGmAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGly-00017S-K6; Thu, 29 Oct 2020 22:51:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGlj-0000zC-F0; Thu, 29 Oct 2020 22:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=pxWDXms+RLkdR685wH8ReSSfYlwhM44TN2eNrBZ0TPg=; b=ebm/lBM+tVxTO7RBTGU68r51k4
 4RXrRE5YnsP/f/GG82HCnGWPMfPFHZBh+7OkSSWkH8uhrrnJ2bQKvHQVD/mX95CR4v7VbF/tiyn23
 Y419Cv92foZETRJTkw9K9351ZLLLG+rA+8PAclJkkPWae0/shR82Z9pzDCD03Yr0XZk8xLkUFCThX
 4lhePtPb9XzoqiyZoOFEZmmHoPqnSXFZJT6ZAcI36awQPcXH5SZmUuLDgL+qegZuJGmxxu+lBMvfT
 3wNhVI6kSsTl/xNb3ZXdFa7lYHGvVYsDsWmCCIkwhQbNjbyIwIOGAgXkb1GeI8oZPSnyOhmDfytc2
 +bnhg3JA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGT4-0003GH-Su; Thu, 29 Oct 2020 22:32:44 +0000
Message-Id: <20201029222651.992069499@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=pxWDXms+RLkdR685wH8ReSSfYlwhM44TN2eNrBZ0TPg=;
 b=Uqj5unVYZnqtSO4r7Rye+ozhFPWXJKm8lEodR7nFFSetXfFan60U5mNqWBtfbZFmb533wK
 AagwLuZLoJHIUU6R44yA9vkhULrBLKQ49zEP5ApoIgmSneBZAJKzC66R3SAnuhcYRkyqr8
 eFMTo/A4RAZTlAyeOb3Mx2JvWE1XT/SvTF7vHJBB7FEtPmoAN0VZ2IUUhFsq4dhGInzFj1
 utrnCo2OVsr8dcXRXdKu12cD8JkyGHvWNqlAWqzvnunNEtmOAE/k8eSYITwlhJu4hdTVZJ
 qmoItb7a+ii8hO7pnt+rnL5xkPup7hfdYmLb8KAr7XUbi8KOPt3QTHBDXGJI9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=pxWDXms+RLkdR685wH8ReSSfYlwhM44TN2eNrBZ0TPg=;
 b=o9n2jAfx/7g/livoK+SKJuw+8e87tZ3f+Wo2TY4l/RKb9olw+TceYAFR+B2166FCpRCMRt
 xhrVQDKRQGrW/sCQ==
Date: Thu, 29 Oct 2020 23:18:20 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 14/18] mm/highmem: Remove the old kmap_atomic cruft
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_223227_554495_F8BFE1D8 
X-CRM114-Status: GOOD (  14.47  )
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

All users gone.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 include/linux/highmem.h |   61 ++----------------------------------------------
 mm/highmem.c            |   28 ++++++++++++++++++----
 2 files changed, 27 insertions(+), 62 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -88,31 +88,16 @@ static inline void kunmap(struct page *p
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
-
-#ifndef CONFIG_KMAP_LOCAL
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-void kunmap_atomic_high(void *kvaddr);
-
 static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
 	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_atomic_high_prot(page, prot);
-}
-
-static inline void __kunmap_atomic(void *vaddr)
-{
-	kunmap_atomic_high(vaddr);
+	return __kmap_local_page_prot(page, prot);
 }
-#else /* !CONFIG_KMAP_LOCAL */
 
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+static inline void *kmap_atomic(struct page *page)
 {
-	preempt_disable();
-	pagefault_disable();
-	return __kmap_local_page_prot(page, prot);
+	return kmap_atomic_prot(page, kmap_prot);
 }
 
 static inline void *kmap_atomic_pfn(unsigned long pfn)
@@ -127,13 +112,6 @@ static inline void __kunmap_atomic(void
 	kunmap_local_indexed(addr);
 }
 
-#endif /* CONFIG_KMAP_LOCAL */
-
-static inline void *kmap_atomic(struct page *page)
-{
-	return kmap_atomic_prot(page, kmap_prot);
-}
-
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
@@ -226,39 +204,6 @@ static inline void __kunmap_atomic(void
 
 #endif /* CONFIG_HIGHMEM */
 
-#if defined(CONFIG_HIGHMEM) || defined(CONFIG_X86_32)
-
-DECLARE_PER_CPU(int, __kmap_atomic_idx);
-
-static inline int kmap_atomic_idx_push(void)
-{
-	int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	WARN_ON_ONCE(in_irq() && !irqs_disabled());
-	BUG_ON(idx >= KM_TYPE_NR);
-#endif
-	return idx;
-}
-
-static inline int kmap_atomic_idx(void)
-{
-	return __this_cpu_read(__kmap_atomic_idx) - 1;
-}
-
-static inline void kmap_atomic_idx_pop(void)
-{
-#ifdef CONFIG_DEBUG_HIGHMEM
-	int idx = __this_cpu_dec_return(__kmap_atomic_idx);
-
-	BUG_ON(idx < 0);
-#else
-	__this_cpu_dec(__kmap_atomic_idx);
-#endif
-}
-
-#endif
-
 /*
  * Prevent people trying to call kunmap_atomic() as if it were kunmap()
  * kunmap_atomic() should get the return value of kmap_atomic, not the page.
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -32,10 +32,6 @@
 #include <linux/vmalloc.h>
 #include <asm/fixmap.h>
 
-#if defined(CONFIG_HIGHMEM) || defined(CONFIG_X86_32)
-DEFINE_PER_CPU(int, __kmap_atomic_idx);
-#endif
-
 /*
  * Virtual_count is not a pure "count".
  *  0 means that it is not mapped, and has not been mapped
@@ -370,6 +366,30 @@ EXPORT_SYMBOL(kunmap_high);
 #endif /* CONFIG_HIGHMEM */
 
 #ifdef CONFIG_KMAP_LOCAL
+
+static DEFINE_PER_CPU(int, __kmap_atomic_idx);
+
+static inline int kmap_atomic_idx_push(void)
+{
+	int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
+
+	WARN_ON_ONCE(in_irq() && !irqs_disabled());
+	BUG_ON(idx >= KM_TYPE_NR);
+	return idx;
+}
+
+static inline int kmap_atomic_idx(void)
+{
+	return __this_cpu_read(__kmap_atomic_idx) - 1;
+}
+
+static inline void kmap_atomic_idx_pop(void)
+{
+	int idx = __this_cpu_dec_return(__kmap_atomic_idx);
+
+	BUG_ON(idx < 0);
+}
+
 #ifndef arch_kmap_local_post_map
 # define arch_kmap_local_post_map(vaddr, pteval)	do { } while (0)
 #endif


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
