Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E927FC388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3482D22263
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbVrjujg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqGyMUOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3482D22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BlecoPCUKch89UokuQ4EWvd1UBMGkuJsMAUqG90XPw0=; b=YbVrjujgkBaUc8AK+ml2+K8uP
	L+Kxw6E/0fU95VeA4e7p+uClgI8qd3yATYK/XwHkuFFxUI4IUjB4ZrwjrL4aU/hzUyNaWQXlLaFne
	dKy1pfg1qR2KqhpeHXwPPebZ3EsweBuXKpllH0WJJZqIGC8koBUHOPPaYYXf10y6AbZN9udefmmiy
	8Ruibs0NcH6K050LyD2LEq6E8Mois3OBIJOqOmuTAnpn7uXJexY0xillXPd97MlrzktCNmdAV1gth
	VNFvsZKI/r/jUMrbrZREmJ/MpCxX/WIAfrH3ltUpTpL4U7l53T55t+isF3XUuz7Q07VmtL+OnP4ku
	QNKClsyhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNDo-0003kh-Qq; Tue, 27 Oct 2020 11:33:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNBf-0002jH-Pk; Tue, 27 Oct 2020 11:30:49 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAC5E22263;
 Tue, 27 Oct 2020 11:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798246;
 bh=XipFZ9Gk+9MwwOjLDX33Y4z9wXHWMYFSkxcbyoqGVRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VqGyMUObvYgG5PnyEd2PUuzKEpLUyHmZb03SGMWoV/7usxrLDwp1bw65SRHW2FXjw
 5KB8xvl9vLXg/L228UtF6r5gwXIywW1768rLUuAN1W+p2s4PbsBoKYIXUHrJuEp0Iu
 GHIgAs+oZyd7B99QQVGwK4MZhf1tnDgWSL3fhPK8=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/13] ia64: forbid using VIRTUAL_MEM_MAP with FLATMEM
Date: Tue, 27 Oct 2020 13:29:48 +0200
Message-Id: <20201027112955.14157-7-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073048_211610_7C7C865A 
X-CRM114-Status: GOOD (  23.94  )
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

Virtual memory map was intended to avoid wasting memory on the memory map
on systems with large holes in the physical memory layout. Long ago it been
superseded first by DISCONTIGMEM and then by SPARSEMEM. Moreover,
SPARSEMEM_VMEMMAP provide the same functionality in much more portable way.

As the first step to removing the VIRTUAL_MEM_MAP forbid it's usage with
FLATMEM and panic on systems with large holes in the physical memory
layout that try to run FLATMEM kernels.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/Kconfig               |  2 +-
 arch/ia64/include/asm/meminit.h |  2 --
 arch/ia64/mm/contig.c           | 48 +++++++++++++++------------------
 arch/ia64/mm/init.c             | 14 ----------
 4 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 12aae706cb27..83de0273d474 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -329,7 +329,7 @@ config NODES_SHIFT
 # VIRTUAL_MEM_MAP has been retained for historical reasons.
 config VIRTUAL_MEM_MAP
 	bool "Virtual mem map"
-	depends on !SPARSEMEM
+	depends on !SPARSEMEM && !FLATMEM
 	default y
 	help
 	  Say Y to compile the kernel with support for a virtual mem map.
diff --git a/arch/ia64/include/asm/meminit.h b/arch/ia64/include/asm/meminit.h
index 092f1c91b36c..e789c0818edb 100644
--- a/arch/ia64/include/asm/meminit.h
+++ b/arch/ia64/include/asm/meminit.h
@@ -59,10 +59,8 @@ extern int reserve_elfcorehdr(u64 *start, u64 *end);
 extern int register_active_ranges(u64 start, u64 len, int nid);
 
 #ifdef CONFIG_VIRTUAL_MEM_MAP
-# define LARGE_GAP	0x40000000 /* Use virtual mem map if hole is > than this */
   extern unsigned long VMALLOC_END;
   extern struct page *vmem_map;
