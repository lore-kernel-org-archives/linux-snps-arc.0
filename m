Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A81C4320A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 12:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C42D160C41
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 12:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C42D160C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQojg6uRHgxipf0KkhkDVM4mTgrIloyrtQZK2UopCwE=; b=ZPDY7pvw34rRI+
	gw6sEiz9CnrB5aflsymo8h/38TSsWTyYg9kIQC1tZIXJqL4IpcrBG3YLgctl7Z0SyZD811EQM3VAF
	rVAPSYakAtv+NHs8KLHYQr9Z5Im95rBfN8Wxd61r9wS07ApVx2vNaDUTgsSZ/WIied+spCRl+xaqi
	3jZEp24BATlXlYv1NUbpJS7Uo7f2P5veSZp+GsWT4BIYIuoV/ZqwWeKmw7SOGx0+UFCrwYoY99/Oc
	PBbxRlNETQAAuhNOu5w+qmHtVw4jn70I9qLFftSkf9qA+g+EhcjBNLFb8dW5tiLGnS+haScx/ArN0
	AJzaQrdnpDXZaJqLZPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDnYq-0078sr-11; Wed, 11 Aug 2021 12:42:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDnOf-0073wf-32
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 12:31:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F5C360FE6;
 Wed, 11 Aug 2021 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628685108;
 bh=tv9C3Cm5qQR3sXiWl3T9jk8eH5uFDMx7/ShOjjjSaDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+a18SdN5uY3z6WkcWr/H3kkXDwgXLnIKPqDeY6igowQRch+OLtbTdTpPFnF4q4lL
 JAW7PQwzFBCaQAGLSPbvCavaFHN404Jhn6OXDnC05WOiT7G/VvTK5t2Sh9qwEcdtGx
 cKKgvcJ9jUI0lBjjM5NY6aN183Hj1QGC5vDDHitskz3Omf+yF1k0XXqbMNcnmrxr+1
 s8d11pHOnmt0m8evPNRz9qV9T4FeAHQHqdhI029WN4241n2DQVb/wT838AF4mTtBAZ
 s6d2q0QRle7HoZ1Lu8wLObCdmZHQvbQcwh8nyvQ/TAkEihwIt9cUM7xe3NqKz/LGrK
 xubSxdH4209pw==
Date: Wed, 11 Aug 2021 15:31:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 09/18] ARC: mm: non-functional code cleanup ahead of 3
 levels
Message-ID: <YRPDL90Qr5RLDmnT@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-10-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811004258.138075-10-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_053149_233142_DA522204 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, Aug 10, 2021 at 05:42:49PM -0700, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/page.h    | 30 ++++++++++++++++--------------
>  arch/arc/include/asm/pgalloc.h |  7 ++++++-
>  2 files changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index c4ac827379cd..313e6f543d2d 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -34,6 +34,13 @@ void copy_user_highpage(struct page *to, struct page *from,
>  			unsigned long u_vaddr, struct vm_area_struct *vma);
>  void clear_user_page(void *to, unsigned long u_vaddr, struct page *page);
>  
> +typedef struct {
> +	unsigned long pgd;
> +} pgd_t;
> +
> +#define pgd_val(x)	((x).pgd)
> +#define __pgd(x)	((pgd_t) { (x) })
> +
>  typedef struct {
>  #ifdef CONFIG_ARC_HAS_PAE40
>  	unsigned long long pte;
> @@ -41,22 +48,17 @@ typedef struct {
>  	unsigned long pte;
>  #endif
>  } pte_t;
> -typedef struct {
> -	unsigned long pgd;
> -} pgd_t;
> +
> +#define pte_val(x)	((x).pte)
> +#define __pte(x)	((pte_t) { (x) })
> +
>  typedef struct {
>  	unsigned long pgprot;
>  } pgprot_t;
>  
> -#define pte_val(x)      ((x).pte)
> -#define pgd_val(x)      ((x).pgd)
> -#define pgprot_val(x)   ((x).pgprot)
> -
> -#define __pte(x)        ((pte_t) { (x) })
> -#define __pgd(x)        ((pgd_t) { (x) })
> -#define __pgprot(x)     ((pgprot_t) { (x) })
> -
> -#define pte_pgprot(x) __pgprot(pte_val(x))
> +#define pgprot_val(x)	((x).pgprot)
> +#define __pgprot(x)	((pgprot_t) { (x) })
> +#define pte_pgprot(x)	__pgprot(pte_val(x))
>  
>  typedef pte_t * pgtable_t;
>  
> @@ -96,8 +98,8 @@ extern int pfn_valid(unsigned long pfn);
>   * virt here means link-address/program-address as embedded in object code.
>   * And for ARC, link-addr = physical address
>   */
> -#define __pa(vaddr)  ((unsigned long)(vaddr))
> -#define __va(paddr)  ((void *)((unsigned long)(paddr)))
> +#define __pa(vaddr)  		((unsigned long)(vaddr))
> +#define __va(paddr)  		((void *)((unsigned long)(paddr)))
>  
>  #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
>  #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
> diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
> index 356237b9c537..0cf73431eb89 100644
> --- a/arch/arc/include/asm/pgalloc.h
> +++ b/arch/arc/include/asm/pgalloc.h
> @@ -29,6 +29,11 @@
>  #ifndef _ASM_ARC_PGALLOC_H
>  #define _ASM_ARC_PGALLOC_H
>  
> +/*
> + * For ARC, pgtable_t is not struct page *, but pte_t * (to avoid
> + * extraneous page_address() calculations) hence can't use
> + * use asm-generic/pgalloc.h which assumes it being struct page *
> + */

Another reason to leave ARC without asm-generic/pgalloc.h was
__get_order_pte() that other arches don't have.
So this and pgtable_t aliased to pte_t * seemed to me too much to bother
then, but probably it's worth reconsidering with addition of 3rd and 4th
levels.

>  #include <linux/mm.h>
>  #include <linux/log2.h>
>  
> @@ -36,7 +41,7 @@ static inline void
>  pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
>  {
>  	/*
> -	 * The cast to long below is OK even when pte is long long (PAE40)
> +	 * The cast to long below is OK in 32-bit PAE40 regime with long long pte
>  	 * Despite "wider" pte, the pte table needs to be in non-PAE low memory
>  	 * as all higher levels can only hold long pointers.
>  	 *
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
