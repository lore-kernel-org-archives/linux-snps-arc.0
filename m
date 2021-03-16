Return-Path: <SRS0=wMnh=IO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F84C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 14:25:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA766505C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 14:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA766505C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=07C6M0eOXUdz3skuAGwzu98r+A9k7k1SlAxjx3N6+LE=; b=R0TNMKL5nsdYsjJKhdF1GUR0+9
	RdL8odgt7Wk4lwKaiJQc8Ch8maUSbWDfaW0d4tLBaQ8WNSYB2MVIZesTWUHfjODRN1HU5IEsu1SuH
	mU0Bpd4QRP0MHFNWlLy9pPSHslcRtIz1YLdFxM+qfiVPZLz2TN12AQoLK6XbCWqHvIOCg/ixaY+Sz
	FGcoS0pzP5iEzgZDob2evwUA14EetELeDK9Gp7LiF4fBMKVhzJ7IHZdkNEymeo1sB9nBkIyRHkuzf
	no/eRh60k4FTT8DLNr7gY4SI3YKvtiUTuB+3yJgPFrEdiNXxhfkp6GjlONc83Of4LfGfXjBspAR3Z
	H5EicgXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMAdC-000wQX-Ew; Tue, 16 Mar 2021 14:25:10 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMAcs-000wMo-Cn; Tue, 16 Mar 2021 14:24:54 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F0Fqr3X4wzrXQ4;
 Tue, 16 Mar 2021 22:22:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 22:24:31 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Richard Henderson <rth@twiddle.net>, Guo Ren
 <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Huacai Chen
 <chenhuacai@kernel.org>, Jonas Bonn <jonas@southpole.se>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 <linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-csky@vger.kernel.org>,
 <linux-hexagon@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
 <linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
 <openrisc@lists.librecores.org>, <linux-parisc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, <linux-um@lists.infradead.org>,
 <linux-xtensa@linux-xtensa.org>, <linux-mm@kvack.org>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH] mm: Move mem_init_print_info() into mm_init()
Date: Tue, 16 Mar 2021 22:26:37 +0800
Message-ID: <20210316142637.92193-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_142451_160786_48690E6B 
X-CRM114-Status: GOOD (  15.59  )
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

mem_init_print_info() is called in mem_init() on each architecture,
and pass NULL argument, cleanup it by using void argument and move
it into mm_init().

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/alpha/mm/init.c             | 1 -
 arch/arc/mm/init.c               | 1 -
 arch/arm/mm/init.c               | 2 --
 arch/arm64/mm/init.c             | 2 --
 arch/csky/mm/init.c              | 1 -
 arch/h8300/mm/init.c             | 2 --
 arch/hexagon/mm/init.c           | 1 -
 arch/ia64/mm/init.c              | 1 -
 arch/m68k/mm/init.c              | 1 -
 arch/microblaze/mm/init.c        | 1 -
 arch/mips/loongson64/numa.c      | 1 -
 arch/mips/mm/init.c              | 1 -
 arch/mips/sgi-ip27/ip27-memory.c | 1 -
 arch/nds32/mm/init.c             | 1 -
 arch/nios2/mm/init.c             | 1 -
 arch/openrisc/mm/init.c          | 2 --
 arch/parisc/mm/init.c            | 2 --
 arch/powerpc/mm/mem.c            | 1 -
 arch/riscv/mm/init.c             | 1 -
 arch/s390/mm/init.c              | 2 --
 arch/sh/mm/init.c                | 1 -
 arch/sparc/mm/init_32.c          | 2 --
 arch/sparc/mm/init_64.c          | 1 -
 arch/um/kernel/mem.c             | 1 -
 arch/x86/mm/init_32.c            | 2 --
 arch/x86/mm/init_64.c            | 2 --
 arch/xtensa/mm/init.c            | 1 -
 include/linux/mm.h               | 2 +-
 init/main.c                      | 1 +
 mm/page_alloc.c                  | 2 +-
 30 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 3c42b3147fd6..a97650a618f1 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -282,5 +282,4 @@ mem_init(void)
 	set_max_mapnr(max_low_pfn);
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 	memblock_free_all();
-	mem_init_print_info(NULL);
 }
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index ce07e697916c..33832e36bdb7 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -194,7 +194,6 @@ void __init mem_init(void)
 {
 	memblock_free_all();
 	highmem_init();
-	mem_init_print_info(NULL);
 }
 
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 828a2561b229..7022b7b5c400 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -316,8 +316,6 @@ void __init mem_init(void)
 
 	free_highpages();
 
