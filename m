Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA3CC433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 07:21:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6359860FE5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 07:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6359860FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RMlsw0GINQCOK+xQl0JO9TaK4reSqM/prXdhU03nPO8=; b=DGdclj8tC5TuB4RX2M+EwBmcQ
	0NY8gw4CwABhyb0tSMg7pxLErqPT6BRixgKOsOCe0Qi8q2IlLRG2ljbbALA+XbmHBokqo/W1CaG60
	18LSyYrZrWwAtm+Zd68UQITLYFypYTzHDsvES/9kLWbs/VyOFcO2aka5jcLBEaqraHtupu9/KjLs/
	Tq6opON5nXJV+93MVxISABzKtFrghCqyEVDCex7yd+h5x7CxV6hxQ7tw+SWAmQ0B6fo0u9rqa8RuQ
	BFfwzIu98E45hZ4qEHwPUFkDNHlaF+HV9AVzSHNNQouoMi21YBPX6EH1QSL+xOG6lVcNSESPjKaha
	m+jWCFwPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYkhh-00BRiD-HB; Tue, 20 Apr 2021 07:21:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkhQ-00BRea-AF
 for linux-snps-arc@desiato.infradead.org; Tue, 20 Apr 2021 07:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=; b=bhpRKh1PbLeWe10JIbd0rbJlaO
 aKvSB22dHA2E/X7OtQNSTJk7qcXe+fagY5NmbPE2OsZ9oHX0xB0/b7Z6K7Kq7aclRyAzUfpUtLaR7
 YULNYCD1Ek6Q85eLMQkFEjOUmHPbtPGzQLNE4d3NzwvbX6FHoAkoadIg97aC3Qs7TLalrS1+fBy9v
 UPMs1O9z1hNrQfSfOC1bdklyicWcZpRGeSiR4huzbRrnzhlBDvEQ5TY9l+myDVpc3oHnrK5q61NhN
 36LoY/zcarjveR5DhTYnjmzkV20Ytl02+/RekJa3gAn7jn12S/p4j0a89GeTSXQYh6uEJthccPXZA
 jE/gbkOQ==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkhK-00BsIW-Mu
 for linux-snps-arc@lists.infradead.org; Tue, 20 Apr 2021 07:21:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id r12so56733201ejr.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 20 Apr 2021 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=;
 b=JDcuGmSnwgEFOWi0Hol09StsvZpHTO8W+O/Gz5MCGTk1hrnPT23hDPfAyBVwJSNZpt
 czBoQS5EsqxfrGVAbix+Te7AGsP7UXhIx8YFBmygfQto+b48SP2efSg7JWmJOpyukexr
 FTsu8EMSbjXVSgncFtnRCeoktgRoY0XVLaFrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=;
 b=ie5oOUJCC7vVWqPQf9Bc9bCMM56PYYFbmFtQsgKjh8UU9nUVNfXo1d4gKnOMf/fP6I
 iZj6m2iS0K/Io3d1+l4JtrG+X5HTagwyvghHi0koCvQryNYl6Rx3kLjldzXWDCK7W7TN
 qJNM3K9qRkfPZjH0nm06iT5VZpiGpBSU8s7vYipkf5vYb0vQKMjBMRwTXaqY7/lBT79e
 aENZYdcJLwhqvgALZokkmn/mexfRNH6EN3+9FEDl8jUwa9QV6Ms9R5YcfWBA71yWV/bF
 HuXUHb4u/qPkrJl+uSN7tjNTNQ5heaSHx4lTi0grO67A5KdRK6YjHc1Rp2OiBAwWky4g
 Zm2A==
X-Gm-Message-State: AOAM531+mYSZXEgviwyM5aaqImDmE9qwvD86XJZh6xwk5Jj9ZCblr/qe
 VD2cuxglz8AFpxcMpSaBderzgg==
X-Google-Smtp-Source: ABdhPJwk6gzZ2A5irFuyneT8BrQdebb3nmjVkes+GHHyVGt7Uear5nG59XVGsiWotx3n47m/ELrbzA==
X-Received: by 2002:a17:906:4d10:: with SMTP id
 r16mr25604487eju.169.1618903284093; 
 Tue, 20 Apr 2021 00:21:24 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id p3sm11836507ejd.65.2021.04.20.00.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 00:21:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, brouer@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, ilias.apalodimas@linaro.org,
 mcroce@linux.microsoft.com, grygorii.strashko@ti.com, arnd@kernel.org,
 hch@lst.de, linux-snps-arc@lists.infradead.org, mhocko@kernel.org,
 mgorman@suse.de
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d0c32751-0a12-1f7f-4f6a-b1f6535a6b6e@rasmusvillemoes.dk>
Date: Tue, 20 Apr 2021 09:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416230724.2519198-2-willy@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_002126_926520_0D2E865D 
X-CRM114-Status: GOOD (  22.40  )
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

On 17/04/2021 01.07, Matthew Wilcox (Oracle) wrote:
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

Shouldn't that member get another name (_dma_addr?) to be sure the
buildbots catch every possible (ab)user and get them turned into the new
accessors? Sure, page->dma_addr is now "pointer to unsigned long"
instead of "dma_addr_t", but who knows if there's a
"(long)page->dma_addr" somewhere?

Rasmus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
