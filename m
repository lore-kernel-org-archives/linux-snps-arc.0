Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22587C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 19:39:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FC961157
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 19:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FC961157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qr/fMaazx2VN0xb4V0/MphJCEgiPmfHRyoZkIMPadXE=; b=dBhp82uX+FchGkUQ0VAikdA6u
	4dLA4ho0Hg6Nbyr6mS9Q6P5J3JCHHT8+XzUxe/+J+3ENtV07pL5DvEcDtzLwJA4mfHTUU0GVXXfXQ
	6P8MIatsK28vsibZPe27X6NcCTlYc5iixoI5CcVfwlICIBTB8nbQg7i2C0Qr0o0x5cHh970afTKKo
	Bs/WY4kcQg6nRE+/tmRPwIZtbR4DH96D/3JM5dtNUOaU0lPTFmOFdvFNlcc6jtdBqTBWV/Jlm1WIt
	vcAL/lxMptG+8peDWf/oCer19Wz+qhn6b1vo4/q2BkE4JCI6j5sjC264ejLCKl57r6IZlHx0ds60Y
	j6Gr4ri3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUE1p-005r9t-LH; Wed, 07 Apr 2021 19:39:53 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUE0L-005r0q-I4
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 19:38:29 +0000
Received: by mail-pg1-x535.google.com with SMTP id y32so10651602pga.11
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZhLAkL4pLMrL1XoezZqsWova6weUhcUsYNTv3NPpou4=;
 b=aacN0/JE6r6E3ww9dRn5EQF60vWsJ9x48Px2uWVrAUmG+yOhXvN+D8+nmJXCdeYsHF
 nUXGtKFj9Qkl+i7DfN5DAF2tKBQT0MVId30SOP1HY5hCeQV3iFAtrki12iYiAxWC+eHT
 zawdO4FfZtpx23o/eEI/zbWmguvw0t9RphTJnFVvxK2aRIsZwh5WMb+/ftzHjuVKTk8V
 9pfPCWyRj/4+2V6ARh5jluyHryacCBE4hz8eZZbexRCG0Dfrxh0lGIfammYhujae6eT0
 reZ90om8cotBBBcl4vqw5Jwr1aMYmdfrtUdEeaJWy54ZJ0A+OEM6XtKmNWppz8YMcDJ3
 xM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhLAkL4pLMrL1XoezZqsWova6weUhcUsYNTv3NPpou4=;
 b=iTSdJ6N3KXrx+uzhgBdazg4UsR+Y8N/MRcScWGNHGZfqOBjUPwMvdVCy8FZm4Dlv76
 bGoNsQ0oCGH7UlAiSO4xgvcDr8CN4KkACqM1CQm4AOsV5ToOAU/2q3OBprPaT/Gehtvy
 VJbY4U94VbJMh/EDXrt8VRzd+p9lVpAPLQKlDCZO7zG7MDDoWobkxlYZuoLWLCwXNk3h
 YwPMLVgouas84Z8Tv57wZdG6TocmQcyIIPj9fWUDPliczrUAih7KPiVtkF6k7zHdticI
 E7lo/C/MoZ6l9TMafC2V90NqSu2WzlUjVKPXgiz+S28LMXCupkl07imI6kpqQeYoD3Gt
 01ag==
X-Gm-Message-State: AOAM530ZAWFdR25Y4TAy/kA2sGwnlKBEI8NHPc+h9MIn8yEG+bXIDsHg
 xwjTWYtBeqYCus8qxxfaWE86HQ==
X-Google-Smtp-Source: ABdhPJwnGzqRM0XZJgUtn7xQjbuX9BgQihvoXCQKKeACZw5aa6ZFEEw1COe9jhoza9BvBoobG005Jg==
X-Received: by 2002:a63:1266:: with SMTP id 38mr4785914pgs.427.1617824299715; 
 Wed, 07 Apr 2021 12:38:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e7sm5316390pfv.107.2021.04.07.12.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 12:38:19 -0700 (PDT)
