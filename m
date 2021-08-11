Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F24BC432BE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 22:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EDD560462
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 22:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EDD560462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IObIksQ1TiGHZBbO5/a7fc+IJw0gJqmIjTmEYhlr1VQ=; b=TKL64IgKdHFuSJYhk6W7G6ZTF5
	Nxv0WYTUyqglhfMIes+ZHxlBkmoDZlnWACv2L085waEDTts6DU7Flv+bq6qWM875uqZ2vDNQhvGUW
	Rc2kHylEM5l8OGwJFPUwwCBOyZksVrv9dFL6T90Ko0h5vaaf0A9QB/dZcDVsciHEEJ/O1hw+HKS8u
	AG6O5rh8/aS77cs0v+37AQ1RuF2OKrj+SVPPhBwY8p3DoM2PllhCCedZQIptgR2fwDGuktxO5D6Nc
	WyMXnEklFdAnebr1qZ+oi/9nlFwDBJSIdAou5/lKM0IfzpX6yrfIPnMgHdQwIcqFkUsHLZJt98+Mg
	uyMO8VHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDwVd-008DgW-JD; Wed, 11 Aug 2021 22:15:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDwVa-008DfQ-G2
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 22:15:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9856A60462;
 Wed, 11 Aug 2021 22:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628720134;
 bh=PA2v/bxyiDdtoBYeKQY7SGsBHybDekFx7rqqJ52I8qg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Sy9IJOOy6ccdw3ccS614BwU/RljW9LaFHzEbg6qqXw+lYBzS6ft0QmQie4XeyhXWH
 ECTE8Y24mYVpTMeG7bb4BT8ixIZ9G4E3tp8Pk7IAnlx/+3xAOjJd7SVSU2KKUCT124
 PMgcWX1f7ZJbK2Gop86RmFwKNKOpjcVOjlkDhgy3LTW/dohrRcjMTsbGdaD9rNbPSa
 hFf/jrx2LGrKWvu2HZSLb7QNU/h+mPWET2VDJbEJ7x4Rj3uBxMYEa9obs5nxee5HlP
 35klOM+Rz7tTh/02Hd/6hhsN3kP7XzYcfwNLBRkHiwQvLs1RZGtoMWKxFKAIj7zaCi
 uU4cgkkmFtczA==
Subject: Re: [PATCH 15/18] ARC: mm: support 3 levels of page tables
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-16-vgupta@kernel.org> <YRPBhJyYM/L5XWb/@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <0d3aa903-9e4d-fdef-82f8-23b53602c6ea@kernel.org>
Date: Wed, 11 Aug 2021 15:15:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRPBhJyYM/L5XWb/@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_151534_624930_0855AEF5 
X-CRM114-Status: GOOD (  21.07  )
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

