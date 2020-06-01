Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A5AC433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 22:08:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 907EA2065C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 22:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSBP5YVf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cAas/Qxo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 907EA2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CLh8FkBIQqP32pxz0WcfrJnzxd1lfSFtE27YlYw3fQ=; b=cSBP5YVf5iuWgr
	O0/qpNeJnC77ZnRpDSyKc3vfX0hhtD5e8I1cCDSfMtP4Z7tJCfR48YA262AAmIrROcLGal6MZpcL/
	cIulTn/nHxogTauyEzjHcsgRyQ2drXJGJ6pcHF0AByGL3mQzWIji4pRdPeoE11GTvvobQqa9U5kRf
	w2z1WFIYKX4DfJuXgN8qBCtraA9Wn+AiNLQXmpSQzRV7wb/NoySnENiqQAjCSlZmOrezqYtOa6SiW
	ZevD8m7DFs2CzXFSU108ejq5Scu7nAthih90RlthGiWQgusfXEtvNXrzgbiTPkHWKbiEL8Dzqs5kC
	3RT4oPiEHHx5P2/iln5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfsbV-0006Cz-R6; Mon, 01 Jun 2020 22:08:21 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfsbT-00069x-HB
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 22:08:20 +0000
Received: by mail-ua1-x942.google.com with SMTP id a10so546310uan.8
 for <linux-snps-arc@lists.infradead.org>; Mon, 01 Jun 2020 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QS7rF6uzPZOkX5aqApv4muf6Ex9QlNvIVzFKmYTGDPs=;
 b=cAas/Qxo7gaHk4h9RCh40Ya9/pLA/d+KSfXnQ4Q1BciGvwfftOWxXf+LJ8bD/YHDDY
 aJFH/pS8iU7u2g1eryl3KnIrky1rzl7YccdOYTac61urYCgM7lJUeDKp8TVyZt8ibUwu
 xxfVtMTXLm5lvgLskAk/3nhzDp2c33R29WtS5u7aBvEwvFr/XMegEgFcSM3o/TJTcNSZ
 ufkMEPjde3cA8mdfvF7DdiD7pZdP6jnc2BoBK/3Nexs/g6vLpbNgybf2I8YBKyV8T4xK
 ohljlL+AaWIAgirJdD+F7vkjyC+BheZV9ST68vYWA4h0YhzgUKfYRTZXLzjyxgnXww5I
 prCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QS7rF6uzPZOkX5aqApv4muf6Ex9QlNvIVzFKmYTGDPs=;
 b=T1/8I2/I9nLtdj9nlEAr5yhT/rKn4D/yP24zL/7EnQvlo0bJF6i5W+I26sKc7wsyPp
 Fb2UNmseUXnqrCI7BmGBYsaxiROjLvb5sPeJv35xXEbwNOCnbaJQXKBqnemtcT+k3eqB
 CSh7r7YxQ5MiyZb3pQccirRCN39N/MkiY3ppgTZnWyUbM480i8lQFNjFRFFo75tebLLz
 GSkoLaD1b0Zj56RvzSWWn/KoIfWhy6pgfltEOKMQIeYcoqKY2QTYdi76u5ogTaR9MOAh
 p7lyETHW9lJXLELLTJeZ+h3VATXg9g+zJRyF9AvR746iTP2nWOfFegrNEgIn3SydUAdZ
 es4g==
X-Gm-Message-State: AOAM530favkUpY41fEFHacGayIX/rZ4qTTmWRuP6pWYdwuwnNwCA5nyy
 OlAsHL4Nl1xIkYfap3cBXE+hjBV1f30GSVh7ltw=
X-Google-Smtp-Source: ABdhPJzvcFuJ1gg4Q6cbaO8cclNmnysul0PUrs6D9T5Ckr875tps8KiZc7hg45oZnp7R7/rdYO/e+IKNsOqZwIFGB2s=
X-Received: by 2002:ab0:300c:: with SMTP id f12mr43612ual.76.1591049296077;
 Mon, 01 Jun 2020 15:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-5-vgupta@synopsys.com>
 <c20755dc-bd3c-2ef6-c0ce-665529a62243@linaro.org>
 <e6b5ba39-dfd4-abe3-5743-ae1bf1b8e9a9@synopsys.com>
