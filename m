Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273EBC77B78
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Apr 2023 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1mx+CD9Glwxv7A+N5WvjxQrYHQxOYLV6LCVIAwv3yc=; b=hpHXrgSNTHnaZC
	ulMc2femGtkC6GnvMwpguV+eTZOiKa6Ro/5T33lNv1ZFYC/pLlJOBUH7Lp56avg50hmLjDTnsry78
	lJUTjxj1clAiX08H21tyUwcj1DIbbMoGjZjORDpNkYnmvkm1HFGHnwUwcRROdcB1e8rUxv36jiG+G
	RZGul5mdB2CdSJvn/y4EpzJgy2mAdmTTP8UA13cIVr5gnTXbtXKTkwK0cxnEERldWMbGyokhfNCKD
	osrrMqYwSAcBQ8YsJyyKALcw7VLIu13SfkmzPch1ZWRQiwsbP7PA4t91u/QUTGiKPiei1VrAzeJbR
	itMwO60TCimczW/k0DnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pornL-003GUS-0c;
	Tue, 18 Apr 2023 20:19:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pornH-003GTn-2g
	for linux-snps-arc@lists.infradead.org;
	Tue, 18 Apr 2023 20:19:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BED3063579;
	Tue, 18 Apr 2023 20:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A15BC433D2;
	Tue, 18 Apr 2023 20:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681849154;
	bh=818LBOx4Bv0tTU4R6fF/F8RgUh8+pLOLseVWoDF04Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxSWuETwBuSPN7KR5ksPL4CeNNoZaPHeQX9xFxsbjuYNY5Ibx/tYwBgIBdeXos4eL
	 vPl28hymPjO/NUqY86TbVyQWGIB/CmkfSreKYBqT8iNF8khdSUiLIdE8IzNfimQcsq
	 0bN1VLPGn4Ep/JH8ndPdU71z/NImVpjwWdQxQrS2dcpLHVBLhQC4etDmwIIhNzJbQ8
	 84h3wrJ1IjbkrHmI0PAt62hXXRb9+VpGeAMGdVwz0tEiGK+g1l4rVbpCjKKNsh3cgD
	 uyxfXEY+DqY0UpASqoouTKWRLY3yN2FsBocpC8eSkpukcgNyZQqcOc6cJresUq6vMu
	 bMp6aAz/r716A==
Date: Tue, 18 Apr 2023 23:18:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
	Vineet Gupta <vgupta@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, David Hildenbrand <david@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns() static
Message-ID: <ZD77Mh58MVMVdLrT@kernel.org>
References: <20230415081904.969049-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415081904.969049-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_131915_962610_6F0953E6 
X-CRM114-Status: GOOD (  25.15  )
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

On Sat, Apr 15, 2023 at 10:18:20AM +0200, Arnd Bergmann wrote:
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

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

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
> -- 
> 2.39.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