On 8/11/21 5:24 AM, Mike Rapoport wrote:
> On Tue, Aug 10, 2021 at 05:42:55PM -0700, Vineet Gupta wrote:
>> ARCv2 MMU is software walked and Linux implements 2 levels of paging: pgd/pte.
>> Forthcoming hw will have multiple levels, so this change preps mm code
>> for same. It is also fun to try multi levels even on soft-walked code to
>> ensure generic mm code is robust to handle.
>>
>> overview
>> ________
>>
>> 2 levels {pgd, pte} : pmd is folded but pmd_* macros are valid and operate on pgd
>> 3 levels {pgd, pmd, pte}:
>>    - pud is folded and pud_* macros point to pgd
>>    - pmd_* macros operate on actual pmd
>>
>> code changes
>> ____________
>>
>> 1. #include <asm-generic/pgtable-nopud.h>
>>
>> 2. Define CONFIG_PGTABLE_LEVELS 3
>>
>> 3a. Define PMD_SHIFT, PMD_SIZE, PMD_MASK, pmd_t
>> 3b. Define pmd_val() which actually deals with pmd
>>      (pmd_offset(), pmd_index() are provided by generic code)
>> 3c. Define pmd_alloc_one() and pmd_free() to allocate pmd
>>      (pmd_populate/pmd_free already exist)
>>
>> 4. Define pud_none(), pud_bad() macros based on generic pud_val() which
>>     internally pertains to pgd now.
>> 4b. define pud_populate() to just setup pgd
>>
>> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
>> ---
>>   arch/arc/Kconfig                      |  4 ++
>>   arch/arc/include/asm/page.h           | 11 +++++
>>   arch/arc/include/asm/pgalloc.h        | 22 ++++++++++
>>   arch/arc/include/asm/pgtable-levels.h | 63 ++++++++++++++++++++++++---
>>   arch/arc/include/asm/processor.h      |  2 +-
>>   arch/arc/mm/fault.c                   |  4 ++
>>   arch/arc/mm/tlb.c                     |  4 +-
>>   arch/arc/mm/tlbex.S                   |  9 ++++
>>   8 files changed, 111 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
>> index 59d5b2a179f6..43cb8aaf57a2 100644
>> --- a/arch/arc/Kconfig
>> +++ b/arch/arc/Kconfig
>> @@ -314,6 +314,10 @@ config ARC_HUGEPAGE_16M
>>   
>>   endchoice
>>   
>> +config PGTABLE_LEVELS
>> +	int "Number of Page table levels"
>> +	default 2
>> +
>>   config ARC_COMPACT_IRQ_LEVELS
>>   	depends on ISA_ARCOMPACT
>>   	bool "Setup Timer IRQ as high Priority"
>> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
>> index 313e6f543d2d..df3cc154ae4a 100644
>> --- a/arch/arc/include/asm/page.h
>> +++ b/arch/arc/include/asm/page.h
>> @@ -41,6 +41,17 @@ typedef struct {
>>   #define pgd_val(x)	((x).pgd)
>>   #define __pgd(x)	((pgd_t) { (x) })
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 2
>> +
>> +typedef struct {
>> +	unsigned long pmd;
>> +} pmd_t;
>> +
>> +#define pmd_val(x)	((x).pmd)
>> +#define __pmd(x)	((pmd_t) { (x) })
>> +
>> +#endif
>> +
>>   typedef struct {
>>   #ifdef CONFIG_ARC_HAS_PAE40
>>   	unsigned long long pte;
>> diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
>> index 0cf73431eb89..01c2d84418ed 100644
>> --- a/arch/arc/include/asm/pgalloc.h
>> +++ b/arch/arc/include/asm/pgalloc.h
>> @@ -86,6 +86,28 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>>   }
>>   
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 2
>> +
>> +static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>> +{
>> +	set_pud(pudp, __pud((unsigned long)pmdp));
>> +}
>> +
>> +static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long addr)
>> +{
>> +	return (pmd_t *)__get_free_page(
>> +		GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO);
>> +}
>> +
>> +static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>> +{
>> +	free_page((unsigned long)pmd);
>> +}
>> +
>> +#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
>> +
>> +#endif
>> +
>>   /*
>>    * With software-only page-tables, addr-split for traversal is tweakable and
>>    * that directly governs how big tables would be at each level.
>> diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
>> index 8ece75335bb5..1c2f022d4ad0 100644
>> --- a/arch/arc/include/asm/pgtable-levels.h
>> +++ b/arch/arc/include/asm/pgtable-levels.h
>> @@ -10,6 +10,8 @@
>>   #ifndef _ASM_ARC_PGTABLE_LEVELS_H
>>   #define _ASM_ARC_PGTABLE_LEVELS_H
>>   
>> +#if CONFIG_PGTABLE_LEVELS == 2
>> +
>>   /*
>>    * 2 level paging setup for software walked MMUv3 (ARC700) and MMUv4 (HS)
>>    *
>> @@ -37,16 +39,38 @@
>>   #define PGDIR_SHIFT		21
>>   #endif
>>   
>> -#define PGDIR_SIZE		BIT(PGDIR_SHIFT)	/* vaddr span, not PDG sz */
>> -#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
>> +#else
>> +
>> +/*
>> + * A default 3 level paging testing setup in software walked MMU
>> + *   MMUv4 (8K page): <4> : <7> : <8> : <13>
>> + */
>> +#define PGDIR_SHIFT		28
>> +#if CONFIG_PGTABLE_LEVELS > 2
>> +#define PMD_SHIFT		21
>> +#endif
>> +
>> +#endif
>>   
>> +#define PGDIR_SIZE		BIT(PGDIR_SHIFT)
>> +#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
>>   #define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
>>   
>> -#define PTRS_PER_PTE		BIT(PGDIR_SHIFT - PAGE_SHIFT)
>> +#if CONFIG_PGTABLE_LEVELS > 2
>> +#define PMD_SIZE		BIT(PMD_SHIFT)
>> +#define PMD_MASK		(~(PMD_SIZE - 1))
>> +#define PTRS_PER_PMD		BIT(PGDIR_SHIFT - PMD_SHIFT)
> Maybe move these into the previous #if CONFIG_PGTABLE_LEVELS > 2?

I've kept them separate to distinguish the "configuration" parts which 
can be changed (for ARCv2 where this is not hardware enforced) from the 
pieces which remain the same. So PMD_SHIFT can be changed for a quick 
hack say but the PMD_{SIZE,MASK} etc are invariants.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
