Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24696C55178
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:33:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7085222265
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xDNPfzb7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5e82w/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7085222265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z11rSXKeOe67+uscN2YGM8AMFZMR3iMC38duwcdrh1U=; b=xDNPfzb7bKAWNpCOdQa+2Qenp
	/Xnb1VFVJlO9vr0FflGnHIdAIKLjm3X6Y7wrtUS5uQjbF2rhVs5BOgJ3a2QIYPLtcUS9OI5f1RHGx
	sdLKHOzOdo+U7yiLV/J49LDmwSSVCWF9nocsvAWiSBLgFa3Q1Je5R0+/Q4c9YK9LDMQ1rlsIGx4tl
	arWfKoHOLCJxCX9jbPKtK/nQGJSBEvRxc2rrP2PIKe3ZWSIZTQO+bmdd1A1yWq7IpqhnUuxAdC7id
	ATgGDEq6RMJ90KFJ7+hv44jtmTfpkmCboszwNhV4B1zSm4fdIz0w2nvv5vBjf2sxYwcLkkxuEvczc
	Ta4mY0+3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNEc-0004AA-A2; Tue, 27 Oct 2020 11:33:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNC1-0002st-0a; Tue, 27 Oct 2020 11:31:21 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B88622283;
 Tue, 27 Oct 2020 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798267;
 bh=+ecFmVmt/rsUVyb3hVXQX25qqx1MNuz8K3wp7M/7+rI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5e82w/94BdRnluTzImlefPfKPSeSMKp+xB2kFrvXPb0oB6Ynh6TW11woagIP4LU6
 AXzJA/0vniCcaywte/JbhdASXRfVqXWtE1809GUu50ovjsG3qZ2C6Z0MGJhIXqjLBL
 FBq+ABlYaT3ESGxJUX/Buau6xyPFFEuwD0h2LN4g=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/13] arm, arm64: move free_unused_memmap() to generic mm
Date: Tue, 27 Oct 2020 13:29:51 +0200
Message-Id: <20201027112955.14157-10-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073109_397530_EF2F82FB 
X-CRM114-Status: GOOD (  26.05  )
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

ARM and ARM64 free unused parts of the memory map just before the
initialization of the page allocator. To allow holes in the memory map both
architectures overload pfn_valid() and define HAVE_ARCH_PFN_VALID.

Allowing holes in the memory map for FLATMEM may be useful for small
machines, such as ARC and m68k and will enable those architectures to cease
using DISCONTIGMEM and still support more than one memory bank.

Move the functions that free unused memory map to generic mm and enable
them in case HAVE_ARCH_PFN_VALID=y.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/Kconfig         |  3 ++
 arch/arm/Kconfig     |  4 +--
 arch/arm/mm/init.c   | 78 ------------------------------------------
 arch/arm64/Kconfig   |  4 +--
 arch/arm64/mm/init.c | 68 -------------------------------------
 mm/memblock.c        | 80 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 85 insertions(+), 152 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..d715da18a8a9 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1028,6 +1028,9 @@ config HAVE_STATIC_CALL_INLINE
 	bool
 	depends on HAVE_STATIC_CALL
 
+config HAVE_ARCH_PFN_VALID
+	bool
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 83adc46c1e67..495d42c5ecec 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -68,6 +68,7 @@ config ARM
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select HAVE_ARCH_PFN_VALID
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER if AEABI && !OABI_COMPAT
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
@@ -1488,9 +1489,6 @@ config ARCH_SPARSEMEM_ENABLE
 	bool
 	select SPARSEMEM_STATIC if SPARSEMEM
 
-config HAVE_ARCH_PFN_VALID
-	def_bool y
-
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index d57112a276f5..a04ac5ea7641 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -267,83 +267,6 @@ static inline void poison_init_mem(void *s, size_t count)
 		*p++ = 0xe7fddef0;
 }
 
