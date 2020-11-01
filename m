Return-Path: <SRS0=uxeU=EH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D32C4741F
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:05:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D74242074F
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYtYKFNH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3LzlJEl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D74242074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X63o55IUDswYWReTeAPHWBhh3MO7wUupgbAUN4UfIQY=; b=GYtYKFNH5foFyxGEKAsuTDblb
	B4SqDQOjRK+0azcV10BJb4stHWHL/qOC7Q+k0IVI7HvHNial6h8icfnlGsKJhPihOJGV32g5Hxj65
	o0AmE4gP0AtzLhnk0LVIKtMJHjmjaMUe0w87OP0xHRTsB6FnryjUvUf7hsqRmvxB+JhOaWF2Y6s9A
	hndItFLh5KKTxh9e9TtRGB5QNF7F8JYtlShSTFyPGk/FZViuqULR1dsEesPtXJK2noK/YHBoduHrs
	dOKEBAYATAKq8JPJ8TGmrk26QvfPFwL4SCgmCrwxb5M11ji8sl4+4UBJacR5igdwGUHedA4EfDoNr
	UKxiTkEOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGn8-0002LK-3e; Sun, 01 Nov 2020 17:05:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGn1-0002J3-UA; Sun, 01 Nov 2020 17:05:13 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AA9F2222F;
 Sun,  1 Nov 2020 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250311;
 bh=961zp8YP3Ph/5e1cBGv3GfPpdUC5CFeOssQ/7iZPL6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3LzlJElvw0Fa8OWGGAqYAf5r/tGpYL6JJKsk76GUxBLzkPSsnkBGmRo88fj0JQ7h
 WqipSTWJpulb4B7oJWChWcrrF3PMKqQr1vx0VRQ7hR7Run92Ysl+OkhWogdTkb0WSK
 3D2Jdazu5rkSgWzeq7e7XLOoO0GlXsJ02Ss+Yq88=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 01/13] alpha: switch from DISCONTIGMEM to SPARSEMEM
Date: Sun,  1 Nov 2020 19:04:42 +0200
Message-Id: <20201101170454.9567-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_120512_136945_40474C0C 
X-CRM114-Status: GOOD (  21.03  )
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

Enable SPARSEMEM support on alpha and deprecate DISCONTIGMEM.

The required changes are mostly around moving duplicated definitions of
page access and address conversion macros to a common place and making sure
they are available for all memory models.

The DISCONTINGMEM support is marked as BROKEN an will be removed in a
couple of releases.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/Kconfig                 |  8 ++++++++
 arch/alpha/include/asm/mmzone.h    | 14 ++------------
 arch/alpha/include/asm/page.h      |  7 ++++---
 arch/alpha/include/asm/pgtable.h   | 12 +++++-------
 arch/alpha/include/asm/sparsemem.h | 18 ++++++++++++++++++
 arch/alpha/kernel/setup.c          |  1 +
 6 files changed, 38 insertions(+), 22 deletions(-)
 create mode 100644 arch/alpha/include/asm/sparsemem.h

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d6e9fc7a7b19..aedf5c296f13 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -40,6 +40,7 @@ config ALPHA
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select SET_FS
+	select SPARSEMEM_EXTREME if SPARSEMEM
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
@@ -551,12 +552,19 @@ config NR_CPUS
 
 config ARCH_DISCONTIGMEM_ENABLE
 	bool "Discontiguous Memory Support"
+	depends on BROKEN
 	help
 	  Say Y to support efficient handling of discontiguous physical memory,
 	  for architectures which are either NUMA (Non-Uniform Memory Access)
 	  or have huge holes in the physical address space for other reasons.
 	  See <file:Documentation/vm/numa.rst> for more.
 
+config ARCH_SPARSEMEM_ENABLE
+	bool "Sparse Memory Support"
+	help
+	  Say Y to support efficient handling of discontiguous physical memory,
+	  for systems that have huge holes in the physical address space.
+
 config NUMA
 	bool "NUMA Support (EXPERIMENTAL)"
 	depends on DISCONTIGMEM && BROKEN
diff --git a/arch/alpha/include/asm/mmzone.h b/arch/alpha/include/asm/mmzone.h
index 9b521c857436..86644604d977 100644
--- a/arch/alpha/include/asm/mmzone.h
+++ b/arch/alpha/include/asm/mmzone.h
@@ -6,6 +6,8 @@
 #ifndef _ASM_MMZONE_H_
 #define _ASM_MMZONE_H_
 
+#ifdef CONFIG_DISCONTIGMEM
+
 #include <asm/smp.h>
 
 /*
@@ -45,8 +47,6 @@ PLAT_NODE_DATA_LOCALNR(unsigned long p, int n)
 }
 #endif
 
-#ifdef CONFIG_DISCONTIGMEM
-
 /*
  * Following are macros that each numa implementation must define.
  */
