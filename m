Return-Path: <SRS0=/JEi=2C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B50AC2D0C9
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2019 09:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216CE24654
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2019 09:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJVZ6QlL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuPLz9Vg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 216CE24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3mDfVk8Xq9AE/U05aCUzF6s9F4wDgn+i1PRTfR+5Rc=; b=RJVZ6QlLazsMsu
	828S8YBgjvwWDhp788qWTqtwoFcPaX006EqIk0w6/NI7aIFWzplbrPiuSTeu4DBRP4863yMsIFVDt
	8LYQdeuIeO/m/5MlDXLuUk2IaPUcxRUu6c3GOpgaBTkXpHH9o6MTfTPhGYAuHjgdyTtpdP5QgR3+G
	ui02BTRXoapDKiC/PE991doNqCYaxp14QaStfQaJuuYQtgWIazo66WbkieSrCW5sW/6pziKNHyVpt
	b7ZLhai13UV6qrwKV8ZFAEZOKVIjV2TQ5BstphJCln5UMuCv+DuF7lYhVbbT3JuJwu0txTKH8W21E
	6s3saiG7dKliEAE8h46Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifKxN-0001uA-O7; Thu, 12 Dec 2019 09:40:25 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifKxL-0001sm-7J
 for linux-snps-arc@lists.infradead.org; Thu, 12 Dec 2019 09:40:24 +0000
Received: by mail-vs1-xe44.google.com with SMTP id t12so1045922vso.13
 for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2019 01:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qGhiju5WIY5gKVT/J0vDHmqmDD3acFFyfUXann8osRQ=;
 b=nuPLz9VgrCTSEEK5lxkjVxl49Fv0zSq13LO9xEcQ+a7Be+OrazaJ9fY8xqHsnPqaj7
 kJrlyLSYCcv+vCwYb/C3IO292TgoL6S4xUpYS28wyVA8YngQYrp4mzbhsdLviSby8srQ
 CYnrhYiqtWcB1MJHNEmOzdBE6gQ0bLh30sbp47JxMgaThHvajsnfpzCi0I5BDwXnTYus
 gDfJ+vALVLIw+YU5uEecvctW2nKoKe6XOutSgtBPF2IuLvxQixZNOdxeFPNe8G5TgcmT
 Wp4H0rJMurzJNQ+hqUhudiT83/mSe+2k7PQct8Ecb/atV7aE0JQ+Te+hEilvZ0+7bLBN
 IpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGhiju5WIY5gKVT/J0vDHmqmDD3acFFyfUXann8osRQ=;
 b=KiL3bwNmrUba0WltIL59XZ5Lq4fMYYsmL4McFE4SLHbjOJn6Kylnhmm+TF4AWRSdTv
 XDoeVQ014bq1AEDbvjRg5Y1Dgmm7uwyakxYFBSYhmaQokpt1Sg8MF2sGm+2mBjxxyTdr
 Uy1Pq9BN1vV0T+NWjCiDeZK6pC7pUpRK3LiHsG7cS+1NcbjUxEbINnQzZApIh8fJ3G6v
 0CA+pyzCM8uHXVO8oaK5tHmMO7wmH56DIYF/aOfnU85aN5zwXg1AbahNop6nqQaKitBO
 BRhPRjB940tJKe9Ts4d1sfNX+KuKE0EXdPc6x59BKQOJJLEwEBfOecnnzzzfxq+ozWGS
 aJ/Q==
X-Gm-Message-State: APjAAAUS00rqGezWLky1S2B2WqMMmwPnGDk3oej1by42kE8rv9xWVC+/
 zog1zZGn1zrlDSuR0L2tvTJtEMiDcCyUZtv8/9jffK9d
X-Google-Smtp-Source: APXvYqxhlThidv5bkax5VBDnTjKA6BjGR3aIKaQyiaKh+H/xOMUoIlGjlmyXrAKbGuX02RU7eLXWmVsb4WDcAMw5wkk=
X-Received: by 2002:a67:dc90:: with SMTP id g16mr6365946vsk.110.1576143620835; 
 Thu, 12 Dec 2019 01:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20191209190218.20544-1-vgupta@synopsys.com>
 <BYAPR12MB301302F82982712931B60172CA5B0@BYAPR12MB3013.namprd12.prod.outlook.com>
 <c262dd40-9fe3-9e6f-3c1f-7fdbe56ffce1@synopsys.com>
