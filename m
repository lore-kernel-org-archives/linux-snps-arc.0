Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13098C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:31:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FB4610D2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FB4610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jLK7ZWyUZAV834uWztrNB2wTi70dPz+DEe6+Cw9a3jE=; b=hKfbuuBpxe/XVmUU3VLfnJKxO
	I9GluAzasj3mt0P4+vuaB9ZB1tYcaEM92hD15Y6TgfPBT/ngzhKiez11a+Z4pyImFHU3VZql4mIFV
	VsrxuwPFapcpo84aZbpn/EBbOo6EWmRlKBDJkeFnZzUm7E62S+2ZyuR8lf40Ov31R7KaM96oLPVVh
	f5SYZY6cEHjoC0ekuPqbhZewcGAe7z6GtEKo8djEKFaQbzw/K0H6K9cjoufLUieTUETUEU+iZSDGA
	atQOLtUdLY4KuyAC8gx7+OD2BJO3x8zQkLck2hjKEw9EEAzil+dv4SWN9UEIiKnpXegwIdenqPaa7
	uJhVsuJyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEpI-005xYY-QF; Wed, 07 Apr 2021 20:31:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEpE-005xXH-PJ
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 20:30:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id l1so9932279plg.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W0hc5Bm7oMiIDOpoPlXJJxGGtWi0inbZKjsUytplVDs=;
 b=GQ53kQfjgTGTfb0LkeP+wQ7dl1EYXPCCAXC2awna7sX3UzRV0UdXtkfw+glEW7iLBS
 FZTexhVBW9wJugCRyb8FFwrzr/wki/LBDyKZR4KhS6UE6tVsx4baUmNae9kM3kb65m3k
 VoIOH9YtLKBk99T2wzRQqWcDvAe83+eIsUMQ0xXU/F3cmkor9tXKdK4KssRZdCD4bgkp
 rXeGtV/+nle/tFZ8ai2LiKwrgDE+0ApB7rs7TW/fCiNKATM5SKAVrtvQCPXOPlnyDEEb
 eMZef2Cint/3BP5z/74Ou+4bmx+mJ4dXqY6+ep+cTgMFAz+2TdI2wAOhPHWCZ9NmUT1c
 YLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W0hc5Bm7oMiIDOpoPlXJJxGGtWi0inbZKjsUytplVDs=;
 b=q6tPCIDMF+Np7dohUvKXyzPvVNgjtkzZCEbqKSH46IxZ+o4xptdmro7fxZiqP/Gh0s
 LW/vuvZQOzHW4AdJkyqScjCD6KH3XTQ/Dv5zaVEVn1r/2GxVJdK8qFnEvam6lmqy+BUR
 qqIX9JnmiF8UqLeuyRKUoRvGgMhwkEpDlYlBznPAVZ93vmbJJJ03gAvGVv9wfwgmKulN
 vw2embekt1Qb53/1YQQ9B3xcA+gLM1xEUAWaR6jZUigDYq+HBAdS86v46IrsBtzi9/Vb
 TXZYcKuYBm3ckfzKDCLntOIdeRJIDnBcWnokFYY0HfADk3U7aeaRblzIU+67jqb2Zz94
 e7pQ==
X-Gm-Message-State: AOAM5301sG6T2VVRIHNDML+hm54TtTgrfyPiIBAE/dT5BDoLwrPecyr/
 A9+yzfMzJ7HtWOgDd/1GK7oIVA==
X-Google-Smtp-Source: ABdhPJxw7cWxVANg8g6NqBNkKplxqoBhNKtvRggsUOzT5zu6rKQgT1LPJeeBn6tzf14BUHumtDLMvg==
X-Received: by 2002:a17:90a:474e:: with SMTP id
 y14mr5068956pjg.127.1617827454964; 
 Wed, 07 Apr 2021 13:30:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x20sm6199291pjp.12.2021.04.07.13.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 13:30:54 -0700 (PDT)
Subject: Re: [PATCH 14/27] arc: Add support for ARCv2
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-15-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <598705ec-c0fb-1808-e532-e764e2d87104@linaro.org>
Date: Wed, 7 Apr 2021 13:30:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-15-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_213056_980420_671B068E 
X-CRM114-Status: GOOD (  13.48  )
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

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> diff --git a/configure b/configure
> index 535e6a9269..80d993fac7 100755
> --- a/configure
> +++ b/configure
> @@ -680,6 +680,8 @@ elif check_define __arm__ ; then
>     cpu="arm"
>   elif check_define __aarch64__ ; then
>     cpu="aarch64"
> +elif check_define __arc__ ; then
> +  cpu="arc"
>   else
>     cpu=$(uname -m)
>   fi

This is host related, not target.

> diff --git a/disas.c b/disas.c
> index a61f95b580..a10fa41330 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -208,6 +208,8 @@ static void initialize_debug_host(CPUDebug *s)
>       s->info.cap_insn_split = 6;
>   #elif defined(__hppa__)
>       s->info.print_insn = print_insn_hppa;
> +#elif defined(__arc__)
> +    s->info.print_insn = print_insn_arc;
>   #endif

As is this.

Until arc can self-host qemu, you don't need them.

> --- a/hw/arc/Makefile.objs

Leftover from before meson.build.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
