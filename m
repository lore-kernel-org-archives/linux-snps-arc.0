Return-Path: <SRS0=WgPK=B4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E293C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Aug 2020 16:08:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D046E2076E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Aug 2020 16:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RsMEks6+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqiPJIVx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D046E2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rCvgPkzbKzROX33MnepJwZyf1cioYyZ5Ggm76dSQ6HI=; b=RsMEks6+c7yp0FQFMu6jt0cZK
	2LaiYEAwpZ/FKycdGp0R4jMRjJiCsMsckDywMYkcc4v43udDGtRainhE52qPD2uitVMFd3Gq8/Ehy
	SK0EFb4gFPJPFN/eU0toMndHEhrfOTCCRhENThUNos7Wh92mrrx2QuSDMdcHqImfytfGVppdPS1lY
	tnKQPAsakmYvws0YAMSpYyD7M1k+QyFam7xnWmsR3qtr3YPydXKg1rcTajqO6CFvfPLgw/g+uCSB6
	EXvKEeJeq1a1xscKsLyMLfRNocyAfOSkPsB1n0rFDiHSQAI4K6ntcYUPD/DckGQotIwjne/HFCmzG
	fwVC7z7Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84A0-0002d1-73; Tue, 18 Aug 2020 16:08:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k849x-0002bz-0g; Tue, 18 Aug 2020 16:08:25 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 828A3207D3;
 Tue, 18 Aug 2020 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597766904;
 bh=0XDiFtoCzEGx2zRl6dr6v/7GtRSHYOaTcxUyoIADvEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqiPJIVx7P1uKny20654FpTQ1dYQDn2N/LYxgmIJfdgyKpNsD3aY2gjM4XLa0YPMo
 EI8QqOK433KMw0XDi1/BZ2Bj+z7UslW4eJYBYSkfJ0RbYxl2t+S9qWJMCAcu53o7OY
 +6MDIROG5nLysgpO550aaHXqu7TGh1kjzeMo/3vg=
Date: Tue, 18 Aug 2020 17:08:16 +0100
From: Will Deacon <will@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: Flushing transparent hugepages
Message-ID: <20200818160815.GA16191@willie-the-truck>
References: <20200818150736.GQ17456@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818150736.GQ17456@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_120825_159996_965D50AE 
X-CRM114-Status: GOOD (  18.18  )
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
Cc: linux-arch@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Catalin Marinas <catalin.marinas@arm.com>, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 04:07:36PM +0100, Matthew Wilcox wrote:
> For example, arm64 seems confused in this scenario:
> 
> void flush_dcache_page(struct page *page)
> {
>         if (test_bit(PG_dcache_clean, &page->flags))
>                 clear_bit(PG_dcache_clean, &page->flags);
> }
> 
> ...
> 
> void __sync_icache_dcache(pte_t pte)
> {
>         struct page *page = pte_page(pte);
> 
>         if (!test_and_set_bit(PG_dcache_clean, &page->flags))
>                 sync_icache_aliases(page_address(page), page_size(page));
> }
> 
> So arm64 keeps track on a per-page basis which ones have been flushed.
> page_size() will return PAGE_SIZE if called on a tail page or regular
> page, but will return PAGE_SIZE << compound_order if called on a head
> page.  So this will either over-flush, or it's missing the opportunity
> to clear the bits on all the subpages which have now been flushed.

Hmm, that seems to go all the way back to 2014 as the result of a bug fix
in 923b8f5044da ("arm64: mm: Make icache synchronisation logic huge page
aware") which has a Reported-by Mark and a CC stable, suggesting something
_was_ going wrong at the time :/ Was there a point where the tail pages
could end up with PG_arch_1 uncleared on allocation?

> What would you _like_ to see?  Would you rather flush_dcache_page()
> were called once for each subpage, or would you rather maintain
> the page-needs-flushing state once per compound page?  We could also
> introduce flush_dcache_thp() if some architectures would prefer it one
> way and one the other, although that brings into question what to do
> for hugetlbfs pages.

For arm64, we'd like to see PG_arch_1 preserved during huge page splitting
[1], but there was a worry that it might break x86 and s390. It's also not
clear to me that we can change __sync_icache_dcache() as it's called when
we're installing the entry in the page-table, so why would it be called
again for the tail pages?

Will

[1] https://lore.kernel.org/linux-arch/20200703153718.16973-8-catalin.marinas@arm.com/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
