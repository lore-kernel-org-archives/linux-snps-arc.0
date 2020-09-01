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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E169C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:16:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2603920719
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 03:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDqCTz23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2603920719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4Tg+o7i/4v/YaU6ghAZ5PEEd89mXC1bjoQEoPsMam8=; b=ZDqCTz23PfHmb6rnZdH03x76x
	kB/Io4z3HtKpvvQvs7pHe981nrVctl0b+2IDM8LNqXs17a59C83AhkzuZHmJvTFTSLuhF9jIodwEY
	UKBKGAiQ6sqtwL+iE3TbsoZbpW3qZDOb9yFGWt+IsvPf+mo8Y1ABuzvtCQWpA3Nx8jyR7Hn79LsvM
	rLroRa7ZbsiGX9/Udkl3dPbXZ9ZP85CFwYAzcb0aDHm9Q4Yt8Y1TaMRu5d5s53kz15PIDEC8+Adoy
	Epnluf1GeLy2O/TSyfDuCgMkFW8/KOSkAhhCjClf/QKVlV3WMqt1Zz4x2U1/tqK0DS1ZUdNRpSb+3
	TxMMA7mtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwmO-0000jC-5o; Tue, 01 Sep 2020 03:16:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwm4-0000ci-Jv; Tue, 01 Sep 2020 03:16:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A61C630E;
 Mon, 31 Aug 2020 20:15:55 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AFB03F68F;
 Mon, 31 Aug 2020 20:15:50 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
Message-ID: <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
Date: Tue, 1 Sep 2020 08:45:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_231556_850573_D93D5822 
X-CRM114-Status: GOOD (  21.40  )
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
> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
> random value.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 086309fb9b6f..bbf9df0e64c6 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -44,10 +44,17 @@
>   * entry type. But these bits might affect the ability to clear entries with
>   * pxx_clear() because of how dynamic page table folding works on s390. So
>   * while loading up the entries do not change the lower 4 bits. It does not
> - * have affect any other platform.
> + * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
> + * used to mark a pte entry.
>   */
> -#define S390_MASK_BITS	4
> -#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
> +#define S390_SKIP_MASK		GENMASK(3, 0)
> +#ifdef CONFIG_PPC_BOOK3S_64
> +#define PPC64_SKIP_MASK		GENMASK(62, 62)
> +#else
> +#define PPC64_SKIP_MASK		0x0
> +#endif

Please drop the #ifdef CONFIG_PPC_BOOK3S_64 here. We already accommodate skip
bits for a s390 platform requirement and can also do so for ppc64 as well. As
mentioned before, please avoid adding any platform specific constructs in the
test.

> +#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
> +#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
>  #define RANDOM_NZVALUE	GENMASK(7, 0)

Please fix the alignments here. Feel free to consider following changes after
this patch.

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 122416464e0f..f969031152bb 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -48,14 +48,11 @@
  * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
  * used to mark a pte entry.
  */
-#define S390_SKIP_MASK         GENMASK(3, 0)
-#ifdef CONFIG_PPC_BOOK3S_64
-#define PPC64_SKIP_MASK                GENMASK(62, 62)
-#else
-#define PPC64_SKIP_MASK                0x0
-#endif
-#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
-#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
+#define S390_SKIP_MASK GENMASK(3, 0)
+#define PPC64_SKIP_MASK        GENMASK(62, 62)
+#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
+#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
+
 #define RANDOM_NZVALUE GENMASK(7, 0)
 
>  
>  static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
> 

Besides, there is also one checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in

total: 0 errors, 1 warnings, 20 lines checked

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
