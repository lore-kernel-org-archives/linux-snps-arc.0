Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FA9C48BD1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 11:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07416136D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 11:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07416136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJwkd41M8HMXAGA5qHpf8cpMcWhBRLHYY4GqxNutP7M=; b=e7Hn49p68oPeovRMbqaZGOufQ3
	tl+affZXLf4QwOMTPwYz1+U/lURmgoeh7CnMY9hLPFYk4OUhJosk8wlhJdmf9yeCnbefV3MPEF5YC
	uphFR0ITuRQL4KVca6x4NkLGsekmoBTyO0v+dyKoX8zRvRqOg88z/WJrR7ZtCzfFPY/7ObMPhxow/
	7YoaL1UuRrI/MpOW3pJRz+jOLpMpchc8V6q2EPuNJOPraisK6kHv/aQfTPVdQNdsJ5uz/OCWCC2r1
	XJYXAQRzqD7IU3J3aS1KJzVefjvi/uTmSWa+cD30iQdRfMTj8UpIiXPJFYqN1qesVvCsKxjwXYyrl
	S1fWJtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvxg-00DDXU-8W; Wed, 09 Jun 2021 11:01:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvua-00DCBc-4m
 for linux-snps-arc@lists.infradead.org; Wed, 09 Jun 2021 10:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Gdg9+tpOx626Ezvggt1xE7D6QrGInTamndBpZke/4o=;
 b=X/JH4frm23e51OvL+AzU/aGWN4rwxW2nutCDtOm9LyTOJ/rzwK4RgqtIqNDskkViAY0b6j
 QsdxlegHTDekdhcER9oIYr8BV3Fi9hIVng/rQ/W7RX39u3ZqNYbFp3mtJVvbGCdRe5Vq6D
 0dJzVXNeFzQMfVoJmLP17f8BVs/C8FM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-_j8o1FayPaap_j6FuCGPcQ-1; Wed, 09 Jun 2021 06:58:14 -0400
X-MC-Unique: _j8o1FayPaap_j6FuCGPcQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so10514839wre.9
 for <linux-snps-arc@lists.infradead.org>; Wed, 09 Jun 2021 03:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2Gdg9+tpOx626Ezvggt1xE7D6QrGInTamndBpZke/4o=;
 b=TGeh12GgH9OFEyWURNBipRIJ4qVeCG68g8pAAnlMxkTyRnzrMdncK064ecSnDYCAIY
 rgUE9UwRRK0f8/zfwg1uxYxmdEJv+g0+3bqQu8l/VpB48QMJ/yvlr5+aDnGtXrnypDWn
 7E8Pq5sEYelSrp60HTR6mnE2ZqQD7O9R05xUe+d4Pee5EWz9wx/j3w/wBPnBC/IsJg1L
 WTwSun8LRLVWIhKsY7QA3pKv5jMjvQeEq9GiUYTt3LzfxzqjwciVRLzbEDL3pJ2Mh3j/
 4q9hYMRh10swMhB3AVKTlcC8vgJTrz12w87gnq0IKs8hKi6Ta7HUSWP4pRsUNMucNSpI
 00HA==
X-Gm-Message-State: AOAM532l1bC3Qq+9k7IrT6WhL61yZwmd/y38r8FS8T0XFstf49XLPDux
 g7Hk/WkymYy779Y7T03nYkj2Ka9dmRuZHSVWJzlURcxiULrTxFzvi3N04dfP2ZA7vYCnJPa7BSY
 6MU34Me8ittYPE5Z12/ggE+aOnrN7tco5
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr27256966wrx.144.1623236292821; 
 Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxANfssiXPPwd5jXqSLFwZZmn/VQ6v6aq6x8NxYxZ6oulxycL5+UbfQGME/wwP7BrwnDfbhqg==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr27256934wrx.144.1623236292583; 
 Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 o3sm24218939wrm.78.2021.06.09.03.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
Subject: Re: [PATCH 9/9] mm: replace CONFIG_FLAT_NODE_MEM_MAP with
 CONFIG_FLATMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet
 <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-10-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5dc2c695-06c9-671f-a77d-24db56485041@redhat.com>
Date: Wed, 9 Jun 2021 12:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-10-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035816_387149_65C38C99 
X-CRM114-Status: GOOD (  26.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> After removal of the DISCONTIGMEM memory model the FLAT_NODE_MEM_MAP
> configuration option is equivalent to FLATMEM.
> 
> Drop CONFIG_FLAT_NODE_MEM_MAP and use CONFIG_FLATMEM instead.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   include/linux/mmzone.h | 4 ++--
>   kernel/crash_core.c    | 2 +-
>   mm/Kconfig             | 4 ----
>   mm/page_alloc.c        | 6 +++---
>   mm/page_ext.c          | 2 +-
>   5 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index ad42f440c704..2698cdbfbf75 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -775,7 +775,7 @@ typedef struct pglist_data {
>   	struct zonelist node_zonelists[MAX_ZONELISTS];
>   
>   	int nr_zones; /* number of populated zones in this node */
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP	/* means !SPARSEMEM */
> +#ifdef CONFIG_FLATMEM	/* means !SPARSEMEM */
>   	struct page *node_mem_map;
>   #ifdef CONFIG_PAGE_EXTENSION
>   	struct page_ext *node_page_ext;
> @@ -865,7 +865,7 @@ typedef struct pglist_data {
>   
>   #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
>   #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
>   #else
>   #define pgdat_page_nr(pgdat, pagenr)	pfn_to_page((pgdat)->node_start_pfn + (pagenr))
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 53eb8bc6026d..2b8446ea7105 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -483,7 +483,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>   	VMCOREINFO_OFFSET(page, compound_head);
>   	VMCOREINFO_OFFSET(pglist_data, node_zones);
>   	VMCOREINFO_OFFSET(pglist_data, nr_zones);
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
>   #endif
>   	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
> diff --git a/mm/Kconfig b/mm/Kconfig
> index bffe4bd859f3..ded98fb859ab 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -55,10 +55,6 @@ config FLATMEM
>   	def_bool y
>   	depends on !SPARSEMEM || FLATMEM_MANUAL
>   
> -config FLAT_NODE_MEM_MAP
> -	def_bool y
> -	depends on !SPARSEMEM
> -
>   #
>   # SPARSEMEM_EXTREME (which is the default) does some bootmem
>   # allocations when sparse_init() is called.  If this cannot
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8f08135d3eb4..f039736541eb 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6444,7 +6444,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
>   	}
>   }
>   
> -#if !defined(CONFIG_FLAT_NODE_MEM_MAP)
> +#if !defined(CONFIG_FLATMEM)
>   /*
>    * Only struct pages that correspond to ranges defined by memblock.memory
>    * are zeroed and initialized by going through __init_single_page() during
> @@ -7241,7 +7241,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>   	}
>   }
>   
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>   {
>   	unsigned long __maybe_unused start = 0;
> @@ -7289,7 +7289,7 @@ static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>   }
>   #else
>   static void __ref alloc_node_mem_map(struct pglist_data *pgdat) { }
> -#endif /* CONFIG_FLAT_NODE_MEM_MAP */
> +#endif /* CONFIG_FLATMEM */
>   
>   #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>   static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index df6f74aac8e1..293b2685fc48 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -191,7 +191,7 @@ void __init page_ext_init_flatmem(void)
>   	panic("Out of memory");
>   }
>   
> -#else /* CONFIG_FLAT_NODE_MEM_MAP */
> +#else /* CONFIG_FLATMEM */
>   
>   struct page_ext *lookup_page_ext(const struct page *page)
>   {
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
