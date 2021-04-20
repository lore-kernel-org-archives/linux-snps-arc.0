Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E2BC43460
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 11:33:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BED613AB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 11:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59BED613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yGK5J7UlosR1sVJt1s0da8WM5uFSM9URF8ZzvmIrhKA=; b=BSRTyeiqB0ofO85Ruxhs3+4B2
	e5SL5/2Oj8lHRsAZjLqgtgrWs6kIJNbEWNw0A9oSSrvmCC5jZGnvWH4yLKGoOpg2ze7sVQF7P4J3K
	sVo6phk5ZDl+3w2ZBmw0cZ2E4S+25k7v0aYxHWpntbmH4TtTTYpGa8JqniPTxntxCqDgS6odnYlEp
	8zKFnypul9Jov35Edr08Aouf6K2Z2ddqRkWIecK3XbMyUvuU9k+d4hglbHuJWox0oMUIrAUGF3Ct7
	lL2mJCzYfxrga5TGfYcCLyizpYUu70SSFgtcW7s9mA7zUqLTyb6LcIoMVuGENWPrujrJoC4qzGJN2
	ZABbRXGPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYocl-00BznP-No; Tue, 20 Apr 2021 11:32:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYocZ-00Bzka-TU; Tue, 20 Apr 2021 11:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OtJQAIKOLywPfylP974VGHUtk1ChEQJ4QJMSIhZUTcM=; b=UMJW1hHSEiHIxuYPCmIWqBggcQ
 7WzgUBYVndXaDyXAvzCaYB++gpfwEmHNwcJBnPHtzISKsXmtj7AQs66KzH/ShiOiEtQuDh6NS2jIC
 danHUqryMov77SaH6PzoCADuqO3OzNjDqitfmMV+5e2ij2f/eQn8q0rI3BSCdyVR8nX+Pl804z8dc
 ldQ6kKGtMIdM7D4SV/a4MiZzQWbt8sK61uwSWkb4CyJGIIQITh5cNWfGAWVtLKBLsiDOb1BvlHnDO
 0piIzcx7W6HJ167GMu1pCWEDcEpmybbhNafNeikjjMqwGNrP1EWY58fAR82XU78U2KE8ASVsO54t6
 xTFN7DAg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYoc4-00F6IN-8G; Tue, 20 Apr 2021 11:32:24 +0000
Date: Tue, 20 Apr 2021 12:32:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jesper Dangaard Brouer <brouer@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, netdev <netdev@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, mcroce@linux.microsoft.com,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@lst.de>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Michal Hocko <mhocko@kernel.org>, Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210420113216.GA3596236@casper.infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <CAMuHMdXm1Zg=Wm-=tn5jUJwqVGUvCi5yDaW0PXWC2DEDYGcy5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXm1Zg=Wm-=tn5jUJwqVGUvCi5yDaW0PXWC2DEDYGcy5A@mail.gmail.com>
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

On Tue, Apr 20, 2021 at 09:39:54AM +0200, Geert Uytterhoeven wrote:
> > +++ b/include/linux/mm_types.h
> > @@ -97,10 +97,10 @@ struct page {
> >                 };
> >                 struct {        /* page_pool used by netstack */
> >                         /**
> > -                        * @dma_addr: might require a 64-bit value even on
> > +                        * @dma_addr: might require a 64-bit value on
> >                          * 32-bit architectures.
> >                          */
> > -                       dma_addr_t dma_addr;
> > +                       unsigned long dma_addr[2];
> 
> So we get two 64-bit words on 64-bit platforms, while only one is
> needed?

Not really.  This is part of the 5-word union in struct page, so the space
ends up being reserved anyway, event if it's not "assigned" to dma_addr.

> > +       dma_addr_t ret = page->dma_addr[0];
> > +       if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > +               ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;
> 
> We don't seem to have a handy macro for a 32-bit left shift yet...
> 
> But you can also avoid the warning using
> 
>     ret |= (u64)page->dma_addr[1] << 32;

Sure.  It doesn't really matter which way we eliminate the warning;
the code is unreachable.

> > +{
> > +       page->dma_addr[0] = addr;
> > +       if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > +               page->dma_addr[1] = addr >> 16 >> 16;
> 
> ... but we do have upper_32_bits() for a 32-bit right shift.

Yep, that's what my current tree looks like.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
