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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933A0C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 04:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B27420719
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 04:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sESKsaN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B27420719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4z3Qxi9lDpYYJPvmWQhD5GctaWzND7ITjTwkt1PShPc=; b=sESKsaN88OqokM0C2UzICebPU
	TZkRag7yq18DTYOhA8GTYMu//g9VUKoAkLo7+qlW2rysyG8fUPM+EsCRbok/V1m9aBJYLGSklo8G/
	2j1nmIuAIWmw7HKH2akwoe1cLaGUJ030U+Hp+GcUbMH8MQdHAvzIPC//UIUvA32LLcHOJh8kvAmFl
	iSgF8PL71q+Sboe7TTVvnPCYhEyW040TNSyovIi0n2kGK4TpCsI4IZIYY+KhJZbZwUrP9Ot2ppXMM
	pxhO2ZtmrfttleF7mbE+nc9mzpOTLDSdW/i+l5GPUTxu/6NUppx0bEfCornIHHBBK16zLypRfvMv9
	bOZZI4eiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCxWP-0005tJ-Es; Tue, 01 Sep 2020 04:03:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCxWK-0005sN-QH; Tue, 01 Sep 2020 04:03:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C839430E;
 Mon, 31 Aug 2020 21:03:41 -0700 (PDT)
Received: from [10.163.69.171] (unknown [10.163.69.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7EAD3F68F;
 Mon, 31 Aug 2020 21:03:36 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 12/13] mm/debug_vm_pgtable/hugetlb: Disable hugetlb
 test on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-13-aneesh.kumar@linux.ibm.com>
Message-ID: <6191e77f-c3b7-21ea-6dbd-eecc09735923@arm.com>
Date: Tue, 1 Sep 2020 09:33:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-13-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_000345_071382_0CCC4489 
X-CRM114-Status: GOOD (  24.39  )
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
> The seems to be missing quite a lot of details w.r.t allocating
> the correct pgtable_t page (huge_pte_alloc()), holding the right
> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
> 
> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
> Hence disable the test on ppc64.

Would really like this to get resolved in an uniform and better way
instead, i.e a modified hugetlb_advanced_tests() which works on all
platforms including ppc64.

In absence of a modified version, I do realize the situation here,
where DEBUG_VM_PGTABLE test either runs on ppc64 or just completely
remove hugetlb_advanced_tests() from other platforms as well.

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index a188b6e4e37e..21329c7d672f 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -813,6 +813,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
>  #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
>  }
>  
> +#ifndef CONFIG_PPC_BOOK3S_64
>  static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>  					  struct vm_area_struct *vma,
>  					  pte_t *ptep, unsigned long pfn,
> @@ -855,6 +856,7 @@ static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>  	pte = huge_ptep_get(ptep);
>  	WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
>  }
> +#endif

In the worst case if we could not get a new hugetlb_advanced_tests() test
that works on all platforms, this might be the last fallback option. In
which case, it will require a proper comment section with a "FIXME: ",
explaining the current situation (and that #ifdef is temporary in nature)
and a hugetlb_advanced_tests() stub when CONFIG_PPC_BOOK3S_64 is enabled.

>  #else  /* !CONFIG_HUGETLB_PAGE */
>  static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
>  static void __init hugetlb_advanced_tests(struct mm_struct *mm,
> @@ -1065,7 +1067,9 @@ static int __init debug_vm_pgtable(void)
>  	pud_populate_tests(mm, pudp, saved_pmdp);
>  	spin_unlock(ptl);
>  
> +#ifndef CONFIG_PPC_BOOK3S_64
>  	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +#endif

#ifdef will not be required here as there would be a stub definition
for hugetlb_advanced_tests() when CONFIG_PPC_BOOK3S_64 is enabled.

>  
>  	spin_lock(&mm->page_table_lock);
>  	p4d_clear_tests(mm, p4dp);
> 

But again, we should really try and avoid taking this path.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
