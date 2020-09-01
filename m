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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1D3C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:18:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F5820719
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfyEG9Qn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F5820719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HSDBrTuVYLcFIkeQL0K+VAbFPcZw2nHJiYapQf+bMAA=; b=OfyEG9QnQSZDHMnbUMga9T/YU
	AKgO6M1P5ZTfIPM9OR8rsjPRl5Or5CQFIiK6s0+TE1YPWmwsuwDA/sT2GIzXKIEI8kSA5GEBn+L3i
	e4tyPwqOFfYweBfJV6VCReRM6A3RO1bTHOoCpovmBPP/SuEiO70EoY7op02uQf2gBRb0W+JwrZ/99
	pksRmx+D5y1ERzJhWqbQ0YLfMsZxTaQkibxBWPpmgtBF+9fUzKhsFHEgAhvI1mzEI3Er31BbbxMZm
	n2k0XZdSjnJ/NyI7fhgx/SdnG9GtFVkNMPUsX1MlxKUMjln8oqql1RkLWJ8fg5FITY7U5TOA6i0fg
	x4j9NBYuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwoy-0001Y3-BX; Tue, 01 Sep 2020 03:18:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwoq-0001VF-Qu; Tue, 01 Sep 2020 03:18:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F3DC30E;
 Mon, 31 Aug 2020 20:18:48 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 792003F68F;
 Mon, 31 Aug 2020 20:18:43 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 05/13] mm/debug_vm_pgtable/savedwrite: Enable
 savedwrite test with CONFIG_NUMA_BALANCING
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-6-aneesh.kumar@linux.ibm.com>
Message-ID: <0c1ba151-b5c4-27a4-d500-4f416d0beedc@arm.com>
Date: Tue, 1 Sep 2020 08:48:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-6-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_231849_027433_DEAF07D6 
X-CRM114-Status: GOOD (  20.58  )
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
> Saved write support was added to track the write bit of a pte after marking the
> pte protnone. This was done so that AUTONUMA can convert a write pte to protnone
> and still track the old write bit. When converting it back we set the pte write
> bit correctly thereby avoiding a write fault again. Hence enable the test only
> when CONFIG_NUMA_BALANCING is enabled and use protnone protflags.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 28f9d0558c20..5c0680836fe9 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -119,10 +119,14 @@ static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pte_t pte = pfn_pte(pfn, prot);
>  
> +	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
> +		return;
> +
>  	pr_debug("Validating PTE saved write\n");
>  	WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
>  	WARN_ON(pte_savedwrite(pte_clear_savedwrite(pte_mk_savedwrite(pte))));
>  }
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>  {
> @@ -235,6 +239,9 @@ static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd = pfn_pmd(pfn, prot);
>  
> +	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
> +		return;
> +
>  	pr_debug("Validating PMD saved write\n");
>  	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
>  	WARN_ON(pmd_savedwrite(pmd_clear_savedwrite(pmd_mk_savedwrite(pmd))));
> @@ -1020,8 +1027,8 @@ static int __init debug_vm_pgtable(void)
>  	pmd_huge_tests(pmdp, pmd_aligned, prot);
>  	pud_huge_tests(pudp, pud_aligned, prot);
>  
> -	pte_savedwrite_tests(pte_aligned, prot);
> -	pmd_savedwrite_tests(pmd_aligned, prot);
> +	pte_savedwrite_tests(pte_aligned, protnone);
> +	pmd_savedwrite_tests(pmd_aligned, protnone);
>  
>  	pte_unmap_unlock(ptep, ptl);
>  
> 

There is a checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
Saved write support was added to track the write bit of a pte after marking the

total: 0 errors, 1 warnings, 33 lines checked

Otherwise this looks good. With the checkpatch.pl warning fixed

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
