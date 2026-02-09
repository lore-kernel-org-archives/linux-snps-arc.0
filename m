Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC21E81BD4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Feb 2026 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZmAdgtKDZHCkJDVYXA2sSIVJXzP+tszZ4bxuqmq0nU=; b=nmcTHrfhlqmSQg
	SvMmH2rJPGWZjg2Sl3WqTRFGGx9VxvxNtEpKiVU7f0KnDOkp1sSzbbr/AjIh89khrenmrYihyb/Yy
	kqzdhSdAzm6SxnfQ1SvqjjTcKHHrVbq2GesNuE3rslFCKB1EgVfrQ49MMOVKwT8uk0IoRl+cOKluW
	rXl8x5efSzvEcoCmgrLe98GiEz7LRFTXbOPErhj8Tc8o/xpUbl5UeOzbAtmRDCey98F+bVFqaoWNj
	eNbpwZS0nBvqr91tJVvSV8kuAogVKqXhmk3KLh2OzBh7HuaLmm8sMW3I9997wLr2ixTNA+h83Z0hd
	HBOZgwmZ3tYnGbdonXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSSA-0000000FWh2-1HDL;
	Mon, 09 Feb 2026 14:41:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSS7-0000000FWgG-3ul0;
	Mon, 09 Feb 2026 14:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA41A6013E;
	Mon,  9 Feb 2026 14:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BD7C16AAE;
	Mon,  9 Feb 2026 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770648086;
	bh=IrP0HcvbxJyr+QPUUgTWRvTOZExBIyn/P520HSFeTE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=APyMK8Xcr0Pj/4H/7ScdM60IKK2Af+gkFXGdQhPjdHsnmzLsJm02Nchy+jJL23anM
	 bNBnoHk9xK2QiZTV+rQY/KLwerxB3VnzQfxzTkQc1iH70KMN3Z0GuLpljati7S0tf8
	 ls86zRd33YVz+J6pURgPRqvGX5Q/n+dPhzCqdL5yV63J60pinW1+OsSd3d1xFDgsvS
	 6up5zQsE5HXsLq3bdag17WhUQCgbBwXYJxsH7xLXV9rnrG9HIsZoWR0mYcQZNF9Lk2
	 3fCjxQBhoGvtiYzXnS5lcX8tXcaTibT8zTyCBbpHKv+p0HdsmTNf1IjvNxObtwAPb6
	 sxyY+fXDu7Mnw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 1/4] mm: don't special case !MMU for is_zero_pfn() and my_zero_pfn()
Date: Mon,  9 Feb 2026 16:40:54 +0200
Message-ID: <20260209144058.2092871-2-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209144058.2092871-1-rppt@kernel.org>
References: <20260209144058.2092871-1-rppt@kernel.org>
MIME-Version: 1.0
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

nommu architectures have empty_zero_page and define ZERO_PAGE() and
although they don't really use it to populate page tables, there is no
reason to hardwire !MMU implementation of is_zero_pfn() and my_zero_pfn()
to 0.

Drop #ifdef CONFIG_MMU around implementations of is_zero_pfn() and
my_zero_pfn() and remove !MMU version.

While on it, make zero_pfn __ro_after_init.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/pgtable.h | 14 +-------------
 mm/memory.c             | 13 -------------
 mm/mm_init.c            | 10 ++++++++++
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 827dca25c0bc..08a88b0d56e5 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1882,7 +1882,6 @@ static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
 	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
 }
 
-#ifdef CONFIG_MMU
 #ifdef __HAVE_COLOR_ZERO_PAGE
 static inline int is_zero_pfn(unsigned long pfn)
 {
@@ -1905,18 +1904,7 @@ static inline unsigned long my_zero_pfn(unsigned long addr)
 	extern unsigned long zero_pfn;
 	return zero_pfn;
 }
-#endif
-#else
-static inline int is_zero_pfn(unsigned long pfn)
-{
-	return 0;
-}
-
-static inline unsigned long my_zero_pfn(unsigned long addr)
-{
-	return 0;
-}
-#endif /* CONFIG_MMU */
+#endif /* __HAVE_COLOR_ZERO_PAGE */
 
 #ifdef CONFIG_MMU
 
diff --git a/mm/memory.c b/mm/memory.c
index 187f16b7e996..51d2018a387a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -162,21 +162,8 @@ static int __init disable_randmaps(char *s)
 }
 __setup("norandmaps", disable_randmaps);
 
-unsigned long zero_pfn __read_mostly;
-EXPORT_SYMBOL(zero_pfn);
-
 unsigned long highest_memmap_pfn __read_mostly;
 
-/*
- * CONFIG_MMU architectures set up ZERO_PAGE in their paging_init()
- */
-static int __init init_zero_pfn(void)
-{
-	zero_pfn = page_to_pfn(ZERO_PAGE(0));
-	return 0;
-}
-early_initcall(init_zero_pfn);
-
 void mm_trace_rss_stat(struct mm_struct *mm, int member)
 {
 	trace_rss_stat(mm, member);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1a29a719af58..dcf9eff34f83 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -53,6 +53,9 @@ EXPORT_SYMBOL(mem_map);
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
 
+unsigned long zero_pfn __ro_after_init;
+EXPORT_SYMBOL(zero_pfn);
+
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
 
@@ -2667,6 +2670,13 @@ static void __init mem_init_print_info(void)
 		);
 }
 
+static int __init init_zero_pfn(void)
+{
+	zero_pfn = page_to_pfn(ZERO_PAGE(0));
+	return 0;
+}
+early_initcall(init_zero_pfn);
+
 void __init __weak arch_mm_preinit(void)
 {
 }
-- 
2.51.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
