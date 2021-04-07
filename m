Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A169DC433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:07:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4599461181
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4599461181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=djXSg9uEhDyH9P6A/m3U653qvTzC2/YefC1NmDglRf4=; b=GWfCSeBwG2cMY4LHdb0ttP6FR
	tI5n+V0C1OMfjfHHf/hqwanXtFFGiMhNdDQW/TfqXiiIpxVw6T8BJ+AkC3YNa6AjmsVsZqLrooOnx
	1UWpEsRgrsP9tXVzpORKmgY56o1EaJk/sd6e6+EX5Mn/CV/YdqrQKY0sSKzSu6gpVRl1di+QVv0zF
	iJjJWBgfL2q/9nYO8dZyHPbOexh4gxDEZPMX5pdWh3PSa/pofeSj3L9KADxYAfhb6YB/qEjGUEJcO
	KSJW27WiYaqi7cuB+zBRllTr5LuFn5c+06wVk+tqiIogGLffQ+OXkR9UGDesN38ZnreeN8caSdHh7
	UPKK9SOuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUHH5-006F3Q-QG; Wed, 07 Apr 2021 23:07:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHH3-006F2o-1R
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 23:07:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d8so30892plh.11
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=04fotQynVTU4+wBpOcUlkGPCMes/rCmQxrfwUr4kB7M=;
 b=buI/JBoZO/WLOhtMBDmvnIqMsPpEtbUePDnKgfqy6Qg0QR6OQTfG3VgftZyQ7OMMkH
 SNyDvThq1zKM5CYvZBLEJFk2z/zPtKIMCREd3rTEp1WmGsLQ3eIM6UWt7ziFz6PKLob1
 +vXbJUmt/nKVyj4ozCQzu7iq5a35N7qpj7MOnI50vJkS9yG5Gb8MsTmREJRAJ2txnCjS
 Ee1f9TpkoMgI9VGTAlyUgAI1QlUk5d3TyZoaFQJHY7kRX0GiC2aVux67thamcY5UVPni
 5wJ3LR+xQVyw2Qzj6INjNQbAzhUhLemlUfwhMJMNmm/y9ZcybYXuV6YSEGjiVh9uv3zc
 Ji4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=04fotQynVTU4+wBpOcUlkGPCMes/rCmQxrfwUr4kB7M=;
 b=WaHSI7kE8Imt3mswniRnzkBoRImh2NNWth/xKPJsKNNoQMC0oiqJaUyzrtFmF723SD
 2RWdC9Nj7RTvjtEanQ8e0ukCfZPDRY3V7WQWXYrpDGxVEq1GQm5FVPVfGz4jkF3q/jIW
 68ew4ANMDHsiGmg03wcHCNwlEOYxOoNDtaGU8At1eyLwwcL17OjoAWWgFHl2lXYvfaZx
 bsIZ+nKFYr6BAAVqlR4c4ljdWH6khyz6GM8lSMWxmuPQED3xiA2yPnhZXtwfTFMYtS05
 KGasfABW2acZChLwgiRu7/vlv11pUHB1e7wRTOW25C1OPUv8rMRkMWROF1bvdwrB7tfL
 vzfg==
X-Gm-Message-State: AOAM533XaL/GNXYqDZSIFKuFDQTVNQMlUjRro2E/7jhgrT7/3CGIc4rF
 +rre63e8VGdc8LTq37lUL/FUhw==
X-Google-Smtp-Source: ABdhPJzpbWzOXL/jAu3iYirepq9u44O409YEBXG22Nqs8IbE6jQmhtimcnsJyRFxKtcYlmt2BLkXmg==
X-Received: by 2002:a17:902:cec1:b029:e8:bf66:42f6 with SMTP id
 d1-20020a170902cec1b02900e8bf6642f6mr5051556plg.16.1617836867456; 
 Wed, 07 Apr 2021 16:07:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z192sm22497300pgz.94.2021.04.07.16.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:07:46 -0700 (PDT)
Subject: Re: [PATCH 18/27] arcv3: Decoder code
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-19-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95b710d4-7379-85ab-63b3-9cf798fe1ee2@linaro.org>
Date: Wed, 7 Apr 2021 16:07:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-19-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_000749_227293_1DC496AC 
X-CRM114-Status: GOOD (  10.37  )
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
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> ---
>   disas/arc.c                |   51 +-
>   target/arc/decoder-v3.c    | 1547 ++++++++++++++++++++++++++++++++++++
>   target/arc/decoder-v3.h    |  322 ++++++++
>   target/arc/flags-v3.def    |  103 +++
>   target/arc/operands-v3.def |  133 ++++
>   5 files changed, 2147 insertions(+), 9 deletions(-)
>   create mode 100644 target/arc/decoder-v3.c
>   create mode 100644 target/arc/decoder-v3.h
>   create mode 100644 target/arc/flags-v3.def
>   create mode 100644 target/arc/operands-v3.def

Do we really need a complete copy of the v2 decoder included with the v3 decoder?


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
