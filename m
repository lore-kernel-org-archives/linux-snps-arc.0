Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0DDC4741F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:53:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20AF20639
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SilYN8df";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IvYjOvka";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UmrmyK4O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HxpVD2rY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20AF20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=GFSxiyJaAlA0uALNnYDtoaBKAxcxY/lVMQnc7SzfLS8=; b=SilYN8dfjILuHU7f2gmXELv1M
	fAP1ApRiQsI8Ywf9Ynx6umb9AWHS104uAjWB3SgY+6oFnoOjq+7X+a9nTVijXiPj2ByWDYIl23B30
	hCx7SnJHHOIxImcOmPTFcCXsd1JuV8HZeKKBr5dBr6t5RKa/7VXloFTnwFqN4EaZzk9IdcxMF7Fd2
	fRWlpI/V+JflUpGslL/iehIJBaw1/bZZDBwKRGUCTYzlFwlI5HPz6yw3v2JIERF1Y4jhYsI/v6o+K
	EKmznYU5rXRVShZH0274RuYKTAWtAI9v5MSax47R0BHp5tVFGK/0BDXc543oV/bECQHvNNmV+IUw9
	deANw8JHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGn0-0001RK-04; Thu, 29 Oct 2020 22:53:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGlo-0000zC-FX; Thu, 29 Oct 2020 22:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=mKqToMCt4TK857L6pxHu/gEBeaTgg/I0tChqKCuxQX4=; b=IvYjOvkaYb1XIRiCN/yOwX7X4i
 LffOMMZgO4nTr7XIT43VNOv0iWPKajjTFhh76T3ZYHVMGaVmTPKnDJ6yZgYN446qOsWugAA3ReFil
 hXo8gvUHic5SGiPGzFh4mHzi4+GAiSoQAwW4CN6N8mW2GPX5ICuhq/Jp7ZH9sIdQ2uS7RrVvJUyFx
 ubuQSImoiXOLCL7f7/mmbZDZrVICXivt1AkRPMuJx5GGD7ESbPFIAEWmIxwlMRNCrbMedrFyIVVA0
 Y3GNqXi6zU6xgT/1F0HCKyNz6iVPojF4hwzxL0wgG/tnVBPZWqXb1LLT83Dhw2PrAzM+yFYj9TzEZ
 JBMqGk2w==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGT4-0003GB-4u; Thu, 29 Oct 2020 22:32:30 +0000
Message-Id: <20201029222651.695446198@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mKqToMCt4TK857L6pxHu/gEBeaTgg/I0tChqKCuxQX4=;
 b=UmrmyK4OiYktirQTA7UPVpOuNJymPsdcFHoBTqnXV9fJJb1k9GhyerYmkkw6v1FwOK7Lkz
 4x4mNiTbwKg5XZwyKoq/Fq/JZ9UZ0JmihPnq0kgM/l9myx6jlrloa9+qlrvH0E2IILOMmC
 azN6aJk3sfuSUjUjr2/AsPYOwAqbXnNKjPh5PdAvsV4A4C05v8RCUhZuD0Ntmlxx3ysFgQ
 BZrlbNRbVJFUI5O0NQLP/p+jcklvUVwb+VDp4aa3GQ3POyZoXr7nIQg1P3mWQ/HIXLu6jH
 COkPfToQ9Rvl0nOPi0H1A0kcb8D8omgt9o+h745K16paCYz0CD3yjsB+QlfWaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mKqToMCt4TK857L6pxHu/gEBeaTgg/I0tChqKCuxQX4=;
 b=HxpVD2rY7MqmhvHwPuXswIG/rzdtissHt/T3LPe1/rTXCiyfxOrWzI7fQMiVzATIzNobbU
 5pcryDtXkN5Hm+Dg==
Date: Thu, 29 Oct 2020 23:18:17 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 11/18] powerpc/mm/highmem: Switch to generic kmap atomic
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_223226_782186_7013A8C5 
X-CRM114-Status: GOOD (  16.84  )
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
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Vineet Gupta <vgupta@synopsys.com>, Guo Ren <guoren@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

