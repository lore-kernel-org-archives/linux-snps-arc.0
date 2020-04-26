Return-Path: <SRS0=h8bZ=6K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2720C5519C
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Apr 2020 05:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9992A2078E
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Apr 2020 05:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fnB3MlRa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9992A2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH/hZOjtigHoSBhtYmoQhHVufinZd8/lfhlzvPgzSLQ=; b=fnB3MlRavaTqz/
	fxeeBNNhStdfWKMed8D0KW0Y/4mNc6r4ZhoqkwFwxXy5aZRTQThIohjivbENvDYOmcN1yRoJlWlfM
	8CHi1Zf3nS6rv080ndLeyAf4RC+eAqW88su5uI9ooniMKxDvNOxyOWBO1tynT9nACJfPS7NPXS2Jy
	ZPaTUJLRU3eBN6YYhsV034Ams+ph2VOWsxu973glHMXt1yrdrLDJ7nNfcqD3p1xH5yQ5KYWkBVXNj
	FQosEtjaozckjI0qIWsRA5LqO0izTtQQPOTc+q5Po4FN5NK61TeqtiacsfHfoTJ/C86X8zNRxGx65
	kmYhMbOEtJ3dYOaGbPGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSaFP-00041V-0h; Sun, 26 Apr 2020 05:54:35 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSaFG-0003rq-Td; Sun, 26 Apr 2020 05:54:28 +0000
IronPort-SDR: qJDn8OSbFAeHsfHQXVY84fAX0Vr3e9DXzKgOuN3PRiVwBtySNwXL/uT9C8A/lpYjq11e2Onnn4
 KkmO8o5PMP6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:23 -0700
IronPort-SDR: JbrFxZQOg4mMIuwtoATzRdij1dRliQGnUgWcjgmHA5TRHF3mzGglJEjgI5nDw5LX1Vgmb6bj/B
 U1DQQme6oOjQ==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; d="scan'208";a="302014809"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:23 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Date: Sat, 25 Apr 2020 22:54:05 -0700
Message-Id: <20200426055406.134198-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200426055406.134198-1-ira.weiny@intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_225426_971091_97459AB6 
X-CRM114-Status: GOOD (  10.52  )
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

Every arch has the same check for a not HIGHMEM page.  Define
kmap_atomic_fast() to quickly return already mapped pages and reduce the
code duplication by lifting this check to the core.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/mm/highmem.c        | 7 +++----
 arch/arm/mm/highmem.c        | 8 +++-----
 arch/csky/mm/highmem.c       | 7 +++----
 arch/microblaze/mm/highmem.c | 8 +++-----
 arch/mips/mm/highmem.c       | 7 +++----
 arch/nds32/mm/highmem.c      | 7 +++----
 arch/powerpc/mm/highmem.c    | 7 +++----
 arch/sparc/mm/highmem.c      | 7 +++----
 arch/x86/mm/highmem_32.c     | 8 +++-----
 arch/xtensa/mm/highmem.c     | 7 +++----
 include/linux/highmem.h      | 9 +++++++++
 11 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 4db13a6b9f3b..1cae4b911a33 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
 {
 	int idx, cpu_idx;
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	cpu_idx = kmap_atomic_idx_push();
 	idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index c700b32350ee..4a629f616a6a 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -35,13 +35,11 @@ void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
 	unsigned long vaddr;
-	void *kmap;
+	void *kmap = kmap_atomic_fast(page);
 	int type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (kmap)
+		return kmap;
 
 #ifdef CONFIG_DEBUG_HIGHMEM
 	/*
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 69b1931986ae..1191f57f53ae 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -25,12 +25,11 @@ EXPORT_SYMBOL(kmap);
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index d7569f77fa15..99fdf826edc2 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -36,13 +36,11 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index c3c9fe962f0f..ba03ca75d4a1 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -33,12 +33,11 @@ EXPORT_SYMBOL(kmap);
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index f9348bec0ecb..4aabde586489 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -14,13 +14,12 @@ void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
 	unsigned long vaddr, pte;
+	void *addr = kmap_atomic_fast(page);
 	int type;
 	pte_t *ptep;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 320c1672b2ae..cdf5b716801a 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -33,12 +33,11 @@
 void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d4a80adea7e5..178641805567 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -56,12 +56,11 @@ void __init kmap_init(void)
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	long idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index c4ebfd0ae401..34770499b0ff 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -15,13 +15,11 @@
 void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 184ceadccc1a..38c14e0b578c 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -41,11 +41,10 @@ void *kmap_atomic(struct page *page)
 {
 	enum fixed_addresses idx;
 	unsigned long vaddr;
+	void *addr = kmap_atomic_fast(page);
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
+	if (addr)
+		return addr;
 
 	idx = kmap_idx(kmap_atomic_idx_push(),
 		       DCACHE_ALIAS(page_to_phys(page)));
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 1a3b7690c78c..eee53e151900 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -60,6 +60,15 @@ static inline void kunmap(struct page *page)
 	kunmap_high(page);
 }
 
+static inline void *kmap_atomic_fast(struct page *page)
+{
+	preempt_disable();
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+	return NULL;
+}
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
