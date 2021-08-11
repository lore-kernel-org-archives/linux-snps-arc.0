Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEB0C4320E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 12:04:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9027C60F55
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 12:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9027C60F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIXGCpV/s2k702MmMUzyuHIcyy1EFVdhGN/wPyD32p0=; b=mk6DoHW5s4S//O
	ifLG24VOQNo5wvOi0B486CMwcqZCJRYSvOiWOJNiLIlYq/0+/XGPeuNOnkTezwXZLxuQNVaL5a8rL
	/JQDuvZ7TE4xpAi/pwjdIagxSS9WyaP7KqOIOxQv+kvWOvAVS4h4cPSTozZ3VsS5WgAgN93YSgiDQ
	6BYYsAb0leGiZ3MHg+LzkRRn8jBDciIxcSyjamZoZj++bb+5l7Npd/nT5Eac2Cph7Dgt/i2t8IoFu
	MmztJen5bJZnyZjXWw7OcnPnGXzLfd63x0+Y19yIU7UzEf1gfc+F8PE+q3nEGOFKqAJG6TT1sl5bN
	xnIuBMEk0YkCpvvadFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDmyD-006tFk-Us; Wed, 11 Aug 2021 12:04:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDmyB-006tEY-Eo
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 12:04:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6127D60F55;
 Wed, 11 Aug 2021 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628683466;
 bh=1/ul8lTpnB4T++xzDF3kRFrA2xyEls7zKujxDteqWws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVoRi/drbZA10GqMWQqMmCoGAgW4Royyy0CA+6YNMUfjh0ivQaLCh9tX9suVJWJhQ
 DHwrdzBb+C3sDOcDa7hs/wGTbPlX7jTnhKThl1cLojTXdv/nywsx5dinAFS8ml7Qpe
 6M548VZLJmoJwx1UJlLzoKqbPE0VldIiADMotoUf986q2t8pTy8S6ntOBUqtTWyPHQ
 4TfSQ2U4+U9Bevg+AIfxFDiOW3awR2RdFk65K/GAoYfjcDynTwnD9x+mjr5wb3uKdx
 rmWZZ+roqwqo8cE+AlXBnZ1jNmJwsqt5XH6EaPIFkg1uGUBH6QAfRro3yE0VetTfKT
 v/W01nfpUVP8A==
Date: Wed, 11 Aug 2021 15:04:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 06/18] ARC: mm: Enable STRICT_MM_TYPECHECKS
Message-ID: <YRO8xUlAtMeJnDbe@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-7-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811004258.138075-7-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_050427_576523_3761A82E 
X-CRM114-Status: GOOD (  20.62  )
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

On Tue, Aug 10, 2021 at 05:42:46PM -0700, Vineet Gupta wrote:
> In the past I've refrained from doing this (atleast 2 times) due to the

                                            ^ at least

> slight code bloat due to ABI implications of pte_t etc becoming sttuct

                                                                 ^ struct
> 
> Per ARC ABI, functions return struct via memory and not through register
> r0, even if the struct would fits in register(s)

                              ^ fit
> 
>  - caller allocates space on stack and passes the address as first arg
>    (r0), shifting rest of args by one
> 
>  - callee creates return struct in memory (referenced via r0)
> 
> This time around the code actually shrunk slightly (due to subtle
> inlining heuristic effects), but still slightly inefficient due to
> return values passed through memory. That however seems like a small

Out of curiosity, is this actually measurable on real world applications?

> cost compared to maintenance burden given the impending new mmu support
> for page walk etc
> 
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/page.h | 26 --------------------------
>  arch/arc/mm/ioremap.c       |  2 +-
>  2 files changed, 1 insertion(+), 27 deletions(-)
> 
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index 4a9d33372fe2..c4ac827379cd 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -34,12 +34,6 @@ void copy_user_highpage(struct page *to, struct page *from,
>  			unsigned long u_vaddr, struct vm_area_struct *vma);
>  void clear_user_page(void *to, unsigned long u_vaddr, struct page *page);
>  
> -#undef STRICT_MM_TYPECHECKS
> -
> -#ifdef STRICT_MM_TYPECHECKS
> -/*
> - * These are used to make use of C type-checking..
> - */
>  typedef struct {
>  #ifdef CONFIG_ARC_HAS_PAE40
>  	unsigned long long pte;
> @@ -64,26 +58,6 @@ typedef struct {
>  
>  #define pte_pgprot(x) __pgprot(pte_val(x))
>  
> -#else /* !STRICT_MM_TYPECHECKS */
> -
> -#ifdef CONFIG_ARC_HAS_PAE40
> -typedef unsigned long long pte_t;
> -#else
> -typedef unsigned long pte_t;
> -#endif
> -typedef unsigned long pgd_t;
> -typedef unsigned long pgprot_t;
> -
> -#define pte_val(x)	(x)
> -#define pgd_val(x)	(x)
> -#define pgprot_val(x)	(x)
> -#define __pte(x)	(x)
> -#define __pgd(x)	(x)
> -#define __pgprot(x)	(x)
> -#define pte_pgprot(x)	(x)
> -
> -#endif
> -
>  typedef pte_t * pgtable_t;
>  
>  /*
> diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
> index 95c649fbc95a..052bbd8b1e5f 100644
> --- a/arch/arc/mm/ioremap.c
> +++ b/arch/arc/mm/ioremap.c
> @@ -39,7 +39,7 @@ void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
>  	if (arc_uncached_addr_space(paddr))
>  		return (void __iomem *)(u32)paddr;
>  
> -	return ioremap_prot(paddr, size, PAGE_KERNEL_NO_CACHE);
> +	return ioremap_prot(paddr, size, pgprot_val(PAGE_KERNEL_NO_CACHE));
>  }
>  EXPORT_SYMBOL(ioremap);
>  
> -- 
> 2.25.1
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
