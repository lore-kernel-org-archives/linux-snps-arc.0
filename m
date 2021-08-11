Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D2FC4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 22:17:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7719B60462
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 22:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7719B60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rxc+C5a2B7FO9EeFGHmiflUdfhDfOcDlG2KhC4NSTt8=; b=QirhTPqHCHg8qBM2yzjdYonuco
	MDTaVEqwkjD4MUE8r/wTYYn5ruYMIcvi/ynvuGdeeGAbRrtFkpdK1ppdVFKUw3ma1+/Lg6UZrbe0k
	2SawQfXhrECrcTV8f7WkDJK1xyub5LbwG6zjYBwJaM8QaqkuHD77+RYq1L6RTNTckCRo7/SgNsdsB
	SQy58zPkTZ6lWH55x/WraWDXBBX0dWiJgmHq36OdcL1w1heGBDFGCNvvFKeNzunKtH3POhXpLO62C
	/wcYnEgN29/WxPz1nOHifgykMcazGwxWj4A6NWDMY8MUCb812rWAWMyUb+XNkVFxkazfrOlAuimQ8
	Dty7hHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDwX4-008Du8-TX; Wed, 11 Aug 2021 22:17:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDwX0-008Dsb-QP
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 22:17:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F74860F46;
 Wed, 11 Aug 2021 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628720222;
 bh=UaYfoPDE2WuCGV0z84ZII/H6BosPDprnkParVyRKNRo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ICE6+tLuUCglGwJP+j1DNUB5gMzg4siP5Y+84MQaKMxptMxe1YoBY/8HkJqmjKfYz
 tn6PoTnY+KA0Bn6IGAQd/7YTBYYS//aWG8qu4n+0EMKu5qvtSBIiP8zHHCXvADGBID
 41SHsAkKziUkvAmGxrgemcOF3WPZ3/F8fmqxuDJxoJ+sM0JTIa7QF/gNL4YDrw6aNO
 2wljBj9dlmk9Yn1kqX+FrtKUZazwH+8WK0Db3IhhhJzm+A0WOzQKFoM27kbjqge4zw
 cY5c4gkCZCIVzbX9/JaTlD637FjHd1gpykcGp01oqcE3qcx2Ju0cvr3pMWipuAYrxM
 MSwHGg+uiwkOw==
Subject: Re: [PATCH 16/18] ARC: mm: support 4 levels of page tables
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-17-vgupta@kernel.org> <YRPCaxDC5f8N9jHW@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <cfe75b58-0783-5997-c05f-3c7db88508f8@kernel.org>
Date: Wed, 11 Aug 2021 15:17:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRPCaxDC5f8N9jHW@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_151704_570991_A44B4C26 
X-CRM114-Status: GOOD (  15.49  )
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

On 8/11/21 5:28 AM, Mike Rapoport wrote:
> On Tue, Aug 10, 2021 at 05:42:56PM -0700, Vineet Gupta wrote:
>> Signed-off-by: Vineet Gupta<vgupta@kernel.org>
>> ---
>>   arch/arc/include/asm/page.h           | 11 +++++++
>>   arch/arc/include/asm/pgalloc.h        | 22 +++++++++++++
>>   arch/arc/include/asm/pgtable-levels.h | 45 ++++++++++++++++++++++++---
>>   arch/arc/mm/fault.c                   |  2 ++
>>   arch/arc/mm/tlbex.S                   |  9 ++++++
>>   5 files changed, 84 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
>> index df3cc154ae4a..883856f12afe 100644
>> --- a/arch/arc/include/asm/page.h
>> +++ b/arch/arc/include/asm/page.h
>> @@ -41,6 +41,17 @@ typedef struct {
>>   #define pgd_val(x)	((x).pgd)
>>   #define __pgd(x)	((pgd_t) { (x) })
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 3
>> +
>> +typedef struct {
>> +	unsigned long pud;
>> +} pud_t;
>> +
>> +#define pud_val(x)      	((x).pud)
>> +#define __pud(x)        	((pud_t) { (x) })
>> +
>> +#endif
>> +
>>   #if CONFIG_PGTABLE_LEVELS > 2
>>   
>>   typedef struct {
>> diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
>> index 01c2d84418ed..e99c724d9235 100644
>> --- a/arch/arc/include/asm/pgalloc.h
>> +++ b/arch/arc/include/asm/pgalloc.h
>> @@ -86,6 +86,28 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>>   }
>>   
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 3
>> +
>> +static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
>> +{
>> +	set_p4d(p4dp, __p4d((unsigned long)pudp));
>> +}
>> +
>> +static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
>> +{
>> +	return (pud_t *)__get_free_page(
>> +		GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO);
>> +}
>> +
>> +static inline void pud_free(struct mm_struct *mm, pud_t *pudp)
>> +{
>> +	free_page((unsigned long)pudp);
>> +}
>> +
>> +#define __pud_free_tlb(tlb, pmd, addr)  pud_free((tlb)->mm, pmd)
>> +
>> +#endif
>> +
>>   #if CONFIG_PGTABLE_LEVELS > 2
>>   
>>   static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>> diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
>> index 1c2f022d4ad0..2da3c4e52a91 100644
>> --- a/arch/arc/include/asm/pgtable-levels.h
>> +++ b/arch/arc/include/asm/pgtable-levels.h
>> @@ -44,8 +44,13 @@
>>   /*
>>    * A default 3 level paging testing setup in software walked MMU
>>    *   MMUv4 (8K page): <4> : <7> : <8> : <13>
>> + * A default 4 level paging testing setup in software walked MMU
>> + *   MMUv4 (8K page): <4> : <3> : <4> : <8> : <13>
>>    */
>>   #define PGDIR_SHIFT		28
>> +#if CONFIG_PGTABLE_LEVELS > 3
>> +#define PUD_SHIFT		25
>> +#endif
>>   #if CONFIG_PGTABLE_LEVELS > 2
>>   #define PMD_SHIFT		21
>>   #endif
>> @@ -56,17 +61,25 @@
>>   #define PGDIR_MASK		(~(PGDIR_SIZE - 1))
>>   #define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 3
>> +#define PUD_SIZE		BIT(PUD_SHIFT)
>> +#define PUD_MASK		(~(PUD_SIZE - 1))
>> +#define PTRS_PER_PUD		BIT(PGDIR_SHIFT - PUD_SHIFT)
> Maybe move these into the previous #if CONFIG_PGTABLE_LEVELS > 3?

Same reasoning as the prev one. Sure there's a bit more ifdef'ery but I 
think it looks more organized to me. But if you really feel strongly I 
can move the code around.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
