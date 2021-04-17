Return-Path: <SRS0=lceQ=JO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639AEC433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 18:32:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B177D60FE5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 18:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B177D60FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=agzGjv0aNoUXveENTKXv2MO19oufGwTpbIovKwcwQvM=; b=nrqlOvvpxksDT/OjELd+6oOcG
	VHhcxzYc37CwkaiH5QotSMIgtwbbokgqw7lDCbj0pr8EILWQc9DtO/e2t1TUVIb7fWukBa/mWo3KD
	N1aZr/KbDNUMukXfUNhiILqrnCE8iS+GbUEO+Z1JevfCs456h4bBFjZ8AeVK20miElO0w7cgmYHRd
	Yqbfw2/qwj2ew3ZhgEJKM8jx04ocV83uXdeWRIhGVFJMH5+hjhZUCmN29JMWayeriqnFLo+k8quDM
	i/TmHOYnHa7XJgzLZ8EYjvMDHwMLrNzxQCJGh8t+ZZeJEZvLlaMQ7C+iXxiX7Pbdv98x868CfZtxX
	WgktTdgyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXpk5-005xog-1v; Sat, 17 Apr 2021 18:32:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXpjt-005xmz-25
 for linux-snps-arc@desiato.infradead.org; Sat, 17 Apr 2021 18:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rXzu2aaQG3S7cGTxRDcxeH5itwSf5UHiBbc+Mfp3iik=; b=TrKJWyDdQkHZ4zsyZNy/NMtBEN
 eJaMLNkL3TexXMjEzwhU2eGmoMbBrDysm2q7nBxsepefvob4ijy7RB8gr0CDhtP00turlakLvJgTQ
 A+Fdxd7x0uEkCKo2kYnE9RSlvtCMu1CZ9JfPijSlSPEPLd9EFJQzOEKivrOHdLI79uJ6UJ7aK9RGr
 F50Qx8arIMcTkJjzXOiLlg3SHMbIHey3ACZuftEgKV3CNCj5m/TmUqQu4Br3lAglEFeVzyEtiQivY
 QgL8WhOW3PHRhFHCeAz+N/OrhE8sFSCyf3SMfp6XQwXmfgo9zZcfy71czfUSAAdYfyDT20+G25jxY
 HcCBTE3w==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXpjn-00A93G-J0
 for linux-snps-arc@lists.infradead.org; Sat, 17 Apr 2021 18:32:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so18235965wmy.5
 for <linux-snps-arc@lists.infradead.org>; Sat, 17 Apr 2021 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rXzu2aaQG3S7cGTxRDcxeH5itwSf5UHiBbc+Mfp3iik=;
 b=e9wLqXquNQTYWhXjUdKEFxVNM3EcZvI8CB4v0ovhwe/yevYVGVmzrbaHhE02CX0UKZ
 iAQ9XXHX1nTA8YswubW58TmD3iYRX4RADm9tE2JivkSsjiH4tHL6PevgUD+Q8o0lj13M
 Wh4WQNLWESeMTaegmO+swRQWtdK95e3TtBPFPjyoSMZO3m6jYk3AFl+7UJTVlzhYvukt
 kZIWWQL5KZN7mSFoC/bQUNXGH+80MdOC3b07Am6Bil612+h6z0k+ywWcIjHl/qR1rea2
 iA5ItEuiIMldPKGr3Y9PSZWyZuR7p/rmUen+WySDnuz9aNuJAQg+hrIjwxVrU28R2S8P
 JYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rXzu2aaQG3S7cGTxRDcxeH5itwSf5UHiBbc+Mfp3iik=;
 b=jkNFT/mUfHMdkUu+I9aThL1iLdzXDpUmh28aS/s6gDJ9uizUx/zp8AhyZe5baoDSWU
 ceVD5I0LWF9joBROD4Z2MWmBA2/JCwhFWp86oNh/xuj/FlBXwRWrBFpuLH7gMulsSiCm
 eO+odo+bCru2CJZl1kkT0JFL8VhcyqJuf+W/W5WQLxfQ7aIzTj/dth9JVmZfZ1NEa13T
 izlm/+DJzriOnDOClEYjbQzeUa/orArwJEKVJsD7dBAV/BXNp0dESfTuMCeIfs/5KWk1
 4ptbnfVgSDRziJ3N8fEa/A/dXCagNhRgCJs8kYY9S3Oa+f+5h8tQRc+K0U5ftNdt+V0Q
 t2bg==
X-Gm-Message-State: AOAM533Xvqu5HJn8QKokiUYlteteep1rY7egiUhUZKUImbi27DRzIjh+
 8AGaAIYvmuYvT2bRXWymX2YnWQ==