-	mem_init_print_info(NULL);
-
 	/*
 	 * Check boundaries twice: Some fundamental inconsistencies can
 	 * be detected at build time already.
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 3685e12aba9b..e8f29a0bb2f1 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -491,8 +491,6 @@ void __init mem_init(void)
 	/* this will put all unused low memory onto the freelists */
 	memblock_free_all();
 
-	mem_init_print_info(NULL);
-
 	/*
 	 * Check boundaries twice: Some fundamental inconsistencies can be
 	 * detected at build time already.
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index 894050a8ce09..bf2004aa811a 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -107,7 +107,6 @@ void __init mem_init(void)
 			free_highmem_page(page);
 	}
 #endif
-	mem_init_print_info(NULL);
 }
 
 void free_initmem(void)
diff --git a/arch/h8300/mm/init.c b/arch/h8300/mm/init.c
index 1f3b345d68b9..f7bf4693e3b2 100644
--- a/arch/h8300/mm/init.c
+++ b/arch/h8300/mm/init.c
@@ -98,6 +98,4 @@ void __init mem_init(void)
 
 	/* this will put all low memory onto the freelists */
 	memblock_free_all();
-
-	mem_init_print_info(NULL);
 }
diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index f2e6c868e477..f01e91e10d95 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -55,7 +55,6 @@ void __init mem_init(void)
 {
 	/*  No idea where this is actually declared.  Seems to evade LXR.  */
 	memblock_free_all();
-	mem_init_print_info(NULL);
 
 	/*
 	 *  To-Do:  someone somewhere should wipe out the bootmem map
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 16d0d7d22657..83280e2df807 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -659,7 +659,6 @@ mem_init (void)
 	set_max_mapnr(max_low_pfn);
 	high_memory = __va(max_low_pfn * PAGE_SIZE);
 	memblock_free_all();
-	mem_init_print_info(NULL);
 
 	/*
 	 * For fsyscall entrpoints with no light-weight handler, use the ordinary
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 14c1e541451c..1759ab875d47 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -153,5 +153,4 @@ void __init mem_init(void)
 	/* this will put all memory onto the freelists */
 	memblock_free_all();
 	init_pointer_tables();
-	mem_init_print_info(NULL);
 }
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 05cf1fb3f5ff..ab55c70380a5 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -131,7 +131,6 @@ void __init mem_init(void)
 	highmem_setup();
 #endif
 
-	mem_init_print_info(NULL);
 	mem_init_done = 1;
 }
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 8315c871c435..fa9b4a487a47 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -178,7 +178,6 @@ void __init mem_init(void)
 	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
 	memblock_free_all();
 	setup_zero_pages();	/* This comes from node 0 */
-	mem_init_print_info(NULL);
 }
 
 /* All PCI device belongs to logical Node-0 */
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 5cb73bf74a8b..c36358758969 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -467,7 +467,6 @@ void __init mem_init(void)
 	memblock_free_all();
 	setup_zero_pages();	/* Setup zeroed pages.  */
 	mem_init_free_highmem();
-	mem_init_print_info(NULL);
 
 #ifdef CONFIG_64BIT
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 87bb6945ec25..6173684b5aaa 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -420,5 +420,4 @@ void __init mem_init(void)
 	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
 	memblock_free_all();
 	setup_zero_pages();	/* This comes from node 0 */
-	mem_init_print_info(NULL);
 }
diff --git a/arch/nds32/mm/init.c b/arch/nds32/mm/init.c
index fa86f7b2f416..f63f839738c4 100644
--- a/arch/nds32/mm/init.c
+++ b/arch/nds32/mm/init.c
@@ -191,7 +191,6 @@ void __init mem_init(void)
 
 	/* this will put all low memory onto the freelists */
 	memblock_free_all();
-	mem_init_print_info(NULL);
 
 	pr_info("virtual kernel memory layout:\n"
 		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index 61862dbb0e32..613fcaa5988a 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -71,7 +71,6 @@ void __init mem_init(void)
 
 	/* this will put all memory onto the freelists */
 	memblock_free_all();
-	mem_init_print_info(NULL);
 }
 
 void __init mmu_init(void)
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index bf9b2310fc93..d5641198b90c 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -211,8 +211,6 @@ void __init mem_init(void)
 	/* this will put all low memory onto the freelists */
 	memblock_free_all();
 
-	mem_init_print_info(NULL);
-
 	printk("mem_init_done ...........................................\n");
 	mem_init_done = 1;
 	return;
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 9ca4e4ff6895..591a4e939415 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -573,8 +573,6 @@ void __init mem_init(void)
 #endif
 		parisc_vmalloc_start = SET_MAP_OFFSET(MAP_START);
 
