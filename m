Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7356BC35FF4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 13 Mar 2025 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUZUqNeGaoxYSLTYicbYG7DcaaefmmbxxWNgHXBuEvY=; b=ZawRgo/k6ZgCfz
	PpQjuRHcyr4HTbWK6jXvbVArfg2bY/cW9nERxW1QlKlrAzGARQa/y1difxS2L7bnrCGVv/tFMZUAb
	ClNfb6zLwyJ+koPCFI/orj0BqfULrOhxNRViJprdWMiZv+vuFN6ffdiOO5/JPHV0OkhKM2i7tS39B
	nLvuyhzOCCb0sn+lrzIRmD6j6ik7wje9SCq5wOxcl1Ogz5FTaX0wrlfkgREkNpvBwWQ9DBsK7Z+lS
	PGgrPLcF82HsbFvFEwFGKZu5pAhD3rNN0j9/JniKMdLIwj65CrJyPjmklBzvl6GEgBrUsRSo1uGql
	+TLiDRXmYgDTjC2NwwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsk8F-0000000Bbjv-0VLT;
	Thu, 13 Mar 2025 15:05:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiyp-0000000BRJa-0tVD;
	Thu, 13 Mar 2025 13:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEE665C4862;
	Thu, 13 Mar 2025 13:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47360C4CEEA;
	Thu, 13 Mar 2025 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873930;
	bh=Af9gKlZIDExjo3NK0sfX49tiYlvs18loCfa3z4qCS4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HkCN8WEiZBDjOoNXkOEhfAhooerV5dkF2AGCJWQINBT3fsaxpVBZFUOQ//qEwjrlr
	 2bPNOWsGN1jhMAGqtWghdbP/jbKVpjyzoCccZNeP956MHM+FvQnV9vxHUVxRi1f57Z
	 Cy2YUjxboCWMf8Ik4jDKpmCaERo0psIxJMx1djt5KJO5hJIfLq+Tx6yluPloxucc9B
	 6OYJdeY4IAXQhLphwpYrBpClaEiHNJqeML3xePGY/xtE3X+oYEZbMNo1hpUyjyziIo
	 HNC9zwJ99nOKR2UIM2I44zSMPyeB7SMX8Wiy499daNzgPSdZFBmii2RnjlN8BaRWiJ
	 bOL4XjeNb0D3Q==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 08/13] xtensa: split out printing of virtual memory layout to a function
Date: Thu, 13 Mar 2025 15:49:58 +0200
Message-ID: <20250313135003.836600-9-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_065211_361579_EBDE051C 
X-CRM114-Status: GOOD (  11.21  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This will help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/xtensa/mm/init.c | 97 ++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 47 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index b2587a1a7c46..01577d33e602 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -66,6 +66,55 @@ void __init bootmem_init(void)
 	memblock_dump_all();
 }
 
