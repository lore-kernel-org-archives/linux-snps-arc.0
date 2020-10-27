Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CAAC388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:36:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9697322263
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QO9hN8eE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkJcfVLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9697322263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s3oTidWNs2Rv/JJRM0I9Dgrc+Kga0yk90Yu0h8LuLb4=; b=QO9hN8eE7+GOxAM1QsP6xYbDj
	36LUhqwc+vi7NGlEJSopbThrf2IgUswBbknSzFsVDU3bObzvCMAUPAe+v3iIpG8YXQAw8KrdqHCmj
	6/pw7X74/KLUI3efgbS1aanPYkeA6mMRtiGYXSvG647jwFRHg8U+TWamHcoiPy13HmFXjcIQBf9VG
	aTypiYnYTvPs2OqM0rkVD2HF+d7BUZDjSLAVX/4wSWhzpPw6Y+X+zvOqKDSJUMu/Yx4PjISDz+rxy
	W8MKskViOU0V+gpF0BSAqC8Nn40tNImmDpFHdfMUatwrXt6yy62MfSxZtdf+8v0DYz+lUnMgCdcoQ
	e3xhA1tHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNGh-0005Bh-JJ; Tue, 27 Oct 2020 11:35:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNC7-0002wR-DY; Tue, 27 Oct 2020 11:31:28 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2710A22265;
 Tue, 27 Oct 2020 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798274;
 bh=OfpKWBGiLOquFTLJJ06mrlODlaGrj9G30w52BIJJUiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkJcfVLZEayKMjLsOxCQb3TfX8Zc25/MSZymGYpjPHvkDTdRO8Iz6MAZG73W3GiLT
 rXkmMo7L+B/ex3DKfOKEYLXlSs4Yzfg8VeF0W9f9bSIOMZbPEUTAqUI0eHiB5RSEYZ
 hW9SS8NIr5fvoaUeoNy5XfavJIWQLiZiYFxZ2Hvs=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 10/13] arc: use FLATMEM with freeing of unused memory map
 instead of DISCONTIGMEM
Date: Tue, 27 Oct 2020 13:29:52 +0200
Message-Id: <20201027112955.14157-11-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073115_726979_0D4A68C3 
X-CRM114-Status: GOOD (  22.16  )
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

Currently ARC uses DISCONTIGMEM to cope with sparse physical memory address
space on systems with 2 memory banks. While DISCONTIGMEM avoids wasting
memory on unpopulated memory map, it adds both memory and CPU overhead
relatively to FLATMEM. Moreover, DISCONTINGMEM is generally considered
deprecated.

The obvious replacement for DISCONTIGMEM would be SPARSEMEM, but it is also
less efficient than FLATMEM in pfn_to_page() and page_to_pfn() conversions.
Besides it requires tuning of SECTION_SIZE which is not trivial for
possible ARC memory configuration.

Since the memory map for both banks is always allocated from the "lowmem"
bank, it is possible to use FLATMEM for two-bank configuration and simply
free the unused hole in the memory map. All is required for that is to
provide ARC-specific pfn_valid() that will take into account actual
physical memory configuration and define HAVE_ARCH_PFN_VALID.

The resulting kernel image configured with defconfig + HIGHMEM=y is
smaller:

$ size a/vmlinux b/vmlinux
   text    data     bss     dec     hex filename
4673503 1245456  279756 6198715  5e95bb a/vmlinux
4658706 1246864  279756 6185326  5e616e b/vmlinux

$ ./scripts/bloat-o-meter a/vmlinux b/vmlinux
add/remove: 28/30 grow/shrink: 42/399 up/down: 10986/-29025 (-18039)
...
Total: Before=4709315, After=4691276, chg -0.38%

Booting nSIM with haps_ns.dts results in the following memory usage
reports:

a:
Memory: 1559104K/1572864K available (3531K kernel code, 595K rwdata, 752K rodata, 136K init, 275K bss, 13760K reserved, 0K cma-reserved, 1048576K highmem)

