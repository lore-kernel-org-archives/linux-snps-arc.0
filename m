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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C02C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:21:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5058820719
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LzjII9IX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5058820719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2qbcRURYgLM9i/XWx3oJMq2xxNRAI+2insdJv3p1uic=; b=LzjII9IXcfiBq5lrF6A6UwS0V
	jy/ydVYSlJErsADawkkCKZwZY5iDVX1PhxF3ke2lnU/WtI4W84M2ltov9V7okSaVKiTMrQLQPvy5x
	OOJGnRCclTQWWWXrGhnv3nrU59RNDRbdwa6C+Fqr3H+agxv9E2VS4BvcJdSA29jGNMPa885hC+1gD
	Kg3j3e+FFpn61DiuH1Sf2wtq50PuO09tqKLBPsfhLQarJZv4/+Xt1QJcGDnC+LwZbXd8fJ1beBS3B
	4xQzmg/Aj7+1Mzpnz5ElBTXQH+Rk1y8rv0gahTWErigVWVFM432OXcAcAIGUtn8SpIspkrnuszwrd
	sXQQPckWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwrr-00029G-Ca; Tue, 01 Sep 2020 03:21:55 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwrh-00026J-CS; Tue, 01 Sep 2020 03:21:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5799830E;
 Mon, 31 Aug 2020 20:21:44 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34D923F68F;
 Mon, 31 Aug 2020 20:21:38 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 06/13] mm/debug_vm_pgtable/THP: Mark the pte entry huge
 before using set_pmd/pud_at
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-7-aneesh.kumar@linux.ibm.com>
Message-ID: <37558832-9cb6-9a11-0009-e268ad51c1f3@arm.com>
Date: Tue, 1 Sep 2020 08:51:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-7-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_232145_813686_947AEDF6 
X-CRM114-Status: GOOD (  19.18  )
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
> kernel expects entries to be marked huge before we use set_pmd_at()/set_pud_at().
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 5c0680836fe9..de83a20c1b30 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -155,7 +155,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  				      unsigned long pfn, unsigned long vaddr,
>  				      pgprot_t prot)
>  {
> -	pmd_t pmd = pfn_pmd(pfn, prot);
> +	pmd_t pmd;
>  
>  	if (!has_transparent_hugepage())
>  		return;
> @@ -164,19 +164,19 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	/* Align the address wrt HPAGE_PMD_SIZE */
>  	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
>  
> -	pmd = pfn_pmd(pfn, prot);
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_set_wrprotect(mm, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_write(pmd));
>  
> -	pmd = pfn_pmd(pfn, prot);
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(!pmd_none(pmd));
>  
> -	pmd = pfn_pmd(pfn, prot);
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	pmd = pmd_wrprotect(pmd);
>  	pmd = pmd_mkclean(pmd);
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
> @@ -237,7 +237,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  
>  static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
> -	pmd_t pmd = pfn_pmd(pfn, prot);
> +	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));

There is no set_pmd_at() in this particular test, why change ?

>  
>  	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
>  		return;
> @@ -277,7 +277,7 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  				      unsigned long pfn, unsigned long vaddr,
>  				      pgprot_t prot)
>  {
> -	pud_t pud = pfn_pud(pfn, prot);
> +	pud_t pud;
>  
>  	if (!has_transparent_hugepage())
>  		return;
> @@ -286,25 +286,28 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  	/* Align the address wrt HPAGE_PUD_SIZE */
>  	vaddr = (vaddr & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE;
>  
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_set_wrprotect(mm, vaddr, pudp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(pud_write(pud));
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> -	pud = pfn_pud(pfn, prot);
> +

Please drop the extra line here.

> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_huge_get_and_clear(mm, vaddr, pudp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!pud_none(pud));
>  
> -	pud = pfn_pud(pfn, prot);
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!pud_none(pud));
>  #endif /* __PAGETABLE_PMD_FOLDED */
> -	pud = pfn_pud(pfn, prot);
> +

Please drop the extra line here.

> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	pud = pud_wrprotect(pud);
>  	pud = pud_mkclean(pud);
>  	set_pud_at(mm, vaddr, pudp, pud);
>

There is a checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
kernel expects entries to be marked huge before we use set_pmd_at()/set_pud_at().

total: 0 errors, 1 warnings, 77 lines checked

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