Subject: Re: [PATCH 07/27] arc: TCG instruction definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-8-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d477c4a9-3ade-1536-19b2-dcae76f54d93@linaro.org>
Date: Wed, 7 Apr 2021 12:38:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-8-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_203825_655593_35B6A64A 
X-CRM114-Status: GOOD (  34.38  )
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
> +void arc_gen_verifyCCFlag(const DisasCtxt *ctx, TCGv ret)

Why "verify"?  I don't see anything that verifies here...

I'll note that this can be done better, if you expose the actual comparison 
rather than a simple boolean.  This could remove 2-3 insns from gen_cc_prologue().

See e.g. disas_jcc and DisasCompare from target/s390x.


> +    { MO_UL, MO_UB, MO_UW }, /* non sign-extended */

"non sign-extended" => "zero-extended".

> +void arc_gen_no_further_loads_pending(const DisasCtxt *ctx, TCGv ret)
> +{
> +    /* TODO: To complete on SMP support. */
> +    tcg_gen_movi_tl(ret, 1);
> +}
> +
> +void arc_gen_set_debug(const DisasCtxt *ctx, bool value)
> +{
> +    /* TODO: Could not find a reson to set this. */
> +}

What's the point of these within the semantics?  It seems like some sort of 
in-chip debugging thing that tcg should ignore?

> +void
> +arc_gen_execute_delayslot(DisasCtxt *ctx, TCGv bta, TCGv take_branch)
> +{
> +    assert(ctx->insn.limm_p == 0 && !ctx->in_delay_slot);
> +
> +    ctx->in_delay_slot = true;
> +    uint32_t cpc = ctx->cpc;
> +    uint32_t pcl = ctx->pcl;
> +    insn_t insn = ctx->insn;
> +
> +    ctx->cpc = ctx->npc;
> +    ctx->pcl = ctx->cpc & ((target_ulong) 0xfffffffffffffffc);
> +
> +    ++ctx->ds;
> +
> +    TCGLabel *do_not_set_bta_and_de = gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_NE, take_branch, 1, do_not_set_bta_and_de);
> +    /*
> +     * In case an exception should be raised during the execution
> +     * of delay slot, bta value is used to set erbta.
> +     */
> +    tcg_gen_mov_tl(cpu_bta, bta);
> +    /* We are in a delay slot */
> +    tcg_gen_mov_tl(cpu_DEf, take_branch);
> +    gen_set_label(do_not_set_bta_and_de);
> +
> +    tcg_gen_movi_tl(cpu_is_delay_slot_instruction, 1);
> +
> +    /* Set the pc to the next pc */
> +    tcg_gen_movi_tl(cpu_pc, ctx->npc);
> +    /* Necessary for the likely call to restore_state_to_opc() */
> +    tcg_gen_insn_start(ctx->npc);

This is unlikely to work reliably.
I suspect it does not work at all with icount.

> +    ctx->env->enabled_interrupts = false;

Illegal, as mentioned before.

