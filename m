Return-Path: <SRS0=1o5z=CE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7320C433E3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 14:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747E62078D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 14:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btV8PyJ9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGUxc1IV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747E62078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:MIME-Version:In-Reply-To:References:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r1AGouq4x8FqLXTJqLZaiGeLnxvB+Wpg2frcccps9AU=; b=btV8PyJ9fhTgTgo57VO5cFZFw
	JFoYWFqY0txvUMf5ozUo0ynihM1xjG40GT6hgltPCwAP9R9Au0SVfGN0LyNwOqe8yxq9rnJDLUAon
	Vs3pagwe3OK7jKH3H5JmLzb3eKinrgtmmL660pE3rRGc9gV1uB5yYfeq6BI33s+ub32v+cYYf46ei
	eA501+iGF3qBxSCnqrSEGVRbUGV5R/JgPTaXlN9pdC/hbLCunsiGO4RSw0WzuKK8zsarcxQ+SrFsH
	oUbtA2p21UooMNEBifREf/pOg/c+YWq34XBNH+pmGgY0U/N+o+VKRG5UGdaic4gjdYRmxa4ri12dk
	i3yq7cw4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwCe-0003t2-Qz; Wed, 26 Aug 2020 14:15:04 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwCa-0003rO-EK; Wed, 26 Aug 2020 14:15:01 +0000
Received: by mail-pl1-x643.google.com with SMTP id a8so740568plm.2;
 Wed, 26 Aug 2020 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=asc1bPjanltrvBpfscIPJeoYc9ISOE48o+/hEQQ6Ews=;
 b=DGUxc1IVrNmfVHRQz38+Vr81E26RqaxVttKM+fqXiG/HNKLGKb5OdHvoJ+QoAYigD4
 XOavGM7i2p8DowniadyrURPXd132ZetOW2PvfBNAu/yhru8QZmAfw98CfUsxpK8fuzK+
 u5q+2EYm6WtOyCXVWD0u9E55hG5tHrJPyMjc3rBkd+58NmaH7tOr8L0gVcTqml/0cu7Z
 Izmnu2rqPGZ3TnBymDB8TWMbmmUBwOXiYDeXg2/xsN579mSXA8+nT6C/KCC8mQjdfVjg
 Gq+ZkEbboLjBsXEBrT194dsOEqelnlFqv47QtLBBPu9oJ5cg+Jqf4G/M0UuVQipGR+/Z
 Avmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=asc1bPjanltrvBpfscIPJeoYc9ISOE48o+/hEQQ6Ews=;
 b=L5HC/uz/9oSO98XjmAncvV7I1kaI2J68w7MkYuo7XbzOULZrbCrJ3uOfN8U8uOj/nF
 /IXgy3W7snrEA97gLZxi75Ea69fPd2rj/Qv4i30XNZBLGZP/Rz+jLXtnxY98dUSs9djD
 qslBOxY+DsxMl+0BTJsCudRkGRUMshjfjMLpB/C3tuHNVvSKHnk3eckpCDsjQlpDNySS
 T0DoTQnv20qovWAK5fFFQgZXdOin2zMdZoJkt3sb3BrtKVKHjXz0BqPXyFUq2GTJXTTy
 nfZ2q/rCnNWmk16A0fpMj/HgU/R4gdGMgRQqpMGFzPQTuTgkST+sOO7Qe6W8TQsEx20B
 KTlw==
X-Gm-Message-State: AOAM5323Wn99tjXM9gVtNBlhaLNZPXfdKClYWd3fzo9XoEqbTMRXYqL0
 7EbgYz7N+JPfQBEFvDNuoG4=
X-Google-Smtp-Source: ABdhPJyp0KMkicGuVPOzUU9zBQgZCPRN7FDrFvKBeMgrVyfAcfhOGXBdnUGAbBgHTxo7CBRwX+PEag==
X-Received: by 2002:a17:90a:de17:: with SMTP id
 m23mr6439822pjv.51.1598451298010; 
 Wed, 26 Aug 2020 07:14:58 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id a12sm3267771pfr.217.2020.08.26.07.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:14:57 -0700 (PDT)
Date: Thu, 27 Aug 2020 00:14:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 04/24] arm: use asm-generic/mmu_context.h for no-op
 implementations
To: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Vineet Gupta
 <Vineet.Gupta1@synopsys.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
 <20200728033405.78469-5-npiggin@gmail.com>
 <86611bf1-13b2-65e5-50d5-b0701020cd3e@synopsys.com>
