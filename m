Return-Path: <SRS0=vffI=NG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BFCC4320A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:28:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0CE61056
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A0CE61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n36scJhE8+5J9qlrfqmTaouEvjPI+q9u29whoXxO3XU=; b=JoJ0kSm3RkdNiD
	ZYzyBswB+70H3J6b6XlnAkopyn8CDTDT4C/vnroy58avIw7S308dybDCS2sN4sC4uCC9Zs9r8sc5Y
	N54U+vZKehcgwWxsPBFZY/mO9gvBk89cnpJM2u0BvldzpcNZaPKIB0oM04uLV2wE6GeEZ2loAt/Zx
	b2R5OwwtuoTqiA6B64Gp3DX/oZJsTqE4iTyKhgV0KsdBD2U7Mg1fmxcRwIxW8CKeAkNGaSReDcKkE
	ZvvVoEXyUWJ+47Sy3F414KF77UlHGjS0xz4IpldgVZtyLWZgggctwacDlpVAqqAgfvMi8VPUHf89b
	bZUHlECQMn0E2OcTQVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFCR2-00F5Mp-UQ; Sun, 15 Aug 2021 09:28:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFCR0-00F5Lf-Bl
 for linux-snps-arc@lists.infradead.org; Sun, 15 Aug 2021 09:28:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51B4D6103A;
 Sun, 15 Aug 2021 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629019682;
 bh=bWCuMi2hzwoR5TfaM4I5wjW1zTT6C2sePe/iQynDiGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmMYihRVX4d0Giz/Syta0Qklt5WNIM1KtRwt2i82BUCvALd/ON/Yeh5jfWuZcAXvl
 nagawa00bFpXiWCliOWuDuHWpYENqORSFoZUi1o0X2Fpt1KPyb905hesGPDOcvHFhF
 5wtgFbaqg8NVGvcq+lsWGqpu8gtlo0Ak7LjvZ1Q4sTLrnjp8L8eqSIEfXFTyVfcSFJ
 8+gTaKLNXvf/KL/5U1+XpoSbbDdUHviMEfjHV4G75aXs8yC1WF3/AFpmRAlJFtufTQ
 3EU73i5SV/KSIeP4mwzUCt1wUsqTVOnd7Q0C4f4OS1dueJp2EllLUCFI6T1LN7l/Xj
 GuCqut9eMtJtA==
Date: Sun, 15 Aug 2021 12:27:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 16/19] ARC: mm: support 3 levels of page tables
Message-ID: <YRjeHE19KXqYWgRp@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
 <20210812233753.104217-17-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812233753.104217-17-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_022802_460313_B4EA8364 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, Aug 12, 2021 at 04:37:50PM -0700, Vineet Gupta wrote:
> ARCv2 MMU is software walked and Linux implements 2 levels of paging: pgd/pte.
> Forthcoming hw will have multiple levels, so this change preps mm code
> for same. It is also fun to try multi levels even on soft-walked code to
> ensure generic mm code is robust to handle.
> 
> overview
> ________
> 
> 2 levels {pgd, pte} : pmd is folded but pmd_* macros are valid and operate on pgd
> 3 levels {pgd, pmd, pte}:
>   - pud is folded and pud_* macros point to pgd
>   - pmd_* macros operate on actual pmd
> 
> code changes
> ____________
> 
> 1. #include <asm-generic/pgtable-nopud.h>
> 
> 2. Define CONFIG_PGTABLE_LEVELS 3
> 
> 3a. Define PMD_SHIFT, PMD_SIZE, PMD_MASK, pmd_t
> 3b. Define pmd_val() which actually deals with pmd
>     (pmd_offset(), pmd_index() are provided by generic code)
> 3c. pmd_alloc_one()/pmd_free() also provided by generic code
>     (pmd_populate/pmd_free already exist)
> 
> 4. Define pud_none(), pud_bad() macros based on generic pud_val() which
>    internally pertains to pgd now.
> 4b. define pud_populate() to just setup pgd
> 
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---

...

> diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
> index 8ece75335bb5..1c2f022d4ad0 100644
> --- a/arch/arc/include/asm/pgtable-levels.h
> +++ b/arch/arc/include/asm/pgtable-levels.h
> @@ -10,6 +10,8 @@
>  #ifndef _ASM_ARC_PGTABLE_LEVELS_H
>  #define _ASM_ARC_PGTABLE_LEVELS_H
>  
> +#if CONFIG_PGTABLE_LEVELS == 2
> +
>  /*
>   * 2 level paging setup for software walked MMUv3 (ARC700) and MMUv4 (HS)
>   *
> @@ -37,16 +39,38 @@
>  #define PGDIR_SHIFT		21
>  #endif
>  
> -#define PGDIR_SIZE		BIT(PGDIR_SHIFT)	/* vaddr span, not PDG sz */
> -#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
> +#else

Adding /* CONFIG_PGTABLE_LEVELS == 2 */ would make the whole thing a bit
more readable, I think.

> +
> +/*
> + * A default 3 level paging testing setup in software walked MMU
> + *   MMUv4 (8K page): <4> : <7> : <8> : <13>
> + */
> +#define PGDIR_SHIFT		28
> +#if CONFIG_PGTABLE_LEVELS > 2
> +#define PMD_SHIFT		21
> +#endif
> +
> +#endif

and here as well.
  
> +#define PGDIR_SIZE		BIT(PGDIR_SHIFT)
> +#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
>  #define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
>  
> -#define PTRS_PER_PTE		BIT(PGDIR_SHIFT - PAGE_SHIFT)
> +#if CONFIG_PGTABLE_LEVELS > 2
> +#define PMD_SIZE		BIT(PMD_SHIFT)
> +#define PMD_MASK		(~(PMD_SIZE - 1))
> +#define PTRS_PER_PMD		BIT(PGDIR_SHIFT - PMD_SHIFT)
> +#endif
> +
> +#define PTRS_PER_PTE		BIT(PMD_SHIFT - PAGE_SHIFT)
>  

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
