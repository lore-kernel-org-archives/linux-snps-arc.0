Return-Path: <SRS0=nlpu=JF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3201AC433ED
	for <linux-snps-arc@archiver.kernel.org>; Thu,  8 Apr 2021 00:20:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D19D601FC
	for <linux-snps-arc@archiver.kernel.org>; Thu,  8 Apr 2021 00:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D19D601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+0hQYirhaxKK8GuiBfpuLEC/mvg5fUn/We9ScueWvPQ=; b=SPvGy416NxlJPeOxuDpBMgEdb
	jLDlQ4WPHV6JsFL/DBuftPKmSex4FI5eUQMTdsguW+SpvQk6WHe9wU7oXlnYbgcbtkSQQJBsWsg/C
	qGQDfjUvT0sPHxs8OkLW7RnmAiSlobC5x7Gb8QCYbZMubT4OaIwyTEVrZ+QHtwJXSfsdAusDFlncr
	BDF6wyW1G31+aEJiyCeq/J78x3pyRrJjXsFFnMc94UmdzjvoiEuIQgkr1ypDbYGCgD2YnBBHkfWtN
	4Zm0ugWexC6U/8kGqgP6vUsrHkbZzYlhgdiXZLYfa3TXJ55y4FOqB/mt0oZOTI8xGs9/FTO5sHQCm
	cdDylTx1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUIPf-006LqN-Mt; Thu, 08 Apr 2021 00:20:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUIPZ-006LpN-1R
 for linux-snps-arc@lists.infradead.org; Thu, 08 Apr 2021 00:20:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id t7so106764plg.9
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yu83XVdIKD7pvteC9vKYdzET4e0VlNA1bk4jJzLoGnM=;
 b=KxKL54Ec4sIjK/PyWFzAXBl+llmLIJobzIc+KFN26ZLZ76v9qFJOPa0pfh0In15xQ4
 WTnohW0WmIDOwIMBxQNuY6vzNQXt9JNa1/Si4BZUEdCeofTXJFvDMFrKjwXb7ejNHmjF
 T/p8Os3YVUZvYdQNZAkCld5p5lxq9F3mcqJruLr6udooc8KRxxoSPb63otOfcOx2jZVJ
 BmXv6DuF9ZjolPo+heKCoAqnpBa6xyjJ7nvTfTELPYnmwglNCQfc5lKPb2tw6GOlgCGU
 6p1xDmowmMq7uvkdwZYH1XY7rSeVRDd7ZbpgFua4pQUpPqiGTrMC9IBTadGeUpwdn4nX
 M2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yu83XVdIKD7pvteC9vKYdzET4e0VlNA1bk4jJzLoGnM=;
 b=ZFCTT/Bg5fBIn7GJxvKO9nn8BgswLezwkVCdCrAp5nxsUCOau1nM2ZDLziADTBosbQ
 bKziFQz8mUITRCW8ZtQudIE84+mUlC/Ausa3GuFrp+bnnhoUWYXB54YZIg9DO+4j6uRH
 WUY3TMZuRLrNChkVGVrqulQAN906fedcCdYf/F9TPIg18eAedGoW4v4gAWzjrznPlYMs
 NsjKIZL7KRdph6JOZTqjDMGHL3z1hPR4vlPIu4sbDyBBxrwk5sc+5X91y8b8mwoH0G1G
 eKJn6BtXVyaEwoZbRVWQd3YZndocKFqkVmFOrNb5/mgcMXEsVxBpKp9moCUonyON9M7b
 FZLA==
X-Gm-Message-State: AOAM531aJhnw8OAS+iLKAan2JfBtKnTSCk8VhbnywAmJOB+OQPgWEUnf
 ApC83p+h4rcCl2+r9sTeW5BC5Q==
