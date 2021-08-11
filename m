Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1107CC432BE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 05:18:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C529F60560
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 05:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C529F60560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwybDTdoKeIqKyl9j4nsijVyMhJp4j+Qzy0XS+TYYYg=; b=hyNBzuX0QE9Fxh
	+NLSFDd9KSSa0ojO+qdKLSn39d20qXooNuixoROVlYQjv9MI8/miqwETUtoujOzuUygN/BQDHy2Ft
	++jsYsjTIs8LeY5tiEvApj/YntpTmfQeeiEi8kdXKegu5xFHBz5fTv4wxIA18hnHiqK99Ms9ldZWS
	CWccdjl1F1ryHBqchBU+igZKIQtfsDOVdVdui7svHViO6JzEShaGtBTVYWDIUBKISPB2NKvTjNvy5
	N8Mo6Vg73gludocjG1elN+WflWKqSgYsa1lxiTDYE0jh0gW+rrJU2JR51OsISB3A0Vi6cRYEtBiRw
	UpoKtsRXPtA0VUanzYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDgcy-005cHD-8V; Wed, 11 Aug 2021 05:18:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDgcv-005cGb-Jl
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 05:18:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEDD660560;
 Wed, 11 Aug 2021 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628659085;
 bh=KaZ5HktjKJgg/abvCF/afCgcYiL4DoXNFGs6S6USjuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iaUw+W5tJLNTIO8XlWFxDhu1sfkl05slqvSv8mec9a6kDYbqIxMRtBZwvk7/a/grn
 MlBkLZBLE1WPjD7gbuz3cvbM0txRFgMvcygTxYNL2OOYxqR27yTL7oW2bJiQ9EIxWp
 Pqpw0krpzymCUfgEA5aPioD/ZznEIMVfNSQ5W/N8t5yHArPjTNP3WMKz7IMUDzlEvW
 42towC/cT4ZDZFZGkeagFNla2KHp5DBcTN7941p1rDtPy/jnI42nkS7IfJ6XYFWJKh
 f3y2RSp3mQYoS1lXUko2AG7CKkHkSHsC2Rkjq8z0+nn7qS4fe70GVez80HzAwxytQc
 vGWMxstpln/lA==
Date: Wed, 11 Aug 2021 08:18:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 07/18] ARC: ioremap: use more commonly used PAGE_KERNEL
 based uncached flag
Message-ID: <YRNdiDnMjQ2hKzIV@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-8-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811004258.138075-8-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_221805_713645_CF5A8ECC 
X-CRM114-Status: GOOD (  14.61  )
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

On Tue, Aug 10, 2021 at 05:42:47PM -0700, Vineet Gupta wrote:
> and remove the one off uncached definition for ARC
> 
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/pgtable.h | 3 ---
>  arch/arc/mm/ioremap.c          | 3 ++-
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 80b57c14b430..b054c14f8bf6 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -103,9 +103,6 @@
>   */
>  #define PAGE_KERNEL          __pgprot(_K_PAGE_PERMS | _PAGE_CACHEABLE)
>  
> -/* ioremap */
> -#define PAGE_KERNEL_NO_CACHE __pgprot(_K_PAGE_PERMS)
> -
>  /* Masks for actual TLB "PD"s */
>  #define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
>  #define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
> diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
> index 052bbd8b1e5f..0ee75aca6e10 100644
> --- a/arch/arc/mm/ioremap.c
> +++ b/arch/arc/mm/ioremap.c
> @@ -39,7 +39,8 @@ void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
>  	if (arc_uncached_addr_space(paddr))
>  		return (void __iomem *)(u32)paddr;
>  
> -	return ioremap_prot(paddr, size, pgprot_val(PAGE_KERNEL_NO_CACHE));
> +	return ioremap_prot(paddr, size,
> +			    pgprot_val(pgprot_noncached(PAGE_KERNEL)));

But this becomes _PAGE_CACHEABLE now. What did I miss?

>  }
>  EXPORT_SYMBOL(ioremap);
>  
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
