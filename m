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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5B8C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E89F32073A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0rRVSIuV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E89F32073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8NiKGSgvhWatrWyPxC1/I64citgOa3CSn/aJjUJaoFo=; b=0rRVSIuViAKbJ6ZIQZaRs6t0F
	LDcfWstSh1qsWRmdDCIFiW1giMP5qjoz8Mdk0t0cdtcTZBoQsjRHUP4ev+steEVcPn5pkMAeD1UIL
	jk6MIQdr4LgpagqWLw+N5oEpfjW0SGfe3t6L8yeTe6GX8rOcs6uU4u1lCUJIknd2SIEfBY7BvFGYH
	A/2itjv02zRR1ipGenHPTQNXubGkEymVqzunluPDCZySqbB+l7+HUtBc+OGkjCxN5Vg0stasgFK4z
	u4NOMnC4AzwpQ4xjyH8MmPNiGlm0pnq5LXdWpafY6/9uOInfbfiGjqBdpDsG8gUvTmYs4w6Y1Mjm0
	fGqvaJWiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCxEX-0004d0-8c; Tue, 01 Sep 2020 03:45:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCxER-0004bR-E1; Tue, 01 Sep 2020 03:45:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00C2F30E;
 Mon, 31 Aug 2020 20:45:14 -0700 (PDT)
Received: from [10.163.69.171] (unknown [10.163.69.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 806F83F68F;
 Mon, 31 Aug 2020 20:45:09 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 10/13] mm/debug_vm_pgtable/locks: Take correct page
 table lock
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-11-aneesh.kumar@linux.ibm.com>
Message-ID: <7da0de4c-8fc8-7e40-c9f7-a8f2d875e364@arm.com>
Date: Tue, 1 Sep 2020 09:14:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-11-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_234515_597183_5E8ECBF1 
X-CRM114-Status: GOOD (  17.74  )
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
> Make sure we call pte accessors with correct lock held.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 78c8af3445ac..0a6e771ebd13 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -1039,33 +1039,39 @@ static int __init debug_vm_pgtable(void)
>  	pmd_thp_tests(pmd_aligned, prot);
>  	pud_thp_tests(pud_aligned, prot);
>  
> +	hugetlb_basic_tests(pte_aligned, prot);
> +

This moved back again. As pointed out earlier, there will be a bisect
problem and so this patch must be folded back with the previous one.

>  	/*
>  	 * Page table modifying tests
>  	 */
> -	pte_clear_tests(mm, ptep, vaddr);
> -	pmd_clear_tests(mm, pmdp);
> -	pud_clear_tests(mm, pudp);
> -	p4d_clear_tests(mm, p4dp);
> -	pgd_clear_tests(mm, pgdp);
>  
>  	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	pte_clear_tests(mm, ptep, vaddr);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -
> +	pte_unmap_unlock(ptep, ptl);
>  
> +	ptl = pmd_lock(mm, pmdp);
> +	pmd_clear_tests(mm, pmdp);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>  	pmd_huge_tests(pmdp, pmd_aligned, prot);
> +	pmd_populate_tests(mm, pmdp, saved_ptep);
> +	spin_unlock(ptl);
> +
> +	ptl = pud_lock(mm, pudp);
> +	pud_clear_tests(mm, pudp);
> +	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>  	pud_huge_tests(pudp, pud_aligned, prot);
> +	pud_populate_tests(mm, pudp, saved_pmdp);
> +	spin_unlock(ptl);
>  
> -	pte_unmap_unlock(ptep, ptl);
> +	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  
> -	pmd_populate_tests(mm, pmdp, saved_ptep);
> -	pud_populate_tests(mm, pudp, saved_pmdp);
> +	spin_lock(&mm->page_table_lock);
> +	p4d_clear_tests(mm, p4dp);
> +	pgd_clear_tests(mm, pgdp);
>  	p4d_populate_tests(mm, p4dp, saved_pudp);
>  	pgd_populate_tests(mm, pgdp, saved_p4dp);
> -
> -	hugetlb_basic_tests(pte_aligned, prot);
> +	spin_unlock(&mm->page_table_lock);
>  
>  	p4d_free(mm, saved_p4dp);
>  	pud_free(mm, saved_pudp);
> 

Overall, grouping together dynamic tests at various page table levels and
taking a corresponding lock, makes sense. Commit message for the resultant
patch should include (a) Test classification (b) Grouping by function for
the static tests, by page table level for the dynamic tests (c) Locking
requirement for the dynamic tests each level etc.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
