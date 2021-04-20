Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CF4C433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 08:40:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BCB61104
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 08:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BCB61104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UlWTV5eemdfuR1YSq2oEVT5HuPmQOFBGP+cdY4S8xoY=; b=S7y5FNsf5r2q2FBG8Q8T7Hkl6
	UH/nNkRybCv2DdauMwO8l5cyq9xcUKaRW7r0Lsa8bh3jiaWluXD0ZAtrs+b0EGNHkRW9o7I6dlqDr
	cB3buefRfhnJApCr46I02lsSst2ae69hARuzkwRGHKSmdHpbWzsBn2enp5fWCuRw6ulxEmoo5mJ5r
	EL27K1fFEzquT7jxgJ58Dv9lHGQcrhg5hG5P77oEc+gzs+unyEVDWTbyON4N8xNt8gW1NP0yE/txZ
	v3qQ+b4JJ7ByMBaImcXrnTs21msGds6kL466cPag1ICWC/qCdbAkUYoaKO5o0T9bfEafDvNlev0Bv
	8MWBfOfiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYlvf-00BbtF-GB; Tue, 20 Apr 2021 08:40:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYlvR-00Bbqt-0M
 for linux-snps-arc@desiato.infradead.org; Tue, 20 Apr 2021 08:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=s6bcoxR8HZiMFi3NTL9YMc0M0vyzTPzo9gr/2ZWsoBo=; b=JxBMQiuwKXYsnOZpZBYDris/Ej
 6Ca4am9lc+aQWL0KfS+9Qs5T8D69MhNxJuY0fe5qhyc5hZBGGXH0XO/UkUv390kxWZjpW5Ef17lrO
 WCzBASOAVXkTUXlmsQrV3YbGa+/akoHupPVpdzWPURCzIGiRyvOC2hF4upvJqRjmVSWv1dJeGtaqx
 M1tClD77cg7B+NXtNaGDGRnDVpBMpyOjNE+JLSb+uVhuKHf3epcWt81RCt/c8A6UxM9UGqTcfA1j7
 WHgNgOCNoxVNumkSEg+713JSIVn911lDhj875kcQQ5VQPpM0fgnU8rcDh7nbQkmX4PwDjk/6ikAa6
 oY9VsfsA==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYlvL-00BvpX-9D
 for linux-snps-arc@lists.infradead.org; Tue, 20 Apr 2021 08:40:03 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-41-LdMxTme-MY-UX7jiXf2mLw-1; Tue, 20 Apr 2021 09:39:52 +0100
X-MC-Unique: LdMxTme-MY-UX7jiXf2mLw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 20 Apr 2021 09:39:51 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Tue, 20 Apr 2021 09:39:51 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>, Matthew Wilcox
 <willy@infradead.org>
CC: Jesper Dangaard Brouer <brouer@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, netdev
 <netdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Arnd Bergmann <arnd@kernel.org>, Christoph
 Hellwig <hch@lst.de>, arcml <linux-snps-arc@lists.infradead.org>, Michal
 Hocko <mhocko@kernel.org>, "Mel Gorman" <mgorman@suse.de>
Subject: RE: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXNbhaf1yRrc3ugkWz9MvyD1ZvgKq9FGTg
Date: Tue, 20 Apr 2021 08:39:51 +0000
Message-ID: <bb8805a33371468892a7271dbe321e1f@AcuMS.aculab.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <CAMuHMdXm1Zg=Wm-=tn5jUJwqVGUvCi5yDaW0PXWC2DEDYGcy5A@mail.gmail.com>
In-Reply-To: <CAMuHMdXm1Zg=Wm-=tn5jUJwqVGUvCi5yDaW0PXWC2DEDYGcy5A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_013959_608429_D57E0CB6 
X-CRM114-Status: GOOD (  29.48  )
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

From: Geert Uytterhoeven
> Sent: 20 April 2021 08:40
> 
> Hi Willy,
> 
> On Sat, Apr 17, 2021 at 4:49 AM Matthew Wilcox <willy@infradead.org> wrote:
> > Replacement patch to fix compiler warning.
> >
> > 32-bit architectures which expect 8-byte alignment for 8-byte integers
> > and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> > page inadvertently expanded in 2019.  When the dma_addr_t was added,
> > it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> > gap between 'flags' and the union.
> >
> > Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
> > This restores the alignment to that of an unsigned long, and also fixes a
> > potential problem where (on a big endian platform), the bit used to denote
> > PageTail could inadvertently get set, and a racing get_user_pages_fast()
> > could dereference a bogus compound_head().
> >
> > Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> Thanks for your patch!
> 
> > --- a/include/linux/mm_types.h
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
> 
> Would
> 
>     unsigned long _dma_addr[sizeof(dma_addr_t) / sizeof(unsigned long)];
> 
> work?
> 
> Or will the compiler become too overzealous, and warn about the use
> of ...[1] below, even when unreachable?
> I wouldn't mind an #ifdef instead of an if () in the code below, though.

You could use [ARRAY_SIZE()-1] instead of [1].
Or, since IIRC it is the last member of that specific struct, define as:
		unsigned long dma_addr[];

...
> > -       return page->dma_addr;
> > +       dma_addr_t ret = page->dma_addr[0];
> > +       if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > +               ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;
> 
> We don't seem to have a handy macro for a 32-bit left shift yet...
> 
> But you can also avoid the warning using
> 
>     ret |= (u64)page->dma_addr[1] << 32;

Or:
	ret |= page->dma_addr[1] + 0ull << 32;

Which relies in integer promotion rather than a cast.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