+static void __init print_vm_layout(void)
+{
+	pr_info("virtual kernel memory layout:\n"
+#ifdef CONFIG_KASAN
+		"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
+#endif
+#ifdef CONFIG_MMU
+		"    vmalloc : 0x%08lx - 0x%08lx  (%5lu MB)\n"
+#endif
+#ifdef CONFIG_HIGHMEM
+		"    pkmap   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    fixmap  : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+#endif
+		"    lowmem  : 0x%08lx - 0x%08lx  (%5lu MB)\n"
+		"    .text   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .rodata : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .data   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .init   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
+		"    .bss    : 0x%08lx - 0x%08lx  (%5lu kB)\n",
+#ifdef CONFIG_KASAN
+		KASAN_SHADOW_START, KASAN_SHADOW_START + KASAN_SHADOW_SIZE,
+		KASAN_SHADOW_SIZE >> 20,
+#endif
+#ifdef CONFIG_MMU
+		VMALLOC_START, VMALLOC_END,
+		(VMALLOC_END - VMALLOC_START) >> 20,
+#ifdef CONFIG_HIGHMEM
+		PKMAP_BASE, PKMAP_BASE + LAST_PKMAP * PAGE_SIZE,
+		(LAST_PKMAP*PAGE_SIZE) >> 10,
+		FIXADDR_START, FIXADDR_END,
+		(FIXADDR_END - FIXADDR_START) >> 10,
+#endif
+		PAGE_OFFSET, PAGE_OFFSET +
+		(max_low_pfn - min_low_pfn) * PAGE_SIZE,
+#else
+		min_low_pfn * PAGE_SIZE, max_low_pfn * PAGE_SIZE,
+#endif
+		((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
+		(unsigned long)_text, (unsigned long)_etext,
+		(unsigned long)(_etext - _text) >> 10,
+		(unsigned long)__start_rodata, (unsigned long)__end_rodata,
+		(unsigned long)(__end_rodata - __start_rodata) >> 10,
+		(unsigned long)_sdata, (unsigned long)_edata,
+		(unsigned long)(_edata - _sdata) >> 10,
+		(unsigned long)__init_begin, (unsigned long)__init_end,
+		(unsigned long)(__init_end - __init_begin) >> 10,
+		(unsigned long)__bss_start, (unsigned long)__bss_stop,
+		(unsigned long)(__bss_stop - __bss_start) >> 10);
+}
 
 void __init zones_init(void)
 {
@@ -77,6 +126,7 @@ void __init zones_init(void)
 #endif
 	};
 	free_area_init(max_zone_pfn);
+	print_vm_layout();
 }
 
 static void __init free_highpages(void)
@@ -118,53 +168,6 @@ void __init mem_init(void)
 	high_memory = (void *)__va(max_low_pfn << PAGE_SHIFT);
 
 	memblock_free_all();
-
-	pr_info("virtual kernel memory layout:\n"
-#ifdef CONFIG_KASAN
-		"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
-#endif
-#ifdef CONFIG_MMU
-		"    vmalloc : 0x%08lx - 0x%08lx  (%5lu MB)\n"
-#endif
-#ifdef CONFIG_HIGHMEM
-		"    pkmap   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    fixmap  : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-#endif
-		"    lowmem  : 0x%08lx - 0x%08lx  (%5lu MB)\n"
-		"    .text   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .rodata : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .data   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .init   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
-		"    .bss    : 0x%08lx - 0x%08lx  (%5lu kB)\n",
-#ifdef CONFIG_KASAN
-		KASAN_SHADOW_START, KASAN_SHADOW_START + KASAN_SHADOW_SIZE,
-		KASAN_SHADOW_SIZE >> 20,
-#endif
-#ifdef CONFIG_MMU
-		VMALLOC_START, VMALLOC_END,
-		(VMALLOC_END - VMALLOC_START) >> 20,
-#ifdef CONFIG_HIGHMEM
-		PKMAP_BASE, PKMAP_BASE + LAST_PKMAP * PAGE_SIZE,
-		(LAST_PKMAP*PAGE_SIZE) >> 10,
-		FIXADDR_START, FIXADDR_END,
-		(FIXADDR_END - FIXADDR_START) >> 10,
-#endif
-		PAGE_OFFSET, PAGE_OFFSET +
-		(max_low_pfn - min_low_pfn) * PAGE_SIZE,
-#else
-		min_low_pfn * PAGE_SIZE, max_low_pfn * PAGE_SIZE,
-#endif
-		((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
-		(unsigned long)_text, (unsigned long)_etext,
-		(unsigned long)(_etext - _text) >> 10,
-		(unsigned long)__start_rodata, (unsigned long)__end_rodata,
-		(unsigned long)(__end_rodata - __start_rodata) >> 10,
-		(unsigned long)_sdata, (unsigned long)_edata,
-		(unsigned long)(_edata - _sdata) >> 10,
-		(unsigned long)__init_begin, (unsigned long)__init_end,
-		(unsigned long)(__init_end - __init_begin) >> 10,
-		(unsigned long)__bss_start, (unsigned long)__bss_stop,
-		(unsigned long)(__bss_stop - __bss_start) >> 10);
 }
 
 static void __init parse_memmap_one(char *p)
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
