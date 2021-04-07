Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8E9C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:36:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 172BE6124C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 172BE6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uED/ex5FPaAyG/ayTFxW7xX8X0Hg8xBTpzJtLycm9co=; b=Ln3ndiZ9TSJ0j/mJdMwapQgQf
	xM1wNv4w0iZGt/wZJEuF0lta/tipLfV075fJ5m1ZHJinbSq7AY2ZwCo6SBxXCA3zcZz2Tc7b6rRgr
	gxgrdzK7e7J/wmR7C1J1EGnx+u8sFVgGLxBt63JYEH7W+3HjNCx3G6pTUqIUkv+pyyIFetOi+sRet
	9UoAJuNpYm1I37cj0zKDggG+J1NPOeDX2oPyjwmdJl3VO/qZob1SO1sjWKj+X1fGauY3oxwI3P6+V
	L2hOkXqVZFL09nvGxOTqWgP3z6xfUB8MlF1jzd0E3joILE9ISXWyEspZmbmj397NhmAcsa9WZ3Uqc
	4s51GhOqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUHj0-006IrO-5D; Wed, 07 Apr 2021 23:36:42 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHiw-006Ir2-Q5
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 23:36:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id k8so32092pgf.4
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 16:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=61sqYPeeEgbD6wjgBardHLMqr1lFVMAMkGpymqf/7jQ=;
 b=OXdajk0n7a2zyaI+a91cF0Qe2zX2/AdOv7asBMtLqbMQRORHXVUu0UieQSHcEdpXIT
 CPethGucGgQ8q3oOGtgw1KQ5XexVhFM98RS52g+49P/CpiG0x22dvUAq5k/5adlKgwTT
 iESo4PF9NPzHK0DsIuH2PREjOcCBKyyIeNMGZ6utoX9PiCCltif/Tkhd3EqvTRVNLN7k
 GeCYpECE3gTSpzgirAnNC7ijNiY1f6jDndezwUE71+hELAc10L6/4Ch37/LHsUO8kPXu
 K6izejGKhNgk93o7tICG8peAEfbB0Ce89Vk0sDRY+W3vjj/FkjN1eiqSj7uoMQBcy6sp
 iG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=61sqYPeeEgbD6wjgBardHLMqr1lFVMAMkGpymqf/7jQ=;
 b=AJrRTkYHtUTt4c65HjbTDf8dKJ6+CSRnolbxBgPgMk2tOuQZZAmrJKIM5jxsy0ShSa
 mnGS1yWadr8Ra6XlDxO2ccSH0EvcOYG2nVkL7PFa5SGlcKRBoP3MpzoJgFQgUx9DWi0J
 1H8DH8qvvd5Ju1TTcWkMKsV78is7jloB0bci+TNihfjpzD1ZAn8Zph+KiCreViF235gU
 v1ZLpYyXVfeRHH5dKPMFbKj+Gdh3tXzz46eF9Ows28dmcYA2Grqn6VD90dp/gkyoothM
 OcCiyv9RCS9lAjHppQXsSKSx0ZpP06Ygyhz9LF3UUnJw2OK4pYRxAuiBptL/7PA4P0fc
 KJ+A==
X-Gm-Message-State: AOAM532TDE0aHN6KDS9Z7g86AhOx34Igr0IDj41H/J41xExq8g2JKGdX
 ZLOjnB9rvkXAXs8hKDmOe6NNIg==
X-Google-Smtp-Source: ABdhPJwloxvQReN6PfTa93d2H/9mV2QSWPkKB9GzlW9h37yXkf5Vmb5GGKswvUk0F3FXKJVZqQ3qwQ==
X-Received: by 2002:a65:6907:: with SMTP id s7mr5461654pgq.296.1617838597138; 
 Wed, 07 Apr 2021 16:36:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x125sm21858236pfd.124.2021.04.07.16.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:36:36 -0700 (PDT)