X-Google-Smtp-Source: ABdhPJy8eVPGkCEVOqcITHVxTpCMYxsxuxYGe77mR9W540Za15SuA9f3s8LvAfJ6EElZzxF5pnQVxQ==
X-Received: by 2002:a1c:770a:: with SMTP id t10mr13782514wmi.49.1618684329574; 
 Sat, 17 Apr 2021 11:32:09 -0700 (PDT)
Received: from apalos.home (ppp-94-65-92-88.home.otenet.gr. [94.65.92.88])
 by smtp.gmail.com with ESMTPSA id a22sm15043900wrc.59.2021.04.17.11.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 11:32:09 -0700 (PDT)
Date: Sat, 17 Apr 2021 21:32:06 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: brouer@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 mcroce@linux.microsoft.com, grygorii.strashko@ti.com,
 arnd@kernel.org, hch@lst.de, linux-snps-arc@lists.infradead.org,
 mhocko@kernel.org, mgorman@suse.de
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <YHspptFx+T588KcG@apalos.home>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417024522.GP2531743@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_113211_693147_AAEC3A84 
X-CRM114-Status: GOOD (  32.08  )
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

Hi Matthew,

On Sat, Apr 17, 2021 at 03:45:22AM +0100, Matthew Wilcox wrote:
> 
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
> ---
>  include/linux/mm_types.h |  4 ++--
>  include/net/page_pool.h  | 12 +++++++++++-
>  net/core/page_pool.c     | 12 +++++++-----
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a8894..5aacc1c10a45 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -97,10 +97,10 @@ struct page {
>  		};
>  		struct {	/* page_pool used by netstack */
>  			/**
> -			 * @dma_addr: might require a 64-bit value even on
> +			 * @dma_addr: might require a 64-bit value on
>  			 * 32-bit architectures.
>  			 */
> -			dma_addr_t dma_addr;
> +			unsigned long dma_addr[2];
>  		};
>  		struct {	/* slab, slob and slub */
>  			union {
> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index b5b195305346..ad6154dc206c 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>  
>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>  {
> -	return page->dma_addr;
> +	dma_addr_t ret = page->dma_addr[0];
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;
> +	return ret;
> +}
> +
> +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> +{
> +	page->dma_addr[0] = addr;
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		page->dma_addr[1] = addr >> 16 >> 16;


The 'error' that was reported will never trigger right?
I assume this was compiled with dma_addr_t as 32bits (so it triggered the
compilation error), but the if check will never allow this codepath to run.
If so can we add a comment explaining this, since none of us will remember why
in 6 months from now?

>  }
>  
>  static inline bool is_page_pool_compiled_in(void)
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index ad8b0707af04..f014fd8c19a6 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -174,8 +174,10 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
>  					  struct page *page,
>  					  unsigned int dma_sync_size)
>  {
> +	dma_addr_t dma_addr = page_pool_get_dma_addr(page);
> +
>  	dma_sync_size = min(dma_sync_size, pool->p.max_len);
> -	dma_sync_single_range_for_device(pool->p.dev, page->dma_addr,
> +	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
>  					 pool->p.offset, dma_sync_size,
>  					 pool->p.dma_dir);
>  }
> @@ -226,7 +228,7 @@ static struct page *__page_pool_alloc_pages_slow(struct page_pool *pool,
>  		put_page(page);
>  		return NULL;
>  	}
> -	page->dma_addr = dma;
> +	page_pool_set_dma_addr(page, dma);
>  
>  	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>  		page_pool_dma_sync_for_device(pool, page, pool->p.max_len);
> @@ -294,13 +296,13 @@ void page_pool_release_page(struct page_pool *pool, struct page *page)
>  		 */
>  		goto skip_dma_unmap;
>  
> -	dma = page->dma_addr;
> +	dma = page_pool_get_dma_addr(page);
>  
> -	/* When page is unmapped, it cannot be returned our pool */
> +	/* When page is unmapped, it cannot be returned to our pool */
>  	dma_unmap_page_attrs(pool->p.dev, dma,
>  			     PAGE_SIZE << pool->p.order, pool->p.dma_dir,
>  			     DMA_ATTR_SKIP_CPU_SYNC);
> -	page->dma_addr = 0;
> +	page_pool_set_dma_addr(page, 0);
>  skip_dma_unmap:
>  	/* This may be the last page returned, releasing the pool, so
>  	 * it is not safe to reference pool afterwards.
> -- 
> 2.30.2
> 

Thanks
/Ilias

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
