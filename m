Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B937C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 16:47:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41D46128A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41D46128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GL0bEHiMwUM75gXd8Qvsm5ZgeHL0B8goy1jTgLveEg8=; b=CAczz5CxjzBHQIYKtHACCKhvt
	AWcNZvLVGULaOZUMt3gMvixQLD5vDo1L7lwicKFb/gxoX2LIHRYhK0m6vQpXkbPELw3H/MehabSju
	aTDP+l5vhGYf55cyfW9/3ZANMGz1N7pYfS9kBfidBUQn8N4uaCZzN+pA5bc5KZOLzW8Dtu2MeMrEQ
	9X1WGp4mVl9bkm1b2O+ImufT7sRnUnezzx2Gpw/1KQ6iCFuiU0B8FI0Mvjr+jyZ1uJxQr31yynHd2
	Erb6Ccop5JIVIHYZgrx0zgX7R5+Kbd4fPq08vZ+MRwo5o+UE6XfR3hzAsZpL26zOFdm2A9cUIeLKp
	26q95LFrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUBLN-005VUM-1M; Wed, 07 Apr 2021 16:47:53 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUBLJ-005VST-C1
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 16:47:51 +0000
Received: by mail-pf1-x433.google.com with SMTP id n38so3643821pfv.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hiAeSQxKJY8HQhTWZrIE+gHskcdssDe2E9A14XOqwcU=;
 b=Ilis7qT2IqmQ5+Y0IMDXKPEVrOnFRsBxoQQKnf6oQQ3HYbVrvzvcRixL7zYbmuKw7n
 zNT+Njs/1h92Ij1B8r0kc2YvILXt8uBGpCyQ+Zm/AvjCuwWOA+jBI2CTDaJL640UQLnM
 2TN9zTcmwpKjqI8M7/fziW7n2jdeA0N7ktMCZgOqhpLjA79UPOHnsaFuAi2140BjDkoZ
 v+TSyBxM9gBExP+lOaAFOD5WriC3d5yp97Q9wjDOJzg5kvPQhRfkSx1LSsFTXReSCPHA
 ctentxJ4aG1zewR4PlPnpHkUcDlFa+p9+mWZj0Dkd+18d6BSn8szaApfkSN/n0QbnkYz
 MJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hiAeSQxKJY8HQhTWZrIE+gHskcdssDe2E9A14XOqwcU=;
 b=ZnRUlJfh9Xa8RowLoagkfwP3N7xb+JaUlNZo1EFmTunXuAAvT4V2jH4xyzAZwPMsV7
 zhWyw7SqInGu/SjhcXgllImyTWygcBNkXIjeE35OGGwUeajwWekSPPgmbChK3SaHyJs+
 yZYwlkeqaudYEhOANel0dr32gdq+YByO/ayGExt8pxBsXlfqaHn1YviNsTzULJbTt+km
 aXFBPPTmETGAdj1t0a3CnqBR6MPkMI1F4hUzvleV9SxoKDHx1I70cxyM7mNFnuSLQy3W
 aPrD5Aq8V0fYMzwlmgWzq2De3iBM6AXL8cJL4fH1FSNGH5TR/1FWWXPTQQQphKgTcm7U
 JJqQ==
X-Gm-Message-State: AOAM533cM3wMPp8ys/xbYD2kQW+9iG/tUMd3MWetVGqpiD77XbTcMmsD
 U1WGKIwOq3J7E+L8Tu9iVBgESg==
X-Google-Smtp-Source: ABdhPJyiYUyR2O8gsDOEfzAuB3H0YQDLcj0W9OXFg8BTQs6YcZByB6FwTKy7W1XM9SNp5to0I3QDkQ==
X-Received: by 2002:a63:3241:: with SMTP id y62mr4017178pgy.127.1617814067931; 
 Wed, 07 Apr 2021 09:47:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s22sm5913271pjs.42.2021.04.07.09.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 09:47:47 -0700 (PDT)
