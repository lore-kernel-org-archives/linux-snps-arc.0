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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68653C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:42:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E87B20693
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zUEV9JV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E87B20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oag2N2J17eYUjXW3oumTYR0nf/rpUI9zTTu3p/J+9Tg=; b=zUEV9JV2n58Ycf7wFQs3qkXHV
	k+S/4VAYt4NhV3QE2J8waZ3nVHx60iewi3bjbMZNP7hIp14BrRna8jm7oybId4GisG0VL4LPZrxOy
	CfmSL4t12aoazP7EoawliUfOJPSg2JNbfYwBFPg+i/5H9qMZp01dblu5DrqZ/l+miccv06u7Wyj8a
	vP/1cghdwgMR5hxjSN/jQ+lVszG1LPlRTCwmfBdRCGjExhx9mGHbc9Lt1GpLLSu6yEoH2t3xQY36m
	WvdFMJSikDcJPbQydpUI21imf85AphEScqy2Xl0OCWqoJVKML1T82YjCGdTqYGhy1u0sQr8ZECAnv
	s1tEk59tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCxBP-0003tr-Fn; Tue, 01 Sep 2020 03:42:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCxBI-0003ra-5E; Tue, 01 Sep 2020 03:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D9D30E;
 Mon, 31 Aug 2020 20:41:57 -0700 (PDT)
