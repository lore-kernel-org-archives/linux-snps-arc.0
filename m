Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5D6C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:44:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B856120E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B856120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uH47PwktljE7QWEAmfeBi6lZVjfbDDXdMZSIYKc8QyY=; b=CX20CxlV7e5xYq5vmN/TDt35j
	/YImF0UxdqCPtaTCzfzN+Tm3bhFERKyO/P2O647mxpIrCVT+sKRpeUoYaPHZIcvWOONnK3PAotTls
	tUvRrcyA24wrqPTXoza4qptCsXiD4CNMB9FDHI5MX12s5toa/VtpCLOz8M1sg6cF9L3i6f80pgfhN
	zkA5RUdI2fl4zCRQhZ84T1y2nAvbgjoZaukFvKFUTJId9J5qiM+HFpvLs3a2aqPCZO9u8b4AToXyn
	qer+ZS6/dbZT6AnXjiLaObpVftwWJhsXCnl5AEp4wSOFwLZqWdh2IobdCLKe9RpAppwZZ/Z/hufrj
	+heoSyjdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUHq7-006Jes-IX; Wed, 07 Apr 2021 23:44:03 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHq4-006JeU-EG
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 23:44:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso2140463pji.3
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 16:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9XQC+A6oqoZrIx8iiiFjBbPpyOIWQZGhH2JcX5VRnyU=;
 b=gb6NtwB8b2IJZQrgOT/FcLOjbm/KQ9BzvI2waNZBzervUsHazjqgCQBrr9WmKyVbW/
 K6YXO3+JrvTrHnz3yCGJ3zCNaoCLF/KN4Vwrqfrn6698h/W8e2DhW75A5RFhR4FDhdTZ
 SAKpLwagjNJjhrq/SXCN01FkMWZL6QUBa6A6EDAssSAfFN74EegHJWK8BtTugY9qdUr4
 +oo9vEwaRsAS+r8FzyK8Szz8YepHa5t6tWE0qUjVJTX9Gn+eXZ43uBpHUHadF5av3sNe
 H5Ik1ZvELbqYvosW+f+dfsJb4VsADu84C4S2XAoh3kkCKkwVwev+BQ72e20pNYoSw6Fx
 YfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9XQC+A6oqoZrIx8iiiFjBbPpyOIWQZGhH2JcX5VRnyU=;
 b=APMIL+YuAolTtiWmnb3/v82byHsq2fpTWK7DnL3aMEQ9ikkgCycTaQinEXCPxgzBLf
 BdIZvJT/zOwjpb1H4B9BoOXtk11ERDUlCES/OmpqeqMxPR6tXqzH6yk5t0Yy69ky/qgI
 0rD9EZuYTIvZL+LFtRSkxFpG0I+x6f8xUNpFtc+Tu95qVnP1TSKsLwrqv9cuJhzSDCBz
 iTKrHpvvkJEM7sVwBP0qTgI+4rGASA088Z1h/ayL7QLj78UIQQbt01WQe5cOi4UL+FZw
 6WnmfJXmc6fTalf8HwUNExNiyEzvYqKhGT1Yw9nrfrhQm9Jk8xwmcV8ro37G8k7jNqYj
 zFog==
X-Gm-Message-State: AOAM531qzcmo3NuN+SlMshgONKGrJ1w/nqLoGbMutCucAyj6AQmgOrOO
 I0Od1T8MXiQ3xE7rNCpFNDFC9w==
X-Google-Smtp-Source: ABdhPJwQUhZ4ABGLdoLtp+zgpW8UvZ7b1XU76++nu1Wq3Pdht8Rk15hT+ZZiKcsUsycBd/cS6lUn9w==
X-Received: by 2002:a17:90b:608:: with SMTP id
 gb8mr5526975pjb.121.1617839038742; 
 Wed, 07 Apr 2021 16:43:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r1sm6354859pjo.26.2021.04.07.16.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:43:58 -0700 (PDT)
Subject: Re: [PATCH 21/27] arcv3: TCG instruction generator changes
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-22-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97eb498e-b696-8d3b-3473-9d7bd86701f6@linaro.org>
Date: Wed, 7 Apr 2021 16:43:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-22-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_004400_603515_F512249A 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
> +        if(ctx->insn.limm & 0x80000000)
> +          ctx->insn.limm += 0xffffffff00000000;

(1) bad braces, but
(2) use an unconditional cast to int32_t.

Qemu forces the compiler to use standard 2's compliment arithmetic. We don't 
have to go out of our way to work around the ISO-C lunacy of "undefined values" 
that for no good reason still allows sign-magnitude and 1's compliment arithmetic.

> +    if (ctx->insn.cc) {
> +        TCGv cc = tcg_temp_local_new();
> +        arc_gen_verifyCCFlag(ctx, cc);
> +        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
> +        tcg_temp_free(cc);
> +    }
> +

Lots of non-uses of gen_cc_prologue/epilogue.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
