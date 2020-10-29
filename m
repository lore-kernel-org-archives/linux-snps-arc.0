Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856E6C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:51:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9459820782
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="be+b7Qdm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PSADSEfc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wMNGBm7F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vZyLTjIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9459820782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=xiYSlMSHT2a7tvkCbknGVpNcneR0n2fIyQtI9n2zq4c=; b=be+b7QdmWnR3AlUZHW/rdUCCY
	QQPGUezhPxnN+TalF5aFAOXNfI5R7OWQzaolDr/eL8EexzlFjJFGYIHmulx618WMRcI9RKc3j/7ip
	/ZvMwVdhYF6jSR823QA/ofnfEw7iUY0yHgtAWQkS9lIZSOyk0JdVjzkiVny3tDBMxDPHogJ37LCLQ
	bLCfwIL0ej5rhpQJBUfRuZC2vv8bn7YqvMAvi9pskegt59JkwjgEq9FjIqIN5pSUch1ygskGpZT8X
	BOemQqPUDsuOSUVUanCFncBkwgDzRTM4wzKnfv5bB9R7g1vc7YIJM4le7rszELeGXQivinFyvibPV
	GMeid/aKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGlb-00011D-Hu; Thu, 29 Oct 2020 22:51:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGlW-0000zC-7J; Thu, 29 Oct 2020 22:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=/OuOJDBSTYr3oNHxI4QIi4hU4+npD6o6bAOehLTNx4c=; b=PSADSEfcGT37F8MyGOwSuBoyYM
 /WGTbsI+Nup7OTsoex3nE0eYQ2HuWNpQZL+gy8IEWl1VzjEnjjSezTG0BTUZKPIwI8sX9KlUOa6gV
 3ohj0DgGt5yShkinykBudpf8WmcamfPNVxDFf2vHx8FpR1uAjubC/dp5cNJQ44zuKEor+YLgx/sGk
 8HPHavL8ZA1p7guVklqAKxlRzPTMHepzNCbhepSIAOOjvkfwfPRO7ilGlHV7S/of3zs7Nsfuv68Xb
 26mqYV/jXtSk9L2AqtWdAVvSl8R6GieH8G1M63ZYuGsMI39ht6kcFbvNOh/uMr/q54AAaqHreQoKi
 B8f2wahQ==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGT0-0003FU-A9; Thu, 29 Oct 2020 22:32:25 +0000
Message-Id: <20201029222651.490984112@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=/OuOJDBSTYr3oNHxI4QIi4hU4+npD6o6bAOehLTNx4c=;
 b=wMNGBm7FEQndNk7gkb6jnxJERy4aewAuqd8JPO2Cb9yQvev11o7dGPg1gvKHjsSgRmreMT
 JAtYvP6wIw+f1xGLJXm+lQ5PVxiQp0fhX0Q5V5NSb4aZmhrdOI79hKcDNs/QCs2WYduRli
 /AdskYqZVN3OFf74Hrx3rg2XVVL5gUQnvjBwVh2eRM8xBNVA4PF/saHit0ecobcwEo/EzQ
 Dc2iJu86rgIRir0rw56KJvJ8HAj9+uW/TytvG6Oyyks+A8fyEfhy/2ONIt9JGQ9OO7vdn8
 GK7/vTtBKGmskreT1+bP9oFMAyYrJCS3zEVtkDvNKZeUoJnBS5WzZwjzr4SE2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=/OuOJDBSTYr3oNHxI4QIi4hU4+npD6o6bAOehLTNx4c=;
 b=vZyLTjIzU9k7xQOCipR1bc80iEErl2mbhdt3YPd+39LdH4ejIB+ygJekHICapKhvJdHuoF
 jLF9JFQmlcL5JeBQ==
Date: Thu, 29 Oct 2020 23:18:15 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 09/18] mips/mm/highmem: Switch to generic kmap atomic
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_223222_669060_DB2F4178 
X-CRM114-Status: GOOD (  14.45  )
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

No reason having the same code in every architecture

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8f328298f8cc..ed6b3de944a8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2654,6 +2654,7 @@ config MIPS_CRC_SUPPORT
 config HIGHMEM
 	bool "High Memory Support"
 	depends on 32BIT && CPU_SUPPORTS_HIGHMEM && SYS_SUPPORTS_HIGHMEM && !CPU_MIPS32_3_5_EVA
+	select KMAP_LOCAL
 
 config CPU_SUPPORTS_HIGHMEM
 	bool
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index f1f788b57166..cb2e0fb8483b 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -48,11 +48,11 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic_pfn(unsigned long pfn);
 
 #define flush_cache_kmaps()	BUG_ON(cpu_has_dc_aliases)
 
-extern void kmap_init(void);
+#define arch_kmap_local_post_map(vaddr, pteval)	local_flush_tlb_one(vaddr)
+#define arch_kmap_local_post_unmap(vaddr)	local_flush_tlb_one(vaddr)
 
 #endif /* __KERNEL__ */
 
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 5fec7f45d79a..57e2f08f00d0 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -8,8 +8,6 @@
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 
-static pte_t *kmap_pte;
-
 unsigned long highstart_pfn, highend_pfn;
 
 void kmap_flush_tlb(unsigned long addr)
@@ -17,78 +15,3 @@ void kmap_flush_tlb(unsigned long addr)
 	flush_tlb_one(addr);
 }
 EXPORT_SYMBOL(kmap_flush_tlb);
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte - idx)));
-#endif
-	set_pte(kmap_pte-idx, mk_pte(page, prot));
-	local_flush_tlb_one((unsigned long)vaddr);
-
-	return (void*) vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int type __maybe_unused;
-
-	if (vaddr < FIXADDR_START)
-		return;
-
-	type = kmap_atomic_idx();
-#ifdef CONFIG_DEBUG_HIGHMEM
-	{
-		int idx = type + KM_TYPE_NR * smp_processor_id();
-
-		BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
-
-		/*
-		 * force other mappings to Oops if they'll try to access
-		 * this pte without first remap it
-		 */
-		pte_clear(&init_mm, vaddr, kmap_pte-idx);
-		local_flush_tlb_one(vaddr);
-	}
-#endif
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
-
-/*
- * This is the same as kmap_atomic() but can map memory that doesn't
- * have a struct page associated with it.
- */
-void *kmap_atomic_pfn(unsigned long pfn)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	preempt_disable();
-	pagefault_disable();
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	set_pte(kmap_pte-idx, pfn_pte(pfn, PAGE_KERNEL));
-	flush_tlb_one(vaddr);
-
-	return (void*) vaddr;
-}
-
-void __init kmap_init(void)
-{
-	unsigned long kmap_vstart;
-
-	/* cache the first kmap pte */
-	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
-	kmap_pte = virt_to_kpte(kmap_vstart);
-}
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6c7bbfe35ba3..e5de8e9c2ede 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -402,9 +402,6 @@ void __init paging_init(void)
 
 	pagetable_init();
 
-#ifdef CONFIG_HIGHMEM
-	kmap_init();
-#endif
 #ifdef CONFIG_ZONE_DMA
 	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
 #endif


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