b:
Memory: 1559112K/1572864K available (3519K kernel code, 594K rwdata, 752K rodata, 136K init, 280K bss, 13752K reserved, 0K cma-reserved, 1048576K highmem)

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/Kconfig            |  3 ++-
 arch/arc/include/asm/page.h | 20 +++++++++++++++++---
 arch/arc/mm/init.c          | 29 ++++++++++++++++++++++-------
 3 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 0a89cc9def65..c874f8ab0341 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -67,6 +67,7 @@ config GENERIC_CSUM
 
 config ARCH_DISCONTIGMEM_ENABLE
 	def_bool n
+	depends on BROKEN
 
 config ARCH_FLATMEM_ENABLE
 	def_bool y
@@ -506,7 +507,7 @@ config LINUX_RAM_BASE
 
 config HIGHMEM
 	bool "High Memory Support"
-	select ARCH_DISCONTIGMEM_ENABLE
+	select HAVE_ARCH_PFN_VALID
 	help
 	  With ARC 2G:2G address split, only upper 2G is directly addressable by
 	  kernel. Enable this to potentially allow access to rest of 2G and PAE
diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index b0dfed0f12be..23e41e890eda 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -82,11 +82,25 @@ typedef pte_t * pgtable_t;
  */
 #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
 
-#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
+/*
+ * When HIGHMEM is enabled we have holes in the memory map so we need
+ * pfn_valid() that takes into account the actual extents of the physical
+ * memory
+ */
+#ifdef CONFIG_HIGHMEM
+
+extern unsigned long arch_pfn_offset;
+#define ARCH_PFN_OFFSET		arch_pfn_offset
+
+extern int pfn_valid(unsigned long pfn);
+#define pfn_valid		pfn_valid
 
-#ifdef CONFIG_FLATMEM
+#else /* CONFIG_HIGHMEM */
+
+#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
 #define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
-#endif
+
+#endif /* CONFIG_HIGHMEM */
 
 /*
  * __pa, __va, virt_to_page (ALERT: deprecated, don't use them)
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 3a35b82a718e..ce07e697916c 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -28,6 +28,8 @@ static unsigned long low_mem_sz;
 static unsigned long min_high_pfn, max_high_pfn;
 static phys_addr_t high_mem_start;
 static phys_addr_t high_mem_sz;
+unsigned long arch_pfn_offset;
+EXPORT_SYMBOL(arch_pfn_offset);
 #endif
 
 #ifdef CONFIG_DISCONTIGMEM
@@ -98,16 +100,11 @@ void __init setup_arch_memory(void)
 	init_mm.brk = (unsigned long)_end;
 
 	/* first page of system - kernel .vector starts here */
-	min_low_pfn = ARCH_PFN_OFFSET;
+	min_low_pfn = virt_to_pfn(CONFIG_LINUX_RAM_BASE);
 
 	/* Last usable page of low mem */
 	max_low_pfn = max_pfn = PFN_DOWN(low_mem_start + low_mem_sz);
 
-#ifdef CONFIG_FLATMEM
-	/* pfn_valid() uses this */
-	max_mapnr = max_low_pfn - min_low_pfn;
-#endif
-
 	/*------------- bootmem allocator setup -----------------------*/
 
 	/*
@@ -153,7 +150,9 @@ void __init setup_arch_memory(void)
 	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
 	 * populated with normal memory zone while node 1 only has highmem
 	 */
+#ifdef CONFIG_DISCONTIGMEM
 	node_set_online(1);
+#endif
 
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
@@ -161,8 +160,15 @@ void __init setup_arch_memory(void)
 	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
 
 	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
+
+	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
 	kmap_init();
-#endif
+
+#else /* CONFIG_HIGHMEM */
+	/* pfn_valid() uses this when FLATMEM=y and HIGHMEM=n */
+	max_mapnr = max_low_pfn - min_low_pfn;
+
+#endif /* CONFIG_HIGHMEM */
 
 	free_area_init(max_zone_pfn);
 }
@@ -190,3 +196,12 @@ void __init mem_init(void)
 	highmem_init();
 	mem_init_print_info(NULL);
 }
+
+#ifdef CONFIG_HIGHMEM
+int pfn_valid(unsigned long pfn)
+{
+	return (pfn >= min_high_pfn && pfn <= max_high_pfn) ||
+		(pfn >= min_low_pfn && pfn <= max_low_pfn);
+}
+EXPORT_SYMBOL(pfn_valid);
+#endif
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
