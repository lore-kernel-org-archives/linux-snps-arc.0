Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDB1C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 00:47:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6968061399
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 00:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6968061399
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pTSyQ0d1CtnLjYSCJHkT1Mtc+G5UbKLHfr0JY9wWD+Y=; b=MbaUh8YA8tbwgk17bEbwbxcx9
	XOrIZdJV1JemQQTIaXu04sR470BKn335wlKXD4xU9ZDFOa+2HBsT0JKj6Q+Z8eUVYGkrJ5YVL4FqM
	ghspb1b/kuHDBDQq3pZ2SBz8wZFVfwohZNmuYPzrTmuVauXKKPAxerpPonBV/+9oiGhj8MpJjMg3Z
	N7r2KcJNnrugObeYwEoI39SwORMplecPd/SooCrZGW2YDjmpkz4JjJEzIHPyPeMo4mviRKpiq5l7/
	qM1lnsBQ+u1oHsduV8Lrvqcu7FWaOiRddUoDZZcsvjNH9KKJJ0UXpQQXFPAicpvixoLVthv/Uj7zu
	9IvXtOJhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTwM3-003ib5-EB; Wed, 07 Apr 2021 00:47:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTwLx-003iaM-Te
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 00:47:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id g10so8451504plt.8
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Apr 2021 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6GP4A6CS6rduBLbEHxveqUx9q0razU3Sl2h9NupMPh0=;
 b=L2vkXYPSpcfaoscLNwSVYz8r5JROHAuuHViMQc/bKmIzCVUG0SvTZueL5q0PW2GvNM
 iWwLiRCY0K98wANOxMD8LJiIO9n2ChIEQIwa9YpljnsL3kfE6nPy5i+1vIBQhdvp9z5O
 4WqgH8gLiRq5vXmVAgmwrIHaH0qtJmAOBRwVyoyLY1U2OgEWDKalMYyYGNsAnAMWkCl7
 5rAzAQ7qzdAY1ijxY0mJPYgqbGLUdAGSs33tPsuypa/ttYWCTu/RBPVaHwQx/fUbtXZ0
 2mYOAGFL1P/0Pls1pBDyv9dOTDmAu1KDmQv+pDB+RPNIo4mh4Yt4nfou+DQQQAJniQVT
 T77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GP4A6CS6rduBLbEHxveqUx9q0razU3Sl2h9NupMPh0=;
 b=GrIETYAF4Ofv2dV59CcKZpL5Io2g4i7UcgirF7OqmRlFc/ZgsgOtyHoXeNi09aTooW
 kjzczI5IWBQWgTnZSor6iOuxMoVi6XfHumoNuACJpAkAYQx/DujxTHVGIMPhwgoMHsOW
 I2BVOX8MpKbo2Z8XPu2o8WGPJ9mDmJQ8fn27Z98y4Ycqvm1XII+Wx35An3Kn/7EVXFTd
 7xP6eOg9/Tr8ecAm3tucEpkFeixNFbcFpDg8jds+2cAnpHp/oEQlTLqEWfw8llR2dBZT
 wFbcGc4sh2f5NLaIeZ5nTMYJySQ4qQf+OrZSI8JXcqZHK/8M2dFsL1dzbCcyAe/NaFDV
 kZAw==
X-Gm-Message-State: AOAM531QtzEP+gDmREuQWCJVnMveD7esWaJX8M/VxTi2XVe7pP8pC+51
 Eo840f78SANx9U3CXS3/k/Ro1RyFr7dOdA==
X-Google-Smtp-Source: ABdhPJzIqsBh7bm9Tg7WxplVkNoRx5v+NOGxBcdpdpgGu5n/T7y2dtldL4wRFrxeXOoErGTn9wMd9w==
X-Received: by 2002:a17:902:c613:b029:e9:5291:2cff with SMTP id
 r19-20020a170902c613b02900e952912cffmr755989plr.43.1617756448223; 
 Tue, 06 Apr 2021 17:47:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t16sm53965pfc.94.2021.04.06.17.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 17:47:27 -0700 (PDT)
Subject: Re: [PATCH 01/27] arc: Add initial core cpu files
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-2-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e94289ec-924e-1c3b-f4f2-a267f14e4510@linaro.org>
Date: Tue, 6 Apr 2021 17:47:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-2-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_014730_700987_C83EFC46 
X-CRM114-Status: GOOD (  19.12  )
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
> +    DEFINE_PROP_BOOL("byte-order", ARCCPU, cfg.byte_order, false),

"byte-order" makes no sense as a bool.
"little-endian" or "big-endian" would.

> +    info->endian = BFD_ENDIAN_LITTLE;

Not using the setting?

> +/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
> +/* vim: set ts=4 sw=4 et: */

Should be redundant with .editorconfig.

