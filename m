Return-Path: <SRS0=vffI=NG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71446C432BE
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:27:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3951E6103A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3951E6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOHw5P0y8QrjqJbDtpVFL081acZFzuT8HspC/BRUNbw=; b=jU5z3pQY/vPBEk
	/kMr+3hcsVFdT6QmEf+3jNM4MIb7D5HVn45No9MKWztWwxdgK7HIKOSWm0rysHmNdlq7Cj/O1RJQ6
	tz2ztm5HYEEs43HV2/6/Bf9TCgGzkQ4wc7nz3DtJGCoLNPuNJHqfMDUHSAKcAqukiSPZ8f3HiSHtj
	yKnWYuBdNM5SUXOvC1LieuUZI1E+KXaN38X77/dXtAn8NQj1WYTFzW5/BvinomeH9mWff5srMC0bg
	WWzmJOH8fARExAlosYXUMYJ/ciAN70BX1MWyeFu54GmCm91cl1AMxGab1Us9sJrswpKoYnU6EA3WW
	SfsXVoeT6dBbaUXxOB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFCQ9-00F5DA-PK; Sun, 15 Aug 2021 09:27:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFCQ6-00F5CW-Tf
 for linux-snps-arc@lists.infradead.org; Sun, 15 Aug 2021 09:27:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8469161042;
 Sun, 15 Aug 2021 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629019626;
 bh=r1D67HgLgbffAVLMOhnCYlyllUe2NEI5jawqVEGJNyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GzywK3lbpMy4MXcIYQ9ebCzxg+P/vxyk40cYQnBp1WsuZafS3lG45un46YvOt1KF6
 8dPWnhw5tovFCW73CUoWbow10w7WQAZz6BLgObPgO7IiioGYCHmEJjAgrgVUEHTVL+
 kW6iByVlxyREqAPS0sbmevYLfuufm6klQSw9w4TQuGaL0J7Mpi5WJRxgraa8CUCsXO
 l8kL9CXZKWA+OC4HJwqoLvsyrv0De1PHoYWYjZ7lYw8jsGBEEPG1kdbPkiHqvutw9X
 g/nD3Xw/+mXM/4dVX1amMXM7fijO1+GDZACKiJ7gk6XaWMHkLOEXGcExUd24q3nlJV
 1VKNJWi3mdOyg==
Date: Sun, 15 Aug 2021 12:27:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 01/19] ARC: mm: use SCRATCH_DATA0 register for caching
 pgdir in ARCv2 only
Message-ID: <YRjd5N012YInbZqX@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
 <20210812233753.104217-2-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812233753.104217-2-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_022707_034344_04491B83 
X-CRM114-Status: GOOD (  24.73  )
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

On Thu, Aug 12, 2021 at 04:37:35PM -0700, Vineet Gupta wrote:
> MMU SCRATCH_DATA0 register is intended to cache task pgd. However in
> ARC700 SMP port, it has to be repurposed for reentrant interrupt
> handling, while UP port doesn't. We  currently ahandle boe usecases

					       ^ handle both

maybe ':set spell' for changelog editing? ;-)

> using a fabricated which has usual issues of dependency nesting and
> ugliness.
> 
> So clean this up: for ARC700 don't use to cache pgd (even in UP) and do
> the opposite for ARCv2.
> 
> And while here, switch to canonical pgd_offset().
> 
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/entry-compact.h |  8 --------
>  arch/arc/include/asm/mmu.h           |  4 ----
>  arch/arc/include/asm/mmu_context.h   |  2 +-
>  arch/arc/include/asm/pgtable.h       | 23 -----------------------
>  arch/arc/mm/fault.c                  |  2 +-
>  arch/arc/mm/tlb.c                    |  4 ++--
>  arch/arc/mm/tlbex.S                  |  2 +-
>  7 files changed, 5 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
> index 6dbf5cecc8cc..5aab4f93ab8a 100644
> --- a/arch/arc/include/asm/entry-compact.h
> +++ b/arch/arc/include/asm/entry-compact.h
> @@ -126,19 +126,11 @@
>   * to be saved again on kernel mode stack, as part of pt_regs.
>   *-------------------------------------------------------------*/
>  .macro PROLOG_FREEUP_REG	reg, mem
> -#ifndef ARC_USE_SCRATCH_REG
> -	sr  \reg, [ARC_REG_SCRATCH_DATA0]
> -#else
>  	st  \reg, [\mem]
> -#endif
>  .endm
>  
>  .macro PROLOG_RESTORE_REG	reg, mem
> -#ifndef ARC_USE_SCRATCH_REG
> -	lr  \reg, [ARC_REG_SCRATCH_DATA0]
> -#else
>  	ld  \reg, [\mem]
> -#endif
>  .endm
>  
>  /*--------------------------------------------------------------
> diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
> index a81d1975866a..4065335a7922 100644
> --- a/arch/arc/include/asm/mmu.h
> +++ b/arch/arc/include/asm/mmu.h
> @@ -31,10 +31,6 @@
>  #define ARC_REG_SCRATCH_DATA0	0x46c
>  #endif
>  
> -#if defined(CONFIG_ISA_ARCV2) || !defined(CONFIG_SMP)
> -#define	ARC_USE_SCRATCH_REG
> -#endif
> -
>  /* Bits in MMU PID register */
>  #define __TLB_ENABLE		(1 << 31)
>  #define __PROG_ENABLE		(1 << 30)
> diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
> index df164066e172..49318a126879 100644
> --- a/arch/arc/include/asm/mmu_context.h
> +++ b/arch/arc/include/asm/mmu_context.h
> @@ -146,7 +146,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	 */
>  	cpumask_set_cpu(cpu, mm_cpumask(next));
>  
> -#ifdef ARC_USE_SCRATCH_REG
> +#ifdef CONFIG_ISA_ARCV2
>  	/* PGD cached in MMU reg to avoid 3 mem lookups: task->mm->pgd */
>  	write_aux_reg(ARC_REG_SCRATCH_DATA0, next->pgd);
>  #endif
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
> diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
> index 8696829d37c0..349fb7a75d1d 100644
> --- a/arch/arc/mm/tlb.c
> +++ b/arch/arc/mm/tlb.c
> @@ -719,8 +719,8 @@ void arc_mmu_init(void)
>  	/* Enable the MMU */
>  	write_aux_reg(ARC_REG_PID, MMU_ENABLE);
>  
> -	/* In smp we use this reg for interrupt 1 scratch */
> -#ifdef ARC_USE_SCRATCH_REG
> +	/* In arc700/smp needed for re-entrant interrupt handling */
> +#ifdef CONFIG_ISA_ARCV2
>  	/* swapper_pg_dir is the pgd for the kernel, used by vmalloc */
>  	write_aux_reg(ARC_REG_SCRATCH_DATA0, swapper_pg_dir);
>  #endif
> diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
> index 96c3a5de9dd4..bcd2909c691f 100644
> --- a/arch/arc/mm/tlbex.S
> +++ b/arch/arc/mm/tlbex.S
> @@ -202,7 +202,7 @@ ex_saved_reg1:
>  
>  	lr  r2, [efa]
>  
> -#ifdef ARC_USE_SCRATCH_REG
> +#ifdef CONFIG_ISA_ARCV2
>  	lr  r1, [ARC_REG_SCRATCH_DATA0] ; current pgd
>  #else
>  	GET_CURR_TASK_ON_CPU  r1
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
