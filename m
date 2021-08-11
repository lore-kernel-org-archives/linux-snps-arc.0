Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3182FC4320A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 05:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E60F160F13
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 05:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E60F160F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkgsiUZSPqifFXFs+sRNiEF8exk+80aOrb11jL3sL+s=; b=3jm3aeYImfVVAh
	R5tuZ9wN4ShDw2/fC1ygykWnvXFN3okAuETU6R2E4iHoukIop32MmmbgM3BZS9wHqIyiyYFZpVKye
	OhYOMCX15/8sYvT1mU8JQt1/MPykCjmWpczZOVcuh6QssIyDIEKMXR+nOLWHwfjqxmOLOm0h0yEpn
	Vt40Ckb3BzTZTP1NJ81uJ6nwXiuWcO+n0vRihb2rMSR/aSf9U+bJhVdnrx6qtWIUlmXwuP275xcal
	ix6p/gFB1D8FFC8XXgYTKNt4AMp2Bc2+Xlr6u8fk/gAF6hIoo6pEHfZjKSG5D1SZfnYreZBscEx//
	lNbLHLvZvjKvdB46dqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDgXG-005bhX-Cf; Wed, 11 Aug 2021 05:12:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDgXE-005bgx-DY
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 05:12:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75B2D60EB2;
 Wed, 11 Aug 2021 05:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628658732;
 bh=Z7LmDfo4zvKNkhohC0InW+SMDP5rAOUz38E0mqDCwHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=If2GrYZCsWAgUZn4dzhz/2LCPJSsKIUbL6y295qindWqzCnB0YyfeR+v2laCFsBzm
 apcx3Y2yNDWkVUFMLBXlJJMbmrS0WMxn4rqNf2uPrLf0XiIa4t8IaS56iSo7REHPZI
 hiDmPVgoxfTwcSUAdHuG/G2yBJU39eeBbsBcXNQpAsjjWWTpafVDyPXg4YVApk9Iz/
 VRaZZ0dcAFvLuDTrYUFXaujZN7Mq9jufIKrodyvysk9DtREFIr6hO2G2Ku3vP7GpPZ
 8/EAcjdYYoq6D5Jlqbn/eUrzaYTWCUc1WR3rbA3fGypWwPA+Y++GbWXLDHlL+7c5id
 CT1YfSwQyzDYQ==
Date: Wed, 11 Aug 2021 08:12:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 04/18] ARC: mm: remove pgd_offset_fast
Message-ID: <YRNcJpyr76h5EK0k@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-5-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811004258.138075-5-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_221212_523017_59697C4E 
X-CRM114-Status: GOOD (  15.61  )
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

On Tue, Aug 10, 2021 at 05:42:44PM -0700, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/pgtable.h | 23 -----------------------
>  arch/arc/mm/fault.c            |  2 +-
>  2 files changed, 1 insertion(+), 24 deletions(-)

Shouldn't this be a part of the patch that removed usage of the scratch reg
for pgd?
 
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 0c3e220bd2b4..80b57c14b430 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -284,29 +284,6 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>  	set_pte(ptep, pteval);
>  }
>  
> -/*
> - * Macro to quickly access the PGD entry, utlising the fact that some
> - * arch may cache the pointer to Page Directory of "current" task
> - * in a MMU register
> - *
> - * Thus task->mm->pgd (3 pointer dereferences, cache misses etc simply
> - * becomes read a register
> - *
> - * ********CAUTION*******:
> - * Kernel code might be dealing with some mm_struct of NON "current"
> - * Thus use this macro only when you are certain that "current" is current
> - * e.g. when dealing with signal frame setup code etc
> - */
> -#ifdef ARC_USE_SCRATCH_REG
> -#define pgd_offset_fast(mm, addr)	\
> -({					\
> -	pgd_t *pgd_base = (pgd_t *) read_aux_reg(ARC_REG_SCRATCH_DATA0);  \
> -	pgd_base + pgd_index(addr);	\
> -})
> -#else
> -#define pgd_offset_fast(mm, addr)	pgd_offset(mm, addr)
> -#endif
> -
>  extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
>  void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
>  		      pte_t *ptep);
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index f5657cb68e4f..41f154320964 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -33,7 +33,7 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
>  	pud_t *pud, *pud_k;
>  	pmd_t *pmd, *pmd_k;
>  
> -	pgd = pgd_offset_fast(current->active_mm, address);
> +	pgd = pgd_offset(current->active_mm, address);
>  	pgd_k = pgd_offset_k(address);
>  
>  	if (!pgd_present(*pgd_k))
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
