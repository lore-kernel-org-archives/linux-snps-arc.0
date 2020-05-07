Return-Path: <SRS0=90H6=6V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93892C38A2A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 601B62083B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QfpKwWzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 601B62083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uw5bOeMfJHkJFPJx8puUVzdwORoienWrmNKxnYCIr5Q=; b=QfpKwWzEzlWDdc
	RAJSC65a/mNKkLVzvryhi60CsND5HFkOIX+k+WMgdFovcJ3i4NbG1Fg3bDIHgJ2rsiVbD2jVKfMA7
	U1B/1CSyDFx1ExLmKME4cNQbKNoT6Lh+YlJ7vPSvu7PE2m51YJggSDsQ+6W8ZeoMLlDGQieoLfFUD
	T5n8rDTdKUgYWz+RgvMXTtd/wjIDGnr8zKRYbZ8Z+m1UUxFkM1jnQo0q+HHiA5dUtvvBROuGvX19s
	+FTsFSknSNByd6RcQyEkv9rKA/vh+4ZyNCxhk1JNR0Ti8rQBEfQ3YBHp7dmmB3yJPx9R7UExSG1gE
	QkT7sA1md8e49jEjn7TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWi5Y-00012G-9M; Thu, 07 May 2020 15:05:28 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWi0i-0003tC-NL; Thu, 07 May 2020 15:00:31 +0000
IronPort-SDR: 2k6jY2DOHmPf5m6WTk7haRbXwMUu79A90bS5LErebwCk4AX0uWoIEcTrSM+hgFD50sI6rjY/Dw
 EdxSg2nLYkfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:25 -0700
IronPort-SDR: ccj/YBIhZWifHTceF3C935K94/o3dJdXmT/VRmo3rphR+KioUyOCSj372Y/MERIhXtEQ84T1Fq
 9jpOl8Z1pCKQ==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="407664237"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:24 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 15/15] kmap: Consolidate kmap_prot definitions
Date: Thu,  7 May 2020 08:00:03 -0700
Message-Id: <20200507150004.1423069-16-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_080029_244318_7129D4C7 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

Most architectures define kmap_prot to be PAGE_KERNEL.

Let sparc and xtensa define there own and define PAGE_KERNEL as the
default if not overridden.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	New Patch for this series
---
 arch/arc/include/asm/highmem.h        | 3 ---
 arch/arm/include/asm/highmem.h        | 2 --
 arch/csky/include/asm/highmem.h       | 2 --
 arch/microblaze/include/asm/highmem.h | 1 -
 arch/mips/include/asm/highmem.h       | 2 --
 arch/nds32/include/asm/highmem.h      | 1 -
 arch/powerpc/include/asm/highmem.h    | 1 -
 arch/sparc/include/asm/highmem.h      | 3 ++-
 arch/sparc/mm/highmem.c               | 4 ----
 arch/x86/include/asm/fixmap.h         | 1 -
 include/linux/highmem.h               | 4 ++++
 11 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 70900a73bfc8..6e5eafb3afdd 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -25,9 +25,6 @@
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 #define PKMAP_NR(virt)		(((virt) - PKMAP_BASE) >> PAGE_SHIFT)
 
-#define kmap_prot		PAGE_KERNEL
-
-
 #include <asm/cacheflush.h>
 
 extern void kmap_init(void);
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index b0d4bd8dc3c1..31811be38d78 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -10,8 +10,6 @@
 #define PKMAP_NR(virt)		(((virt) - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-#define kmap_prot		PAGE_KERNEL
-
 #define flush_cache_kmaps() \
 	do { \
 		if (cache_is_vivt()) \
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index ea2f3f39174d..14645e3d5cd5 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -38,8 +38,6 @@ extern void *kmap_atomic_pfn(unsigned long pfn);
 
 extern void kmap_init(void);
 
-#define kmap_prot PAGE_KERNEL
-
 #endif /* __KERNEL__ */
 
 #endif /* __ASM_CSKY_HIGHMEM_H */
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index d7c55cfd27bd..284ca8fb54c1 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -25,7 +25,6 @@
 #include <linux/uaccess.h>
 #include <asm/fixmap.h>
 
-#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 76dec0bd4f59..f1f788b57166 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -54,8 +54,6 @@ extern void *kmap_atomic_pfn(unsigned long pfn);
 
 extern void kmap_init(void);
 
-#define kmap_prot PAGE_KERNEL
-
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_HIGHMEM_H */
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index a48a6536d41a..5717647d14d1 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -32,7 +32,6 @@
 #define LAST_PKMAP_MASK		(LAST_PKMAP - 1)
 #define PKMAP_NR(virt)		(((virt) - (PKMAP_BASE)) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
-#define kmap_prot		PAGE_KERNEL
 
 static inline void flush_cache_kmaps(void)
 {
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index 8d8ee3fcd800..104026f7d6bc 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -29,7 +29,6 @@
 #include <asm/page.h>
 #include <asm/fixmap.h>
 
-#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index f4babe67cb5d..37f8694bde84 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -25,11 +25,12 @@
 #include <asm/vaddrs.h>
 #include <asm/kmap_types.h>
 #include <asm/pgtable.h>
+#include <asm/pgtsrmmu.h>
 
 /* declarations for highmem.c */
 extern unsigned long highstart_pfn, highend_pfn;
 
-extern pgprot_t kmap_prot;
+#define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
 extern pte_t *pkmap_page_table;
 
 void kmap_init(void) __init;
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index 414f578d1e57..d237d902f9c3 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -32,9 +32,6 @@
 #include <asm/pgalloc.h>
 #include <asm/vaddrs.h>
 
-pgprot_t kmap_prot;
-EXPORT_SYMBOL(kmap_prot);
-
 static pte_t *kmap_pte;
 
 void __init kmap_init(void)
@@ -51,7 +48,6 @@ void __init kmap_init(void)
 
         /* cache the first kmap pte */
         kmap_pte = pte_offset_kernel(dir, address);
-        kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
 }
 
 void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
index 28183ee3cc42..b9527a54db99 100644
--- a/arch/x86/include/asm/fixmap.h
+++ b/arch/x86/include/asm/fixmap.h
@@ -152,7 +152,6 @@ extern void reserve_top_address(unsigned long reserve);
 extern int fixmaps_set;
 
 extern pte_t *kmap_pte;
-#define kmap_prot PAGE_KERNEL
 extern pte_t *pkmap_page_table;
 
 void __native_set_fixmap(enum fixed_addresses idx, pte_t pte);
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index cc0c3904e501..bf470c16cecb 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -40,6 +40,10 @@ extern void kunmap_atomic_high(void *kvaddr);
 static inline void kmap_flush_tlb(unsigned long addr) { }
 #endif
 
+#ifndef kmap_prot
+#define kmap_prot PAGE_KERNEL
+#endif
+
 void *kmap_high(struct page *page);
 static inline void *kmap(struct page *page)
 {
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
