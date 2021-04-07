Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124B9C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 02:39:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF5861245
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 02:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF5861245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4f9O+6XZ9bbyhHEcJdUc5P5M8xyAynOoa4by5nDq9RE=; b=R9DJhc3doL9J0M92Zo7+qkpMF
	aA0hhlfDnektaWBpDAg1SmwfuW8o/32Aa3hzIAXQBWRYNC0xynpgVISVVFts4rRPSKTQ2zNo1qu+e
	h9KtBNk+w+pXvEvwpW4/oTViP4giExmYH0hYpPI1mwF6Blomr/InT0ZRbUlvOZGFdnnQ+m61yiXi1
	7kU2Jx25+5ZA/YY0Cwc+ghO2sHu381YzpEAlM8PaEGKA7RP20jbnoDRM4SeLCkVOl9UEcfY5oergU
	sq01oh3HXNprESxZr1B+Q2MfeoEi0qC8DuAd9k3sLvG7HenyFHvu3hjM+F7+M2NbUL6RjbUiKPcrl
	HrfkoZFyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTy5p-003of0-3A; Wed, 07 Apr 2021 02:39:06 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTy4F-003oZY-O9
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 02:37:24 +0000
Received: by mail-pg1-x52a.google.com with SMTP id p12so7880111pgj.10
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Apr 2021 19:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3dIN6m9df5pZMa/+DOcrwQzhmeN6PMyAZ0wDFGU1v/4=;
 b=qI7nhi42ry2arYoQLD5dJ3HrRfqbNICP7z5uGgZqjB5fbt/iIAEYc+m+e4URhiGZka
 xFliqo9zUFpgU4dCWw5LEeEvI65VZnsZTlyGBHwfJf3somUnMEuDR6OTLMX5n7AN/v1i
 ENRlZfd2D3BazQpD+de6VwMdexgbQ4GplgjzK5j7D1gGOoK+xv9hWqGH2C/l2shj1nBN
 LNn7KIQOu03go20KL+GMJcTrCLc+jUUF4AoncWbCq7WMQUzDHg+sUjdPH3maSPsiessr
 KJ4kH8MW0Y2b0BtPas27dX86zXOSD88focx4PeUYyf+BzEIwCU/j0y50eC+/mfHQdQDQ
 6eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3dIN6m9df5pZMa/+DOcrwQzhmeN6PMyAZ0wDFGU1v/4=;
 b=A5UwytjmBYwMnWIPh33+HfrjezT8hmBrErDm8WJGFjmtFnimUbAYKpAnP9v4X/0sLC
 NOsG7RT5THLRd93U0eqooRqHJef7HFA/Um3VEx/heLgy3mCPKM5felHi4/aUvH2KdsLN
 P3mtCzlWwATKinSqMm2FrRtBk7zOcrKtTtk7xS6Vwt6MuwgCsDGP2Hq2p6JPOd4uSClo
 jFd46p5ISdKzSJHUAuN0PdAPk77YT9CsL3QhCC7+5In6nJlvnFNvJ+cCqLd5CNs2qd8N
 pezaf3Pqu4Wu7oJkd1TxQSp29Zhy9aH6xL5HOR69EGhc6Pk8gOAHwP4ohvTOBZ+VjQre
 zNEg==
X-Gm-Message-State: AOAM5300vdqcEG8zmRcXefGFri4RejIUXxScm4iusqsF7TzgljyjBKgI
 AiK48DqHbOB7/rkUE0OyTyeAWQ==
X-Google-Smtp-Source: ABdhPJyp1dZeiIpJ9eP+KapY9xwCNllzsFcmWcf2ot9HNSsHr9g0v8tS+Hy9+KN6hlRCAmEEPqWJ+A==
X-Received: by 2002:aa7:818e:0:b029:215:2466:3994 with SMTP id
 g14-20020aa7818e0000b029021524663994mr972700pfi.48.1617763037869; 
 Tue, 06 Apr 2021 19:37:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m1sm3454222pjk.24.2021.04.06.19.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 19:37:17 -0700 (PDT)
Subject: Re: [PATCH 04/27] arc: TCG and decoder glue code and helpers
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-5-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2df509f0-6c53-24cb-92ac-096e5685a0b7@linaro.org>
Date: Tue, 6 Apr 2021 19:37:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-5-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_033721_969470_16A610F2 
X-CRM114-Status: GOOD (  13.24  )
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
> +static inline target_ulong
> +carry_add_flag(target_ulong dest, target_ulong b, target_ulong c, uint8_t size)
> +{
> +    target_ulong t1, t2, t3;
> +
> +    t1 = b & c;
> +    t2 = b & (~dest);
> +    t3 = c & (~dest);
> +    t1 = t1 | t2 | t3;
> +    return (t1 >> (size - 1)) & 1;
> +}
> +
> +target_ulong helper_carry_add_flag(target_ulong dest, target_ulong b,
> +                                   target_ulong c) {
> +    return carry_add_flag(dest, b, c, TARGET_LONG_BITS);
> +}
> +
> +static inline target_ulong
> +overflow_add_flag(target_ulong dest, target_ulong b, target_ulong c,
> +                  uint8_t size)
> +{
> +    dest >>= (size - 1);
> +    b >>= (size - 1);
> +    c >>= (size - 1);
> +    if ((dest == 0 && b == 1 && c == 1)
> +        || (dest == 1 && b == 0 && c == 0)) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +target_ulong helper_overflow_add_flag(target_ulong dest, target_ulong b,
> +                                      target_ulong c) {
> +    return overflow_add_flag(dest, b, c, TARGET_LONG_BITS);
> +}
> +
> +static inline target_ulong
> +overflow_sub_flag(target_ulong dest, target_ulong b, target_ulong c,
> +                  uint8_t size)
> +{
> +    dest >>= (size - 1);
> +    b >>= (size - 1);
> +    c >>= (size - 1);
> +    if ((dest == 1 && b == 0 && c == 1)
> +        || (dest == 0 && b == 1 && c == 0)) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +target_ulong helper_overflow_sub_flag(target_ulong dest, target_ulong b,
> +                                      target_ulong c) {
> +    return overflow_sub_flag(dest, b, c, TARGET_LONG_BITS);
> +}
> +
> +target_ulong helper_repl_mask(target_ulong dest, target_ulong src,
> +                              target_ulong mask)
> +{
> +    target_ulong ret = dest & (~mask);
> +    ret |= (src & mask);
> +
> +    return ret;
> +}
> +
> +target_ulong helper_mpymu(CPUARCState *env, target_ulong b, target_ulong c)
> +{
> +    uint64_t _b = (uint64_t) b;
> +    uint64_t _c = (uint64_t) c;
> +
> +    return (uint32_t) ((_b * _c) >> 32);
> +}
> +
> +target_ulong helper_mpym(CPUARCState *env, target_ulong b, target_ulong c)
> +{
> +    int64_t _b = (int64_t) ((int32_t) b);
> +    int64_t _c = (int64_t) ((int32_t) c);
> +
> +    /*
> +     * fprintf(stderr, "B = 0x%llx, C = 0x%llx, result = 0x%llx\n",
> +     *         _b, _c, _b * _c);
> +     */
> +    return (_b * _c) >> 32;
> +}

All completely trivial in tcg:

   tcg_gen_add2_tl,
   tcg_gen_mulu2_tl,
   tcg_gen_muls2_tl.

and simple arithmetic for overflow -- see gen_add_CC in arm/translate.c.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
