Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA0CC43464
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B44B21D42
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLkYTt0r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="faK7CJZj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2FnY2CgY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fMUgmEzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B44B21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=95cHnVvZ8jQmHModD0C2inf04+bQ99OfAFMY/FqbhQI=; b=bLkYTt0rdimIFOHU5gbPA3HXr
	7CQ0txgog9RU1bhx9/dEd85ZZ1biYn8+5oc7z8Fx63rAPmdzM0R55JCot3ssrIWgBs4M2CVchrBJq
	efmzmThR/Y/+aZhiZ1rpH/up7hRzJlhsvx9f05kq9ANKu55uIRRkdteLVHAlD4+jVrK7/cckm07HE
	IQcU2c86wC6cU+2WIRnv0aEfdALTj+TP8w8/tjz79obZ1TTwwPQBIfIt9ugFnw3FdgLXgTHgn0jve
	zd9sgGRvKmFpAlsUGCKiKVV//5pu+LZLO5bWwyawDtd/0hwbPzt+N6CPR3JY6k/Tyqdt01IpPj0N6
	OuqKTUwcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZqR-0006hy-CX; Sat, 19 Sep 2020 10:11:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZqC-0006cm-HK; Sat, 19 Sep 2020 10:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=T76OE0hi3eXJr7P+BXpYE0pYDTNZ2r9R3SGulCeyUuU=; b=faK7CJZjpA2CXmNzgHn07Ycm3x
 ljRxYagliEo60FhuhMRo4XmRNppIryxNUoXmECzziCU34vDDbsvAunfTBHbSI/OcUeritLTyxSY+A
 fFo1E6zB6eAxxVXYkOK+COh7ESt/3tKNCz1p8y+xpjeKVMJHGR4hP0rfJ2pK8tc3oX5VRm/Xwb6AE
 u3WuYNG7CcJiXot9UeOrqaZxtZF6o8cWAMKp6nvYCw7uS5GCi4H55cYo8nS89tO3qjMKgWg2tFZ/w
 J9Rxw1Cc3w3t+5WT52ebJLHhnsKMww/yuOviqlU3dvhoquWDjGkZi5DC+33gxlVzcD5/ADMKh2w2+
 fkqryiew==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZVZ-00060j-Mu; Sat, 19 Sep 2020 09:50:25 +0000
Message-Id: <20200919092617.183860899@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=T76OE0hi3eXJr7P+BXpYE0pYDTNZ2r9R3SGulCeyUuU=;
 b=2FnY2CgYWeCTW79kyvYexk7YWJ5xeg5RXZtJ9x9zc2OPN3Abm6p3LWSqAACGBBqDpxCXEK
 AmJNM9ROty5cv5zC8ZMPGQFlgo5ozfsX3aCrBpUMsRRmNlSxk2Nb7ibaVsStTHAV+q1xhw
 tyuUzA8HGEbMNGj37Qb4z+s6kZ5dVfT/fSBG8UTTSfIo/dViyeIUoDNoqWM41jUb1uRe8y
 TNuoicaGFBrepBDOjFrsE5pU2M0/QYOnyyCI8Na1YuZRUl8nzPl97OPAYFEckcN1cPy7c7
 tnTLXhL0lRIQLAXZHDTRcAsRcj8SYlsXc5v1Qks/4q2bDcL1VWyRREvxbaGmYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=T76OE0hi3eXJr7P+BXpYE0pYDTNZ2r9R3SGulCeyUuU=;
 b=fMUgmEzq+EZqCAGQZdywecGad01pST+RaIL5AkSyisvyVygac32pLGfvQZhYYgbpit1xXp
 4d6YjSdh1O9XNzCw==
Date: Sat, 19 Sep 2020 11:18:04 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 13/15] mm/highmem: Remove the old kmap_atomic cruft
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_105018_697469_ADA16BA9 
X-CRM114-Status: GOOD (  15.16  )
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

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/highmem.h |   65 ++----------------------------------------------
 mm/highmem.c            |   28 +++++++++++++++++---
 2 files changed, 28 insertions(+), 65 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -94,27 +94,6 @@ static inline void kunmap(struct page *p
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
-
-#ifndef CONFIG_KMAP_ATOMIC_GENERIC
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-void kunmap_atomic_high(void *kvaddr);
-
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_atomic_high_prot(page, prot);
-}
-
-static inline void __kunmap_atomic(void *vaddr)
-{
-	kunmap_atomic_high(vaddr);
-	pagefault_enable();
-}
-#else /* !CONFIG_KMAP_ATOMIC_GENERIC */
-
 static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
@@ -127,17 +106,14 @@ static inline void *kmap_atomic_pfn(unsi
 	return kmap_atomic_pfn_prot(pfn, kmap_prot);
 }
 
-static inline void __kunmap_atomic(void *addr)
+static inline void *kmap_atomic(struct page *page)
 {
-	kumap_atomic_indexed(addr);
+	return kmap_atomic_prot(page, kmap_prot);
 }
 
-
-#endif /* CONFIG_KMAP_ATOMIC_GENERIC */
-
-static inline void *kmap_atomic(struct page *page)
+static inline void __kunmap_atomic(void *addr)
 {
-	return kmap_atomic_prot(page, kmap_prot);
+	kumap_atomic_indexed(addr);
 }
 
 /* declarations for linux/mm/highmem.c */
@@ -233,39 +209,6 @@ static inline void __kunmap_atomic(void
 
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
@@ -31,10 +31,6 @@
 #include <asm/tlbflush.h>
 #include <linux/vmalloc.h>
 
-#if defined(CONFIG_HIGHMEM) || defined(CONFIG_X86_32)
-DEFINE_PER_CPU(int, __kmap_atomic_idx);
-#endif
-
 /*
  * Virtual_count is not a pure "count".
  *  0 means that it is not mapped, and has not been mapped
@@ -380,6 +376,30 @@ static inline void kmap_high_unmap_tempo
 #endif /* CONFIG_HIGHMEM */
 
 #ifdef CONFIG_KMAP_ATOMIC_GENERIC
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
 #ifndef arch_kmap_temp_post_map
 # define arch_kmap_temp_post_map(vaddr, pteval)	do { } while (0)
 #endif


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