No reason having the same code in every architecture

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Kconfig               |    1 
 arch/powerpc/include/asm/highmem.h |    6 ++-
 arch/powerpc/mm/Makefile           |    1 
 arch/powerpc/mm/highmem.c          |   67 -------------------------------------
 arch/powerpc/mm/mem.c              |    7 ---
 5 files changed, 6 insertions(+), 76 deletions(-)

--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -409,6 +409,7 @@ menu "Kernel options"
 config HIGHMEM
 	bool "High memory support"
 	depends on PPC32
+        select KMAP_LOCAL
 
 source "kernel/Kconfig.hz"
 
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -29,7 +29,6 @@
 #include <asm/page.h>
 #include <asm/fixmap.h>
 
-extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
 /*
@@ -60,6 +59,11 @@ extern pte_t *pkmap_page_table;
 
 #define flush_cache_kmaps()	flush_cache_all()
 
+#define arch_kmap_local_post_map(vaddr, pteval)	\
+	local_flush_tlb_page(NULL, vaddr)
+#define arch_kmap_local_post_unmap(vaddr)	\
+	local_flush_tlb_page(NULL, vaddr)
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_HIGHMEM_H */
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_NEED_MULTIPLE_NODES) += num
 obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
-obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
 obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
 obj-$(CONFIG_KASAN)		+= kasan/
--- a/arch/powerpc/mm/highmem.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * highmem.c: virtual kernel memory mappings for high memory
- *
- * PowerPC version, stolen from the i386 version.
- *
- * Used in CONFIG_HIGHMEM systems for memory pages which
- * are not addressable by direct kernel virtual addresses.
- *
- * Copyright (C) 1999 Gerhard Wichert, Siemens AG
- *		      Gerhard.Wichert@pdb.siemens.de
- *
- *
- * Redesigned the x86 32-bit VM architecture to deal with
- * up to 16 Terrabyte physical memory. With current x86 CPUs
- * we now support up to 64 Gigabytes physical RAM.
- *
- * Copyright (C) 1999 Ingo Molnar <mingo@redhat.com>
- *
- * Reworked for PowerPC by various contributors. Moved from
- * highmem.h by Benjamin Herrenschmidt (c) 2009 IBM Corp.
- */
-
-#include <linux/highmem.h>
-#include <linux/module.h>
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	WARN_ON(IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !pte_none(*(kmap_pte - idx)));
-	__set_pte_at(&init_mm, vaddr, kmap_pte-idx, mk_pte(page, prot), 1);
-	local_flush_tlb_page(NULL, vaddr);
-
-	return (void*) vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-
-	if (vaddr < __fix_to_virt(FIX_KMAP_END))
-		return;
-
-	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM)) {
-		int type = kmap_atomic_idx();
-		unsigned int idx;
-
-		idx = type + KM_TYPE_NR * smp_processor_id();
-		WARN_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
-
-		/*
-		 * force other mappings to Oops if they'll try to access
-		 * this pte without first remap it
-		 */
-		pte_clear(&init_mm, vaddr, kmap_pte-idx);
-		local_flush_tlb_page(NULL, vaddr);
-	}
-
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -61,11 +61,6 @@
 unsigned long long memory_limit;
 bool init_mem_is_free;
 
-#ifdef CONFIG_HIGHMEM
-pte_t *kmap_pte;
-EXPORT_SYMBOL(kmap_pte);
-#endif
-
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 			      unsigned long size, pgprot_t vma_prot)
 {
@@ -235,8 +230,6 @@ void __init paging_init(void)
 
 	map_kernel_page(PKMAP_BASE, 0, __pgprot(0));	/* XXX gross */
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
-
-	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
 #endif /* CONFIG_HIGHMEM */
 
 	printk(KERN_DEBUG "Top of RAM: 0x%llx, Total RAM: 0x%llx\n",


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