X-Google-Smtp-Source: ABdhPJzFJnSxaI3Bx6jbGlLg1tEW1kOeKGc9SgblMMhHbkz7C4ymWBb+9hgLYSrEjwp76J+vTquF8w==
X-Received: by 2002:a17:903:2306:b029:e7:1c8d:63fc with SMTP id
 d6-20020a1709032306b02900e71c8d63fcmr5291275plh.35.1617841239010; 
 Wed, 07 Apr 2021 17:20:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y189sm22072985pfy.8.2021.04.07.17.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 17:20:38 -0700 (PDT)
Subject: Re: [PATCH 07/27] arc: TCG instruction definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-8-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2288398-1192-5abf-b671-9f57d81200ae@linaro.org>
Date: Wed, 7 Apr 2021 17:20:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-8-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_012041_943415_7292AD88 
X-CRM114-Status: GOOD (  14.01  )
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
> +/*
> + * ADD
> + *    Variables: @b, @c, @a
> + *    Functions: getCCFlag, getFFlag, setZFlag, setNFlag, setCFlag, CarryADD,
> + *               setVFlag, OverflowADD
> + * --- code ---
> + * {
> + *   cc_flag = getCCFlag ();
> + *   lb = @b;
> + *   lc = @c;
> + *   if((cc_flag == true))
> + *     {
> + *       lb = @b;
> + *       lc = @c;
> + *       @a = (@b + @c);
> + *       if((getFFlag () == true))
> + *         {
> + *           setZFlag (@a);
> + *           setNFlag (@a);
> + *           setCFlag (CarryADD (@a, lb, lc));
> + *           setVFlag (OverflowADD (@a, lb, lc));
> + *         };
> + *     };
> + * }
> + */
> +
> +int
> +arc_gen_ADD(DisasCtxt *ctx, TCGv b, TCGv c, TCGv a)
> +{
> +    int ret = DISAS_NEXT;
> +    TCGv temp_3 = tcg_temp_local_new();
> +    TCGv cc_flag = tcg_temp_local_new();
> +    TCGv lb = tcg_temp_local_new();
> +    TCGv lc = tcg_temp_local_new();
> +    TCGv temp_1 = tcg_temp_local_new();
> +    TCGv temp_2 = tcg_temp_local_new();
> +    TCGv temp_5 = tcg_temp_local_new();
> +    TCGv temp_4 = tcg_temp_local_new();
> +    TCGv temp_7 = tcg_temp_local_new();
> +    TCGv temp_6 = tcg_temp_local_new();
> +    getCCFlag(temp_3);
> +    tcg_gen_mov_tl(cc_flag, temp_3);
> +    tcg_gen_mov_tl(lb, b);
> +    tcg_gen_mov_tl(lc, c);
> +    TCGLabel *done_1 = gen_new_label();
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp_1, cc_flag, arc_true);
> +    tcg_gen_xori_tl(temp_2, temp_1, 1);
> +    tcg_gen_andi_tl(temp_2, temp_2, 1);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, temp_2, arc_true, done_1);
> +    tcg_gen_mov_tl(lb, b);
> +    tcg_gen_mov_tl(lc, c);
> +    tcg_gen_add_tl(a, b, c);
> +    if ((getFFlag () == true)) {
> +        setZFlag(a);
> +        setNFlag(a);
> +        CarryADD(temp_5, a, lb, lc);
> +        tcg_gen_mov_tl(temp_4, temp_5);
> +        setCFlag(temp_4);
> +        OverflowADD(temp_7, a, lb, lc);
> +        tcg_gen_mov_tl(temp_6, temp_7);
> +        setVFlag(temp_6);
> +    }
> +    gen_set_label(done_1);
> +    tcg_temp_free(temp_3);
> +    tcg_temp_free(cc_flag);
> +    tcg_temp_free(lb);
> +    tcg_temp_free(lc);
> +    tcg_temp_free(temp_1);
> +    tcg_temp_free(temp_2);
> +    tcg_temp_free(temp_5);
> +    tcg_temp_free(temp_4);
> +    tcg_temp_free(temp_7);
> +    tcg_temp_free(temp_6);
> +
> +    return ret;
> +}

