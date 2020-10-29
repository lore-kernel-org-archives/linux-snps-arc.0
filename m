Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E09C55178
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED18A20782
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZtOfteV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kOvuaaNw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tr9cMrwm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED18A20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=p+motQEymrTmzcqFKCDWGycUT63h4w6sXMcd1EQWNDE=; b=WZtOfteVWHUzJvnU82LttWjfH
	x5VbSDXmIAUwMCsHJlyO3BWYXw/ibt756ZVwKL8ZaRTC+PwdBFs395h6wH7wseqI5qb1baXmPztuN
	0Hkv/seAwQ2hcSGMouE30yKnWcu/rqb+VTH75m7l4/2NyrTHDNnbz2zdF4gV3wTSr+QYcQ/DT4/N5
	o3JMoIFkCCj4eorAJl7T3JDU7xA/TaiOacWR8qSLP0Go1NPmJSGIOtR82btONGbgCureU4/lU7iRk
	Fe1EKEGhburuf/lrTHpgO+p1lxqBwYhnrI4B3Uzbh2OvIydkDJeqO12ym8PfYAXzRfpnEkOvHlKjj
	BTC2nQf+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGUt-0005QR-GS; Thu, 29 Oct 2020 22:34:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGSv-0004fc-3H; Thu, 29 Oct 2020 22:32:37 +0000
Message-Id: <20201029222651.209698448@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=4pbqy1oxZ7hvzU+YxFccKSj2wRStaHISaAIgYIlWHiI=;
 b=kOvuaaNwK6IJ4aH7PKnkIjnIc7eyWsDMmnkGdnQP4vDCafRSeNAiMkb3iXyqY0EUqZaZv3
 O6OKf6GMQNVLj4ojyPIMylsN5Vtazsx0Cma/It1S36+5FmZdf08RPvNfVBhZRCTxMFFrlM
 B5GODdmUB9W0PZR83kazo4yNHgy7LAdlOTbMw/FV/5BmAyvgvWYdJAeOOIcB8KXvZNyDmh
 mRas6q2Tsu9PWX1uAOhpGqlw2e5bD3eD7Ud6pIhPxp/rxHtoVzYuNY5pzjFdE8Cp2ReB77
 gz5Rfri7X7aDDpAAnthqmhGPNv2NDEblMVUxKn9yE1GcGmkX8dzoB7EaXAlRcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=4pbqy1oxZ7hvzU+YxFccKSj2wRStaHISaAIgYIlWHiI=;
 b=Tr9cMrwmQY+N7XZ4sDkllnAvgljBj3LpnEhFBPG9eUzLPeNLXrgyj96daU3efsOYcRQd/H
 KIt/tm1Cm2vuIsCQ==
Date: Thu, 29 Oct 2020 23:18:12 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 06/18] ARM: highmem: Switch to generic kmap atomic
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_183217_461665_66477D9A 
X-CRM114-Status: GOOD (  20.93  )
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

No reason having the same code in every architecture.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e00d94b16658..410235e350cc 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1499,6 +1499,7 @@ config HAVE_ARCH_PFN_VALID
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
+	select KMAP_LOCAL
 	help
 	  The address space of ARM processors is only 4 Gigabytes large
 	  and it has to accommodate user address space, kernel address
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index 31811be38d78..99a99862c474 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -46,19 +46,32 @@ extern pte_t *pkmap_page_table;
 
 #ifdef ARCH_NEEDS_KMAP_HIGH_GET
 extern void *kmap_high_get(struct page *page);
-#else
+
+static inline void *arch_kmap_local_high_get(struct page *page)
+{
+	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !cache_is_vivt())
+		return NULL;
+	return kmap_high_get(page);
+}
+#define arch_kmap_local_high_get arch_kmap_local_high_get
+
+#else /* ARCH_NEEDS_KMAP_HIGH_GET */
 static inline void *kmap_high_get(struct page *page)
 {
 	return NULL;
 }
-#endif
+#endif /* !ARCH_NEEDS_KMAP_HIGH_GET */
 
