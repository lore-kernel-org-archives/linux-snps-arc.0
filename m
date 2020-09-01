Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D50C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF9A5207EA
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfjGrj51"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9A5207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k13MiW/ylKYtUSBPd0vHhv+RQcV1LD3O42iAUwaGlQI=; b=VfjGrj51afSORB0mvOAZ9lsjz
	mktHVik2lX4EVnDEFHX53lMY3LuWY25j2sQ0Fm0bM4sP+8gWsf0XRSKMKQsROZCtrG5ePcZW5YPzW
	kFin2Mv/eRk2UOoBrqWK8YDd8GAX0SGDn7zKu8Wi12SLon4N8x4Qq9vLILYz37mm8Q4rLAyyjAFx6
	F6H92ycIhcCyKoRrrmg1hVASkzFAeSPUExkGkKkHc1Hk1zi8DNle2DsXwBl3hGcOb7Vd/E+sjfrt3
	sFfTImVSCldCu4WC2OZk1TP8S6Eozlc8A9+kc8Qn3Jt+0UFyKS2hXafn74h4voHJguk4Z1IEDzKPU
	k/BllvR4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwkY-0008Nx-6K; Tue, 01 Sep 2020 03:14:22 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwkL-0008Ix-Mj; Tue, 01 Sep 2020 03:14:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3115330E;
 Mon, 31 Aug 2020 20:14:05 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCD53F68F;
 Mon, 31 Aug 2020 20:14:00 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 02/13] powerpc/mm: Move setting pte specific flags to
 pfn_pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-3-aneesh.kumar@linux.ibm.com>
Message-ID: <5b3f0db6-09f6-3f40-c9fc-911814d691bb@arm.com>
Date: Tue, 1 Sep 2020 08:43:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-3-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_231409_967567_A08D014C 
X-CRM114-Status: GOOD (  25.57  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
> powerpc used to set the pte specific flags in set_pte_at(). This is different
> from other architectures. To be consistent with other architecture update
> pfn_pte to set _PAGE_PTE on ppc64. Also, drop now unused pte_mkpte.
> 
> We add a VM_WARN_ON() to catch the usage of calling set_pte_at() without setting
> _PAGE_PTE bit. We will remove that after a few releases.
> 
> With respect to huge pmd entries, pmd_mkhuge() takes care of adding the
> _PAGE_PTE bit.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 15 +++++++++------
>  arch/powerpc/include/asm/nohash/pgtable.h    |  5 -----
>  arch/powerpc/mm/pgtable.c                    |  5 -----
>  3 files changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 079211968987..2382fd516f6b 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -619,7 +619,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
>  	VM_BUG_ON(pfn >> (64 - PAGE_SHIFT));
>  	VM_BUG_ON((pfn << PAGE_SHIFT) & ~PTE_RPN_MASK);
>  
> -	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot));
> +	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot) | _PAGE_PTE);
>  }
>  
>  static inline unsigned long pte_pfn(pte_t pte)
> @@ -655,11 +655,6 @@ static inline pte_t pte_mkexec(pte_t pte)
>  	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_EXEC));
>  }
>  
> -static inline pte_t pte_mkpte(pte_t pte)
> -{
> -	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
> -}
> -
>  static inline pte_t pte_mkwrite(pte_t pte)
>  {
>  	/*
> @@ -823,6 +818,14 @@ static inline int pte_none(pte_t pte)
>  static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte, int percpu)
>  {
> +
> +	VM_WARN_ON(!(pte_raw(pte) & cpu_to_be64(_PAGE_PTE)));
> +	/*
> +	 * Keep the _PAGE_PTE added till we are sure we handle _PAGE_PTE
> +	 * in all the callers.
> +	 */
> +	 pte = __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
> +
>  	if (radix_enabled())
>  		return radix__set_pte_at(mm, addr, ptep, pte, percpu);
>  	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
> index 4b7c3472eab1..6277e7596ae5 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -140,11 +140,6 @@ static inline pte_t pte_mkold(pte_t pte)
>  	return __pte(pte_val(pte) & ~_PAGE_ACCESSED);
>  }
>  
> -static inline pte_t pte_mkpte(pte_t pte)
> -{
> -	return pte;
> -}
> -
>  static inline pte_t pte_mkspecial(pte_t pte)
>  {
>  	return __pte(pte_val(pte) | _PAGE_SPECIAL);
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 9c0547d77af3..ab57b07ef39a 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -184,9 +184,6 @@ void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  	 */
>  	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>  
> -	/* Add the pte bit when trying to set a pte */
> -	pte = pte_mkpte(pte);
> -
>  	/* Note: mm->context.id might not yet have been assigned as
>  	 * this context might not have been activated yet when this
>  	 * is called.
> @@ -275,8 +272,6 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
>  	 */
>  	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>  
> -	pte = pte_mkpte(pte);
> -
>  	pte = set_pte_filter(pte);
>  
>  	val = pte_val(pte);
> 

There is one checkpatch.pl warning for this patch.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#6: 
powerpc used to set the pte specific flags in set_pte_at(). This is different

total: 0 errors, 1 warnings, 61 lines checked

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
