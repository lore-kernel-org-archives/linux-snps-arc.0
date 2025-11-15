Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C90CEB2C7
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 Nov 2025 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66CCmqGm+0qieBgd/AWJAAcYqN5uGcRzbwPRCYyFGCI=; b=RWMMqlK+gbk0p2
	LpKc53tgzb0UGZUZBznunX76+PkaJf+rBRUAW8qjLjGsxMLj0rJdFelaIUMKFwlvQ8E/rxmEfMwVq
	LRplY2OUWFqgciOpuYe9TW9oeY7YfLFJ1Qrf5lgavV70ghSj89CC2mT0BmtT8/EAUzEiXGyfTphDA
	liy4lIT83IZ8oXxTxv3GaJsYc0g1pXJcExzTgwnjQZzRj2kV6Fmh2UvKAw3jeq5f7jjXvFYYxYkvl
	vexoK5p0wzmQO88Jhe/XQY85zlRNEVrtPxCMKpqn5RsY31T43u7LA5VECjX7PlrfOMi49vNpSsYop
	M9D1jA39kDgTqFC22lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCGP-0000000Dcyw-0klz;
	Sat, 15 Nov 2025 09:08:09 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCGM-0000000Dcxm-0L5Z
	for linux-snps-arc@lists.infradead.org;
	Sat, 15 Nov 2025 09:08:07 +0000
Message-ID: <d58a6475-15f2-4e7c-b384-146623ce55fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763197672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuGUgkNBhxAyHgvlC2Rtd4xfIzwmCu+LetoLyFbR46Y=;
	b=kNysVfHsdj+0Qseu6HcgTet+NVlC+EYvKu/FOU10GOWi/nxL8FolfSVt4/dADuwt4v6eGO
	ihunYFsAestSz7zz/fhdf7/MlU9A15UpPrX0hNXtoFRGbUs2QnpKQ2keo3fNajZYWhiuZW
	+qGkodE+uZWV2JrmnmGzM7YxCyKUZy4=
Date: Sat, 15 Nov 2025 17:06:51 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Magnus Lindholm <linmag7@gmail.com>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
 <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010806_254562_0B12DC46 
X-CRM114-Status: GOOD (  12.30  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Magnus,

On 11/15/25 3:13 AM, Magnus Lindholm wrote:
> Hi,
> 
> I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
> to build the kernel (on Alpha) with this patch applied.
> 
> I made the following changes in order to get it to build on Alpha:

Thanks! Will fix it in the next version.

> 
> diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
> index 7e9455a18aae..6761b0c282bf 100644
> --- a/mm/pt_reclaim.c
> +++ b/mm/pt_reclaim.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #include <linux/hugetlb.h>
> -#include <asm-generic/tlb.h>
>   #include <asm/pgalloc.h>
> +#include <asm/tlb.h>
> 
>   #include "internal.h"
> 
> 
> /Magnus


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
