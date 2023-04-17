Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E08C77B72
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VCrWf1x97gnU9yEclpmAt+/zJ5CWLlbTxLXRaAJd8A=; b=1nukXOmljQF1xV
	7ESt6i4yB+macyiH7ZjS/XIopOsnClekBdw75SsCTXg/Y5JH5Mn0oNIW3SLRHvUdWsI6RWVRKiklf
	5caLncQ5FvSOFVvxnO/BU0U0L0TrCzcshLqvHs27BAWvpGG6umKIU5IAN9lphEa896Gh5wI4ic+i9
	E74UsZjxcpPIWUxIuEsI/zX4ikFc3G74mwZPTFBW5OQIRcr2s1yHOUmsqmMQs98RI1CTnVNKDQErK
	Zoi5M6eOHBH1RsPIVieIevkjiM7XNi2IXGbR3RuUZov3NWdXB2ro87xHgtactx36mUjRPGTAzu/2y
	SWrGJD7gfzjp/19OARdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLk1-00Ffxg-2u;
	Mon, 17 Apr 2023 10:05:45 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLjt-00FftM-1w
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Apr 2023 10:05:45 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A63B21A4F;
	Mon, 17 Apr 2023 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1681725935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8fabMzfAGjYP0BKz9hKFICr8htAJHIgLHPI3ASfU3Y=;
	b=x3m71yKhdvmuBlg8QOf5PuKlKQHoRWyjXLkNrFDX+MuM6ItA8xxYSiw/ER4YXWMV52BKOq
	cKHP3/kZdcOq7+8J9+KMMMHRfOTrB1saDQHR5r8Wpg6Cpc6563HMWZp/Fe308Thc+VQAn9
	/k1eOkEQX+8Pe55Oh/Mxi4cZURNMFe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1681725935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8fabMzfAGjYP0BKz9hKFICr8htAJHIgLHPI3ASfU3Y=;
	b=hyQgOgVfxD4SWY/sZeKOyYctwFET7dw5pbiknDMQnkwXPnZU+474gLlDsSSKo9n+7v3Y5T
	vBU5YkICotyLboAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E64EA1390E;
	Mon, 17 Apr 2023 10:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AontNu4ZPWTAeAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Mon, 17 Apr 2023 10:05:34 +0000
Message-ID: <5a5e21d1-b346-2943-3ec0-e84f03551998@suse.cz>
Date: Mon, 17 Apr 2023 12:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns() static
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
 Vineet Gupta <vgupta@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20230415081904.969049-1-arnd@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230415081904.969049-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_030537_803692_DA5DE9FB 
X-CRM114-Status: GOOD (  22.44  )
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

On 4/15/23 10:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang produces a build failure on x86 for some randconfig builds
> after a change that moves around code to mm/mm_init.c:
> 
> Cannot find symbol for section 2: .text.
> mm/mm_init.o: failed
> 
> I have not been able to figure out why this happens, but the __weak
> annotation on arch_has_descending_max_zone_pfns() is the trigger here.
> 
> Removing the weak function in favor of an open-coded Kconfig option
> check avoids the problem and becomes clearer as well as better to
> optimize by the compiler.
> 
> Fixes: 9420f89db2dd ("mm: move most of core MM initialization to mm/mm_init.c")
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Makes sense if there's only a single arch that has the special case.

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
> v2: fix logic bug reported-by: kernel test robot <oliver.sang@intel.com>,
> see https://lore.kernel.org/oe-lkp/202304151422.5e4d380b-oliver.sang@intel.com
> ---
>  arch/arc/mm/init.c | 5 -----
>  include/linux/mm.h | 1 -
>  mm/mm_init.c       | 4 ++--
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index ce4e939a7f07..2b89b6c53801 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -74,11 +74,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>  		base, TO_MB(size), !in_use ? "Not used":"");
>  }
>  
> -bool arch_has_descending_max_zone_pfns(void)
> -{
> -	return !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
> -}
> -
>  /*
>   * First memory setup routine called from setup_arch()
>   * 1. setup swapper's mm @init_mm
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 63acf4a598fe..75d8adce0aee 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3061,7 +3061,6 @@ extern void setup_per_cpu_pageset(void);
>  extern int min_free_kbytes;
>  extern int watermark_boost_factor;
>  extern int watermark_scale_factor;
> -extern bool arch_has_descending_max_zone_pfns(void);
>  
>  /* nommu.c */
>  extern atomic_long_t mmap_pages_allocated;
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 35302b7bca83..7f7f9c677854 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1754,9 +1754,9 @@ static void __init free_area_init_memoryless_node(int nid)
>   * Some architectures, e.g. ARC may have ZONE_HIGHMEM below ZONE_NORMAL. For
>   * such cases we allow max_zone_pfn sorted in the descending order
>   */
> -bool __weak arch_has_descending_max_zone_pfns(void)
> +static bool arch_has_descending_max_zone_pfns(void)
>  {
> -	return false;
> +	return IS_ENABLED(CONFIG_ARC) && !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
>  }
>  
>  /**


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
