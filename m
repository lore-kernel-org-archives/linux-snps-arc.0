Return-Path: <SRS0=RmAe=IU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F120AC433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 19:00:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B64619A2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 19:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B64619A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Rqd+oegI4HEk0peFxD4rCbLzr9ZQ9V8oEwXS4mi52U=; b=AqeHAH4KfToA8B9AruPwHX9vo
	WCOKau6ZrsPsOrhL+75MyX6blb1lHh2mrI88H63zoA64tu6dMNi+7sUzJ8QDQlNE2YCgk0pJzMBih
	DCCAapWdTsqs65wmEgNdl8/0BpS9c941dpmA0HzLmRBXTtqioqzFmh286MUXeYSrTObH84dBuOqvK
	33uooWpbD2Zxdvoy3UqzwXdKIFZQM4M8apuxj4QyXDs1QslJ5Kvg+aiJj1NYSPaDfLmW1jOcJ2Ns5
	fFtLSJQi5p9U3TasqFE5KbsXmdfn/D4Xzm9p5LBVjBTLgrKHPVjePxBq2XyMdDcfE0HYfBCyXM98a
	geok4TgUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPn2-00CNSD-0M; Mon, 22 Mar 2021 19:00:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPma-00CNH4-W9
 for linux-snps-arc@desiato.infradead.org; Mon, 22 Mar 2021 19:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=2EJyJcrq06gm3q/Jdx7dDHzPtIm0aUhTMkX60JDg6g0=; b=ay+4yFF+i6CBiMEA4/WsQ0vM90
 oonwhXHrSUzuXF4uBOLEU6ZkKgy4VhB5tLF2OET8X6a6qs6VBiL/xIrbINRIZeEJpjaIbLps+glMz
 gAPJGv5KL8HurcKgN41c0p56GSYyt0vJGIysm5Vc7RakHhKkjCZ+yO9WtY+LBVoR1joVqk1ogF1jq
 FZJIenYCTLHrGppch151kJTaebwVBXGuPCmtfUES+EHas7cadKh+SCfN6HdGS1PrPfbUE7MKCvgmG
 WF9wICxTEVpwQKJMVu7VwtB2TAvdou9IGWA2yxF3lOVOQdif32dOea8Pe7LW2FOHoLysHh01B2IB2
 R15XDjGg==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPlI-008wiR-Ca; Mon, 22 Mar 2021 18:59:01 +0000
Subject: Re: [PATCH] arch: arc: Fix a typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, vgupta@synopsys.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210322122819.2704169-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ff40ae9d-60e7-5c41-0271-6edc5906b219@infradead.org>
Date: Mon, 22 Mar 2021 11:58:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322122819.2704169-1-unixbhaskar@gmail.com>
Content-Language: en-US
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

On 3/22/21 5:28 AM, Bhaskar Chowdhury wrote:
> 
> s/defintion/definition/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  arch/arc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 4392c9c189c4..e47adc97a89b 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -31,7 +31,7 @@ endif
> 
> 
>  ifdef CONFIG_ARC_CURR_IN_REG
> -# For a global register defintion, make sure it gets passed to every file
> +# For a global register definition, make sure it gets passed to every file
>  # We had a customer reported bug where some code built in kernel was NOT using
>  # any kernel headers, and missing the r25 global register
>  # Can't do unconditionally because of recursive include issues
> --


-- 
~Randy


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
