Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA47C433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 07:40:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C3C61027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 07:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C3C61027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZP2CZ2goK1BG8r729r7q5DV4dE2xhVzXCCNBRYJK0Ag=; b=lXBuXt/nTHmbuv/Exk4mkfqh9
	2tIlFLqWqNmJR1bL0A4pbCvmPHeoLzeLJyOHlM+UVpwDgQuSSLZxru7chzsfS6ONX7nkatad9gv6E
	U9985i+/joXxMq1vtgb9ThjtNqn/D5tGQ/LYHxbkQZ9h02M7BpEoLfJEgAxdx8UIOSekLdN4vOfpP
	4FsbeTv+bRKsnxXWmtjgOQPSTaWgsy9Hxv/xI1cktRoV/EwHEAw2lIYSqNwBnkCMr2BRzoL8YaD29
	9pAcDHJnwTSHf0PKX9X4QtHRVHT3ntoJjDONCjgmu4OR0opuNaTWcLi85HG2DKL2L8dhFcAl/iEnA
	Rt/+7sN6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYkzk-00BUpk-SF; Tue, 20 Apr 2021 07:40:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkzW-00BUof-0F; Tue, 20 Apr 2021 07:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=H6eQzhTjkJ0rVc7HEe9OWdxxcp9k4JKL+wOyVTTn6UM=; b=i/NOqTrF3nVoGD3eb4SurROmsx
 k9W7J3a7yv4m559tkV2RlWq/Y05xFVDO73hX6zDPvcuWFW+3F3zfF6DnU4ARZA+VcCqxEht7pTpib
 HELB1YOh12AwsASqinIOsvGTohComzHzYXWYhuokYzs4FtwS6CbeGNhaMTfbGpADpOadvpAelkfO+
 QXdwI4z+uag0lLsuq6fqzhFWHcUjTXJV008EnmZTV+z4KSeJrS1w0083rWQ6mIAYCDpBwpvyF4ykW
 ArEEslFQH9+MjQ5j+zjQjI26DtBAtUTRKgDIy/41WKf7jyK1894wkvPd32oxHz/K0uAdoSa7Cl+S5
 k+R54jhw==;
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkzQ-00Bt4o-4x; Tue, 20 Apr 2021 07:40:12 +0000
Received: by mail-vk1-f179.google.com with SMTP id x4so8135301vkx.5;
 Tue, 20 Apr 2021 00:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6eQzhTjkJ0rVc7HEe9OWdxxcp9k4JKL+wOyVTTn6UM=;
 b=eZyWZTcelL4PYnudThLeO2hurC1S47cdwziMat/0x1a2ssUni/5gQHd0Sj2Y/vkqF+
 9eMoBEBukC/wwcOj+x1HSuCEeZSho2SS6PA7PoHguTLLmnkUJ0azIsgNFHaZrF6phkNO
 dht1l28TvsgudKW6NW36ZAzRbaPoGRD1gcENOnBQIcK8V0jqpP3c9ZdTZZJECeqaxR63
 WSipPpDYX7ThBdeU4eNrFiMAvR7mkeQv4bru7akd9aCjYz3IDEyhCSjzjVgg+zLryB+M
 ZaSHEUw+w86LfSwVE0SpU3zFKk/g+ZIF1qZWIwuwTYAeLX+kOxNJrETWK7FJJT3sca1i
 mA3g==
X-Gm-Message-State: AOAM531S/i5Po8ANVfQ80oV6msjBl7j5AG22EIOybOsovM+RQmwqwomw
 qTJyCF2ISt+Nvv6OVvjHikFgZ4GEoPIV1LTMWBc=
X-Google-Smtp-Source: ABdhPJyQrVlZDIuzz0IXIFr61zWg3jELX2WXl+k/TdsCheRdiMxsjqJCL3H7m7n2s4eAxB2N41JJBdYT1MQaqIXF0Cc=
X-Received: by 2002:a1f:2504:: with SMTP id l4mr15813452vkl.5.1618904406471;
 Tue, 20 Apr 2021 00:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
In-Reply-To: <20210417024522.GP2531743@casper.infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Apr 2021 09:39:54 +0200
Message-ID: <CAMuHMdXm1Zg=Wm-=tn5jUJwqVGUvCi5yDaW0PXWC2DEDYGcy5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: Matthew Wilcox <willy@infradead.org>
Cc: Jesper Dangaard Brouer <brouer@redhat.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, 
 netdev <netdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 mcroce@linux.microsoft.com, Grygorii Strashko <grygorii.strashko@ti.com>, 
 Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@lst.de>,
 arcml <linux-snps-arc@lists.infradead.org>, 
 Michal Hocko <mhocko@kernel.org>, Mel Gorman <mgorman@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_004008_219549_EB3C6345 
X-CRM114-Status: GOOD (  35.48  )
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

Hi Willy,

On Sat, Apr 17, 2021 at 4:49 AM Matthew Wilcox <willy@infradead.org> wrote:
> Replacement patch to fix compiler warning.
>
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Fri, 16 Apr 2021 16:34:55 -0400
> Subject: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
> To: brouer@redhat.com
> Cc: linux-kernel@vger.kernel.org,
>     linux-mm@kvack.org,
>     netdev@vger.kernel.org,
>     linuxppc-dev@lists.ozlabs.org,
>     linux-arm-kernel@lists.infradead.org,
>     linux-mips@vger.kernel.org,
>     ilias.apalodimas@linaro.org,
>     mcroce@linux.microsoft.com,
>     grygorii.strashko@ti.com,
>     arnd@kernel.org,
>     hch@lst.de,
>     linux-snps-arc@lists.infradead.org,
>     mhocko@kernel.org,
>     mgorman@suse.de
>
> 32-bit architectures which expect 8-byte alignment for 8-byte integers
> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> page inadvertently expanded in 2019.  When the dma_addr_t was added,
> it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> gap between 'flags' and the union.
>
> Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
> This restores the alignment to that of an unsigned long, and also fixes a
> potential problem where (on a big endian platform), the bit used to denote
> PageTail could inadvertently get set, and a racing get_user_pages_fast()
> could dereference a bogus compound_head().
>
> Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Thanks for your patch!

> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -97,10 +97,10 @@ struct page {
>                 };
>                 struct {        /* page_pool used by netstack */
>                         /**
> -                        * @dma_addr: might require a 64-bit value even on
> +                        * @dma_addr: might require a 64-bit value on
>                          * 32-bit architectures.
>                          */
> -                       dma_addr_t dma_addr;
> +                       unsigned long dma_addr[2];

So we get two 64-bit words on 64-bit platforms, while only one is
needed?

Would

    unsigned long _dma_addr[sizeof(dma_addr_t) / sizeof(unsigned long)];

work?

Or will the compiler become too overzealous, and warn about the use
of ...[1] below, even when unreachable?
I wouldn't mind an #ifdef instead of an if () in the code below, though.

>                 };
>                 struct {        /* slab, slob and slub */
>                         union {
> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index b5b195305346..ad6154dc206c 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>
>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>  {
> -       return page->dma_addr;
> +       dma_addr_t ret = page->dma_addr[0];
> +       if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +               ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;

We don't seem to have a handy macro for a 32-bit left shift yet...

But you can also avoid the warning using

    ret |= (u64)page->dma_addr[1] << 32;

> +       return ret;
> +}
> +
> +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> +{
> +       page->dma_addr[0] = addr;
> +       if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +               page->dma_addr[1] = addr >> 16 >> 16;

... but we do have upper_32_bits() for a 32-bit right shift.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