> +#define CPU_GP(env)     ((env)->r[26])
> +#define CPU_FP(env)     ((env)->r[27])
> +#define CPU_SP(env)     ((env)->r[28])
> +#define CPU_ILINK(env)  ((env)->r[29])
> +#define CPU_ILINK1(env) ((env)->r[29])
> +#define CPU_ILINK2(env) ((env)->r[30])
> +#define CPU_BLINK(env)  ((env)->r[31])
> +#define CPU_LP(env)     ((env)->r[60])
> +#define CPU_IMM(env)    ((env)->r[62])
> +#define CPU_PCL(env)    ((env)->r[63])

Surely this is better as a enum of regnos?

I'm not especially keen on lvalue macros like this, especially when you can't 
reuse the enum for e.g. the tcg globals.

> +/* Flags in pstate */
> +#define Hf_b  (0)
> +#define AEf_b (5)
> +#define Uf_b  (7)
> +#define Lf_b  (12)
> +#define DZf_b (13)
> +#define SCf_b (14)
> +#define ESf_b (15)
> +#define ADf_b (19)
> +#define USf_b (20)
> +
> +/* Flags with their on fields */
> +#define IEf_b   (31)
> +#define IEf_bS  (1)
> +
> +#define Ef_b    (1)
> +#define Ef_bS   (4)
> +
> +#define DEf_b   (6)
> +#define DEf_bS  (1)
> +
> +#define Vf_b    (8)
> +#define Vf_bS   (1)
> +#define Cf_b    (9)
> +#define Cf_bS   (1)
> +#define Nf_b    (10)
> +#define Nf_bS   (1)
> +#define Zf_b    (11)
> +#define Zf_bS   (1)
> +
> +#define RBf_b   (16)
> +#define RBf_bS  (3)

We have include/hw/registerfields.h that's a bit better at defining, 
extracting, and setting fields.

> +#define SET_STATUS_BIT(STAT, BIT, VALUE) { \
> +    STAT.pstate &= ~(1 << BIT##_b); \
> +    STAT.pstate |= (VALUE << BIT##_b); \
> +}

do {
     (STAT).pstate = deposit32((STAT).pstate, BIT, 1, VALUE);
} while (0)

> +typedef struct {
> +    target_ulong pstate;
> +
> +    target_ulong RBf;
> +    target_ulong Ef;     /* irq priority treshold. */
> +    target_ulong Vf;     /*  overflow                */
> +    target_ulong Cf;     /*  carry                   */
> +    target_ulong Nf;     /*  negative                */
> +    target_ulong Zf;     /*  zero                    */
> +    target_ulong DEf;
> +    target_ulong IEf;

I understand why the 4 arithmetic flags are split out, but why are the others? 
  Surely they are not nearly so performance sensitive.

> +/* ARC PIC interrupt bancked regs. */
> +typedef struct {
> +    target_ulong priority;
> +    target_ulong trigger;
> +    target_ulong pulse_cancel;
> +    target_ulong enable;
> +    target_ulong pending;
> +    target_ulong status;
> +} ARCIrq;

This is cpu.h.  The PIC is not the cpu, so this should be elsewhere.

> +typedef struct CPUARCState {
> +    target_ulong        r[64];
> +
> +    ARCStatus stat, stat_l1, stat_er;
> +
> +    struct {
> +        target_ulong    S2;
> +        target_ulong    S1;
> +        target_ulong    CS;
> +    } macmod;
> +
> +    target_ulong intvec;
> +
> +    target_ulong eret;
> +    target_ulong erbta;
> +    target_ulong ecr;
> +    target_ulong efa;
> +    target_ulong bta;
> +    target_ulong bta_l1;
> +    target_ulong bta_l2;
> +
> +    target_ulong pc;     /*  program counter         */

What is this and why is it different from PCL, aka r[63]?

> +    /* used for propagatinng "hostpc/return address" to sub-functions */
> +    uintptr_t host_pc;

Not a fan.  Subfunctions should have the retaddr passed down directly, so that 
it's obvious that the value is not stale.

> +static inline int cpu_mmu_index(const CPUARCState *env, bool ifetch)
> +{
> +    return GET_STATUS_BIT(env->stat, Uf) != 0 ? 1 : 0;
> +}

A very complicated way to just return GET_STATUS_BIT.
Or even GET_STATUS_BIT != 0, come to that.

> +
> +static inline void cpu_get_tb_cpu_state(CPUARCState *env, target_ulong *pc,
> +                                        target_ulong *cs_base,
> +                                        uint32_t *pflags)
> +{
> +    *pc = env->pc;
> +    *cs_base = 0;
> +#ifdef CONFIG_USER_ONLY
> +    assert(0); /* Not really supported at the moment. */

g_assert_not_reached() is our canonical "can't get here".
Though #error would be better in this instance.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