Subject: Re: [PATCH 05/27] arc: TCG instruction generator and hand-definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-6-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <865edf7e-2d01-d272-411f-19e92671aa15@linaro.org>
Date: Wed, 7 Apr 2021 09:47:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-6-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_174749_716824_C560332E 
X-CRM114-Status: GOOD (  25.70  )
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
> + * Function to add boiler plate code for conditional execution.
> + * It will add tcg_gen codes only if there is a condition to
> + * be checked (ctx->insn.cc != 0).
> + * Remember to pair it with gen_cc_epilogue(ctx) macro.
> + */
> +static void gen_cc_prologue(DisasCtxt *ctx)
> +{
> +    ctx->tmp_reg = tcg_temp_local_new();
> +    ctx->label = gen_new_label();

There's no point in creating these when insn.cc is false.

> +    if (ctx->insn.cc) {
> +        arc_gen_verifyCCFlag(ctx, ctx->tmp_reg);
> +        tcg_gen_brcondi_tl(TCG_COND_NE, ctx->tmp_reg, 1, ctx->label);

You don't need a local temp for tmp_reg.
You can create and free it here.

> +/*
> + * The finishing counter part of gen_cc_prologue. This is supposed
> + * to be put at the end of the function using it.
> + */
> +static void gen_cc_epilogue(const DisasCtxt *ctx)
> +{
> +    if (ctx->insn.cc) {
> +        gen_set_label(ctx->label);
> +    }
> +    tcg_temp_free(ctx->tmp_reg);
> +}

You do not need to keep it live til here.

> +/*
> + * Populates a 32-bit vector with repeating SHIMM:
> + *   vec32=(0000000000u6,0000000000u6)
> + *   vec32=(sssss12,sssss12)
> + * It's crucial that the s12 part of an encoding is in signed
> + * integer form while passed along in SHIMM, e.g:
> + *   s12 = -125 (0xf803) --> 0xfffff803
> + * Do not forget to free the returned TCGv_i32 when done!
> + */
> +static TCGv_i32 dup_shimm_to_i32(int16_t shimm)
> +{
> +    TCGv_i32 vec32 = tcg_temp_new_i32();
> +    int32_t val = shimm;
> +    val = ((val << 16) & 0xffff0000) | (val & 0xffff);
> +    tcg_gen_movi_i32(vec32, val);
> +    return vec32;
> +}

   return tcg_constant_i32(dup_const(MO_16, shimm));

> 
> +static TCGv_i64 dup_limm_to_i64(int32_t limm)
> +{
> +    TCGv_i64 vec64 = tcg_temp_new_i64();
> +    int64_t val = limm;
> +    val = (val << 32) | (val & 0xffffffff);
> +    tcg_gen_movi_i64(vec64, val);
> +    return vec64;
> +}

   return tcg_constant_i64(dup_const(MO_32, limm));

> +static TCGv_i64 quad_shimm_to_i64(int16_t shimm)
> +{
> +    TCGv_i64 vec64 = tcg_temp_new_i64();
> +    int64_t val = shimm;
> +    val = (val << 48) | ((val << 32) & 0x0000ffff00000000) |
> +          ((val << 16) & 0x00000000ffff0000) | (val & 0xffff);
> +    tcg_gen_movi_i64(vec64, val);
> +    return vec64;
> +}

   return tcg_constant_i64(dup_const(MO_16, shimm));

Note that, tcg_constant_* are hashed and need not be freed (but are silently 
accepted if you do).  However, you cannot assign to them.  If you really 
require a mutable temporary, use tcg_const_*.


> +static void gen_vec_op2h(const DisasCtxt *ctx,
> +                         void (*OP)(TCGv, TCGv, TCGv),
> +                         TCGv_i32 dest,
> +                         TCGv_i32 b32,
> +                         TCGv_i32 c32)
> +{
> +    TCGv_i32 t0, t1;
> +
> +    /* If no real register for result, then this a nop. Bail out! */
> +    if (!(ctx->insn.operands[0].type & ARC_OPERAND_IR)) {
> +        return;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    tcg_gen_mov_i32(t0, b32);
> +    /*
> +     * If the last operand is a u6/s12, say 63, there is no "HI" in it.
> +     * Instead, it must be duplicated to form a pair; e.g.: (63, 63).
> +     */
> +    if (ctx->insn.operands[2].type & ARC_OPERAND_SHIMM) {
> +        t1 = dup_shimm_to_i32(ctx->insn.operands[2].value);
> +    } else {
> +        t1 = tcg_temp_new();
> +        tcg_gen_mov_i32(t1, c32);
> +    }
> +
> +    (*OP)(dest, t0, t1);
> +
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t0);
> +}

Why are you copying b32 to a new temp?  Do you have callbacks that are not 
careful about overlap between dest, t0, t1, and assume that you have 
non-overlapping inputs?

If you don't require uniqueness, and use tcg_constant_* above, then you don't 
need to copy c32 into a new temp either, nor worry about conditionally freeing it.

> +static void gen_add16(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +    tcg_gen_xor_i32(tmp, t0, t1);
> +    tcg_gen_andi_i32(tmp, tmp, 0x8000);
> +    tcg_gen_andi_i32(t0, t0, ~0x8000);
> +    tcg_gen_andi_i32(t1, t1, ~0x8000);
> +    tcg_gen_add_i32(t0, t0, t1);
> +    tcg_gen_xor_i32(dest, t0, tmp);
> +    tcg_temp_free_i32(tmp);
> +}

I guess that answers my question of whether you're relying on new unique temps 
as inputs: yes.

> +static void arc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    bool in_a_delayslot_instruction = false;
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +    CPUARCState *env = cpu->env_ptr;
> +
> +    /* TODO (issue #62): these must be removed */
> +    dc->zero = tcg_const_local_tl(0);
> +    dc->one  = tcg_const_local_tl(1);
> +
> +    if (env->stat.is_delay_slot_instruction == 1) {
> +        in_a_delayslot_instruction = true;
> +    }
> +
> +    dc->cpc = dc->base.pc_next;
> +    decode_opc(env, dc);
> +
> +    dc->base.pc_next = dc->npc;
> +    tcg_gen_movi_tl(cpu_npc, dc->npc);
> +
> +    if (in_a_delayslot_instruction == true) {
> +        dc->base.is_jmp = DISAS_NORETURN;
> +
> +        /* Post execution delayslot logic. */
> +        TCGLabel *DEf_not_set_label1 = gen_new_label();
> +        tcg_gen_brcondi_tl(TCG_COND_NE, cpu_DEf, 1, DEf_not_set_label1);
> +        tcg_gen_movi_tl(cpu_DEf, 0);
> +        gen_goto_tb(dc, 1, cpu_bta);
> +        gen_set_label(DEf_not_set_label1);
> +        env->stat.is_delay_slot_instruction = 0;

You may not examine or modify env directly during translate.
This absolutely will not work.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
