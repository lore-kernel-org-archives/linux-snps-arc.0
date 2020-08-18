Return-Path: <SRS0=WgPK=B4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342DEC433E3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Aug 2020 15:07:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060D1206B5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Aug 2020 15:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UG64L55B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rAKScTQo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060D1206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=islM5wwFWn3UY/DSQJB9Ic/G9yU9JrrCUJV/6cx4814=; b=UG64L55Boq6/Kvf81T3BT7jZIl
	NG0vbtI9iWKZH3dfXbNHOMmL3bsSiZYbTDUZyZ68RSWKb5ipHyhVPA1X5EHCiN2O9usplcVaAsKmO
	IAyhuMu0aqcbFGnwz9V9ffJ/ZcCfo9ktyOwdlZmR+UAZfbi7Mua+0zK7r7KXcD0jdygSoBBXyT7At
	bB0lP/n5VjXZcf7gHd7NwGQIffXFfVByfsCO7f99p9DBMlBIVtssj37LY6+5UORog45ZmUlRf6rQ4
	T0cvEaG0djWWj0jnyXwEGS0eH99noRQn+/0rCb+3zJec3OX4reA5Rr7tenYxmeI96Vy9cBAhYzXF3
	BOBApdZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k83DG-0005tg-6T; Tue, 18 Aug 2020 15:07:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k83DE-0005tW-Au; Tue, 18 Aug 2020 15:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=TYCkUvvfwzERhSHuzl+o/xwRoFEE9UiQMu2LCKTxT2c=; b=rAKScTQoURfEN9R47mu2vwzvW1
 Qr92K5z88B2fMLXzcVaHIjsutHu31n+1t6NktU6dXrpb6qBvKGewRdDEu9YWxyaqPT3MGP2+amFeq
 030HybeiDQAp9K8oNMiWpdSSP2KjuUDNq6z3GwFS1zWlgIdpB/YsfFYankS6FDpHeKTdEQUybqx+Y
 WGyBZ4JzG9qSrcJJ5B1ZsacnV/Rsd2fIh9tQQ/re1f3qLvOpy3/D0PzzsiObpvCEz2QxnrYV91fdU
 rklPsQUsoTct720dBy8ejRuBWjm4jiJMHilAS7Xntlh81xlBZYvhwK858mixM81kNlULt4cBAKwWb
 WxUXdk+w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k83D6-00020t-48; Tue, 18 Aug 2020 15:07:36 +0000
Date: Tue, 18 Aug 2020 16:07:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-arch@vger.kernel.org
Subject: Flushing transparent hugepages
Message-ID: <20200818150736.GQ17456@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Catalin Marinas <catalin.marinas@arm.com>, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

If your arch does not support HAVE_ARCH_TRANSPARENT_HUGEPAGE, you can
stop reading now.  Although maybe you're curious about adding support.

$ git grep -w HAVE_ARCH_TRANSPARENT_HUGEPAGE arch
arch/Kconfig:config HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/arc/Kconfig:config HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/arm/Kconfig:config HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/arm64/Kconfig:     select HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/mips/Kconfig:      select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES
arch/powerpc/platforms/Kconfig.cputype: select HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/s390/Kconfig:      select HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/sparc/Kconfig:     select HAVE_ARCH_TRANSPARENT_HUGEPAGE
arch/x86/Kconfig:       select HAVE_ARCH_TRANSPARENT_HUGEPAGE

If your arch does not implement flush_dcache_page(), you can also
stop reading.

$ for i in arc arm arm64 mips powerpc s390 sparc x86; do git grep -l flush_dcache_page arch/$i/include; done
arch/arc/include/asm/cacheflush.h
arch/arm/include/asm/cacheflush.h
arch/arm64/include/asm/cacheflush.h
arch/mips/include/asm/cacheflush.h
arch/powerpc/include/asm/cacheflush.h
arch/sparc/include/asm/cacheflush_32.h
arch/sparc/include/asm/cacheflush_64.h
arch/sparc/include/asm/pgtable_64.h

OK, so we're down to arc, arm, arm64, mips, powerpc & sparc.  Hi!  ;-)

I'm working on adding THP support for filesystems with storage backing
and part of that is expanding the definition of THP to be any order
(ie any power of two of PAGE_SIZE).  Now, shmem already has some calls
to flush_dcache_page() for THPs, for example:

        if (sgp != SGP_WRITE && !PageUptodate(page)) {
                struct page *head = compound_head(page);
                int i;

                for (i = 0; i < compound_nr(head); i++) {
                        clear_highpage(head + i);
                        flush_dcache_page(head + i);
                }
                SetPageUptodate(head);
        }

where you'll be called once for each subpage.  But ... these are error
paths, and I'm sure you all diligently test cache coherency scenarios
of error paths in shmem ... right?

For example, arm64 seems confused in this scenario:

void flush_dcache_page(struct page *page)
{
        if (test_bit(PG_dcache_clean, &page->flags))
                clear_bit(PG_dcache_clean, &page->flags);
}

...

void __sync_icache_dcache(pte_t pte)
{
        struct page *page = pte_page(pte);

        if (!test_and_set_bit(PG_dcache_clean, &page->flags))
                sync_icache_aliases(page_address(page), page_size(page));
}

So arm64 keeps track on a per-page basis which ones have been flushed.
page_size() will return PAGE_SIZE if called on a tail page or regular
page, but will return PAGE_SIZE << compound_order if called on a head
page.  So this will either over-flush, or it's missing the opportunity
to clear the bits on all the subpages which have now been flushed.

PowerPC has special handling of hugetlbfs pages.  Well, that's what
the config option says, but actually it handles THP as well.  If
the config option is enabled.

#ifdef CONFIG_HUGETLB_PAGE
        if (PageCompound(page)) {
                flush_dcache_icache_hugepage(page);
                return;
        }
#endif

By the way, THPs can be mapped askew -- that is, at an offset which
means you can't use a PMD to map a PMD sized page.

Anyway, we don't really have consensus between the various architectures
on how to handle either THPs or hugetlb pages.  It's not contemplated
in Documentation/core-api/cachetlb.rst so there's no real surprise
we've diverged.

What would you _like_ to see?  Would you rather flush_dcache_page()
were called once for each subpage, or would you rather maintain
the page-needs-flushing state once per compound page?  We could also
introduce flush_dcache_thp() if some architectures would prefer it one
way and one the other, although that brings into question what to do
for hugetlbfs pages.

It might not be a bad idea to centralise the handling of all this stuff
somewhere.  Sounds like the kind of thing Arnd would like to do ;-) I'll
settle for getting enough clear feedback about what the various arch
maintainers want that I can write a documentation update for cachetlb.rst.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
