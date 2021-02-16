Return-Path: <SRS0=hb0l=HS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D987C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Feb 2021 05:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCFA6186A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Feb 2021 05:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCFA6186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wd+848Atg+UDd5tyMogGszaXTn2dZE62+FTfteH1vyU=; b=k+GfxGxal2RwWvlUGacRECPJk
	lGh8bEkwFxTLNIHjTCxHSVzEhE3t1/SqLTnth1aYWIee9G5bWSbztR70pe5h+ywMyPDUGsQhGQRNh
	hitu7Q72AkPvqUiC3K2Zt2whY5fOyWhVxrBAcdxqo032WWCQSPaxkb42S4gNEO1InsR3QNC8Io6t9
	krqEgA7vpYJlaSz9jReL+7ARVQ2xSUYpljbh/XbCCIU/J8DA+1FfzibvZCnAkM97sH2urH9663VKf
	Gzgsj9YCR6eWmVId1ArNXIG5UZaltCV40iE5tl7icRZ+popgQCumlUGN1tcYPfhz8xnY9XREYGfCs
	U2Mp8pHOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBsWq-0003mQ-1K; Tue, 16 Feb 2021 05:04:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBsWm-0003lz-QE
 for linux-snps-arc@lists.infradead.org; Tue, 16 Feb 2021 05:04:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id z6so5451934pfq.0
 for <linux-snps-arc@lists.infradead.org>; Mon, 15 Feb 2021 21:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2YpI+iKoMZZUD3Z1xVREz1xTJJ25V96V4TT5cVOnFeQ=;
 b=Sd1wCKsRm91PkghmzuNllFKEYbNkzmmiBtJGHAFP945o+9bTMHEwf3y3LMCiPr3hps
 iYEisGYMSrq2GiJpHmtAlBhxmaeTOr9B3DoFiiwgCqhs5OuH+t0eXTvqwM3DCeAHZ4rN
 YGmG6W45DCwHgeB57UOq8/PDmeVp7+lOp/zxQzQL+RtCoJmeHZNjXEzwNuABuPkzcTyf
 FYkqOiOo1/XIJfJvAkEBDJfk0mcUC7HBPXwjHB5N5zeITdvaIFZBHLnMjYM1aGA02y0k
 n0yALGp6Sbt4mvwprS9mS/DYE+aUzesxmhYHQDG2m3EVvRlGW6zHa8hXUIehO7cx+658
 qhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2YpI+iKoMZZUD3Z1xVREz1xTJJ25V96V4TT5cVOnFeQ=;
 b=m6DKCDz7NulxMq4XaYKiRD1TlKPSDmjAlZtY3wN7yVLe2ONrP14El1GSSxZ3VO/4Aq
 2nwdvxHZkZ/syBJ56Z8+BoCUOstCxCuZQCqywpu3unzsMgc4hK5KkMxTfxPtquKjRvl2
 ncjSCtZm+ssqtX1JNJY/wbZQVC0z5cXVFcmgQ190WDIbnsyNkEhQWZfz4+fBSeOAsmnU
 kjgOXuK4GP/flYdL6kmqUGNbCkY1O+6a5sQ0luivATqweXEZ7lrz7kojo61s6fitdAqU
 cg+bQ6a8nh216lrvi39be5IOuW6+U/K2G++q5SV471ctDU7Iq5KAPF0ewUTxrobow/K2
 mpHA==
X-Gm-Message-State: AOAM530Pd7XrRkFV8PPrS/XI+PDNP32r+QyscAggN9+xTtFSdxZiC24t
 PX2ULoM8NzakhloidVMzuqWL2azDa0U=
X-Google-Smtp-Source: ABdhPJw88S3vcPyT95UPrUdri00RZDU3YF1IpdwPKN0Vk6npYU9ZRmtrVm7cDBWIhxQaBWyZaz+sRw==
X-Received: by 2002:aa7:9056:0:b029:1db:7a51:56df with SMTP id
 n22-20020aa790560000b02901db7a5156dfmr18200294pfo.48.1613451836928; 
 Mon, 15 Feb 2021 21:03:56 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id c22sm16840180pfc.12.2021.02.15.21.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 21:03:56 -0800 (PST)
