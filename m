Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B70EC433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F512083B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Imyetqen"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F512083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yuIi6OscG2jn7qBtfF6pgowVkt9YCbDkMNV/Wiz4p/U=; b=ImyetqenZhByuZq/LTMPgwSdY
	RTRLZTN2g25Q4IKE/GLjDcZXKD9A9NV5uDBKIbMl8Q79wieJvYciGS+VoK2dVtphDZJ5OUdQ8MrZX
	FXUjbPOPuk5PMAkQi+2OLPdbW6W/DSfT5PxsuNmHWBtYBIyk6ZwwRfAVmEY1p0aeQ1J8IgKAB3esu
	5sSaV8mgato1nbjdzEiLoOsR4HwlxIn5k5Rl8Lifo4zDhfHsvHGF+hkP7KDkfFcydgPwSpv+EEpWw
	4QTX3Svo/YShva3kx5fEcpYL7GV5ysqBn7eDfH61WlnhDCUkRmIaQfqS5NNz/R4Do9pm6hDTJ8Hxl
	s7DrmDSbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwkA-0008Da-Vq; Tue, 01 Sep 2020 03:13:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwjt-00087R-Pz; Tue, 01 Sep 2020 03:13:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 594C330E;
 Mon, 31 Aug 2020 20:13:34 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 820923F68F;
 Mon, 31 Aug 2020 20:13:29 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 01/13] powerpc/mm: Add DEBUG_VM WARN for pmd_clear
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-2-aneesh.kumar@linux.ibm.com>
Message-ID: <e90b9886-1fbf-eacc-5108-acc1af2cac59@arm.com>
Date: Tue, 1 Sep 2020 08:42:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-2-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_231341_921293_5D854238 
X-CRM114-Status: GOOD (  20.22  )
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
> With the hash page table, the kernel should not use pmd_clear for clearing
> huge pte entries. Add a DEBUG_VM WARN to catch the wrong usage.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 6de56c3b33c4..079211968987 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -868,6 +868,13 @@ static inline bool pte_ci(pte_t pte)
>  
>  static inline void pmd_clear(pmd_t *pmdp)
>  {
> +	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
> +		/*
> +		 * Don't use this if we can possibly have a hash page table
> +		 * entry mapping this.
> +		 */
> +		WARN_ON((pmd_val(*pmdp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
> +	}
>  	*pmdp = __pmd(0);
>  }
>  
> @@ -916,6 +923,13 @@ static inline int pmd_bad(pmd_t pmd)
>  
>  static inline void pud_clear(pud_t *pudp)
>  {
> +	if (IS_ENABLED(CONFIG_DEBUG_VM) && !radix_enabled()) {
> +		/*
> +		 * Don't use this if we can possibly have a hash page table
> +		 * entry mapping this.
> +		 */
> +		WARN_ON((pud_val(*pudp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));
> +	}
>  	*pudp = __pud(0);
>  }

There are two checkpatch.pl warnings for this patch.

WARNING: line length of 105 exceeds 100 columns
#27: FILE: arch/powerpc/include/asm/book3s/64/pgtable.h:876:
+               WARN_ON((pmd_val(*pmdp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));

WARNING: line length of 105 exceeds 100 columns
#41: FILE: arch/powerpc/include/asm/book3s/64/pgtable.h:931:
+               WARN_ON((pud_val(*pudp) & (H_PAGE_HASHPTE | _PAGE_PTE)) == (H_PAGE_HASHPTE | _PAGE_PTE));

total: 0 errors, 2 warnings, 26 lines checked

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
