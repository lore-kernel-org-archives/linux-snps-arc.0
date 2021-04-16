Return-Path: <SRS0=/KVa=JN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D040BC433B4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Apr 2021 23:08:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8EF610CD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Apr 2021 23:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8EF610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wNslbdmFflAW8p0rMDLJciuPHH138mTXyHNWrCAFuvA=; b=BQ1M168eB9N3qH4ihbmGoX8W+
	XNUhxakPf8AKptBfTga0Zm9WhWVHepmkbFaK1qpAhwGTiMMqxVohgQL7a/aZ9fzXqRcr6wB7u/OE7
	7U0wSg6+R9ZhIGZ4HgHgjRgU0J/xOJy7qG2HEEAGV9B6LbXRII05iTqwmEB2Tqxmhwt9ES5IMTqlA
	mx0066j3gbj4ckFvxelFKAFk9P/jcTxY5u4Z3V1rv13HAyMiMM1GVsZe+Oe+5KUpu2yMARq61Khyz
	WPBnkPInYf9haxiE9Zlvukb4Sp+HJ1sh/FD7TGQAarNY/JylhS3e4LWF4CdQEN1uX7oFnq6xkc9Mr
	hu6WNdeyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXXZm-003fXe-RL; Fri, 16 Apr 2021 23:08:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXXZA-003fRS-Q4; Fri, 16 Apr 2021 23:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7RQQOKlZfptY8lQfv4l5MN8bW99nIhpZAUjYQWKjbHY=; b=YmfVnEk3XiuEP8jmPep/KMKTCm
 FCer4kctEbk/+GNHuBZ8YFNrdKU44xlcl41J+bNFEc53pi74cE5/BLRbsjHC4f8PKiEVIVwlUAR7t
 Z55+HNT/99N2xVNKwp+BxJDdxbFavbZStT6ml+LiqeSScnyJEGjUY1qv3vZy9XpWik8pDr0R3u9mr
 YZpRlXaZY6zK/e2aevHlOS8hCwxYF9T5hfqXwKOxLAXe4vi1AER+8AHlbktawk4qufHp5LqztQe62
 fJGCts2hlsjYoXQcLvgSA+p/Z2uMF0IYb8xmYDmqAjunEiQdpXqkeM7qmy56jDoYHdcHnWv1GagYl
 bqoyQWlQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXXYn-00AZOP-Kg; Fri, 16 Apr 2021 23:07:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: brouer@redhat.com
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, ilias.apalodimas@linaro.org,
 mcroce@linux.microsoft.com, grygorii.strashko@ti.com, arnd@kernel.org,
 hch@lst.de, linux-snps-arc@lists.infradead.org, mhocko@kernel.org,
 mgorman@suse.de
Subject: [PATCH 2/2] mm: Indicate pfmemalloc pages in compound_head
Date: Sat, 17 Apr 2021 00:07:24 +0100
Message-Id: <20210416230724.2519198-3-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416230724.2519198-1-willy@infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
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

The net page_pool wants to use a magic value to identify page pool pages.
The best place to put it is in the first word where it can be clearly a
non-pointer value.  That means shifting dma_addr up to alias with ->index,
which means we need to find another way to indicate page_is_pfmemalloc().
Since page_pool doesn't want to set its magic value on pages which are
pfmemalloc, we can use bit 1 of compound_head to indicate that the page
came from the memory reserves.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h       | 12 +++++++-----
 include/linux/mm_types.h |  7 +++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8ba434287387..44eab3f6d5ae 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1629,10 +1629,12 @@ struct address_space *page_mapping_file(struct page *page);
 static inline bool page_is_pfmemalloc(const struct page *page)
 {
 	/*
-	 * Page index cannot be this large so this must be
-	 * a pfmemalloc page.
+	 * This is not a tail page; compound_head of a head page is unused
+	 * at return from the page allocator, and will be overwritten
+	 * by callers who do not care whether the page came from the
+	 * reserves.
 	 */
-	return page->index == -1UL;
+	return page->compound_head & 2;
 }
 
 /*
@@ -1641,12 +1643,12 @@ static inline bool page_is_pfmemalloc(const struct page *page)
  */
 static inline void set_page_pfmemalloc(struct page *page)
 {
-	page->index = -1UL;
+	page->compound_head = 2;
 }
 
 static inline void clear_page_pfmemalloc(struct page *page)
 {
-	page->index = 0;
+	page->compound_head = 0;
 }
 
 /*
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5aacc1c10a45..39f7163dcace 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -96,10 +96,9 @@ struct page {
 			unsigned long private;
 		};
 		struct {	/* page_pool used by netstack */
-			/**
-			 * @dma_addr: might require a 64-bit value on
-			 * 32-bit architectures.
-			 */
+			unsigned long pp_magic;
+			unsigned long xmi;
+			unsigned long _pp_mapping_pad;
 			unsigned long dma_addr[2];
 		};
 		struct {	/* slab, slob and slub */
-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