-  extern int find_largest_hole(u64 start, u64 end, void *arg);
   extern int create_mem_map_page_table(u64 start, u64 end, void *arg);
   extern int vmemmap_find_next_valid_pfn(int, int);
 #else
diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
index ba81d8cb0059..bfc4ecd0a2ab 100644
--- a/arch/ia64/mm/contig.c
+++ b/arch/ia64/mm/contig.c
@@ -19,15 +19,12 @@
 #include <linux/mm.h>
 #include <linux/nmi.h>
 #include <linux/swap.h>
+#include <linux/sizes.h>
 
 #include <asm/meminit.h>
 #include <asm/sections.h>
 #include <asm/mca.h>
 
-#ifdef CONFIG_VIRTUAL_MEM_MAP
-static unsigned long max_gap;
-#endif
-
 /* physical address where the bootmem map is located */
 unsigned long bootmap_start;
 
@@ -166,33 +163,30 @@ find_memory (void)
 	alloc_per_cpu_data();
 }
 
-static void __init virtual_map_init(void)
+static int __init find_largest_hole(u64 start, u64 end, void *arg)
 {
-#ifdef CONFIG_VIRTUAL_MEM_MAP
-	efi_memmap_walk(find_largest_hole, (u64 *)&max_gap);
-	if (max_gap < LARGE_GAP) {
-		vmem_map = (struct page *) 0;
-	} else {
-		unsigned long map_size;
+	u64 *max_gap = arg;
 
-		/* allocate virtual_mem_map */
+	static u64 last_end = PAGE_OFFSET;
 
-		map_size = PAGE_ALIGN(ALIGN(max_low_pfn, MAX_ORDER_NR_PAGES) *
-			sizeof(struct page));
-		VMALLOC_END -= map_size;
-		vmem_map = (struct page *) VMALLOC_END;
-		efi_memmap_walk(create_mem_map_page_table, NULL);
+	/* NOTE: this algorithm assumes efi memmap table is ordered */
 
-		/*
-		 * alloc_node_mem_map makes an adjustment for mem_map
-		 * which isn't compatible with vmem_map.
-		 */
-		NODE_DATA(0)->node_mem_map = vmem_map +
-			find_min_pfn_with_active_regions();
+	if (*max_gap < (start - last_end))
+		*max_gap = start - last_end;
+	last_end = end;
+	return 0;
+}
 
-		printk("Virtual mem_map starts at 0x%p\n", mem_map);
-	}
-#endif /* !CONFIG_VIRTUAL_MEM_MAP */
+static void __init verify_gap_absence(void)
+{
+	unsigned long max_gap;
+
+	/* Forbid FLATMEM if hole is > than 1G */
+	efi_memmap_walk(find_largest_hole, (u64 *)&max_gap);
+	if (max_gap >= SZ_1G)
+		panic("Cannot use FLATMEM with %ldMB hole\n"
+		      "Please switch over to SPARSEMEM\n",
+		      (max_gap >> 20));
 }
 
 /*
@@ -210,7 +204,7 @@ paging_init (void)
 	max_zone_pfns[ZONE_DMA32] = max_dma;
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 
-	virtual_map_init();
+	verify_gap_absence();
 
 	free_area_init(max_zone_pfns);
 	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index ef12e097f318..9b5acf8fb092 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -574,20 +574,6 @@ ia64_pfn_valid (unsigned long pfn)
 }
 EXPORT_SYMBOL(ia64_pfn_valid);
 
-int __init find_largest_hole(u64 start, u64 end, void *arg)
-{
-	u64 *max_gap = arg;
-
-	static u64 last_end = PAGE_OFFSET;
-
-	/* NOTE: this algorithm assumes efi memmap table is ordered */
-
-	if (*max_gap < (start - last_end))
-		*max_gap = start - last_end;
-	last_end = end;
-	return 0;
-}
-
 #endif /* CONFIG_VIRTUAL_MEM_MAP */
 
 int __init register_active_ranges(u64 start, u64 len, int nid)
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