Subject: Re: [PATCH] arc: Replace lkml.org links with lore
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.kernel.arc
References: <20210210232849.1358703-1-keescook@chromium.org>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <8d0dd35a-4bc2-6762-3ae9-a0bf38961f5a@synopsys.com>
Date: Mon, 15 Feb 2021 21:03:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210210232849.1358703-1-keescook@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_000400_925957_E7888D50 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: Joe Perches <joe@perches.com>, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <abrodkin@synopsys.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/10/21 3:28 PM, Kees Cook wrote:
> As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
> links with lore"), replace lkml.org links with lore to better use a
> single source that's more likely to stay available long-term.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Let me know if you want me to pick this up.

Thx,
-Vineet

> ---
>   arch/arc/include/asm/irqflags-compact.h | 8 ++++++--
>   arch/arc/mm/dma.c                       | 2 +-
>   arch/arc/plat-axs10x/axs10x.c           | 2 +-
>   arch/arc/plat-hsdk/platform.c           | 2 +-
>   4 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arc/include/asm/irqflags-compact.h b/arch/arc/include/asm/irqflags-compact.h
> index 863d63ad18d6..0d63e568d64c 100644
> --- a/arch/arc/include/asm/irqflags-compact.h
> +++ b/arch/arc/include/asm/irqflags-compact.h
> @@ -50,8 +50,12 @@
>    * are redone after IRQs are re-enabled (and gcc doesn't reuse stale register)
>    *
>    * Noted at the time of Abilis Timer List corruption
> - *	Orig Bug + Rejected solution	: https://lkml.org/lkml/2013/3/29/67
> - *	Reasoning			: https://lkml.org/lkml/2013/4/8/15
> + *
> + * Orig Bug + Rejected solution:
> + * https://lore.kernel.org/lkml/1364553218-31255-1-git-send-email-vgupta@synopsys.com
> + *
> + * Reasoning:
> + * https://lore.kernel.org/lkml/CA+55aFyFWjpSVQM6M266tKrG_ZXJzZ-nYejpmXYQXbrr42mGPQ@mail.gmail.com
>    *
>    ******************************************************************/
>   
> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> index 517988e60cfc..2a7fbbb83b70 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -32,7 +32,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
>   
>   /*
>    * Cache operations depending on function and direction argument, inspired by
> - * https://lkml.org/lkml/2018/5/18/979
> + * https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.org.uk
>    * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
>    * dma-mapping: provide a generic dma-noncoherent implementation)"
>    *
> diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
> index 63ea5a606ecd..b821df7b0089 100644
> --- a/arch/arc/plat-axs10x/axs10x.c
> +++ b/arch/arc/plat-axs10x/axs10x.c
> @@ -50,7 +50,7 @@ static void __init axs10x_enable_gpio_intc_wire(void)
>   	 * Current implementation of "irq-dw-apb-ictl" driver doesn't work well
>   	 * with stacked INTCs. In particular problem happens if its master INTC
>   	 * not yet instantiated. See discussion here -
> -	 * https://lkml.org/lkml/2015/3/4/755
> +	 * https://lore.kernel.org/lkml/54F6FE2C.7020309@synopsys.com
>   	 *
>   	 * So setup the first gpio block as a passive pass thru and hide it from
>   	 * DT hardware topology - connect MB intc directly to cpu intc
> diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
> index b3ea1fa11f87..c4a875b22352 100644
> --- a/arch/arc/plat-hsdk/platform.c
> +++ b/arch/arc/plat-hsdk/platform.c
> @@ -52,7 +52,7 @@ static void __init hsdk_enable_gpio_intc_wire(void)
>   	 * Current implementation of "irq-dw-apb-ictl" driver doesn't work well
>   	 * with stacked INTCs. In particular problem happens if its master INTC
>   	 * not yet instantiated. See discussion here -
> -	 * https://lkml.org/lkml/2015/3/4/755
> +	 * https://lore.kernel.org/lkml/54F6FE2C.7020309@synopsys.com
>   	 *
>   	 * So setup the first gpio block as a passive pass thru and hide it from
>   	 * DT hardware topology - connect intc directly to cpu intc
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
