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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FADC433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:26:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF47520719
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FesSk+G5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF47520719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y2fTRbgsjWB69I/p23Q22Jp1TB6VMPHYdasZlTDYwd8=; b=FesSk+G5e0yNcLExjixOSfJnb
	nADelaXQKteQCFR0jgbrxAS2NG3ZiEiyomfhRkYN+1ArhnoeakhH9b/RoZ+M6k48D7+tH+VRgxM7Q
	TkH9Po9M41B72NYCjNlnA85svVC5AA1Sqdxb5E5zYsGwSIyUpy3RsHpuoqEcCfMJ5JvazJ6cj52/m
	Xm7vMCsCeyMC7uzqeSmddtHGI5+5uHHHBJPkb3jSpGqRx8GRd7iTESrFIS6P0NowkbghHMLzXAfM8
	E7mnyJHCd9UM0u8w3LnlCHoa7ec6J19fS+TOhMXn64VoYlnq3Lf82x7EDk0gPSo5AuNP8yUtD1glr
	C47fDcXZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwwT-00030M-5b; Tue, 01 Sep 2020 03:26:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwwO-0002yj-9m; Tue, 01 Sep 2020 03:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1826030E;
 Mon, 31 Aug 2020 20:26:34 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352D43F68F;
 Mon, 31 Aug 2020 20:26:28 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
Message-ID: <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
Date: Tue, 1 Sep 2020 08:55:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_232636_469450_633242CA 
X-CRM114-Status: GOOD (  22.50  )
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
> pte_clear_tests operate on an existing pte entry. Make sure that is not a none
> pte entry.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 21329c7d672f..8527ebb75f2c 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -546,7 +546,7 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>  static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
>  				   unsigned long vaddr)
>  {
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte =  ptep_get_and_clear(mm, vaddr, ptep);

Seems like ptep_get_and_clear() here just clears the entry in preparation
for a following set_pte_at() which otherwise would have been a problem on
ppc64 as you had pointed out earlier i.e set_pte_at() should not update an
existing valid entry. So the commit message here is bit misleading.

>  
>  	pr_debug("Validating PTE clear\n");
>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> @@ -944,7 +944,7 @@ static int __init debug_vm_pgtable(void)
>  	p4d_t *p4dp, *saved_p4dp;
>  	pud_t *pudp, *saved_pudp;
>  	pmd_t *pmdp, *saved_pmdp, pmd;
> -	pte_t *ptep;
> +	pte_t *ptep, pte;
>  	pgtable_t saved_ptep;
>  	pgprot_t prot, protnone;
>  	phys_addr_t paddr;
> @@ -1049,6 +1049,8 @@ static int __init debug_vm_pgtable(void)
>  	 */
>  
>  	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	pte = pfn_pte(pte_aligned, prot);
> +	set_pte_at(mm, vaddr, ptep, pte);

Not here, creating and populating an entry must be done in respective
test functions itself. Besides, this seems bit redundant as well. The
test pte_clear_tests() with the above change added, already

- Clears the PTEP entry with ptep_get_and_clear()
- Creates and populates the PTEP with set_pte_at()
- Clears with pte_clear()
- Checks for pte_none()

If the objective is to clear the PTEP entry before calling set_pte_at(),
then only the first chunk is required and it should also be merged with
a previous patch. 

[PATCH v3 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an existing pte entry 


>  	pte_clear_tests(mm, ptep, vaddr);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  	pte_unmap_unlock(ptep, ptl);
> 

There is a checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
pte_clear_tests operate on an existing pte entry. Make sure that is not a none

total: 0 errors, 1 warnings, 24 lines checked

There is also a build failure on x86 reported from kernel test robot.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
