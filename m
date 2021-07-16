Return-Path: <SRS0=1Xwl=MI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84C4C12002
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Jul 2021 19:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71CE8611AB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Jul 2021 19:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71CE8611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ClZZEVd6jMiKudOGAAumchQA1ivf5pS+3aVXbCs8oCg=; b=sD0VhK/JqYlPK1Ox1JadjiYPMo
	chXQeybYIpqq79hJegIF7FBAka+xzoufYFl/RZ86qgrGCQNngMrpu9le/eOlpUcFBlZFuwhfZ+8ZZ
	Ayq0vButSyYX+y76yzmHvobFBCQKdqIkXqTxduJNcqcY5Ij+DK/CR02scTaCoGBBgYI1ay3q08xCd
	2sK79+NpXij7I+hNG/fhts85CTfMu0S3PSOK1Y2obGxGa720oggLY0Wupgte7VYjaWUylrcZDLuG2
	FDR20kOBeaN//Rj70Yn0oNz97VaSeA5wUxFBQqvUXhiu3vT+5GduYP7l7uQDrnM8TpMsXq68yLrzK
	rY194BrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Tgi-0059V3-PY; Fri, 16 Jul 2021 19:39:56 +0000
Received: from gateway23.websitewelcome.com ([192.185.50.108])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Tgf-0059Sf-Ur
 for linux-snps-arc@lists.infradead.org; Fri, 16 Jul 2021 19:39:55 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 67358195BE
 for <linux-snps-arc@lists.infradead.org>; Fri, 16 Jul 2021 14:39:31 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 4TgJmqchcoIHn4TgJm57Ej; Fri, 16 Jul 2021 14:39:31 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wG2fHRIYhToISlq/S0FluX42lfgP0GsA8YTjdaC6kf8=; b=FJX96jA0Fdz2e8153jhYYYymUl
 3xQW8aS/aM5g7lahRxIicefg9mrRo9F3xyU5Q7rVETSD2XSBuAaNu5PT30tWyoK/ualYbjKkTsf22
 J3XN6HIz+UADKpWE2WFtyzfUAqNuQEClplsY76QIbcz1+Jm2ioINwIDpYdeF7cqw+gsSQE74xA6+7
 VCN9upjgnbb6TlUSqcuHeiSfyNq4XzJq+vxpiA10b0GoOWTKrqFjYZbK6r+E2yvbMmJEFOVE52AO9
 aXxPWsEihxwphWCK6x4xyTfP88H0hH21z/gKGhNGtRI9iyjDLidMZWhG1PnGLN6hX8qLpLN47+Bhm
 3HkqPWBg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:42938
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1m4TgG-003TNa-Sf; Fri, 16 Jul 2021 14:39:28 -0500
Subject: Re: [PATCH] ARC: unwind: Use struct_size helper instead of open-coded
 arithmetic
To: Len Baker <len.baker@gmx.com>, Vineet Gupta <vgupta@synopsys.com>
Cc: "dean.yang_cp" <yangdianqing@yulong.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210716170344.9150-1-len.baker@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <e39778bc-4059-49d6-79a1-9a207eb319cf@embeddedor.com>
Date: Fri, 16 Jul 2021 14:41:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716170344.9150-1-len.baker@gmx.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1m4TgG-003TNa-Sf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:42938
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_123954_144174_ACA12901 
X-CRM114-Status: GOOD (  11.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 7/16/21 12:03, Len Baker wrote:
> Dynamic size calculations (especially multiplication) should not be
> performed in memory allocator function arguments due to the risk of them
> overflowing. This could lead to values wrapping around and a smaller
> allocation being made than the caller was expecting. Using those
> allocations could lead to linear overflows of heap memory and other
> misbehaviors.
> 
> To avoid this scenario, use the struct_size helper.
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>  arch/arc/kernel/unwind.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index 47bab67f8649..af18052b86a7 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -13,6 +13,7 @@
>  #include <linux/sched.h>
>  #include <linux/module.h>
>  #include <linux/memblock.h>
> +#include <linux/overflow.h>
>  #include <linux/sort.h>
>  #include <linux/slab.h>
>  #include <linux/stop_machine.h>
> @@ -312,9 +313,7 @@ static void init_unwind_hdr(struct unwind_table *table,
>  	if (tableSize || !n)
>  		goto ret_err;
> 
> -	hdrSize = 4 + sizeof(unsigned long) + sizeof(unsigned int)
> -	    + 2 * n * sizeof(unsigned long);
> -
> +	hdrSize = struct_size(header, table, n);
>  	header = alloc(hdrSize);
>  	if (!header)
>  		goto ret_err;
> --
> 2.25.1
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