> +    /*
> +     * In case we might be in a situation where the delayslot is in a
> +     * different MMU page. Make a fake exception to interrupt
> +     * delayslot execution in the context of the branch.
> +     * The delayslot will then be re-executed in isolation after the
> +     * branch code has set bta and DEf status flag.
> +     */
> +    if ((cpc & PAGE_MASK) < 0x80000000 &&
> +        (cpc & PAGE_MASK) != (ctx->cpc & PAGE_MASK)) {
> +        ctx->in_delay_slot = false;
> +        TCGv dpc = tcg_const_local_tl(ctx->npc);
> +        tcg_gen_mov_tl(cpu_pc, dpc);
> +        gen_helper_fake_exception(cpu_env, dpc);

I think you should *always* execute the delay slot separately.  That's the only 
way the instruction count will be done right.

I'm pretty sure I asked you before to have a look at some of the other targets 
that implement delay slots for ideas on how to do this correctly.


> +void arc_gen_get_bit(TCGv ret, TCGv a, TCGv pos)
> +{
> +    tcg_gen_rotr_tl(ret, a, pos);
> +    tcg_gen_andi_tl(ret, ret, 1);
> +}

Should be a plain shift, not a rotate, surely.

> +void arc_gen_extract_bits(TCGv ret, TCGv a, TCGv start, TCGv end)
> +{
> +    TCGv tmp1 = tcg_temp_new();
> +
> +    tcg_gen_shr_tl(ret, a, end);
> +
> +    tcg_gen_sub_tl(tmp1, start, end);
> +    tcg_gen_addi_tl(tmp1, tmp1, 1);
> +    tcg_gen_shlfi_tl(tmp1, 1, tmp1);
> +    tcg_gen_subi_tl(tmp1, tmp1, 1);
> +
> +    tcg_gen_and_tl(ret, ret, tmp1);

Doesn't work for start == 31, end = 0,
due to shift count of 32.

You could rewrite this to

   t = 31 - start;
   ret = a << t;
   t = 31 - end;
   ret = ret >> t;

Amusingly, there's exactly one instance of extractBits that doesn't use 
constant arguments, and that's in ROR.  And there, the extract *would* use 
constant arguments if the extract was from @dest instead of from lsrc.  At 
which point you could just use tcg_gen_extract_tl.


> +TCGv arc_gen_next_reg(const DisasCtxt *ctx, TCGv reg)
> +{
> +    int i;
> +    for (i = 0; i < 64; i += 2) {
> +        if (reg == cpu_r[i]) {
> +            return cpu_r[i + 1];
> +        }
> +    }
> +    /* Check if REG is an odd register. */
> +    for (i = 1; i < 64; i += 2) {
> +        /* If so, that is unsanctioned. */
> +        if (reg == cpu_r[i]) {
> +            arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
> +            return NULL;
> +        }
> +    }

This is really ugly.  Surely you can do something better.

Perhaps not resolving regno to TCGv quite so early, so that it's easy to simply 
add one and index.

> +void arc_gen_verifyCCFlag(const DisasCtxt *ctx, TCGv ret);
> +#define getCCFlag(R)    arc_gen_verifyCCFlag(ctx, R)

I wonder if it would be clearer if the ruby translator simply added the context 
parameter itself, rather than have 99 macros to do the same.

> +#define getNFlag(R)     cpu_Nf
> +#define setNFlag(ELEM)  tcg_gen_shri_tl(cpu_Nf, ELEM, (TARGET_LONG_BITS - 1))

I'll note that setting of flags happens much more often than checking of flags. 
  Therefore it is a win if the setter does less work than the getter.

That's why we normally store the N and V flags in-place, in the high bit (see 
arm, s390x, etc).  This makes the setter a simple move, and the getter either a 
shift or TCG_COND_LT.

> +#define setZFlag(ELEM)  \
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, ELEM, 0);

Similarly, the Z flag can be set with a simple move, and the get can use the 
setcond.

> +#define nextInsnAddressAfterDelaySlot(R) \
> +  { \
> +    ARCCPU *cpu = env_archcpu(ctx->env); \
> +    uint16_t delayslot_buffer[2]; \
> +    uint8_t delayslot_length; \
> +    ctx->env->pc = ctx->cpc; \
> +    ctx->env->stat.is_delay_slot_instruction = 1; \

Again, illegal to read or write env.

> +#define setPC(NEW_PC)                                   \
> +    do {                                                \
> +        gen_goto_tb(ctx, 1, NEW_PC);                    \
> +        ret = ret == DISAS_NEXT ? DISAS_NORETURN : ret; \
> +    } while (0)

Why is this not unconditionally DISAS_NORETURN?
Because gen_goto_tb always exits.

> +/*
> + * An enter_s may change code like below:
> + * ----
> + * r13 .. r26 <== shell opcodes
> + * sp <= pc+56
> + * enter_s
> + * ---
> + * It's not that we are promoting these type of instructions.
> + * nevertheless we must be able to emulate them. Hence, once
> + * again: ret = DISAS_UPDATE
> + */
> +#define helperEnter(U6)                 \
> +    do {                                \
> +        gen_helper_enter(cpu_env, U6);  \
> +        ret = DISAS_UPDATE;             \
> +    } while (0)

Macro not used?

> +/* A leave_s may jump to blink, hence the DISAS_UPDATE */
> +#define helperLeave(U7)                                           \

Likewise.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
