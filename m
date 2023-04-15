Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF3DC77B78
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 Apr 2023 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IlpfTbVl3GpA7Qg5ij2hHyYZJTuD/uhCkOAhjjz1Qm0=; b=FOv6pcCWcIpLGD
	aqKzd9NtzXzqszy0Q9+T2djixX66F4nI+tnC9w05wZm9O3afpqxHPOoyOqr4E/qOoDJcYGGtsUtw2
	H5NO/nKE2dqNblrQItk+cxWSEMKEPXYz/P3BKabLmq6NLtthKOAcuxMcyhRAvZiN8bGy7mCnLPUHr
	oz578iI2V+kx515T6C3tLamPlotzdBN9LcQbSXYiMNh1qE3hEzW0fwpsZh6xIFULwCO/i0XSkJVxW
	QVS7IGQwHfB96VxzR1XkcPuQ8Jy/i/hRWRT+sAhZKKINc0tPdmwXN+qEjhEr2GH2qwuGRXql3/fhO
	j67GR7ceBpFV5YmjDNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnb7y-00BccK-1z;
	Sat, 15 Apr 2023 08:19:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnb7v-00BcbX-1v
	for linux-snps-arc@lists.infradead.org;
	Sat, 15 Apr 2023 08:19:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64ABD60E92;
	Sat, 15 Apr 2023 08:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DCEC433D2;
	Sat, 15 Apr 2023 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681546757;
	bh=ljAiPSwIhWGmapP/c1uNdTrp/qDU7fl0aVv/azO7YYc=;
	h=From:To:Cc:Subject:Date:From;
	b=Wl3gzEypngqcW08OZvjH6HF9OZf/zXny3K7LUCUsq++UnsVLaDKvBzCnhntZEYtQK
	 AdB9V6nMsz4R1ufYFZULYMFVAZSDK8ynDrMXz1jq1KTK4udt9Q5xLqSIN9p4eTcs87
	 b50ZibD2Eh59IxclwgnAp1/U+qO7oK4EjJ0rv/gbAKKYQ+uqaqERJSJn1kGtIIFnr5
	 AHjH5ltIKRs+cDY9eMjqab2PHhVcroegZgBk10mO6WzgSLNbOP6m9LsjdE2kwul5XY
	 kmklVMWmjC1IK0WvXsS3piYyalfFDaaEw79LF5x/x+nWKSBDnFHZuVKa4vLKWoXDlO
	 a3MDw3OJUipSg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	llvm@lists.linux.dev,
	Vineet Gupta <vgupta@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns() static
Date: Sat, 15 Apr 2023 10:18:20 +0200
Message-Id: <20230415081904.969049-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_011919_736422_D3C98B01 
X-CRM114-Status: GOOD (  15.03  )
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

From: Arnd Bergmann <arnd@arndb.de>

clang produces a build failure on x86 for some randconfig builds
after a change that moves around code to mm/mm_init.c:

Cannot find symbol for section 2: .text.
mm/mm_init.o: failed

I have not been able to figure out why this happens, but the __weak
annotation on arch_has_descending_max_zone_pfns() is the trigger here.

Removing the weak function in favor of an open-coded Kconfig option
check avoids the problem and becomes clearer as well as better to
optimize by the compiler.

Fixes: 9420f89db2dd ("mm: move most of core MM initialization to mm/mm_init.c")
Cc: llvm@lists.linux.dev
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: fix logic bug reported-by: kernel test robot <oliver.sang@intel.com>,
see https://lore.kernel.org/oe-lkp/202304151422.5e4d380b-oliver.sang@intel.com
---
 arch/arc/mm/init.c | 5 -----
 include/linux/mm.h | 1 -
 mm/mm_init.c       | 4 ++--
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index ce4e939a7f07..2b89b6c53801 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -74,11 +74,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		base, TO_MB(size), !in_use ? "Not used":"");
 }
 
-bool arch_has_descending_max_zone_pfns(void)
-{
-	return !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
-}
-
 /*
  * First memory setup routine called from setup_arch()
  * 1. setup swapper's mm @init_mm
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 63acf4a598fe..75d8adce0aee 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3061,7 +3061,6 @@ extern void setup_per_cpu_pageset(void);
 extern int min_free_kbytes;
 extern int watermark_boost_factor;
 extern int watermark_scale_factor;
-extern bool arch_has_descending_max_zone_pfns(void);
 
 /* nommu.c */
 extern atomic_long_t mmap_pages_allocated;
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 35302b7bca83..7f7f9c677854 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1754,9 +1754,9 @@ static void __init free_area_init_memoryless_node(int nid)
  * Some architectures, e.g. ARC may have ZONE_HIGHMEM below ZONE_NORMAL. For
  * such cases we allow max_zone_pfn sorted in the descending order
  */
-bool __weak arch_has_descending_max_zone_pfns(void)
+static bool arch_has_descending_max_zone_pfns(void)
 {
-	return false;
+	return IS_ENABLED(CONFIG_ARC) && !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
 }
 
 /**
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