-	mem_init_print_info(NULL);
-
 #if 0
 	/*
 	 * Do not expose the virtual kernel memory layout to userspace.
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 4e8ce6d85232..7e11c4cb08b8 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -312,7 +312,6 @@ void __init mem_init(void)
 		(mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) - 1;
 #endif
 
-	mem_init_print_info(NULL);
 #ifdef CONFIG_PPC32
 	pr_info("Kernel virtual memory layout:\n");
 #ifdef CONFIG_KASAN
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7f5036fbee8c..3c5ee3b7d811 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -102,7 +102,6 @@ void __init mem_init(void)
 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 	memblock_free_all();
 
-	mem_init_print_info(NULL);
 	print_vm_layout();
 }
 
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 0e76b2127dc6..8ac710de1ab1 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -209,8 +209,6 @@ void __init mem_init(void)
 	setup_zero_pages();	/* Setup zeroed pages. */
 
 	cmma_init_nodat();
-
-	mem_init_print_info(NULL);
 }
 
 void free_initmem(void)
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 0db6919af8d3..168d7d4dd735 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -359,7 +359,6 @@ void __init mem_init(void)
 
 	vsyscall_init();
 
-	mem_init_print_info(NULL);
 	pr_info("virtual kernel memory layout:\n"
 		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
 		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 6139c5700ccc..1e9f577f084d 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -292,8 +292,6 @@ void __init mem_init(void)
 
 		map_high_region(start_pfn, end_pfn);
 	}
-
-	mem_init_print_info(NULL);
 }
 
 void sparc_flush_page_to_ram(struct page *page)
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 182bb7bdaa0a..e454f179cf5d 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2520,7 +2520,6 @@ void __init mem_init(void)
 	}
 	mark_page_reserved(mem_map_zero);
 
-	mem_init_print_info(NULL);
 
 	if (tlb_type == cheetah || tlb_type == cheetah_plus)
 		cheetah_ecache_flush_init();
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 9242dc91d751..9019ff5905b1 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -54,7 +54,6 @@ void __init mem_init(void)
 	memblock_free_all();
 	max_low_pfn = totalram_pages();
 	max_pfn = max_low_pfn;
-	mem_init_print_info(NULL);
 	kmalloc_ok = 1;
 }
 
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index da31c2635ee4..21ffb03f6c72 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -755,8 +755,6 @@ void __init mem_init(void)
 	after_bootmem = 1;
 	x86_init.hyper.init_after_bootmem();
 
-	mem_init_print_info(NULL);
-
 	/*
 	 * Check boundaries twice: Some fundamental inconsistencies can
 	 * be detected at build time already.
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 5430c81eefc9..aa8387aab9c1 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1350,8 +1350,6 @@ void __init mem_init(void)
 		kclist_add(&kcore_vsyscall, (void *)VSYSCALL_ADDR, PAGE_SIZE, KCORE_USER);
 
 	preallocate_vmalloc_pages();
-
-	mem_init_print_info(NULL);
 }
 
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 2daeba9e454e..6a32b2cf2718 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -119,7 +119,6 @@ void __init mem_init(void)
 
 	memblock_free_all();
 
-	mem_init_print_info(NULL);
 	pr_info("virtual kernel memory layout:\n"
 #ifdef CONFIG_KASAN
 		"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 89314651dd62..c2e0b3495c5a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2373,7 +2373,7 @@ extern unsigned long free_reserved_area(void *start, void *end,
 					int poison, const char *s);
 
 extern void adjust_managed_page_count(struct page *page, long count);
-extern void mem_init_print_info(const char *str);
+extern void mem_init_print_info(void);
 
 extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
 
diff --git a/init/main.c b/init/main.c
index 53b278845b88..5581af5b4cb7 100644
--- a/init/main.c
+++ b/init/main.c
@@ -830,6 +830,7 @@ static void __init mm_init(void)
 	report_meminit();
 	stack_depot_init();
 	mem_init();
+	mem_init_print_info();
 	/* page_owner must be initialized after buddy is ready */
 	page_ext_init_flatmem_late();
 	kmem_cache_init();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 55d938297ce6..e4a6bf69c806 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7728,7 +7728,7 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 	return pages;
 }
 
-void __init mem_init_print_info(const char *str)
+void __init mem_init_print_info(void)
 {
 	unsigned long physpages, codesize, datasize, rosize, bss_size;
 	unsigned long init_code_size, init_data_size;
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