-static inline void __init
-free_memmap(unsigned long start_pfn, unsigned long end_pfn)
-{
-	struct page *start_pg, *end_pg;
-	phys_addr_t pg, pgend;
-
-	/*
-	 * Convert start_pfn/end_pfn to a struct page pointer.
-	 */
-	start_pg = pfn_to_page(start_pfn - 1) + 1;
-	end_pg = pfn_to_page(end_pfn - 1) + 1;
-
-	/*
-	 * Convert to physical addresses, and
-	 * round start upwards and end downwards.
-	 */
-	pg = PAGE_ALIGN(__pa(start_pg));
-	pgend = __pa(end_pg) & PAGE_MASK;
-
-	/*
-	 * If there are free pages between these,
-	 * free the section of the memmap array.
-	 */
-	if (pg < pgend)
-		memblock_free_early(pg, pgend - pg);
-}
-
-/*
- * The mem_map array can get very big.  Free the unused area of the memory map.
- */
-static void __init free_unused_memmap(void)
-{
-	unsigned long start, end, prev_end = 0;
-	int i;
-
-	/*
-	 * This relies on each bank being in address order.
-	 * The banks are sorted previously in bootmem_init().
-	 */
-	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
-#ifdef CONFIG_SPARSEMEM
-		/*
-		 * Take care not to free memmap entries that don't exist
-		 * due to SPARSEMEM sections which aren't present.
-		 */
-		start = min(start,
-				 ALIGN(prev_end, PAGES_PER_SECTION));
-#else
-		/*
-		 * Align down here since the VM subsystem insists that the
-		 * memmap entries are valid from the bank start aligned to
-		 * MAX_ORDER_NR_PAGES.
-		 */
-		start = round_down(start, MAX_ORDER_NR_PAGES);
-#endif
-		/*
-		 * If we had a previous bank, and there is a space
-		 * between the current bank and the previous, free it.
-		 */
-		if (prev_end && prev_end < start)
-			free_memmap(prev_end, start);
-
-		/*
-		 * Align up here since the VM subsystem insists that the
-		 * memmap entries are valid from the bank end aligned to
-		 * MAX_ORDER_NR_PAGES.
-		 */
-		prev_end = ALIGN(end, MAX_ORDER_NR_PAGES);
-	}
-
-#ifdef CONFIG_SPARSEMEM
-	if (!IS_ALIGNED(prev_end, PAGES_PER_SECTION))
-		free_memmap(prev_end,
-			    ALIGN(prev_end, PAGES_PER_SECTION));
-#endif
-}
-
 static void __init free_highpages(void)
 {
 #ifdef CONFIG_HIGHMEM
@@ -385,7 +308,6 @@ void __init mem_init(void)
 	set_max_mapnr(pfn_to_page(max_pfn) - mem_map);
 
 	/* this will put all unused low memory onto the freelists */
-	free_unused_memmap();
 	memblock_free_all();
 
 #ifdef CONFIG_SA1111
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f858c352f72a..b7e6a0c09d12 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -138,6 +138,7 @@ config ARM64
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
+	select HAVE_ARCH_PFN_VALID
 	select HAVE_ARCH_PREL32_RELOCATIONS
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_STACKLEAK
@@ -1021,9 +1022,6 @@ config ARCH_SELECT_MEMORY_MODEL
 config ARCH_FLATMEM_ENABLE
 	def_bool !NUMA
 
-config HAVE_ARCH_PFN_VALID
-	def_bool y
-
 config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 095540667f0f..3d8328277bec 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -430,71 +430,6 @@ void __init bootmem_init(void)
 	memblock_dump_all();
 }
 
-#ifndef CONFIG_SPARSEMEM_VMEMMAP
-static inline void free_memmap(unsigned long start_pfn, unsigned long end_pfn)
-{
-	struct page *start_pg, *end_pg;
-	unsigned long pg, pgend;
-
-	/*
-	 * Convert start_pfn/end_pfn to a struct page pointer.
-	 */
-	start_pg = pfn_to_page(start_pfn - 1) + 1;
-	end_pg = pfn_to_page(end_pfn - 1) + 1;
-
-	/*
-	 * Convert to physical addresses, and round start upwards and end
-	 * downwards.
-	 */
-	pg = (unsigned long)PAGE_ALIGN(__pa(start_pg));
-	pgend = (unsigned long)__pa(end_pg) & PAGE_MASK;
-
-	/*
-	 * If there are free pages between these, free the section of the
-	 * memmap array.
-	 */
-	if (pg < pgend)
-		memblock_free(pg, pgend - pg);
-}
-
-/*
- * The mem_map array can get very big. Free the unused area of the memory map.
- */
-static void __init free_unused_memmap(void)
-{
-	unsigned long start, end, prev_end = 0;
-	int i;
-
-	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
-#ifdef CONFIG_SPARSEMEM
-		/*
-		 * Take care not to free memmap entries that don't exist due
-		 * to SPARSEMEM sections which aren't present.
-		 */
-		start = min(start, ALIGN(prev_end, PAGES_PER_SECTION));
-#endif
-		/*
-		 * If we had a previous bank, and there is a space between the
-		 * current bank and the previous, free it.
-		 */
-		if (prev_end && prev_end < start)
-			free_memmap(prev_end, start);
-
-		/*
-		 * Align up here since the VM subsystem insists that the
-		 * memmap entries are valid from the bank end aligned to
-		 * MAX_ORDER_NR_PAGES.
-		 */
-		prev_end = ALIGN(end, MAX_ORDER_NR_PAGES);
-	}
-
-#ifdef CONFIG_SPARSEMEM
-	if (!IS_ALIGNED(prev_end, PAGES_PER_SECTION))
-		free_memmap(prev_end, ALIGN(prev_end, PAGES_PER_SECTION));
-#endif
-}
-#endif	/* !CONFIG_SPARSEMEM_VMEMMAP */
-
 /*
  * mem_init() marks the free areas in the mem_map and tells us how much memory
  * is free.  This is done after various parts of the system have claimed their
@@ -510,9 +445,6 @@ void __init mem_init(void)
 
 	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
 
-#ifndef CONFIG_SPARSEMEM_VMEMMAP
-	free_unused_memmap();
-#endif
 	/* this will put all unused low memory onto the freelists */
 	memblock_free_all();
 
