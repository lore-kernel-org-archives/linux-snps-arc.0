Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270B5C77B70
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Apr 2023 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QSbiUd7kuH/sqLEYkNcePrNhbbtID4EMQeqtXUtK2H8=; b=Lwr8oQTc/VP002
	ZktJsyCyx3kCJPxOSYfC3oKOfM+QxDKzZRHX/8C4j+uZ6iEUWcoRntihuIZOm459dTUtUelSVK9yG
	T78LTseucVa7F1iQSMwB3qWfcqlNIFoaSQPiSWcaVg0a+S52TP9zpY5VLSE6nsVk6pMCxH0fAcmIc
	756rPDUYrO2fS4e/rAS0FS6XuXld+IG4jY6z9p0RxcOnbk8IWGobu3C2dYrNO/f26TWASvjAmFClB
	KfxfJZR75MZPXhJCe3yogIlB+ocnzhgRLb5LcuVRqGZqmOUx4rSMhEIEgU4jzFY5g7tEwI8UULCpa
	LRcK9hlAXjXzMm+nn1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEQ1-008dI5-2q;
	Fri, 14 Apr 2023 08:04:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEPz-008dHS-0a
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Apr 2023 08:04:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E905B61509;
	Fri, 14 Apr 2023 08:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1904C433D2;
	Fri, 14 Apr 2023 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681459465;
	bh=kIJ6lK/Lc6cAvvvb9aZuILfOuK0T9xQHpTLzt8A9dFI=;
	h=From:To:Cc:Subject:Date:From;
	b=e6CSSlSynnb8/8SQwximjDYsEgO3iB37cizeXObEuBX6UeZi8PxJbes/BFDKFHl1r
	 J845+gmamcoMiwEHZXspDymX/EUrJ1c0x2LpLkUaRUwb6c4sSDKK9Lu9lzza8abojD
	 RuKF8Ji5sBj5MXlRir50HWDq3CKnkFPF18u8iPwydZ2QdJMV1Oc4gP38WMyZgvAFAw
	 bSzc8eH4UpRLtxV1eCsP8mnq61xV61x6SEdQd8P0WPIzpHETQ62DyT0FuRhFfBlMA8
	 VFn8ZB8lzhZGvQZooZ11s139afw6PGuEVJO6I/2qXWP+S+ACcTnOg0CGC4JK84r2mZ
	 5BgtQeI+xEWQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>
Cc: Arnd Bergmann <arnd@arndb.de>,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] mm: make arch_has_descending_max_zone_pfns() static
Date: Fri, 14 Apr 2023 10:03:53 +0200
Message-Id: <20230414080418.110236-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_010427_497763_F27CF2C2 
X-CRM114-Status: GOOD (  14.74  )
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
index ada57b11bb5a..a13cc121841d 100644
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
index 35302b7bca83..f6165747fd3e 100644
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
+	return !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
 }
 
 /**
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
