Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAF3C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 01:25:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA2761369
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 01:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA2761369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n9p9l6+xio27ybeGTcMdU/4H+/bU3KbQR/QxlkAjLC8=; b=iPJ5Xhar/urqg4LeZHF9mp7Si
	2dkHsBh0N65kB+qu956LU0QsOc63Jp3D9huBqnikD9IcziQjrxQiMhF9g/yQvTmGLf5OSq4Zi3Rrj
	DriymXqgNSmN048fpzleCSTd1IN22EttsGQKVHzI0yqW2jBQ0uOeltTah5KYs4poCMhMBw/266tm2
	VsV9hGdmGgFrFzTJCqoJegTQix58Cmsey4qFv7wuaBaxYn9j7FikfMof2yc9UWHm0QMHUZjPL3XsO
	gt2xVCG40ponsFO2X2WQu7QUAzWADpnOG0YDtnZXgDXrQ7MHlZXO7a7RFt1MG77dY8Aw9FGBPj/mU
	/kRzoRWZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTwwU-003kVj-BS; Wed, 07 Apr 2021 01:25:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTwwO-003kSO-MT
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 01:25:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id f29so9308206pgm.8
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Apr 2021 18:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mv7Dn7oK37cuoJGyv5zyHnEoTysH1d7ZsbYbLl3FjFw=;
 b=UpCulVkHKKR29ZyEDm0lI8qU4JEnqCQBPlExvYWbAhFI7K3FzUfS7CVqeoxa7OjV8R
 nyTVvAWkA6MdOROZy0lJAQqBygjUnhV/ANRVOL5n7JgqgjdLNY5Q2UcISkdV+mmWFk1b
 OW51G1LLzvF6NSlj+D0pmGvBUo4tlAwdpEQQl+Dv7ZMDRcq33M8EGnxhQ2yRL7vpCRIW
 1lxQIHFJA/3uAmxNE2hP3Sccv2M9lMxDppImW9eb3tvPKyK/RxdP7S+5h2pkQ7/bKJAK
 11nPA8VR6Eyf/AcUHgkwwWDfsFu86wKMix+nBhhyBAGlvCmRz1WUTLWiBR1tqjj4bMvm
 TrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mv7Dn7oK37cuoJGyv5zyHnEoTysH1d7ZsbYbLl3FjFw=;
 b=AXaf4x9GUeAsuu4fsRv5uZeC7gg52sneEoG+AewsfBpeGJuX0gy/lqCwni39yt5X2Y
 7QMK+nGXB2VATdSV5GiWvsddu6okvgARaQF6vJ9P8ANwt9W0G5mtgYmHQBVESddjYVLW
 5vZihzBOMl9Q0bS08bxSC/11lY3cPaXKiftFM8lu2IJf1n+LLEIA/fWmGBfiaT8Gk1yW
 3pgJSZW6gfAc5PY1uzM3vWPwVDQZk+ODdjhTkt+clN/VFpqcd+zXHm9QwRIMSGpJU10Z
 WeM6ytaeg8O6IwGE4jmeDEyybaynOmSezVHvPWQ6AAztDxElH17Cj1X7xDaArURrCsAk
 ItMg==
X-Gm-Message-State: AOAM5339E7WOufCfnSkmeswYVoSPWh9rSGVoUoH6j6Fx8FbVmGCyiu+G
 i3JdbhCeG5at+gS9OlQGcRqJaQ==
X-Google-Smtp-Source: ABdhPJwsPqDlFMTF0ABDGUdmqZ8fqSj5N37QopR4nIwe5FxOyMXuUjZbFf4gBBXi7l7Z+M6kOjdSDA==
X-Received: by 2002:aa7:8187:0:b029:213:d43b:4782 with SMTP id
 g7-20020aa781870000b0290213d43b4782mr761213pfi.26.1617758706992; 
 Tue, 06 Apr 2021 18:25:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j1sm3001239pjn.26.2021.04.06.18.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 18:25:06 -0700 (PDT)
Subject: Re: [PATCH 02/27] arc: Decoder code
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-3-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44722d06-8fe2-0d9b-9b42-1442c5625aa0@linaro.org>
Date: Tue, 6 Apr 2021 18:25:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-3-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_022510_039451_BE734C42 
X-CRM114-Status: GOOD (  13.37  )
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
> +static long long int
> +extract_uimm6_20(unsigned long long insn ATTRIBUTE_UNUSED,

global replace long long int with int64_t,
and unsigned long long int with uint64_t.


> +{
> +  unsigned value = 0;
> +
> +  value |= ((insn >> 6) & 0x003f) << 0;
> +
> +  return value;
> +}

return extract64(insn, 6, 6);

and so forth.  Please minimize the by-hand bit manipulation.

> +static const struct arc_opcode *find_format(insn_t *pinsn,
> +                                            uint64_t insn,
> +                                            uint8_t insn_len,
> +                                            uint32_t isa_mask)
> +{
> +    uint32_t i = 0;
> +    const struct arc_opcode *opcode = NULL;
> +    const uint8_t *opidx;
> +    const uint8_t *flgidx;
> +    bool has_limm = false;
> +
> +    do {
> +        bool invalid = false;
> +        uint32_t noperands = 0;
> +
> +        opcode = &arc_opcodes[i++];
> +        memset(pinsn, 0, sizeof(*pinsn));
> +
> +        if (!(opcode->cpu & isa_mask)) {
> +            continue;
> +        }
> +
> +        if (arc_opcode_len(opcode) != (int) insn_len) {
> +            continue;
> +        }
> +
> +        if ((insn & opcode->mask) != opcode->opcode) {
> +            continue;
> +        }

A linear search through the entire opcode table, really?
You can do better.

Before you re-invent the wheel, please first have a look at 
docs/devel/decodetree.rst.  I see no reason why you can't take those tables 
that you import your tables from binutils, as you're doing now, and then have a 
small program that converts to decodetree at build-time.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
