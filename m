Return-Path: <SRS0=uxeU=EH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A09C4741F
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:07:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2BC2224E
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYTFWcAf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYNhTkLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2BC2224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SsDJXl9qZg4ghegL0mXIpWJF8aVV+8p3hs36J2sMt2Q=; b=SYTFWcAf55iN9ppiI/XJ9LToo
	/73BC76wjR6qtkNyujG2zfTuKxQgL+Oe4zGPT5NlAP3a7RQPhXvntGc5ZK0w1ra+OWL7X8Lwhgsd+
	gDnxOHjVaJFrbYzm8dLfMeClQJlJ0vc5x68kg2sF/4Bnk1EJGpVMMxzuJM/vvHADPcw1UonDEpiOj
	Eu90DWoZs22g0clYSBSkO/raagzJ+uXD76Zhu81V+cnGwX3uY/BUpglxdU42gyHaVwJ4cP6Zmc9LQ
	evpeHQ/xeh7kV3UNLGTmOIcJf5gX19QqnWDRA6EjIeZjPpqTcFHgtadaTGfliTnWeIpTdmll4QCCV
	/M+UjlhsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGoz-0003Dn-TL; Sun, 01 Nov 2020 17:07:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGo9-0002oI-1n; Sun, 01 Nov 2020 17:06:26 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53BD12224F;
 Sun,  1 Nov 2020 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250380;
 bh=GJTV8t7eUInQzqDc/hr5Dhpq8t96xJHg9K0YZLO71MY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KYNhTkLVgz7dfjqoUX4Po8ljwPSushLBVskuiQQV1Po8XLAY71xPQrdPgGX5X31A4
 7FNo2oe9peI+aBvyRyIZn4I4gCPx6AhGkytdpLp/EFc1tfe24HIbPlZTUGbSf/OCOB
 BZ4N6/ONIQneMFZayXAwNL7t8GeCIlvJLHaXjCFY=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 12/13] m68k/mm: enable use of generic memory_model.h for
 !DISCONTIGMEM
Date: Sun,  1 Nov 2020 19:04:53 +0200
Message-Id: <20201101170454.9567-13-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_120621_324148_062457DF 
X-CRM114-Status: GOOD (  16.92  )
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

The pg_data_map and pg_data_table arrays as well as page_to_pfn() and
pfn_to_page() are required only for DISCONTIGMEM. Other memory models can
use the generic definitions in asm-generic/memory_model.h.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/Kconfig.cpu               | 1 -
 arch/m68k/include/asm/page.h        | 2 ++
 arch/m68k/include/asm/page_mm.h     | 5 +++++
 arch/m68k/include/asm/virtconvert.h | 5 -----
 arch/m68k/mm/init.c                 | 6 +++---
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index e8ad721e52f6..b8884af365ae 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -374,7 +374,6 @@ config SINGLE_MEMORY_CHUNK
 	bool "Use one physical chunk of memory only" if ADVANCED && !SUN3
 	depends on MMU
 	default y if SUN3 || MMU_COLDFIRE
-	select NEED_MULTIPLE_NODES
 	help
 	  Ignore all but the first contiguous chunk of physical memory for VM
 	  purposes.  This will save a few bytes kernel size and may speed up
diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index 2614a1206f2f..6116d7094292 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -62,8 +62,10 @@ extern unsigned long _ramend;
 #include <asm/page_no.h>
 #endif
 
+#ifdef CONFIG_DISCONTIGMEM
 #define __phys_to_pfn(paddr)	((unsigned long)((paddr) >> PAGE_SHIFT))
 #define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
+#endif
 
 #include <asm-generic/getorder.h>
 
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 0e794051d3bb..7f5912af2a52 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -153,6 +153,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	pfn_to_virt(page_to_pfn(page));					\
 })
 
+#ifdef CONFIG_DISCONTIGMEM
 #define pfn_to_page(pfn) ({						\
 	unsigned long __pfn = (pfn);					\
 	struct pglist_data *pgdat;					\
@@ -165,6 +166,10 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	pgdat = &pg_data_map[page_to_nid(__p)];				\
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
 })
+#else
+#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
+#include <asm-generic/memory_model.h>
+#endif
 
 #define virt_addr_valid(kaddr)	((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
 #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
index eb9eb5cb23a6..ca91b32dc6ef 100644
--- a/arch/m68k/include/asm/virtconvert.h
+++ b/arch/m68k/include/asm/virtconvert.h
@@ -29,12 +29,7 @@ static inline void *phys_to_virt(unsigned long address)
 }
 
 /* Permanent address of a page. */
-#if defined(CONFIG_MMU) && !defined(CONFIG_DISCONTIGMEM)
-#define page_to_phys(page) \
-	__pa(PAGE_OFFSET + (((page) - pg_data_map[0].node_mem_map) << PAGE_SHIFT))
-#else
 #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
-#endif
 
 /*
  * IO bus memory addresses are 1:1 with the physical address,
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 4b46ceace3d3..14c1e541451c 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -42,12 +42,12 @@ EXPORT_SYMBOL(empty_zero_page);
 
 #ifdef CONFIG_MMU
 
-pg_data_t pg_data_map[MAX_NUMNODES];
-EXPORT_SYMBOL(pg_data_map);
-
 int m68k_virt_to_node_shift;
 
 #ifdef CONFIG_DISCONTIGMEM
+pg_data_t pg_data_map[MAX_NUMNODES];
+EXPORT_SYMBOL(pg_data_map);
+
 pg_data_t *pg_data_table[65];
 EXPORT_SYMBOL(pg_data_table);
 #endif
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
