Return-Path: <SRS0=cOi9=A3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14178C433E3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jul 2020 14:15:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A32207DD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jul 2020 14:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbrYtuS2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A32207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EI/eEbDfit3OHpHpFTODp9I53kf/QM8pmmU0VOZD8Y4=; b=GbrYtuS2fW/8NqpMCWW+1IlPE
	521nF/5zdOHxQ3tOOhAOcvDXc4iRaKp7GltSth2VTarsSnXJeXhyU1m5za9ZwPMHdOXhAAY8yJ4Gn
	8Uy6ruJDqzjICIZUn3ql+Dkx3if+xflLs3LdKHkveILDky0hxOi6iCgXESBUT/gEMSi9GJue7aNEg
	KQuP4tqLHVI5P3/TcTRk3kVrUZqZkcmaI9h8xVaJZ1ugpx2YCWjr6+cjEpwoJ/8BiQQgyYqnQBzfr
	EVyBOfvbDvOyPrNQhERJ0A69O9VgNG1SAbqYKcMUVH2kShVORQuRL/u7V6Lp3pB3udcxWBisKjPv0
	E1CM5dzCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw4fF-0002tG-Te; Thu, 16 Jul 2020 14:15:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw4ev-0002m9-Vz; Thu, 16 Jul 2020 14:14:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA8F331B;
 Thu, 16 Jul 2020 07:14:43 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00B4B3F66E;
 Thu, 16 Jul 2020 07:14:38 -0700 (PDT)
Subject: Re: [PATCH V5 1/4] mm/debug_vm_pgtable: Add tests validating arch
 helpers for core MM features
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
 <1594610587-4172-2-git-send-email-anshuman.khandual@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2ff756c5-28e2-b64a-3788-260ba30c6409@arm.com>
Date: Thu, 16 Jul 2020 15:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594610587-4172-2-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_101450_155684_5E5FB60A 
X-CRM114-Status: GOOD (  24.91  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, agordeev@linux.ibm.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 christophe.leroy@csgroup.eu, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 gerald.schaefer@de.ibm.com, ziy@nvidia.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, cai@lca.pw,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 aneesh.kumar@linux.ibm.com, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 13/07/2020 04:23, Anshuman Khandual wrote:
> This adds new tests validating arch page table helpers for these following
> core memory features. These tests create and test specific mapping types at
> various page table levels.
> 
> 1. SPECIAL mapping
> 2. PROTNONE mapping
> 3. DEVMAP mapping
> 4. SOFTDIRTY mapping
> 5. SWAP mapping
> 6. MIGRATION mapping
> 7. HUGETLB mapping
> 8. THP mapping
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: x86@kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Vineet Gupta <vgupta@synopsys.com>	#arc
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   mm/debug_vm_pgtable.c | 302 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 301 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 61ab16fb2e36..2fac47db3eb7 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
[...]
> +
> +static void __init pte_swap_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	swp_entry_t swp;
> +	pte_t pte;
> +
> +	pte = pfn_pte(pfn, prot);
> +	swp = __pte_to_swp_entry(pte);

Minor issue: this doesn't look necessarily valid - there's no reason a 
normal PTE can be turned into a swp_entry. In practise this is likely to 
work on all architectures because there's no reason not to use (at 
least) all the PFN bits for the swap entry, but it doesn't exactly seem 
correct.

Can we start with a swp_entry_t (from __swp_entry()) and check the round 
trip of that?

It would also seem sensible to have a check that 
is_swap_pte(__swp_entry_to_pte(__swp_entry(x,y))) is true.

> +	pte = __swp_entry_to_pte(swp);
> +	WARN_ON(pfn != pte_pfn(pte));
> +}
> +
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	swp_entry_t swp;
> +	pmd_t pmd;
> +
> +	pmd = pfn_pmd(pfn, prot);
> +	swp = __pmd_to_swp_entry(pmd);
> +	pmd = __swp_entry_to_pmd(swp);
> +	WARN_ON(pfn != pmd_pfn(pmd));
> +}
> +#else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot) { }
> +#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
> +static void __init swap_migration_tests(void)
> +{
> +	struct page *page;
> +	swp_entry_t swp;
> +
> +	if (!IS_ENABLED(CONFIG_MIGRATION))
> +		return;
> +	/*
> +	 * swap_migration_tests() requires a dedicated page as it needs to
> +	 * be locked before creating a migration entry from it. Locking the
> +	 * page that actually maps kernel text ('start_kernel') can be real
> +	 * problematic. Lets allocate a dedicated page explicitly for this

NIT: s/Lets/Let's

Otherwise looks good to me.

Steve

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