I must say I'm not really impressed by the results here.

Your input is clearly intended to be fed to an optimizing compiler, which TCG 
is not.


> +/*
> + * DIV
> + *    Variables: @src2, @src1, @dest
> + *    Functions: getCCFlag, divSigned, getFFlag, setZFlag, setNFlag, setVFlag
> + * --- code ---
> + * {
> + *   cc_flag = getCCFlag ();
> + *   if((cc_flag == true))
> + *     {
> + *       if(((@src2 != 0) && ((@src1 != 2147483648) || (@src2 != 4294967295))))
> + *         {
> + *           @dest = divSigned (@src1, @src2);
> + *           if((getFFlag () == true))
> + *             {
> + *               setZFlag (@dest);
> + *               setNFlag (@dest);
> + *               setVFlag (0);
> + *             };
> + *         }
> + *       else
> + *         {
> + *         };
> + *     };
> + * }
> + */
> +
> +int
> +arc_gen_DIV(DisasCtxt *ctx, TCGv src2, TCGv src1, TCGv dest)
> +{
> +    int ret = DISAS_NEXT;
> +    TCGv temp_9 = tcg_temp_local_new();
> +    TCGv cc_flag = tcg_temp_local_new();
> +    TCGv temp_1 = tcg_temp_local_new();
> +    TCGv temp_2 = tcg_temp_local_new();
> +    TCGv temp_3 = tcg_temp_local_new();
> +    TCGv temp_4 = tcg_temp_local_new();
> +    TCGv temp_5 = tcg_temp_local_new();
> +    TCGv temp_6 = tcg_temp_local_new();
> +    TCGv temp_7 = tcg_temp_local_new();
> +    TCGv temp_8 = tcg_temp_local_new();
> +    TCGv temp_10 = tcg_temp_local_new();
> +    TCGv temp_11 = tcg_temp_local_new();
> +    getCCFlag(temp_9);
> +    tcg_gen_mov_tl(cc_flag, temp_9);
> +    TCGLabel *done_1 = gen_new_label();
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp_1, cc_flag, arc_true);
> +    tcg_gen_xori_tl(temp_2, temp_1, 1);
> +    tcg_gen_andi_tl(temp_2, temp_2, 1);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, temp_2, arc_true, done_1);
> +    TCGLabel *else_2 = gen_new_label();
> +    TCGLabel *done_2 = gen_new_label();
> +    tcg_gen_setcondi_tl(TCG_COND_NE, temp_3, src2, 0);
> +    tcg_gen_setcondi_tl(TCG_COND_NE, temp_4, src1, 2147483648);
> +    tcg_gen_setcondi_tl(TCG_COND_NE, temp_5, src2, 4294967295);
> +    tcg_gen_or_tl(temp_6, temp_4, temp_5);
> +    tcg_gen_and_tl(temp_7, temp_3, temp_6);
> +    tcg_gen_xori_tl(temp_8, temp_7, 1);
> +    tcg_gen_andi_tl(temp_8, temp_8, 1);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, temp_8, arc_true, else_2);
> +    divSigned(temp_10, src1, src2);
> +    tcg_gen_mov_tl(dest, temp_10);
> +    if ((getFFlag () == true)) {
> +        setZFlag(dest);
> +        setNFlag(dest);
> +        tcg_gen_movi_tl(temp_11, 0);
> +        setVFlag(temp_11);
> +    }
> +    tcg_gen_br(done_2);
> +    gen_set_label(else_2);
> +    gen_set_label(done_2);
> +    gen_set_label(done_1);

Nor is your compiler, for that matter, creating branches for empty elses.  The 
two together produce cringe-worthy results.

I can't help but feeling that the same amount of effort would have produced a 
legible, maintainable conversion directly to TCG, and without the fantastic 
amount of duplication you have created with your independent v2 and v3 files.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