diff --git a/mm/memblock.c b/mm/memblock.c
index b68ee86788af..049df4163a97 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1926,6 +1926,85 @@ static int __init early_memblock(char *p)
 }
 early_param("memblock", early_memblock);
 
+static void __init free_memmap(unsigned long start_pfn, unsigned long end_pfn)
+{
+	struct page *start_pg, *end_pg;
+	phys_addr_t pg, pgend;
+
+	/*
+	 * Convert start_pfn/end_pfn to a struct page pointer.
+	 */
+	start_pg = pfn_to_page(start_pfn - 1) + 1;
+	end_pg = pfn_to_page(end_pfn - 1) + 1;
+
+	/*
+	 * Convert to physical addresses, and round start upwards and end
+	 * downwards.
+	 */
+	pg = PAGE_ALIGN(__pa(start_pg));
+	pgend = __pa(end_pg) & PAGE_MASK;
+
+	/*
+	 * If there are free pages between these, free the section of the
+	 * memmap array.
+	 */
+	if (pg < pgend)
+		memblock_free(pg, pgend - pg);
+}
+
+/*
+ * The mem_map array can get very big.  Free the unused area of the memory map.
+ */
+static void __init free_unused_memmap(void)
+{
+	unsigned long start, end, prev_end = 0;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_PFN_VALID) ||
+	    IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP))
+		return;
+
+	/*
+	 * This relies on each bank being in address order.
+	 * The banks are sorted previously in bootmem_init().
+	 */
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
+#ifdef CONFIG_SPARSEMEM
+		/*
+		 * Take care not to free memmap entries that don't exist
+		 * due to SPARSEMEM sections which aren't present.
+		 */
+		start = min(start, ALIGN(prev_end, PAGES_PER_SECTION));
+#else
+		/*
+		 * Align down here since the VM subsystem insists that the
+		 * memmap entries are valid from the bank start aligned to
+		 * MAX_ORDER_NR_PAGES.
+		 */
+		start = round_down(start, MAX_ORDER_NR_PAGES);
+#endif
+
+		/*
+		 * If we had a previous bank, and there is a space
+		 * between the current bank and the previous, free it.
+		 */
+		if (prev_end && prev_end < start)
+			free_memmap(prev_end, start);
+
+		/*
+		 * Align up here since the VM subsystem insists that the
+		 * memmap entries are valid from the bank end aligned to
+		 * MAX_ORDER_NR_PAGES.
+		 */
+		prev_end = ALIGN(end, MAX_ORDER_NR_PAGES);
+	}
+
+#ifdef CONFIG_SPARSEMEM
+	if (!IS_ALIGNED(prev_end, PAGES_PER_SECTION))
+		free_memmap(prev_end, ALIGN(prev_end, PAGES_PER_SECTION));
+#endif
+}
+
 static void __init __free_pages_memory(unsigned long start, unsigned long end)
 {
 	int order;
@@ -2012,6 +2091,7 @@ unsigned long __init memblock_free_all(void)
 {
 	unsigned long pages;
 
+	free_unused_memmap();
 	reset_all_zones_managed_pages();
 
 	pages = free_low_memory_core_early();
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
