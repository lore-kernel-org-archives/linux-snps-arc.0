Return-Path: <SRS0=eyJ8=6S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D4CC47247
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 01:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205A520735
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 01:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uOHp9mqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205A520735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bamIulV3Rfv2UrLt+sokgENos5kLQHUcJmYA3IsPVNs=; b=uOHp9mqFzSR08L
	j8adZW2D34JpFDNIEqil7oTOljFiciJwUQ2TYbglumgcjhNZpJyerhx5kZmlJKHrwJLZQlNlY0Mlq
	/8Mc2bD21tMAuyeYkBquaBd6ESyVS78n3tL+fkikm76q8XT8Av11hUbWGalxXWNWH5BbL/JP8Qmbe
	GqTWe1raC4Kv83JqTAkVH3rWgkfRfQ8pBy+Mdz/c66rDInX4KY0oNAkEeeht8mLNJcm3WThggBJwo
	MfaOYQm+XU+fiA/mSy/1C25FpIEeR2uC8vYlY+2bVfd8bt83vlIpC6nR2iMreLif6lhVbfwPGMtqQ
	xVp5ubtbmpd7G/cmQ4bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVPeo-00017X-Gp; Mon, 04 May 2020 01:12:30 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVPbu-00046i-4n; Mon, 04 May 2020 01:09:32 +0000
IronPort-SDR: aTUf7M4ii1nNbX7gnistoigDX2vSe2PxxAkImHZiK8bXgsZwGgpnfXTyyx5E7AvNzB/OtHzvRR
 fzXpsx41eubg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:28 -0700
IronPort-SDR: 1bVoB4qieEEpgiINwJqOQjpqs6XmNA2TyX/l62INV5ILFJeC3pCrUNHGyeeWoQefqo/wcHYSxL
 CJqg8qvEGylQ==
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="406323237"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:27 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V2 09/11] arch/kmap: Don't hard code kmap_prot values
Date: Sun,  3 May 2020 18:09:10 -0700
Message-Id: <20200504010912.982044-10-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504010912.982044-1-ira.weiny@intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_180930_220853_61DFB489 
X-CRM114-Status: GOOD (  11.71  )
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
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

To support kmap_atomic_prot() on all architectures each arch must
support protections passed in to them.

Change csky, mips, nds32 and xtensa to use their global constant
kmap_prot rather than a hard coded value which was equal.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
changes from V1:
	Mention that kmap_prot is a constant in commit message
---
 arch/csky/mm/highmem.c   | 2 +-
 arch/mips/mm/highmem.c   | 2 +-
 arch/nds32/mm/highmem.c  | 2 +-
 arch/xtensa/mm/highmem.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 0aafbbbe651c..f4311669b5bb 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -32,7 +32,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, PAGE_KERNEL));
+	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
 	flush_tlb_one((unsigned long)vaddr);
 
 	return (void *)vaddr;
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 155fbb107b35..87023bd1a33c 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -29,7 +29,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, PAGE_KERNEL));
+	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
 	local_flush_tlb_one((unsigned long)vaddr);
 
 	return (void*) vaddr;
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index f6e6915c0d31..809f8c830f06 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -21,7 +21,7 @@ void *kmap_atomic_high(struct page *page)
 
 	idx = type + KM_TYPE_NR * smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	pte = (page_to_pfn(page) << PAGE_SHIFT) | (PAGE_KERNEL);
+	pte = (page_to_pfn(page) << PAGE_SHIFT) | (kmap_prot);
 	ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
 	set_pte(ptep, pte);
 
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 4de323e43682..50168b09510a 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -48,7 +48,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte + idx)));
 #endif
-	set_pte(kmap_pte + idx, mk_pte(page, PAGE_KERNEL_EXEC));
+	set_pte(kmap_pte + idx, mk_pte(page, kmap_prot));
 
 	return (void *)vaddr;
 }
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