In-Reply-To: <86611bf1-13b2-65e5-50d5-b0701020cd3e@synopsys.com>
MIME-Version: 1.0
Message-Id: <1598450646.p1afhqiz8e.astroid@bobo.none>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_101500_553240_CD0BF15E 
X-CRM114-Status: GOOD (  22.22  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Excerpts from Vineet Gupta's message of July 28, 2020 2:14 pm:
> On 7/27/20 8:33 PM, Nicholas Piggin wrote:
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/arm/include/asm/mmu_context.h | 26 +++-----------------------
>>  1 file changed, 3 insertions(+), 23 deletions(-)
>> 
>> diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
>> index f99ed524fe41..84e58956fcab 100644
>> --- a/arch/arm/include/asm/mmu_context.h
>> +++ b/arch/arm/include/asm/mmu_context.h
>> @@ -26,6 +26,8 @@ void __check_vmalloc_seq(struct mm_struct *mm);
>>  #ifdef CONFIG_CPU_HAS_ASID
>>  
>>  void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk);
>> +
>> +#define init_new_context init_new_context
>>  static inline int
>>  init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>>  {
>> @@ -92,32 +94,10 @@ static inline void finish_arch_post_lock_switch(void)
>>  
>>  #endif	/* CONFIG_MMU */
>>  
>> -static inline int
>> -init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>> -{
>> -	return 0;
>> -}
>> -
>> -
>>  #endif	/* CONFIG_CPU_HAS_ASID */
>>  
>> -#define destroy_context(mm)		do { } while(0)
>>  #define activate_mm(prev,next)		switch_mm(prev, next, NULL)
> 
> Actually this can also go away too.
> 
> ARM switch_mm(prev, next, tsk) -> check_and_switch_context(next, tsk) but latter
> doesn't use @tsk at all. With patch below, you can remove above as well...

Thanks for reviewing. I did notice that might be possible but I was 
avoiding any change that wasn't completely trivial. It's a good point
to continue consolidating and simplifying though.

Thanks,
Nick

> 
> -------->
> From 672e0f78a94892794057a5a7542d85b71c1369c4 Mon Sep 17 00:00:00 2001
> From: Vineet Gupta <vgupta@synopsys.com>
> Date: Mon, 27 Jul 2020 21:12:42 -0700
> Subject: [PATCH] ARM: mm: check_and_switch_context() doesn't use @tsk arg
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/arm/include/asm/efi.h         | 2 +-
>  arch/arm/include/asm/mmu_context.h | 5 ++---
>  arch/arm/mm/context.c              | 2 +-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
> index 5dcf3c6011b7..0995b308149d 100644
> --- a/arch/arm/include/asm/efi.h
> +++ b/arch/arm/include/asm/efi.h
> @@ -37,7 +37,7 @@ int efi_set_mapping_permissions(struct mm_struct *mm,
> efi_memory_desc_t *md);
> 
>  static inline void efi_set_pgd(struct mm_struct *mm)
>  {
> -	check_and_switch_context(mm, NULL);
> +	check_and_switch_context(mm);
>  }
> 
>  void efi_virtmap_load(void);
> diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
> index f99ed524fe41..c96360fa3466 100644
> --- a/arch/arm/include/asm/mmu_context.h
> +++ b/arch/arm/include/asm/mmu_context.h
> @@ -25,7 +25,7 @@ void __check_vmalloc_seq(struct mm_struct *mm);
> 
>  #ifdef CONFIG_CPU_HAS_ASID
> 
> -void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk);
> +void check_and_switch_context(struct mm_struct *mm);
>  static inline int
>  init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  {
> @@ -47,8 +47,7 @@ static inline void a15_erratum_get_cpumask(int this_cpu, struct
> mm_struct *mm,
> 
>  #ifdef CONFIG_MMU
> 
> -static inline void check_and_switch_context(struct mm_struct *mm,
> -					    struct task_struct *tsk)
> +static inline void check_and_switch_context(struct mm_struct *mm)
>  {
>  	if (unlikely(mm->context.vmalloc_seq != init_mm.context.vmalloc_seq))
>  		__check_vmalloc_seq(mm);
> diff --git a/arch/arm/mm/context.c b/arch/arm/mm/context.c
> index b7525b433f3e..86c411e1d7cb 100644
> --- a/arch/arm/mm/context.c
> +++ b/arch/arm/mm/context.c
> @@ -234,7 +234,7 @@ static u64 new_context(struct mm_struct *mm, unsigned int cpu)
>  	return asid | generation;
>  }
> 
> -void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
> +void check_and_switch_context(struct mm_struct *mm)
>  {
>  	unsigned long flags;
>  	unsigned int cpu = smp_processor_id();
> -- 
> 2.20.1
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
