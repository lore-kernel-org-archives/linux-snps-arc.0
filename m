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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A35C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:17:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3484620719
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PnarLorr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3484620719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SmEf+L1ZkbdRLGA9FTbocqQwP7p6kpR69n/0TgUmjzc=; b=PnarLorr215oInNecHu1ziX9G
	gV4EdiiyqUimuZ3VYVj/OV2HO5LOAfNkKDYCUQeuudlIuYohPrzrShlFoGZBG2KlOKAVHLIhuEuLQ
	IYhQVd2cLd0pxfJ3MQFqMtg1XbZanYkTVOwTSqCTpmY4Z1/jQ/TWn+pz7NkoDbUxyhRatXfxZ7NEq
	mQ4Mz7eBcdGu/8MZ30EE6Y4y+p2LYzEzDYGMaLxlkm6XAnEdHl9sv79sQw2KBRiFFzAXwTjC0eS/y
	JtBZKBFxHiQzzo2LK6y6m58lWFwYFjBInGHioY/EprXHaRSGM7iGFkj82sW750XpyaLYVN3CN5bjn
	2/HsxDXKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwnU-000155-L5; Tue, 01 Sep 2020 03:17:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwnI-00010Z-5W; Tue, 01 Sep 2020 03:17:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 173DA30E;
 Mon, 31 Aug 2020 20:17:11 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3437E3F68F;
 Mon, 31 Aug 2020 20:17:05 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 04/13] mm/debug_vm_pgtables/hugevmap: Use the arch
 helper to identify huge vmap support.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-5-aneesh.kumar@linux.ibm.com>
Message-ID: <eaf15275-f1b1-c5c7-f649-d2b43e4b4ac4@arm.com>
Date: Tue, 1 Sep 2020 08:46:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-5-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_231712_407788_AFF47F14 
X-CRM114-Status: GOOD (  19.63  )
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
> ppc64 supports huge vmap only with radix translation. Hence use arch helper
> to determine the huge vmap support.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index bbf9df0e64c6..28f9d0558c20 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -28,6 +28,7 @@
>  #include <linux/swapops.h>
>  #include <linux/start_kernel.h>
>  #include <linux/sched/mm.h>
> +#include <linux/io.h>
>  #include <asm/pgalloc.h>
>  #include <asm/tlbflush.h>
>  
> @@ -206,11 +207,12 @@ static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
>  	WARN_ON(!pmd_leaf(pmd));
>  }
>  
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>  static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd;
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pmd_supported())
>  		return;
>  
>  	pr_debug("Validating PMD huge\n");
> @@ -224,6 +226,10 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(!pmd_none(pmd));
>  }
> +#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
> +static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot) { }
> +#endif /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
> +

Some small nits here.

- s/!CONFIG_HAVE_ARCH_HUGE_VMAP/CONFIG_HAVE_ARCH_HUGE_VMAP
- Drop the extra line at the end
- Move the { } down just to be consistent with existing stub for pmd_huge_tests()

>  
>  static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
> @@ -320,11 +326,12 @@ static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
>  	WARN_ON(!pud_leaf(pud));
>  }
>  
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>  static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
>  {
>  	pud_t pud;
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pud_supported())
>  		return;
>  
>  	pr_debug("Validating PUD huge\n");
> @@ -338,6 +345,10 @@ static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!pud_none(pud));
>  }
> +#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
> +static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot) { }
> +#endif /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
> +

Some small nits here.

- s/!CONFIG_HAVE_ARCH_HUGE_VMAP/CONFIG_HAVE_ARCH_HUGE_VMAP
- Drop the extra line at the end
- Move the { } down just to be consistent with existing stub for pud_huge_tests()

>  #else  /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
>  static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
>  static void __init pud_advanced_tests(struct mm_struct *mm,
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
