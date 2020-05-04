Return-Path: <SRS0=eyJ8=6S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0739C4725D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 01:09:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32B72071C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 01:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cRNB6SwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C32B72071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIo8DGZQP3AG1/dvtHfKGSow6HyJiyAoQKueCqFU7LQ=; b=cRNB6SwD14Mdxl
	lysTyXnPDJ3z8OA+eDlI3BGz02cT8+OwSLAqA9IXoHAD4+nPs0xbF5uer3fccG3H8PXcfqBtOtE+0
	a5bfNiKw0ZVFplk0Gw+VGdFWaLb1LwIAbIfXMEU6CRLvVseVhqWMg9dnDA/Iic+icmCkrlphINjKx
	kk64rX0oeh01G1i70j5a9G0zVNXt1nasOHFhaMCbD7rC+qpp9O6+SVdUSPOCjsgIWEYLJxx7JcL0l
	SQRNN8sc0+Xuout6xVvGxcyEwytoIut6zy7QhjOeqQRZBXYjl3j+ygRGWRkZCtHqj/QsI0u5q0eY/
	ZitSvP1FFmsi7NRkWYKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVPcJ-0004YH-61; Mon, 04 May 2020 01:09:55 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVPbo-00042J-4J; Mon, 04 May 2020 01:09:25 +0000
IronPort-SDR: tkmx3Q4rJ5q6zxtzngXs6wQQYBMZT5f7T1lLwr4Cn3WQtQONmqcndkfGrJTHmUS2yb03+LXbwP
 aS6A96RwkwHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:21 -0700
IronPort-SDR: 5JoyiIVwom1lkt6Vg0SCXKYR4YSDxajShQ4pXaZ+YL/BI2Wr1bMA05ygOTiJSAB3ffIfcCKkOE
 Bmvncx5YYtNQ==
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="277386312"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:20 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V2 01/11] arch/kmap: Remove BUG_ON()
Date: Sun,  3 May 2020 18:09:02 -0700
Message-Id: <20200504010912.982044-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504010912.982044-1-ira.weiny@intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_180924_184233_3C7128C5 
X-CRM114-Status: GOOD (  12.15  )
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
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

Replace the use of BUG_ON(in_interrupt()) in the kmap() and kunmap()
in favor of might_sleep().

Besides the benefits of might_sleep(), this normalizes the
implementations such that they can be made generic in subsequent
patches.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/include/asm/highmem.h        | 2 +-
 arch/arc/mm/highmem.c                 | 2 +-
 arch/arm/mm/highmem.c                 | 2 +-
 arch/csky/mm/highmem.c                | 2 +-
 arch/microblaze/include/asm/highmem.h | 2 +-
 arch/mips/mm/highmem.c                | 2 +-
 arch/nds32/mm/highmem.c               | 2 +-
 arch/powerpc/include/asm/highmem.h    | 2 +-
 arch/sparc/include/asm/highmem.h      | 4 ++--
 arch/x86/mm/highmem_32.c              | 3 +--
 arch/xtensa/include/asm/highmem.h     | 4 ++--
 11 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 1af00accb37f..042e92921c4c 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -45,7 +45,7 @@ static inline void flush_cache_kmaps(void)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index fc8849e4f72e..39ef7b9a3aa9 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -51,7 +51,7 @@ static pte_t * fixmap_page_table;
 
 void *kmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
 
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index a76f8ace9ce6..cc6eb79ef20c 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -42,7 +42,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 813129145f3d..690d678649d1 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -29,7 +29,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 332c78e15198..99ced7278b5c 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -66,7 +66,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index d08e6d7d533b..edd889f6cede 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -28,7 +28,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index 022779af6148..4c7c28e994ea 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -24,7 +24,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index a4b65b186ec6..529512f6d65a 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -74,7 +74,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 18d776925c45..7dd2d4b3f980 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -55,7 +55,7 @@ void kunmap_high(struct page *page);
 
 static inline void *kmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_high(page);
@@ -63,7 +63,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 0a1898b8552e..8af66382672b 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -15,8 +15,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	if (in_interrupt())
-		BUG();
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 04e9340eac4b..413848cc1e56 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -73,7 +73,7 @@ static inline void *kmap(struct page *page)
 	 */
 	BUILD_BUG_ON(PKMAP_BASE <
 		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_high(page);
@@ -81,7 +81,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