@@ -68,11 +68,6 @@ PLAT_NODE_DATA_LOCALNR(unsigned long p, int n)
 /* XXX: FIXME -- nyc */
 #define kern_addr_valid(kaddr)	(0)
 
-#define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
-
-#define pmd_page(pmd)		(pfn_to_page(pmd_val(pmd) >> 32))
-#define pte_pfn(pte)		(pte_val(pte) >> 32)
-
 #define mk_pte(page, pgprot)						     \
 ({								 	     \
 	pte_t pte;                                                           \
@@ -95,16 +90,11 @@ PLAT_NODE_DATA_LOCALNR(unsigned long p, int n)
 	__xx;                                                           \
 })
 
-#define page_to_pa(page)						\
-	(page_to_pfn(page) << PAGE_SHIFT)
-
 #define pfn_to_nid(pfn)		pa_to_nid(((u64)(pfn) << PAGE_SHIFT))
 #define pfn_valid(pfn)							\
 	(((pfn) - node_start_pfn(pfn_to_nid(pfn))) <			\
 	 node_spanned_pages(pfn_to_nid(pfn)))					\
 
-#define virt_addr_valid(kaddr)	pfn_valid((__pa(kaddr) >> PAGE_SHIFT))
-
 #endif /* CONFIG_DISCONTIGMEM */
 
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index e241bd88880f..268f99b4602b 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -83,12 +83,13 @@ typedef struct page *pgtable_t;
 
 #define __pa(x)			((unsigned long) (x) - PAGE_OFFSET)
 #define __va(x)			((void *)((unsigned long) (x) + PAGE_OFFSET))
-#ifndef CONFIG_DISCONTIGMEM
+
 #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
+#define virt_addr_valid(kaddr)	pfn_valid((__pa(kaddr) >> PAGE_SHIFT))
 
+#ifdef CONFIG_FLATMEM
 #define pfn_valid(pfn)		((pfn) < max_mapnr)
-#define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
-#endif /* CONFIG_DISCONTIGMEM */
+#endif /* CONFIG_FLATMEM */
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 660b14ce1317..8d856c62e22a 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -203,10 +203,10 @@ extern unsigned long __zero_page(void);
  * Conversion functions:  convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  */
-#ifndef CONFIG_DISCONTIGMEM
-#define page_to_pa(page)	(((page) - mem_map) << PAGE_SHIFT)
-
+#define page_to_pa(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #define pte_pfn(pte)	(pte_val(pte) >> 32)
+
+#ifndef CONFIG_DISCONTIGMEM
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 #define mk_pte(page, pgprot)						\
 ({									\
@@ -236,10 +236,8 @@ pmd_page_vaddr(pmd_t pmd)
 	return ((pmd_val(pmd) & _PFN_MASK) >> (32-PAGE_SHIFT)) + PAGE_OFFSET;
 }
 
-#ifndef CONFIG_DISCONTIGMEM
-#define pmd_page(pmd)	(mem_map + ((pmd_val(pmd) & _PFN_MASK) >> 32))
-#define pud_page(pud)	(mem_map + ((pud_val(pud) & _PFN_MASK) >> 32))
-#endif
+#define pmd_page(pmd)	(pfn_to_page(pmd_val(pmd) >> 32))
+#define pud_page(pud)	(pfn_to_page(pud_val(pud) >> 32))
 
 extern inline unsigned long pud_page_vaddr(pud_t pgd)
 { return PAGE_OFFSET + ((pud_val(pgd) & _PFN_MASK) >> (32-PAGE_SHIFT)); }
diff --git a/arch/alpha/include/asm/sparsemem.h b/arch/alpha/include/asm/sparsemem.h
new file mode 100644
index 000000000000..a0820fd2d4b1
--- /dev/null
+++ b/arch/alpha/include/asm/sparsemem.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_SPARSEMEM_H
+#define _ASM_ALPHA_SPARSEMEM_H
+
+#ifdef CONFIG_SPARSEMEM
+
+#define SECTION_SIZE_BITS	27
+
+/*
+ * According to "Alpha Architecture Reference Manual" physical
+ * addresses are at most 48 bits.
+ * https://download.majix.org/dec/alpha_arch_ref.pdf
+ */
+#define MAX_PHYSMEM_BITS	48
+
+#endif /* CONFIG_SPARSEMEM */
+
+#endif /* _ASM_ALPHA_SPARSEMEM_H */
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 916e42d74a86..03dda3beb3bd 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -648,6 +648,7 @@ setup_arch(char **cmdline_p)
 	/* Find our memory.  */
 	setup_memory(kernel_end);
 	memblock_set_bottom_up(true);
+	sparse_init();
 
 	/* First guess at cpu cache sizes.  Do this before init_arch.  */
 	determine_cpu_caches(cpu->type);
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