Subject: Re: [PATCH 20/27] arcv3: TCG, decoder glue code and helper changes
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-21-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <129d4614-0970-04c6-35b4-3dcadcf619c2@linaro.org>
Date: Wed, 7 Apr 2021 16:36:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-21-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_003639_127342_C66720B3 
X-CRM114-Status: GOOD (  20.45  )
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
> +uint64_t helper_carry_add_flag32(uint64_t dest, uint64_t b, uint64_t c) {
> +    return carry_add_flag(dest, b, c, 32);
> +}
> +
> +target_ulong helper_overflow_add_flag32(target_ulong dest, target_ulong b, target_ulong c) {
> +    return overflow_add_flag(dest, b, c, 32);
> +}
> +
> +target_ulong helper_overflow_sub_flag32(target_ulong dest, target_ulong b, target_ulong c) {
> +    dest = dest & 0xffffffff;
> +    b = b & 0xffffffff;
> +    c = c & 0xffffffff;
> +    return overflow_sub_flag(dest, b, c, 32);
> +}

You shouldn't need to replicate these functions.  Use the correct types and 
masking in the first place.


> +uint64_t helper_rotate_left32(uint64_t orig, uint64_t n)
> +{
> +    uint64_t t;
> +    uint64_t dest = (orig << n) & ((0xffffffff << n) & 0xffffffff);
> +
> +    t = (orig >> (32 - n)) & ((1 << n) - 1);
> +    dest |= t;
> +
> +    return dest;
> +}
> +
> +uint64_t helper_rotate_right32(uint64_t orig, uint64_t n)
> +{
> +    uint64_t t;
> +    uint64_t dest = (orig >> n) & (0xffffffff >> n);
> +
> +    t = ((orig & ((1 << n) - 1)) << (32 - n));
> +    dest |= t;
> +
> +    return dest;
> +}

rol32 and ror32.

> +uint64_t helper_asr_32(uint64_t b, uint64_t c)
> +{
> +  uint64_t t;
> +  c = c & 31;
> +  t = b;
> +  for(int i = 0; i < c; i++) {
> +    t >>= 1;
> +    if((b & 0x80000000) != 0)
> +      t |= 0x80000000;
> +  }
> +      //t |= ((1 << (c+1)) - 1) << (32 - c);
> +
> +  return t;

Really?  I can't imagine what lead you to write this.
Who writes a simple shift operation with a loop?

Perhaps no helper at all and

   tcg_gen_sra_tl(ret, b, c);
   tcg_gen_ext32s_tl(ret, ret);


> +target_ulong helper_ffs32(CPUARCState *env, uint64_t src)
> +{
> +    int i;
> +    if (src == 0) {
> +      return 31;
> +    }
> +    for (i = 0; i <= 31; i++) {
> +      if (((src >> i) & 1) != 0) {
> +        break;
> +      }
> +    }
> +    return i;
> +}

tcg_gen_ori_tl(ret, src, MAKE_64BIT_MASK(32, 32));
tcg_gen_ctzi_tl(ret, ret, 31);

Though I really wonder if you've got that function correct, as it's not the 
*normal* definition of ffs...


> +target_ulong helper_norml(CPUARCState *env, uint64_t src1)
> +{
> +    int i;
> +    int64_t tmp = (int64_t) src1;
> +    if (tmp == 0 || tmp == -1) {
> +      return 0;
> +    }
> +    for (i = 0; i <= 63; i++) {
> +      if ((tmp >> i) == 0) {
> +          break;
> +      }
> +      if ((tmp >> i) == -1) {
> +          break;
> +      }
> +    }
> +    return i;
> +}

This is some cognate of count-leading-repititions-of-sign-bit, 
tcg_gen_clrsb_tl.  A decent computation should be like

   tcg_gen_clrsb_i64(ret, src);
   tcg_gen_subfi_i64(ret, 63, ret);


> diff --git a/target/arc/semfunc-v2_mapping.def b/target/arc/semfunc-v2_mapping.def
> new file mode 100644
> index 0000000000..ab8d9ff123
> --- /dev/null
> +++ b/target/arc/semfunc-v2_mapping.def

You could have named this properly to start.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