In-Reply-To: <e6b5ba39-dfd4-abe3-5743-ae1bf1b8e9a9@synopsys.com>
From: Ramana Radhakrishnan <ramana.gcc@googlemail.com>
Date: Mon, 1 Jun 2020 23:08:04 +0100
Message-ID: <CAJA7tRYHtnNks=aWCTe890kTvd9PjXCOf-q-6uK2ZnAho0j1KA@mail.gmail.com>
Subject: Re: [PATCH 4/5] aarch/fpu: use generic sqrt, fma functions
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_150819_616069_F9FF1637 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 10:45 PM Vineet Gupta via Libc-alpha
<libc-alpha@sourceware.org> wrote:
>
> On 6/1/20 9:38 AM, Adhemerval Zanella via Libc-alpha wrote:
> >
> >
> > On 29/05/2020 23:00, Vineet Gupta wrote:
> >> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> >
> > LGTM, some comments below.
> >
> >> -#include <math_private.h>
> >> -#include <libm-alias-finite.h>
> >> -
> >> -double
> >> -__ieee754_sqrt (double d)
> >> -{
> >> -  return __builtin_sqrt (d);
> >> -}
> >> -libm_alias_finite (__ieee754_sqrt, __sqrt)
> >
> > Ok.
>
> How is one to test aarch64 port with hard-float. build-many-glibc doesn't have a
> hf variant and hacking one didn't do the right thing either.

AArch64 is hard-float by default : there is no soft-float variant.

regards
Ramana

>
> >> diff --git a/sysdeps/aarch64/fpu/math-use-builtins.h b/sysdeps/aarch64/fpu/math-use-builtins.h
> >> new file mode 100644
> >> index 000000000000..52f0a0dad6dd
> >> --- /dev/null
> >> +++ b/sysdeps/aarch64/fpu/math-use-builtins.h
> >> @@ -0,0 +1,70 @@
> >> +/* Using math gcc builtins instead of generic implementation.  aarch64 version.
> >> +   Copyright (C) 2019-2020 Free Software Foundation, Inc.
> >
> > I think it should be just 2020 here.
>
> Fixed.
>
> >> +
> >> +/* Define these macros to 1 to use __builtin_xyz instead of the
> >> +   generic implementation.  */
> >> +#define USE_NEARBYINT_BUILTIN 0
> >> +#define USE_NEARBYINTF_BUILTIN 0
> >> +#define USE_NEARBYINTL_BUILTIN 0
> >> +#define USE_NEARBYINTF128_BUILTIN 0
> >
> > Since we are adding this new file for aarch64, we could also enable it fo
> > nearbyint{f} and remove sysdeps/aarch64/fpu/s_nearbyint{f}.c as well.
>
> OK, but only
>
> +#define USE_NEARBYINT_BUILTIN 1
> +#define USE_NEARBYINTF_BUILTIN 1
>
> The other 2 are not defined currently. If they are, then I prefer they be enabled
> as a separate commit for bisectability.
>
>
> >> +#define USE_RINT_BUILTIN 0
> >> +#define USE_RINTF_BUILTIN 0
> >> +#define USE_RINTL_BUILTIN 0
> >> +#define USE_RINTF128_BUILTIN 0
> >
> > Ditto.
>
> OK and again only RINT and RINTF.
> Also I don't understand one thing. Both the generic and aarch64 code have this
>
> float
> __rintf (float x)
> ...
> libm_alias_float (__rint, rint)
>
> The alias arg 1 __rint seems to lack suffix 'f' ?
>
>
> >> +
> >> +#define USE_FLOOR_BUILTIN 0
> >> +#define USE_FLOORF_BUILTIN 0
>
> Again FLOOR, FLOORF only
>
> >> +#define USE_FLOORL_BUILTIN 0
> >> +#define USE_FLOORF128_BUILTIN 0
> >
> > Ditto.
>
> Ditto
>
>
> >> +
> >> +#define USE_CEIL_BUILTIN 0
> >> +#define USE_CEILF_BUILTIN 0
> >> +#define USE_CEILL_BUILTIN 0
> >> +#define USE_CEILF128_BUILTIN 0
> >
> > Ditto.
>
> Ditto
>
> >
> >> +
> >> +#define USE_TRUNC_BUILTIN 0
> >> +#define USE_TRUNCF_BUILTIN 0
> >> +#define USE_TRUNCL_BUILTIN 0
> >> +#define USE_TRUNCF128_BUILTIN 0
> >
> > Ditto.
>
> Ditto
>
> >> +
> >> +#define USE_ROUND_BUILTIN 0
> >> +#define USE_ROUNDF_BUILTIN 0
> >> +#define USE_ROUNDL_BUILTIN 0
> >> +#define USE_ROUNDF128_BUILTIN 0
> >
> > Ditto.
>
> Ditto
>
> >> +
> >> +#define USE_COPYSIGNL_BUILTIN 1
> >> +#if __GNUC_PREREQ (7, 0)
> >> +# define USE_COPYSIGNF128_BUILTIN 1
> >> +#else
> >> +# define USE_COPYSIGNF128_BUILTIN 0
> >> +#endif
> >> +
> >
> > It should be described in commit message as well (although generated
> > instruction are essentially the same).
>
> Well this one is even more special as it was already using the same code, except
> that the math-use-builtins.h was generic vs. aarch64 specific one.
>
> Thx
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
