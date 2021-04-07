Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E80C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 03:52:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93859613BD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 03:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93859613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pp79B85P007ojrh7IeG75VJ16OxLolUdN9PMWWVm6rE=; b=cPl1+whDnYiUwyB6XN2+B79+2
	gpUX8GbFDeZ896SiNVLTGx+DGED/G7RNIDj9N2FK7m2QOFPPxNX0/dZYGRZgfYzSm7Y2K7s5x1i4a
	i84dUbuqHw894UqbszunKlj1V53gBxjuNxNop66Hx25PDIg67QmEEBX5o83mrNi1WDGWSs/fybhC/
	XwJmxGHF64dDzbD8W8hzzPSSinjKdcwytj5Zm0bk4Zf3VavFksvN5bLczoWen64lwtWBbCqprTOEy
	LJpQ2b0iZIzoQ8Pm02E6/4U48gKzvX93DDXPasixiEVxXHTM9eoJGMssv9xgzxLYeUlpDWHSfKUjM
	5k3d66vLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTzF7-003ztL-0l; Wed, 07 Apr 2021 03:52:37 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTzF0-003zt2-S7
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 03:52:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id z16so4605804pga.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Apr 2021 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KSzUjykhlPdqK8yc/oHkW/atVoEfA4yFdtdXgnna6SE=;
 b=UosME+g5U7CTF4sTyfIVe2b4cenoVG0xILvVwvrcl5wPRSUZdxl9Ps3tVvk6Bgwh/g
 tE2qsYa3kSJoj607bguS1dhQTp7T8Jk6NX/UgJOMf3ijTmJis+jlQQknFLzXIElrZbjL
 /olntt+33osw0LawRRLEuSMwZATVU6Ehnp7YntfX/s56RK/ZdRGwL4Dk6W9WuvwyTzhC
 9w7Kwp+b2hBYyMHuyYW4zSrW9vZtvoZJigkRyRdTYjj1ayeWcNu9DZt0/nEA3hmc1vYZ
 kT7NdfzdVhs/fn0M4iQLe4QMQGNdcFahWpCRw6db60kfBVhioxAMjYh+BwrIKRZRAqUY
 Makg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KSzUjykhlPdqK8yc/oHkW/atVoEfA4yFdtdXgnna6SE=;
 b=F7+3JixmQWAvt8rRwOaCaR2iCdZVrnYPeONGtRBCcl9o5OcP99uXQ1IYElY4gUDCxk
 XBEUWTz/Lclf5qvZkZv+/s5+00MNjlTOIiBmtwl9rhXK9qn5T3qRHOT0MTyEw5elOwwG
 4/jEGLmAs67rOdPEmEU6Fgdim5dUC2Iq2JEmuwjSNHAcvItFQn0ol6aJ5v/zqVXsG8Bu
 Ua0IVu9HnzSoILFavPeFvy9W/vsEQN7Jpyt9hOLUlvAlUKlJ5haU83ts0viDWxJdy10V
 78+6RiIrm6275PM9M4d9ipoUVQw59GaoyzB5H7FLED3+u1vCdskbmQosG7mmYbBNn23Z
 FvPw==
X-Gm-Message-State: AOAM531+Yh8gepPFNArOKjsKHBrpiFHe8EWRUzzJeRbMq/hj9TlZ0qn3
 chSqycYh/g4pfQmCawAP5hO7pA==
X-Google-Smtp-Source: ABdhPJz8qPpZNv/e8OCGQZ4KFMaPA+EPsntXh2AxHLemJsuOlMI870/gpLX89XZybVk9rZnhPD/THA==
X-Received: by 2002:a63:d54a:: with SMTP id v10mr1344192pgi.83.1617767548912; 
 Tue, 06 Apr 2021 20:52:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 11sm20493296pfn.146.2021.04.06.20.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 20:52:28 -0700 (PDT)
Subject: Re: [PATCH 05/27] arc: TCG instruction generator and hand-definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-6-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7fe5b4af-a4b5-354d-9901-67c414c92eef@linaro.org>
Date: Tue, 6 Apr 2021 20:52:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-6-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_045232_469067_DC1806C0 
X-CRM114-Status: GOOD (  23.20  )
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
> Add the most generic parts of TCG constructions. It contains the
> basic infrastructure for fundamental ARC features, such as
> ZOL (zero overhead loops) and delay-slots.
> Also includes hand crafted TCG for more intricate instructions, such
> as vector instructions.
> 
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>

Procedure is that you also sign off on the patches you post.

> +#define REG(x)  (cpu_r[x])

Does this really provide any clarity to the code?

> +static inline bool use_goto_tb(const DisasContext *dc, target_ulong dest)