-/*
- * The following functions are already defined by <linux/highmem.h>
- * when CONFIG_HIGHMEM is not set.
- */
-#ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic_pfn(unsigned long pfn);
-#endif
+#define arch_kmap_local_post_map(vaddr, pteval)				\
+	local_flush_tlb_kernel_page(vaddr)
+
+#define arch_kmap_local_pre_unmap(vaddr)				\
+do {									\
+	if (cache_is_vivt())						\
+		__cpuc_flush_dcache_area((void *)vaddr, PAGE_SIZE);	\
+} while (0)
+
+#define arch_kmap_local_post_unmap(vaddr)				\
+	local_flush_tlb_kernel_page(vaddr)
 
 #endif
diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index 7cb1699fbfc4..c4ce477c5261 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_MODULES)		+= proc-syms.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 
 obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.o
-obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_ARM_PV_FIXUP)	+= pv-fixup-asm.o
 
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
deleted file mode 100644
index 187fab227b50..000000000000
--- a/arch/arm/mm/highmem.c
+++ /dev/null
@@ -1,121 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mm/highmem.c -- ARM highmem support
- *
- * Author:	Nicolas Pitre
- * Created:	september 8, 2008
- * Copyright:	Marvell Semiconductors Inc.
- */
-
-#include <linux/module.h>
-#include <linux/highmem.h>
-#include <linux/interrupt.h>
-#include <asm/fixmap.h>
-#include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
-#include "mm.h"
-
-static inline void set_fixmap_pte(int idx, pte_t pte)
-{
-	unsigned long vaddr = __fix_to_virt(idx);
-	pte_t *ptep = virt_to_kpte(vaddr);
-
-	set_pte_ext(ptep, pte, 0);
-	local_flush_tlb_kernel_page(vaddr);
-}
-
-static inline pte_t get_fixmap_pte(unsigned long vaddr)
-{
-	pte_t *ptep = virt_to_kpte(vaddr);
-
-	return *ptep;
-}
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned int idx;
-	unsigned long vaddr;
-	void *kmap;
-	int type;
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	/*
-	 * There is no cache coherency issue when non VIVT, so force the
-	 * dedicated kmap usage for better debugging purposes in that case.
-	 */
-	if (!cache_is_vivt())
-		kmap = NULL;
-	else
-#endif
-		kmap = kmap_high_get(page);
-	if (kmap)
-		return kmap;
-
-	type = kmap_atomic_idx_push();
-
-	idx = FIX_KMAP_BEGIN + type + KM_TYPE_NR * smp_processor_id();
-	vaddr = __fix_to_virt(idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	/*
-	 * With debugging enabled, kunmap_atomic forces that entry to 0.
-	 * Make sure it was indeed properly unmapped.
-	 */
-	BUG_ON(!pte_none(get_fixmap_pte(vaddr)));
-#endif
-	/*
-	 * When debugging is off, kunmap_atomic leaves the previous mapping
-	 * in place, so the contained TLB flush ensures the TLB is updated
-	 * with the new mapping.
-	 */
-	set_fixmap_pte(idx, mk_pte(page, prot));
-
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int idx, type;
-
-	if (kvaddr >= (void *)FIXADDR_START) {
-		type = kmap_atomic_idx();
-		idx = FIX_KMAP_BEGIN + type + KM_TYPE_NR * smp_processor_id();
-
-		if (cache_is_vivt())
-			__cpuc_flush_dcache_area((void *)vaddr, PAGE_SIZE);
-#ifdef CONFIG_DEBUG_HIGHMEM
-		BUG_ON(vaddr != __fix_to_virt(idx));
-		set_fixmap_pte(idx, __pte(0));
-#else
-		(void) idx;  /* to kill a warning */
-#endif
-		kmap_atomic_idx_pop();
-	} else if (vaddr >= PKMAP_ADDR(0) && vaddr < PKMAP_ADDR(LAST_PKMAP)) {
-		/* this address was obtained through kmap_high_get() */
-		kunmap_high(pte_page(pkmap_page_table[PKMAP_NR(vaddr)]));
-	}
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
-
-void *kmap_atomic_pfn(unsigned long pfn)
-{
-	unsigned long vaddr;
-	int idx, type;
-	struct page *page = pfn_to_page(pfn);
-
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-	type = kmap_atomic_idx_push();
-	idx = FIX_KMAP_BEGIN + type + KM_TYPE_NR * smp_processor_id();
-	vaddr = __fix_to_virt(idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(get_fixmap_pte(vaddr)));
-#endif
-	set_fixmap_pte(idx, pfn_pte(pfn, kmap_prot));
-
-	return (void *)vaddr;
-}


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