Received: from [10.163.69.171] (unknown [10.163.69.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23BA83F68F;
 Mon, 31 Aug 2020 20:41:51 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 09/13] mm/debug_vm_pgtable/locks: Move non page table
 modifying test together
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-10-aneesh.kumar@linux.ibm.com>
Message-ID: <d0a0a50c-702b-c63a-edf2-263e4e7bd4a5@arm.com>
Date: Tue, 1 Sep 2020 09:11:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-10-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_234200_296922_F6FE723E 
X-CRM114-Status: GOOD (  22.62  )
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
> This will help in adding proper locks in a later patch

It really makes sense to classify these tests here as static and dynamic.
Static are the ones that test via page table entry values modification
without changing anything on the actual page table itself. Where as the
dynamic tests do change the page table. Static tests would probably never
require any lock synchronization but the dynamic ones will do.

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 52 ++++++++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 0ce5c6a24c5b..78c8af3445ac 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -992,7 +992,7 @@ static int __init debug_vm_pgtable(void)
>  	p4dp = p4d_alloc(mm, pgdp, vaddr);
>  	pudp = pud_alloc(mm, p4dp, vaddr);
>  	pmdp = pmd_alloc(mm, pudp, vaddr);
> -	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	ptep = pte_alloc_map(mm, pmdp, vaddr);
>  
>  	/*
>  	 * Save all the page table page addresses as the page table
> @@ -1012,33 +1012,12 @@ static int __init debug_vm_pgtable(void)
>  	p4d_basic_tests(p4d_aligned, prot);
>  	pgd_basic_tests(pgd_aligned, prot);
>  
> -	pte_clear_tests(mm, ptep, vaddr);
> -	pmd_clear_tests(mm, pmdp);
> -	pud_clear_tests(mm, pudp);
> -	p4d_clear_tests(mm, p4dp);
> -	pgd_clear_tests(mm, pgdp);
> -
> -	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -
>  	pmd_leaf_tests(pmd_aligned, prot);
>  	pud_leaf_tests(pud_aligned, prot);
>  
> -	pmd_huge_tests(pmdp, pmd_aligned, prot);
> -	pud_huge_tests(pudp, pud_aligned, prot);
> -
>  	pte_savedwrite_tests(pte_aligned, protnone);
>  	pmd_savedwrite_tests(pmd_aligned, protnone);
>  
> -	pte_unmap_unlock(ptep, ptl);
> -
> -	pmd_populate_tests(mm, pmdp, saved_ptep);
> -	pud_populate_tests(mm, pudp, saved_pmdp);
> -	p4d_populate_tests(mm, p4dp, saved_pudp);
> -	pgd_populate_tests(mm, pgdp, saved_p4dp);
> -
>  	pte_special_tests(pte_aligned, prot);
>  	pte_protnone_tests(pte_aligned, protnone);
>  	pmd_protnone_tests(pmd_aligned, protnone);
> @@ -1056,11 +1035,38 @@ static int __init debug_vm_pgtable(void)
>  	pmd_swap_tests(pmd_aligned, prot);
>  
>  	swap_migration_tests();
> -	hugetlb_basic_tests(pte_aligned, prot);
>  
>  	pmd_thp_tests(pmd_aligned, prot);
>  	pud_thp_tests(pud_aligned, prot);
>  
> +	/*
> +	 * Page table modifying tests
> +	 */

In this comment, please do add some more details about how these tests
need proper locking mechanism unlike the previous static ones. Also add
a similar comment section for the static tests that dont really change
page table and need not require corresponding locking mechanism. Both
comment sections will make this classification clear.

> +	pte_clear_tests(mm, ptep, vaddr);
> +	pmd_clear_tests(mm, pmdp);
> +	pud_clear_tests(mm, pudp);
> +	p4d_clear_tests(mm, p4dp);
> +	pgd_clear_tests(mm, pgdp);
> +
> +	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
> +	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> +	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +
> +
> +	pmd_huge_tests(pmdp, pmd_aligned, prot);
> +	pud_huge_tests(pudp, pud_aligned, prot);
> +
> +	pte_unmap_unlock(ptep, ptl);
> +
> +	pmd_populate_tests(mm, pmdp, saved_ptep);
> +	pud_populate_tests(mm, pudp, saved_pmdp);
> +	p4d_populate_tests(mm, p4dp, saved_pudp);
> +	pgd_populate_tests(mm, pgdp, saved_p4dp);
> +
> +	hugetlb_basic_tests(pte_aligned, prot);

hugetlb_basic_tests() is a non page table modifying static test and
should be classified accordingly.

> +
>  	p4d_free(mm, saved_p4dp);
>  	pud_free(mm, saved_pudp);
>  	pmd_free(mm, saved_pmdp);
> 

Changes till this patch fails to boot on arm64 platform. This should be
folded with the next patch.

[   17.080644] ------------[ cut here ]------------
[   17.081342] kernel BUG at mm/pgtable-generic.c:164!
[   17.082091] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   17.082977] Modules linked in:
[   17.083481] CPU: 79 PID: 1 Comm: swapper/0 Tainted: G        W         5.9.0-rc2-00105-g740e72cd6717 #14
[   17.084998] Hardware name: linux,dummy-virt (DT)
[   17.085745] pstate: 60400005 (nZCv daif +PAN -UAO BTYPE=--)
[   17.086645] pc : pgtable_trans_huge_deposit+0x58/0x60
[   17.087462] lr : debug_vm_pgtable+0x4dc/0x8f0
[   17.088168] sp : ffff80001219bcf0
[   17.088710] x29: ffff80001219bcf0 x28: ffff8000114ac000 
[   17.089574] x27: ffff8000114ac000 x26: 0020000000000fd3 
[   17.090431] x25: 0020000081400fd3 x24: fffffe00175c12c0 
[   17.091286] x23: ffff0005df04d1a8 x22: 0000f18d6e035000 
[   17.092143] x21: ffff0005dd790000 x20: ffff0005df18e1a8 
[   17.093003] x19: ffff0005df04cb80 x18: 0000000000000014 
[   17.093859] x17: 00000000b76667d0 x16: 00000000fd4e6611 
[   17.094716] x15: 0000000000000001 x14: 0000000000000002 
[   17.095572] x13: 000000000055d966 x12: fffffe001755e400 
[   17.096429] x11: 0000000000000008 x10: ffff0005fcb6e210 
[   17.097292] x9 : ffff0005fcb6e210 x8 : 0020000081590fd3 
[   17.098149] x7 : ffff0005dd71e0c0 x6 : ffff0005df18e1a8 
[   17.099006] x5 : 0020000081590fd3 x4 : 0020000081590fd3 
[   17.099862] x3 : ffff0005df18e1a8 x2 : fffffe00175c12c0 
[   17.100718] x1 : fffffe00175c1300 x0 : 0000000000000000 
[   17.101583] Call trace:
[   17.101993]  pgtable_trans_huge_deposit+0x58/0x60
[   17.102754]  do_one_initcall+0x74/0x1cc
[   17.103381]  kernel_init_freeable+0x1d0/0x238
[   17.104089]  kernel_init+0x14/0x118
[   17.104658]  ret_from_fork+0x10/0x34
[   17.105251] Code: f9000443 f9000843 f9000822 d65f03c0 (d4210000) 
[   17.106303] ---[ end trace e63471e00f8c147f ]---

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