Drop all of the unnecessary inline markers.
The compiler will decide for itself just fine.

> +void gen_goto_tb(const DisasContext *ctx, int n, TCGv dest)
> +{
> +    tcg_gen_mov_tl(cpu_pc, dest);
> +    tcg_gen_andi_tl(cpu_pcl, dest, ~((target_ulong) 3));
> +    if (ctx->base.singlestep_enabled) {
> +        gen_helper_debug(cpu_env);
> +    } else {
> +        tcg_gen_exit_tb(NULL, 0);
> +    }
> +}

This doesn't use goto_tb, so perhaps a better name?

It also doesn't use tcg_gen_lookup_and_goto_ptr(), so it could be improved.

> +static void gen_gotoi_tb(const DisasContext *ctx, int n, target_ulong dest)
> +{
> +    if (use_goto_tb(ctx, dest)) {
> +        tcg_gen_goto_tb(n);
> +        tcg_gen_movi_tl(cpu_pc, dest);
> +        tcg_gen_movi_tl(cpu_pcl, dest & (~((target_ulong) 3)));
> +        tcg_gen_exit_tb(ctx->base.tb, n);
> +    } else {
> +        tcg_gen_movi_tl(cpu_pc, dest);
> +        tcg_gen_movi_tl(cpu_pcl, dest & (~((target_ulong) 3)));
> +        if (ctx->base.singlestep_enabled) {
> +            gen_helper_debug(cpu_env);
> +        }
> +        tcg_gen_exit_tb(NULL, 0);

Forgot the else, as above.  Also not using lookup.

> +    for (i = 0; i < 64; i++) {
> +        char name[16];
> +
> +        sprintf(name, "r[%d]", i);
> +        cpu_r[i] = tcg_global_mem_new(cpu_env,
> +                                      ARC_REG_OFFS(r[i]),
> +                                      strdup(name));

g_strdup_printf, and drop the local variable.

> +}
> +static void arc_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)

Mind the whitespace.

> +{
> +    /* place holder for now */
> +}
> +
> +static void arc_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +
> +
> +    tcg_gen_insn_start(dc->base.pc_next);

Similarly.

> +static int arc_gen_INVALID(const DisasContext *ctx)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "invalid inst @:%08x\n", ctx->cpc);
> +    return DISAS_NEXT;
> +}

You need to generate an exception here.

> +    buffer[0] = cpu_lduw_code(ctx->env, ctx->cpc);

translator_lduw.

> +    length = arc_insn_length(buffer[0], cpu->family);
> +
> +    switch (length) {
> +    case 2:
> +        /* 16-bit instructions. */
> +        insn = (uint64_t) buffer[0];
> +        break;
> +    case 4:
> +        /* 32-bit instructions. */
> +        buffer[1] = cpu_lduw_code(ctx->env, ctx->cpc + 2);
> +        uint32_t buf = (buffer[0] << 16) | buffer[1];

Why use the array buffer[] and not a couple of scalars?

> +    if (ctx->insn.limm_p) {
> +        ctx->insn.limm = ARRANGE_ENDIAN(true,
> +                                        cpu_ldl_code(ctx->env,

translator_ldl

> +/*
> + * Throw "misaligned" exception if 'addr' is not 32-bit aligned.
> + * This check is done irrelevant of status32.AD bit.
> + */
> +static void check_addr_is_word_aligned(const DisasCtxt *ctx,
> +                                       TCGv addr)
> +{
> +    TCGLabel *l1 = gen_new_label();
> +    TCGv tmp = tcg_temp_local_new();
> +
> +    tcg_gen_andi_tl(tmp, addr, 0x3);
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, tmp, 0, l1);
> +
> +    tcg_gen_mov_tl(cpu_efa, addr);
> +    tcg_gen_movi_tl(cpu_eret, ctx->cpc);
> +    tcg_gen_mov_tl(cpu_erbta, cpu_bta);
> +
> +    TCGv tcg_index = tcg_const_tl(EXCP_MISALIGNED);
> +    TCGv tcg_cause = tcg_const_tl(0x0);
> +    TCGv tcg_param = tcg_const_tl(0x0);
> +
> +    gen_helper_raise_exception(cpu_env, tcg_index, tcg_cause, tcg_param);
> +
> +    gen_set_label(l1);

So.. you shouldn't have to do anything like this.

As far as I can see, there's nothing special about enter/leave.  All memory ops 
are supposed to be aligned (with double-word ops treated as two word ops for 
alignment).

So you should be implementing TCGCPUOps.do_unaligned_access, and set 
TARGET_ALIGNED_ONLY in default-configs/.

Quite large this patch.  I'll get back to it later...


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
