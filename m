Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59162C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:52:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96E8223BD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="libUk6nd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UE7TiN5p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4QvDGqKV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nHEOgyol"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A96E8223BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=2t2/+Xt94bAzRdNsmXpwiCkReUWq26K/UExjzBse3Mw=; b=libUk6ndxIkeW8t4oGXJTjdSj
	qAAzBzVG7b7crzVeFge17gUhy6BKx0sjaSsWNEblEEd/XOe7BT9tT6T2I+frPcvt1O+CfrRc1EJhS
	xdqJVfuTi/B1M6NboBjOey3Jqfe8lPAYemhKnaFb7UMarIAgYaPgRAH4JOm9wY6yoTXUMOQ0UhQKr
	VCRbrp9vWTuBPgBMXyRQ8VIXhJvFOWmIXU0/NesBeDEE2ysOofOCfS96RoKABXlAw4cFrBMdAmvEL
	PHyrATxHbxcsWCp/kaGHO23OvMjueB5wBtL+07JSEGGlHyw8ylckEA4OqStsUmnRn1D5hHmyw2f3d
	1r9m8szVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtvS-0000FI-KG; Tue, 03 Nov 2020 10:52:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtvN-0008Ve-KP; Tue, 03 Nov 2020 10:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=dYx1Yl6wgjFDzL4d7wpy+MQ/ca4VbI4dshzY4C94zCg=; b=UE7TiN5pqTc/IwgKUnEcRYhJ17
 +04CchSsU8ySEdDn5waryNKOD37ZYoh/HRAYYbP8TDMrsiCYt7IWzKTrg5c8tFJ0IPM+1n/LGTppv
 Xt3D11BBPW1b6HBmJ/XvbLUHueqZ7JKlioZAWu7yDE5TYvZjA8gJLkU8b82oM9kQUyHdiGPN5FKqc
 dk4NZ+Kks29ppw3ALh9chjdRfgNE5rFkDvCkoyQX+ibcZSidjwUgwmdqNt4lS/KKGKemGjgKlmLRn
 2X0BBwoj/8i7n8e4N7xYfQxZISOBpdIHT+SYGCpPXzyzdMKrYARXYK+YwXqtf1zdOt9ZiDunis1QM
 +roB71Xg==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtdO-0002GN-Ni; Tue, 03 Nov 2020 10:34:20 +0000
Message-Id: <20201103095858.516281567@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dYx1Yl6wgjFDzL4d7wpy+MQ/ca4VbI4dshzY4C94zCg=;
 b=4QvDGqKVKPFjYTZiH7xhv8zBsxgNw5ucuOWpbKZ18rMtaNCpT4m1fIgg7d42Pf4ttY8gnQ
 j6STlpHNZtb54KQolCEvAOtfIBn6Zvac5eoLzhR1q+EBZQKhuxC69WReFFoUfX3tPRPCts
 2HTD6Fl5QJuJ5QyiXhkDQiJfASqZgrTfuQJiZK0MqskHi6zDD6EHlpfZpwHaxGhXXwPr9X
 Vb4k2kb3SczzsSlpmpaZ3L8Dy/cZbHaEz0VgKRZkMQL3dGerZvWCuwHHNLPkfinWQIFB0j
 gsmyZDxZFqomNDAg2jzR8z96x8DEnYsbXhV7JtsOk/xYyutDKygozbXhq2uhKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dYx1Yl6wgjFDzL4d7wpy+MQ/ca4VbI4dshzY4C94zCg=;
 b=nHEOgyol8j2FfkUQAHNBZiJ0Vnv+JbHd05D8vSpMEVgHoPEClg1kXmC2+PGwuxytijKdb7
 OO86HAY7UU5tfdBw==
Date: Tue, 03 Nov 2020 10:27:31 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 19/37] mm/highmem: Remove the old kmap_atomic cruft
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_103352_252511_17627561 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

All users gone.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/highmem.h |   63 +++---------------------------------------------
 mm/highmem.c            |    7 -----
 2 files changed, 5 insertions(+), 65 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -86,31 +86,16 @@ static inline void kunmap(struct page *p
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
@@ -125,13 +110,6 @@ static inline void __kunmap_atomic(void
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
@@ -212,41 +190,8 @@ static inline void __kunmap_atomic(void
 
 #define kmap_flush_unused()	do {} while(0)
 
-#endif /* CONFIG_HIGHMEM */
-
-#if !defined(CONFIG_KMAP_LOCAL)
-#if defined(CONFIG_HIGHMEM)
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
-#endif
-#endif
+#endif /* CONFIG_HIGHMEM */
 
 /*
  * Prevent people trying to call kunmap_atomic() as if it were kunmap()
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -31,12 +31,6 @@
 #include <asm/tlbflush.h>
 #include <linux/vmalloc.h>
 
-#ifndef CONFIG_KMAP_LOCAL
-#ifdef CONFIG_HIGHMEM
-DEFINE_PER_CPU(int, __kmap_atomic_idx);
-#endif
-#endif
-
 /*
  * Virtual_count is not a pure "count".
  *  0 means that it is not mapped, and has not been mapped
@@ -410,6 +404,7 @@ static inline void kmap_local_idx_pop(vo
 #ifndef arch_kmap_local_post_map
 # define arch_kmap_local_post_map(vaddr, pteval)	do { } while (0)
 #endif
+
 #ifndef arch_kmap_local_pre_unmap
 # define arch_kmap_local_pre_unmap(vaddr)		do { } while (0)
 #endif


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
