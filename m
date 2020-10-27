Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7CFC388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:32:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25C222263
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KrpoIbRP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjNj5FSF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25C222263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tMtPOI6UBIxLrso/wY3O+pOetzctF9PuyDJrMQp1z7M=; b=KrpoIbRPqdOuC/VG4r9jLgDcH
	9b/QSMXWzciOYnhFvn5Mbk5RVWiOtTjiI5ipurN6JZbLCnffIZIYy5ZQ22lQdnxoDF4GeyZKPGYDM
	z7tQq8C7ZQjjd1PSCCzm9XF5m414+zFQT8fO4lvMirb3VhK/UGCbuzc7Bcl0G8PPb09xXToXRVYIS
	WQWnAfTU0bIBG6BjgON/sFgDDJvFdY4IRLJAcAQzoEUd1lS8OYjF8kIzrLki/zo3tXTewOMGEXSfM
	B6gC2GP3kAV0wOlDCvV5Jc8XQjVtDK3cI8Gd16zAY/JofFWeUYylprm1mzoRZvwbVJupm8q5N72KM
	3RnNCPfPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXND0-0003HY-Bq; Tue, 27 Oct 2020 11:32:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNBE-0002Vf-GE; Tue, 27 Oct 2020 11:30:22 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6048522281;
 Tue, 27 Oct 2020 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798219;
 bh=3qystsPnlugjRY8KsORSq7RQeCX5pBKTiAj4xq/mspE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BjNj5FSFIwe17dRRhPtFzFq+PmqU9E4pD5GIlu2eyCkB5srdBe5YvAntFjwJNj5JX
 fYpsmJrEBjNkluDvSFl5V0nS70cGNpKKBs25O8Er9Oxzzdh3UabjM5ColXN7R435E4
 RZQC0EmtS/7eX0gagqQR3rMsLaX4XsAaOEnFJo68=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/13] ia64: remove custom __early_pfn_to_nid()
Date: Tue, 27 Oct 2020 13:29:44 +0200
Message-Id: <20201027112955.14157-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073021_665567_2E517105 
X-CRM114-Status: GOOD (  23.35  )
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

The ia64 implementation of __early_pfn_to_nid() essentially relies on the
same data as the generic implementation.

The correspondence between memory ranges and nodes is set in memblock
during early memory initialization in register_active_ranges() function.

The initialization of sparsemem that requires early_pfn_to_nid() happens
later and it can use the memblock information like the other architectures.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/Kconfig      |  3 ---
 arch/ia64/mm/numa.c    | 30 ------------------------------
 include/linux/mm.h     |  3 ---
 include/linux/mmzone.h | 11 -----------
 mm/page_alloc.c        | 16 ++++++++++++----
 5 files changed, 12 insertions(+), 51 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 39b25a5a591b..12aae706cb27 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -342,9 +342,6 @@ config HOLES_IN_ZONE
 	bool
 	default y if VIRTUAL_MEM_MAP
 
-config HAVE_ARCH_EARLY_PFN_TO_NID
-	def_bool NUMA && SPARSEMEM
-
 config HAVE_ARCH_NODEDATA_EXTENSION
 	def_bool y
 	depends on NUMA
diff --git a/arch/ia64/mm/numa.c b/arch/ia64/mm/numa.c
index f34964271101..46b6e5f3a40f 100644
--- a/arch/ia64/mm/numa.c
+++ b/arch/ia64/mm/numa.c
@@ -58,36 +58,6 @@ paddr_to_nid(unsigned long paddr)
 EXPORT_SYMBOL(paddr_to_nid);
 
 #if defined(CONFIG_SPARSEMEM) && defined(CONFIG_NUMA)
-/*
- * Because of holes evaluate on section limits.
- * If the section of memory exists, then return the node where the section
- * resides.  Otherwise return node 0 as the default.  This is used by
- * SPARSEMEM to allocate the SPARSEMEM sectionmap on the NUMA node where
- * the section resides.
- */
-int __meminit __early_pfn_to_nid(unsigned long pfn,
-					struct mminit_pfnnid_cache *state)
-{
-	int i, section = pfn >> PFN_SECTION_SHIFT, ssec, esec;
-
-	if (section >= state->last_start && section < state->last_end)
-		return state->last_nid;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		ssec = node_memblk[i].start_paddr >> PA_SECTION_SHIFT;
-		esec = (node_memblk[i].start_paddr + node_memblk[i].size +
-			((1L << PA_SECTION_SHIFT) - 1)) >> PA_SECTION_SHIFT;
-		if (section >= ssec && section < esec) {
-			state->last_start = ssec;
-			state->last_end = esec;
-			state->last_nid = node_memblk[i].nid;
-			return node_memblk[i].nid;
-		}
-	}
-
-	return -1;
-}
-
 void numa_clear_node(int cpu)
 {
 	unmap_cpu_from_node(cpu, NUMA_NO_NODE);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef360fe70aaf..ac51b07b9021 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2433,9 +2433,6 @@ static inline int early_pfn_to_nid(unsigned long pfn)
 #else
 /* please see mm/page_alloc.c */
 extern int __meminit early_pfn_to_nid(unsigned long pfn);
-/* there is a per-arch backend function. */
-extern int __meminit __early_pfn_to_nid(unsigned long pfn,
-					struct mminit_pfnnid_cache *state);
 #endif
 
 extern void set_dma_reserve(unsigned long new_dma_reserve);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index fb3bf696c05e..876600a6e891 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1428,17 +1428,6 @@ void sparse_init(void);
 #define subsection_map_init(_pfn, _nr_pages) do {} while (0)
 #endif /* CONFIG_SPARSEMEM */
 
-/*
- * During memory init memblocks map pfns to nids. The search is expensive and
- * this caches recent lookups. The implementation of __early_pfn_to_nid
- * may treat start/end as pfns or sections.
- */
-struct mminit_pfnnid_cache {
-	unsigned long last_start;
-	unsigned long last_end;
-	int last_nid;
-};
-
 /*
  * If it is possible to have holes within a MAX_ORDER_NR_PAGES, then we
  * need to check pfn validity within that MAX_ORDER_NR_PAGES block.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 23f5066bd4a5..1fdbf8da77af 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1558,14 +1558,23 @@ void __free_pages_core(struct page *page, unsigned int order)
 
 #ifdef CONFIG_NEED_MULTIPLE_NODES
 
-static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
+/*
+ * During memory init memblocks map pfns to nids. The search is expensive and
+ * this caches recent lookups. The implementation of __early_pfn_to_nid
+ * treats start/end as pfns.
+ */
+struct mminit_pfnnid_cache {
+	unsigned long last_start;
+	unsigned long last_end;
+	int last_nid;
+};
 
-#ifndef CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID
+static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
 
 /*
  * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
  */
-int __meminit __early_pfn_to_nid(unsigned long pfn,
+static int __meminit __early_pfn_to_nid(unsigned long pfn,
 					struct mminit_pfnnid_cache *state)
 {
 	unsigned long start_pfn, end_pfn;
@@ -1583,7 +1592,6 @@ int __meminit __early_pfn_to_nid(unsigned long pfn,
 
 	return nid;
 }
-#endif /* CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID */
 
 int __meminit early_pfn_to_nid(unsigned long pfn)
 {
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