In-Reply-To: <c262dd40-9fe3-9e6f-3c1f-7fdbe56ffce1@synopsys.com>
From: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Date: Thu, 12 Dec 2019 11:40:09 +0200
Message-ID: <CAL0iMy38na7TaeP4=imQ_ESn8c5igjDMBAVX4OG5=8CvD=nohA@mail.gmail.com>
Subject: Re: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_014023_262548_5E5B3A6C 
X-CRM114-Status: GOOD (  15.27  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>,
 "andrew.burgess@embecosm.com" <andrew.burgess@embecosm.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Pushed. Thank you for your contribution,
Claudiu

On Wed, Dec 11, 2019 at 12:47 AM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
>
> On 12/10/19 1:12 AM, Claudiu Zissulescu wrote:
> > Hi,
> >
> > Thank you for your contribution, I'll push it asap. As far as I understand, you need this patch both in gcc9 branch and mainline.
> >
> > Cheers,
> > Claudiu
>
> Indeed both mainline and gcc9
>
> Thx
> -Vineet
>
> >
> >> -----Original Message-----
> >> From: Vineet Gupta [mailto:vgupta@synopsys.com]
> >> Sent: Monday, December 09, 2019 8:02 PM
> >> To: gcc-patches@gcc.gnu.org
> >> Cc: Claudiu Zissulescu <claziss@synopsys.com>;
> >> andrew.burgess@embecosm.com; linux-snps-arc@lists.infradead.org;
> >> Vineet Gupta <vgupta@synopsys.com>
> >> Subject: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
> >> comparisons
> >>
> >> ARC gcc generates FDCMP instructions which raises Invalid operation for
> >> signaling NaN only. This causes glibc iseqsig() primitives to fail (in
> >> the current ongoing glibc port to ARC)
> >>
> >> So split up the hard float compares into two categories and for unordered
> >> compares generate the FDCMPF instruction (vs. FDCMP) which raises
> >> exception
> >> for either NaNs.
> >>
> >> With this fix testsuite/gcc.dg/torture/pr52451.c passes for ARC.
> >>
> >> Also passes 6 additional tests in glibc testsuite (test*iseqsig) and no
> >> regressions
> >>
> >> gcc/
> >> xxxx-xx-xx  Vineet Gupta  <vgupta@synopsys.com>
> >>
> >>      * config/arc/arc-modes.def (CC_FPUE): New Mode CC_FPUE which
> >>      helps codegen generate exceptions even for quiet NaN.
> >>      * config/arc/arc.c (arc_init_reg_tables): Handle New CC_FPUE mode.
> >>      (get_arc_condition_code): Likewise.
> >>      (arc_select_cc_mode): LT, LE, GT, GE to use the New CC_FPUE
> >> mode.
> >>      * config/arc/arc.h (REVERSE_CONDITION): Handle New CC_FPUE
> >> mode.
> >>      * config/arc/predicates.md (proper_comparison_operator):
> >> Likewise.
> >>      * config/arc/fpu.md (cmpsf_fpu_trap): New Pattern for CC_FPUE.
> >>      (cmpdf_fpu_trap): Likewise.
> >>
> >> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> >> ---
> >>  gcc/config/arc/arc-modes.def |  1 +
> >>  gcc/config/arc/arc.c         |  8 ++++++--
> >>  gcc/config/arc/arc.h         |  2 +-
> >>  gcc/config/arc/fpu.md        | 24 ++++++++++++++++++++++++
> >>  gcc/config/arc/predicates.md |  1 +
> >>  5 files changed, 33 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/gcc/config/arc/arc-modes.def b/gcc/config/arc/arc-modes.def
> >> index 36a2f4abfb25..d16b6a289a15 100644
> >> --- a/gcc/config/arc/arc-modes.def
> >> +++ b/gcc/config/arc/arc-modes.def
> >> @@ -38,4 +38,5 @@ VECTOR_MODES (INT, 16);       /* V16QI V8HI V4SI V2DI
> >> */
> >>
> >>  /* FPU condition flags.  */
> >>  CC_MODE (CC_FPU);
> >> +CC_MODE (CC_FPUE);
> >>  CC_MODE (CC_FPU_UNEQ);
> >> diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
> >> index 28305f459dcd..cbb95d6e9043 100644
> >> --- a/gcc/config/arc/arc.c
> >> +++ b/gcc/config/arc/arc.c
> >> @@ -1564,6 +1564,7 @@ get_arc_condition_code (rtx comparison)
> >>      default : gcc_unreachable ();
> >>      }
> >>      case E_CC_FPUmode:
> >> +    case E_CC_FPUEmode:
> >>        switch (GET_CODE (comparison))
> >>      {
> >>      case EQ        : return ARC_CC_EQ;
> >> @@ -1686,11 +1687,13 @@ arc_select_cc_mode (enum rtx_code op, rtx x,
> >> rtx y)
> >>        case UNLE:
> >>        case UNGT:
> >>        case UNGE:
> >> +    return CC_FPUmode;
> >> +
> >>        case LT:
> >>        case LE:
> >>        case GT:
> >>        case GE:
> >> -    return CC_FPUmode;
> >> +    return CC_FPUEmode;
> >>
> >>        case LTGT:
> >>        case UNEQ:
> >> @@ -1844,7 +1847,7 @@ arc_init_reg_tables (void)
> >>        if (i == (int) CCmode || i == (int) CC_ZNmode || i == (int) CC_Zmode
> >>            || i == (int) CC_Cmode
> >>            || i == CC_FP_GTmode || i == CC_FP_GEmode || i ==
> >> CC_FP_ORDmode
> >> -          || i == CC_FPUmode || i == CC_FPU_UNEQmode)
> >> +          || i == CC_FPUmode || i == CC_FPUEmode || i ==
> >> CC_FPU_UNEQmode)
> >>          arc_mode_class[i] = 1 << (int) C_MODE;
> >>        else
> >>          arc_mode_class[i] = 0;
> >> @@ -8401,6 +8404,7 @@ arc_reorg (void)
> >>
> >>        /* Avoid FPU instructions.  */
> >>        if ((GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUmode)
> >> +          || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUEmode)
> >>            || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) ==
> >> CC_FPU_UNEQmode))
> >>          continue;
> >>
> >> diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
> >> index 4d7ac3281b41..c08ca3d0d432 100644
> >> --- a/gcc/config/arc/arc.h
> >> +++ b/gcc/config/arc/arc.h
> >> @@ -1531,7 +1531,7 @@ enum arc_function_type {
> >>    (((MODE) == CC_FP_GTmode || (MODE) == CC_FP_GEmode                 \
> >>      || (MODE) == CC_FP_UNEQmode || (MODE) == CC_FP_ORDmode   \
> >>      || (MODE) == CC_FPXmode || (MODE) == CC_FPU_UNEQmode     \
> >> -    || (MODE) == CC_FPUmode)                                         \
> >> +    || (MODE) == CC_FPUmode || (MODE) == CC_FPUEmode)                \
> >>     ? reverse_condition_maybe_unordered ((CODE))                      \
> >>     : reverse_condition ((CODE)))
> >>
> >> diff --git a/gcc/config/arc/fpu.md b/gcc/config/arc/fpu.md
> >> index 6289e9c3f593..6729795de542 100644
> >> --- a/gcc/config/arc/fpu.md
> >> +++ b/gcc/config/arc/fpu.md
> >> @@ -242,6 +242,18 @@
> >>     (set_attr "type" "fpu")
> >>     (set_attr "predicable" "yes")])
> >>
> >> +(define_insn "*cmpsf_fpu_trap"
> >> +  [(set (reg:CC_FPUE CC_REG)
> >> +    (compare:CC_FPUE (match_operand:SF 0 "register_operand"  "r,
> >> r,r")
> >> +                    (match_operand:SF 1 "nonmemory_operand"
> >> "r,CfZ,F")))]
> >> +  "TARGET_FP_SP_BASE"
> >> +  "fscmpf%?\\t%0,%1"
> >> +  [(set_attr "length" "4,4,8")
> >> +   (set_attr "iscompact" "false")
> >> +   (set_attr "cond" "set")
> >> +   (set_attr "type" "fpu")
> >> +   (set_attr "predicable" "yes")])
> >> +
> >>  (define_insn "*cmpsf_fpu_uneq"
> >>    [(set (reg:CC_FPU_UNEQ CC_REG)
> >>      (compare:CC_FPU_UNEQ
> >> @@ -338,6 +350,18 @@
> >>     (set_attr "type" "fpu")
> >>     (set_attr "predicable" "yes")])
> >>
> >> +(define_insn "*cmpdf_fpu_trap"
> >> +  [(set (reg:CC_FPUE CC_REG)
> >> +    (compare:CC_FPUE (match_operand:DF 0 "even_register_operand"
> >> "r")
> >> +                    (match_operand:DF 1 "even_register_operand"
> >> "r")))]
> >> +  "TARGET_FP_DP_BASE"
> >> +  "fdcmpf%? %0, %1"
> >> +  [(set_attr "length" "4")
> >> +   (set_attr "iscompact" "false")
> >> +   (set_attr "cond" "set")
> >> +   (set_attr "type" "fpu")
> >> +   (set_attr "predicable" "yes")])
> >> +
> >>  (define_insn "*cmpdf_fpu_uneq"
> >>    [(set (reg:CC_FPU_UNEQ CC_REG)
> >>      (compare:CC_FPU_UNEQ
> >> diff --git a/gcc/config/arc/predicates.md b/gcc/config/arc/predicates.md
> >> index e0013b32f0f5..4d2ad7ba6789 100644
> >> --- a/gcc/config/arc/predicates.md
> >> +++ b/gcc/config/arc/predicates.md
> >> @@ -439,6 +439,7 @@
> >>            || code == ORDERED || code == UNORDERED);
> >>
> >>      case E_CC_FPUmode:
> >> +    case E_CC_FPUEmode:
> >>        return 1;
> >>      case E_CC_FPU_UNEQmode:
> >>        return 1;
> >> --
> >> 2.20.1
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
