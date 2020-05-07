Return-Path: <SRS0=90H6=6V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA1DC38A2A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:05:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68CC2083B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kQDubMvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68CC2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEgb6SadUGpGbMhsnh3rCjBS/T8prodnlit7GEMvO8M=; b=kQDubMvHObMHw9
	G7l7pSAElC6QYyAg+M9sPGLaO6zC8E8ncrjoSvKdR9QGy24VyUFVN6v77aGdaTwB1qvjm29Pu1aFo
	hQ0QEKR66vCzXpliLNm3tTUUlDztGcMrNFiuF+OIXyUfDlALAR6EvBtZQPM1/60l2v7kce/xyHhxI
	Px6rbnv611hssSU46JosOl3dIwVafJt3cTwO2yUbJyYreMZ491rnSBkPGqovRqGC44q8Wd7Sx+T+p
	Ds2BVXlW4JNTh/ZIV5wKb9swfbZsDB+/hj1F4JAeLqvWCp2MyWRrEHHtSNOG5qU74NQOLQ006Qahm
	D416KM+dE7Gb6gju1OGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWi5a-00014A-Sd; Thu, 07 May 2020 15:05:30 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWi0k-0003ce-TL; Thu, 07 May 2020 15:00:32 +0000
IronPort-SDR: xTxg1/GTFAxOGTcKCzYL59eVQpx9ei/BnucisWP+7GGjalBtLhR5H70GvSwXb35SdS5Ajm2B1Z
 2bh9IebAq/kA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:20 -0700
IronPort-SDR: 8kelONvFWkDSLnlxb+aC09SCcHpfPaQNdOui/5AjOqlu1OGR0HzXrUJ86xU7g9SACnHrbkp/Nh
 JAksyq4FIvkw==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="339377415"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:19 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 12/15] kmap: Remove kmap_atomic_to_page()
Date: Thu,  7 May 2020 08:00:00 -0700
Message-Id: <20200507150004.1423069-13-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_080031_029599_3423FAD9 
X-CRM114-Status: GOOD (  10.68  )
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
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

kmap_atomic_to_page() has no callers and is only defined on 1 arch and
declared on another.  Remove it.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	New Patch for this series
---
 arch/csky/include/asm/highmem.h  |  1 -
 arch/csky/mm/highmem.c           | 13 -------------
 arch/nds32/include/asm/highmem.h |  1 -
 3 files changed, 15 deletions(-)

diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index 263fbddcd0a3..ea2f3f39174d 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -33,7 +33,6 @@ extern pte_t *pkmap_page_table;
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
-extern struct page *kmap_atomic_to_page(void *ptr);
 
 #define flush_cache_kmaps() do {} while (0)
 
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 3ae5c8cd7619..3b3f622f5ae9 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -81,19 +81,6 @@ void *kmap_atomic_pfn(unsigned long pfn)
 	return (void *) vaddr;
 }
 
-struct page *kmap_atomic_to_page(void *ptr)
-{
-	unsigned long idx, vaddr = (unsigned long)ptr;
-	pte_t *pte;
-
-	if (vaddr < FIXADDR_START)
-		return virt_to_page(ptr);
-
-	idx = virt_to_fix(vaddr);
-	pte = kmap_pte - (idx - FIX_KMAP_BEGIN);
-	return pte_page(*pte);
-}
-
 static void __init kmap_pages_init(void)
 {
 	unsigned long vaddr;
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index 4d21308549c9..a48a6536d41a 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -52,7 +52,6 @@ extern void kmap_init(void);
  */
 #ifdef CONFIG_HIGHMEM
 extern void *kmap_atomic_pfn(unsigned long pfn);
-extern struct page *kmap_atomic_to_page(void *ptr);
 #endif
 
 #endif
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
