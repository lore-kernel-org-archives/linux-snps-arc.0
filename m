Return-Path: <SRS0=uxeU=EH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E4DC55178
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:06:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29D22224E
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:06:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M2fl8TTG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACW/GF0o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E29D22224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=56ySxfDfSZS8tj1P7oq8jtEkKUs+8UsaeT0F3Ehn6ok=; b=M2fl8TTGzK65U0DZFy3BJFV7F
	U5mpSWM0XSZVX/MZLQLBV8krCE7tYZHEozJqqPirJ0SA9kEM06Jn7Q6tmj63xkyk33UiFP3rQSgN1
	8f5X8L45SB4hy9wJa/Ug2d/l28A+2Rr3icOXjIwtKH2/Iqb/y9fI717WjhSGXDkq1laY63fOuy6r2
	g/XlSdLpFYihL6L98TvmLaOtPuN7RKlmM5ZuJsRkZjJcqKkEFgH2ACUE4zy/Rdn6kFoMMZDY1m7zy
	wQ5Iz0g4lhllEleOL7O1v3nkgYruvQloLmYAJ8pC7JHK1g1S4kjQd4qxbaj36McV2J5AdYyHUbzZ4
	qqzL7AQqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGno-0002eL-FH; Sun, 01 Nov 2020 17:06:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGnQ-0002TG-TT; Sun, 01 Nov 2020 17:05:42 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AD7E2222F;
 Sun,  1 Nov 2020 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250336;
 bh=zMhqm8rA573QnfAHp47KPpfQjEAK86ZwGGp3h7Y8/nM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ACW/GF0oeifYG5DUM8yF2CNpSzi0UkgF2Bo2MpTBtn8pgt6p7Wrv1TVShSnsY4kZu
 G1DEcqa7kLV3tQ4NpDXFjygFEQIDGGIHacXYPKO/PhGdzm/ZdawiYECLU9P9aQSRx3
 0JoyLIsUDdlSn9jb3p0lIRqN6R6B+qoPqqLHVIUc=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 05/13] ia64: split virtual map initialization out of
 paging_init()
Date: Sun,  1 Nov 2020 19:04:46 +0200
Message-Id: <20201101170454.9567-6-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_120537_140361_88A1E46A 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

For both FLATMEM and DISCONTIGMEM/SPARSEMEM the virtual map initialization
is spread over paging_init() for no good reason.

Split out the bits related to virtual map initialization to a helper
functions, one for FLATMEM and another for !FLATMEM configurations.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/mm/contig.c    | 34 ++++++++++++++++++++--------------
 arch/ia64/mm/discontig.c | 37 ++++++++++++++++++++-----------------
 2 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
index 2491aaeca90c..ba81d8cb0059 100644
--- a/arch/ia64/mm/contig.c
+++ b/arch/ia64/mm/contig.c
@@ -166,21 +166,8 @@ find_memory (void)
 	alloc_per_cpu_data();
 }
 
-/*
- * Set up the page tables.
- */
-
-void __init
-paging_init (void)
+static void __init virtual_map_init(void)
 {
-	unsigned long max_dma;
-	unsigned long max_zone_pfns[MAX_NR_ZONES];
-
-	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
-	max_dma = virt_to_phys((void *) MAX_DMA_ADDRESS) >> PAGE_SHIFT;
-	max_zone_pfns[ZONE_DMA32] = max_dma;
-	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
-
 #ifdef CONFIG_VIRTUAL_MEM_MAP
 	efi_memmap_walk(find_largest_hole, (u64 *)&max_gap);
 	if (max_gap < LARGE_GAP) {
@@ -206,6 +193,25 @@ paging_init (void)
 		printk("Virtual mem_map starts at 0x%p\n", mem_map);
 	}
 #endif /* !CONFIG_VIRTUAL_MEM_MAP */
+}
+
+/*
+ * Set up the page tables.
+ */
+
+void __init
+paging_init (void)
+{
+	unsigned long max_dma;
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
+
+	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
+	max_dma = virt_to_phys((void *) MAX_DMA_ADDRESS) >> PAGE_SHIFT;
+	max_zone_pfns[ZONE_DMA32] = max_dma;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+
+	virtual_map_init();
+
 	free_area_init(max_zone_pfns);
 	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
 }
diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
index f41dcf75887b..c7311131156e 100644
--- a/arch/ia64/mm/discontig.c
+++ b/arch/ia64/mm/discontig.c
@@ -584,6 +584,25 @@ void call_pernode_memory(unsigned long start, unsigned long len, void *arg)
 	}
 }
 
+static void __init virtual_map_init(void)
+{
+#ifdef CONFIG_VIRTUAL_MEM_MAP
+	int node;
+
+	VMALLOC_END -= PAGE_ALIGN(ALIGN(max_low_pfn, MAX_ORDER_NR_PAGES) *
+		sizeof(struct page));
+	vmem_map = (struct page *) VMALLOC_END;
+	efi_memmap_walk(create_mem_map_page_table, NULL);
+	printk("Virtual mem_map starts at 0x%p\n", vmem_map);
+
+	for_each_online_node(node) {
+		unsigned long pfn_offset = mem_data[node].min_pfn;
+
+		NODE_DATA(node)->node_mem_map = vmem_map + pfn_offset;
+	}
+#endif
+}
+
 /**
  * paging_init - setup page tables
  *
@@ -593,29 +612,13 @@ void call_pernode_memory(unsigned long start, unsigned long len, void *arg)
 void __init paging_init(void)
 {
 	unsigned long max_dma;
-	unsigned long pfn_offset = 0;
-	int node;
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
 
 	max_dma = virt_to_phys((void *) MAX_DMA_ADDRESS) >> PAGE_SHIFT;
 
 	sparse_init();
 
-#ifdef CONFIG_VIRTUAL_MEM_MAP
-	VMALLOC_END -= PAGE_ALIGN(ALIGN(max_low_pfn, MAX_ORDER_NR_PAGES) *
-		sizeof(struct page));
-	vmem_map = (struct page *) VMALLOC_END;
-	efi_memmap_walk(create_mem_map_page_table, NULL);
-	printk("Virtual mem_map starts at 0x%p\n", vmem_map);
-#endif
-
-	for_each_online_node(node) {
-		pfn_offset = mem_data[node].min_pfn;
-
-#ifdef CONFIG_VIRTUAL_MEM_MAP
-		NODE_DATA(node)->node_mem_map = vmem_map + pfn_offset;
-#endif
-	}
+	virtual_map_init();
 
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA32] = max_dma;
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
