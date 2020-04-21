Return-Path: <SRS0=oiin=6F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A1EC38A30
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Apr 2020 02:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073112082E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Apr 2020 02:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WOfk7tcI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pi6jeKp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073112082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18wMdjjIzBxMIb8pJuuWMDHYYD79DO+CGxUqqjs1a8Y=; b=WOfk7tcI+p9PDT
	szmA+KLWHwuJFg852zG7GdM2i3WjAN1Qf7OWonWrn+8XKXYcrm4aCIrxG8qqlKGO64IRkdxbhkf0T
	YC0ehe9ByMeoQiR7vD2c1n91f0k704W79W/4U4q85XBf7s/5/ad+/jfv89nIVkVrB2uCj7YSwfyfn
	CegUq3esbZ9WHBWQMZY8P8gAlyDgRiqicOefeWFyU9toefM7T0H2qE4iCc+s2kMA69oB1sKozO2Bx
	Lu/xzlXEOwUXjrks96iIvN1I5v5Ep0l9oA6ZogZmqkN57krldIVK3OSYo5AkIF2PpOsurwcBPNsEX
	wWbyB/octSRWZcuq2lZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQial-0000zs-MV; Tue, 21 Apr 2020 02:24:55 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQiah-0000vW-0V
 for linux-snps-arc@lists.infradead.org; Tue, 21 Apr 2020 02:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587435889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Muw3THJhE6mXPlOA/UgJHfU1SluTy1QDua9Qwu1ZGDs=;
 b=Pi6jeKp1fro4josAGSxfofUlP0YxX96NGDpQdGjFKPWBCxi2tohLHaS4zlXl3A1I3EZekC
 kagw2L2uGeyKzo5TQO/7YsgKWXIGDuzqma6/ejZ8a5S7zwqIi7uFVTIrCFISwGq/sb6bo4
 CItvxaaJ6CowaBED3Q8pfAK0dlhfBm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-M7FU_cShM9S7GfjktLA04w-1; Mon, 20 Apr 2020 22:24:48 -0400
X-MC-Unique: M7FU_cShM9S7GfjktLA04w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C109A107ACC9;
 Tue, 21 Apr 2020 02:24:41 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 470B65DA76;
 Tue, 21 Apr 2020 02:24:37 +0000 (UTC)
Date: Tue, 21 Apr 2020 10:24:35 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 02/21] mm: make early_pfn_to_nid() and related defintions
 close to each other
Message-ID: <20200421022435.GP4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-3-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_192451_132664_53DB7FFB 
X-CRM114-Status: GOOD (  21.07  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The early_pfn_to_nid() and it's helper __early_pfn_to_nid() are spread
> around include/linux/mm.h, include/linux/mmzone.h and mm/page_alloc.c.
> 
> Drop unused stub for __early_pfn_to_nid() and move its actual generic
> implementation close to its users.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  include/linux/mm.h     |  4 ++--
>  include/linux/mmzone.h |  9 --------
>  mm/page_alloc.c        | 51 +++++++++++++++++++++---------------------
>  3 files changed, 27 insertions(+), 37 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5a323422d783..a404026d14d4 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2388,9 +2388,9 @@ extern void sparse_memory_present_with_active_regions(int nid);
>  
>  #if !defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP) && \
>      !defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID)
> -static inline int __early_pfn_to_nid(unsigned long pfn,
> -					struct mminit_pfnnid_cache *state)
> +static inline int early_pfn_to_nid(unsigned long pfn)
>  {
> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_NUMA));
>  	return 0;
>  }

It's better to make a separate patch to drop __early_pfn_to_nid() here.

>  #else
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 1b9de7d220fb..7b5b6eba402f 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1078,15 +1078,6 @@ static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
>  #include <asm/sparsemem.h>
>  #endif
>  
> -#if !defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID) && \
> -	!defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP)
> -static inline unsigned long early_pfn_to_nid(unsigned long pfn)
> -{
> -	BUILD_BUG_ON(IS_ENABLED(CONFIG_NUMA));
> -	return 0;
> -}
> -#endif
> -
>  #ifdef CONFIG_FLATMEM
>  #define pfn_to_nid(pfn)		(0)
>  #endif
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 0d012eda1694..1ac775bfc9cf 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1504,6 +1504,31 @@ void __free_pages_core(struct page *page, unsigned int order)

#if defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID) || \
        defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP)

This is the upper layer of ifdeffery scope.
>  
>  static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
>  
> +#ifndef CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID

Moving __early_pfn_to_nid() here makes the upper layer of ifdeferry
scope a little werid. But seems no better way to optimize it.

Otherwise, this patch looks good to me.

Reviewed-by: Baoquan He <bhe@redhat.com>

> +
> +/*
> + * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
> + */
> +int __meminit __early_pfn_to_nid(unsigned long pfn,
> +					struct mminit_pfnnid_cache *state)
> +{
> +	unsigned long start_pfn, end_pfn;
> +	int nid;
> +
> +	if (state->last_start <= pfn && pfn < state->last_end)
> +		return state->last_nid;
> +
> +	nid = memblock_search_pfn_nid(pfn, &start_pfn, &end_pfn);
> +	if (nid != NUMA_NO_NODE) {
> +		state->last_start = start_pfn;
> +		state->last_end = end_pfn;
> +		state->last_nid = nid;
> +	}
> +
> +	return nid;
> +}
> +#endif /* CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID */
> +
>  int __meminit early_pfn_to_nid(unsigned long pfn)
>  {
>  	static DEFINE_SPINLOCK(early_pfn_lock);
> @@ -6298,32 +6323,6 @@ void __meminit init_currently_empty_zone(struct zone *zone,
>  	zone->initialized = 1;
>  }
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> -#ifndef CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID
> -
> -/*
> - * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
> - */
> -int __meminit __early_pfn_to_nid(unsigned long pfn,
> -					struct mminit_pfnnid_cache *state)
> -{
> -	unsigned long start_pfn, end_pfn;
> -	int nid;
> -
> -	if (state->last_start <= pfn && pfn < state->last_end)
> -		return state->last_nid;
> -
> -	nid = memblock_search_pfn_nid(pfn, &start_pfn, &end_pfn);
> -	if (nid != NUMA_NO_NODE) {
> -		state->last_start = start_pfn;
> -		state->last_end = end_pfn;
> -		state->last_nid = nid;
> -	}
> -
> -	return nid;
> -}
> -#endif /* CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID */
> -
>  /**
>   * free_bootmem_with_active_regions - Call memblock_free_early_nid for each active range
>   * @nid: The node to free memory on. If MAX_NUMNODES, all nodes are freed.
> -- 
> 2.25.1
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
