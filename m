Return-Path: <SRS0=nWz8=IB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EAFC433DB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Mar 2021 14:36:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D3E364ED9
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Mar 2021 14:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D3E364ED9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C+zod8GepKacVnKgB3U45cwOKk/UEcUnewg1ykn/D00=; b=cXeo9YXRDzOBnCiowuBpB7dIS
	KjH+lLfo7Z2BsP7q1dJV2qz0CdaQzhKhILI4LmpLRsU+rHvpDg7w2CvEwAZBNVzPKVGrtlBXvtHi0
	EIlX3x8vZ6qoU3ijKVOAr0suZD+RdRNtRK2ADcZdZrnmyWnMpSpJ76vJAGa1Hvv+uKiJAHD0u7h+P
	+DJCGhuI6OrxImcupttipk5S+YZa9d+ISAU1C57XbEqY7gfE4JLZap1E7yEfrk7FXISRA4t2VBFgd
	93pzhC38hQTIdb/ztf2r+4n1YSeLBjBa93rI4zwElenF7UcjrrpJ1tgx4emKsPQloRjPx5PTpCQQG
	5bMCNs87g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSc4-005AFy-Vt; Wed, 03 Mar 2021 14:36:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS9P-0053cT-2m
 for linux-snps-arc@desiato.infradead.org; Wed, 03 Mar 2021 14:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=wht29kUAgkDTBmrHaW1q6XJ3NXEO35xEuxud/bR3ziE=; b=N5+XwIZx6mhPnAwbRklAC39HSe
 v1cSJaQF+dviq82seCT+Yr/t3c3lsVDAwMeOVy3wZyzBZaEaRUbsMmSyZJMEyFHiplp2HTi2LwMDK
 vNkk7e3yuPUOUtZet+5uPBZu5J8HEyetTZMeFik7KGT07LG3qHVNB7tqDd39GFBYFgza+KwLEhiJw
 654Mto0WPfsOeW7Ish32kDXsbh+RiQIXWyExG/V3pp9zk7UCObwUIODhAdFU9PN5hZ/HSuK2A6XqY
 nP6TtG2hrFlP8kmpdA5Wq8TK+hX2wmcxYJtdSL3LyVsObV9mfh5veTvLhzkaQBTuoYfHworw/YRXb
 kVpW64wA==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHAHj-0007Vq-85
 for linux-snps-arc@lists.infradead.org; Tue, 02 Mar 2021 19:02:21 +0000
Received: by mail-pg1-x532.google.com with SMTP id n10so14466380pgl.10
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Mar 2021 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wht29kUAgkDTBmrHaW1q6XJ3NXEO35xEuxud/bR3ziE=;
 b=AZrrmzliYKd1I2bdE1uPjy6MzgCQYn94j+rrwAbHdfT3faZtrRh0wbfaDLNVvtb2qt
 nQaiXureHZxB8+QeqHQXy2X7UiCopVHmJxQd0Tq3jOiFpt3isgYaVZq9xWfn+jY/wrt+
 DJEd6A/bDeZbMJCIigCLzlZA7nHZE2PDIcYqQlcakuxPG+BwYeuA6EbVTkdEuhxJ8q06
 2z/6QTTRESwT3FwsLoeLM1YJFu0fQXoDnhpa7nWKycx9Ky5khf3L7OC7/+uqguXUNSyD
 OF5RABsitB65mU1xlpVZSuBxZCuPJj0w4FEnC4ZR/j8tpfSAecZkr+f1mXSqqSwVGjVm
 26xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wht29kUAgkDTBmrHaW1q6XJ3NXEO35xEuxud/bR3ziE=;
 b=c5b2XErvGMVJaKU9W0b+17h5UqWvh+5o1XPdTr3vLfOY9wlp6yPu6HSSs3gPLONi4z
 NLGZdLarjup5d2EfKCHRQOS5V83SXmE1XfvU64AMtOaBCZj3a5nWp+0J9dfqaUiuC5pq
 daAeBkcw8m+LJE8K6FKvOurX3XxWJRzCHjFx7fiwQEX+tNZqouiBIZxPTVRWhbyE9P/K
 T3HfoQsB538Ul/GO4YDZ8ZqVETMepm3iWA5VDPOf3u91bWHaOUj/ARvUW3fUVglyBP8W
 fGlcnyX/QMI4xRFeVFVL4n+XVcjulKjPzA2F3vCFd9g/3NrVHG24/EF48WnFJwX6KXRN
 yJTg==
X-Gm-Message-State: AOAM533JinPpV8e1IIesjHGool14ww4oB/O+7j68rgumSsSYsKkUZ6SX
 0dv3fv5Q56o9rQEOYDJ1nk4=
X-Google-Smtp-Source: ABdhPJywrkBqp9m6xKkrLJLVnWvCouj4D7AyUfUr4U23MJmh3YdXp//gK+9wnKB64E695F64o9FIYA==
X-Received: by 2002:a63:1021:: with SMTP id f33mr1065584pgl.409.1614711674219; 
 Tue, 02 Mar 2021 11:01:14 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id e22sm18629680pgk.56.2021.03.02.11.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 11:01:13 -0800 (PST)
Subject: Re: [PATCH] arc: kernel: Return -EFAULT if copy_to_user() fails
To: Wang Qing <wangqing@vivo.com>, Jens Axboe <axboe@kernel.dk>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.kernel.arc
References: <1614600349-15662-1-git-send-email-wangqing@vivo.com>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <bed81c02-97e0-9905-0dd3-6064a54691ff@synopsys.com>
Date: Tue, 2 Mar 2021 11:01:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614600349-15662-1-git-send-email-wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_190221_436106_1AECF80C 
X-CRM114-Status: GOOD (  16.38  )
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

On 3/1/21 4:05 AM, Wang Qing wrote:
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return -EFAULT if the copy doesn't complete.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Do you want me to pick this up via ARC tree ?

Thx,
-Vineet

> ---
>   arch/arc/kernel/signal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
> index a78d8f7..fdbe06c
> --- a/arch/arc/kernel/signal.c
> +++ b/arch/arc/kernel/signal.c
> @@ -96,7 +96,7 @@ stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
>   			     sizeof(sf->uc.uc_mcontext.regs.scratch));
>   	err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
>   
> -	return err;
> +	return err ? -EFAULT : 0;
>   }
>   
>   static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
> @@ -110,7 +110,7 @@ static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
>   				&(sf->uc.uc_mcontext.regs.scratch),
>   				sizeof(sf->uc.uc_mcontext.regs.scratch));
>   	if (err)
> -		return err;
> +		return -EFAULT;
>   
>   	set_current_blocked(&set);
>   	regs->bta	= uregs.scratch.bta;
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
