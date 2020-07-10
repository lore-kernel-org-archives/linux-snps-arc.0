Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34D3C433E3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 19:22:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694F22076A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 19:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mr6qyi2O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0daJhCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694F22076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Z9eRnucPK4Au1ngD1/yyIKLxi4V4nvZSEma2v/HzQI=; b=Mr6qyi2OKxD6oT7SOKxYucxVL
	aIVI4QxPRcj6AiS6WhD0Tgzw3z+CSBkWaxVnl0SElPthSzqIJh+csBe5JDxz4PsyTmJaGpErEC6Cg
	DRRp9hCcMa1rqSZsHEgOoy7LahPQjMc+DSNRFXgtM3TOdlaq6svh9OnCyHio82fV4j44aXwvV7rDI
	us+8vDlfs7Rn7PLtSDlhROQUp99hmCmEV4ghttkjEy4nVzlc1wcD1/0MlC8ZmUp0Oi4yIsH1/eTWV
	NmgxSFf8aXBQO5qn+TChy0XbFugO9tJvvRUXAlVAQAHqfQmBhGfncLukCnZco8U31Vlhatj6AogC7
	1XLlPasng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtyat-0006dj-Mn; Fri, 10 Jul 2020 19:21:59 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtyar-0006dK-HY
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 19:21:58 +0000
Received: by mail-io1-xd44.google.com with SMTP id c16so7169075ioi.9
 for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jul 2020 12:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3CuaswNa+sfnmkBB/YryU/MhiY04ynitjlS5krbF98=;
 b=R0daJhCi/oMuGOvt9n6pvpJZfVOSmMKlyeGeA/lRxz7dPfp1CtelKean6fx1KLaAci
 f7lNb7Pzrdq3thm26L46s+dYqBgPfbSZ67wxbJClw/moA+9qWUApeH7NksvOk8sBCtEX
 nXesFlWvUi3UTR4xLwyh2aIjGDCZOH1NlD1JFQlfPk/P9WMvZYBINzR37GWVGMiTfheM
 CD3IEW9sROrSdtALTcvHS0ciN6OQ6AqqD7S7xLo4k+02wkQHcfkLRUWSxRRK/pv9E+0t
 YQ7XmqdNGZFIm+wSBGj7Ygv8+oyTDena3W0xrRV1rTn2+XK2p1a6j7z5doePj2tg2UvP
 sX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3CuaswNa+sfnmkBB/YryU/MhiY04ynitjlS5krbF98=;
 b=rYaPeGhaWy7AqIGmgtU9PScJUyKJcR6PMaeKsf2Xi6LYwaeHgFdt8gMt/Sx1xZICVY
 5rVDjzOqNxuixm+ZOIW4aNqQUIrDz+nMTu/FY5cUezhXm/c8WnLZcfXlY+8g0f4xLhhE
 MNueP460oFv2GtARQ1srs+GjDKY3XzQJlqxpPENu9UwFeN4MPOZj9VMZfX4iL6Yaev4d
 7w6fe24yTlTUaPatPR797yUsiNRpChnAvEainTrsR38DLb0FaChK6aMZvy1AOjoksUYe
 iPRx8DXGwCiPUk5CJN+mogli5PYND7c0qvPAsixfTN/86z0Rdy/MwxpezqYNuFBkofV7
 FMDw==
X-Gm-Message-State: AOAM531n6iTnY21WlKVN2MXFRLVW8xAXy9S+2QO/qsbN+e8ds68yJ99x
 uD5o3jQZHhk6IcPYlB/NlA0s6sYbku39Gm89Xmg=
X-Google-Smtp-Source: ABdhPJyiEJfIyvxOj5USKBB86iDRdTtp7+o+A4icDJ5WBmDWSL+Fak4Cm2ehDSMOF8OJOORjsIZfRthQdo3hiDy6aEQ=
X-Received: by 2002:a6b:640f:: with SMTP id t15mr28880667iog.175.1594408915780; 
 Fri, 10 Jul 2020 12:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
 <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
 <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
 <87o8on4t38.fsf@oldenburg2.str.redhat.com>
 <cf8e41c7-8a58-f9bc-ab6a-ca5099bf6b46@synopsys.com>
In-Reply-To: <cf8e41c7-8a58-f9bc-ab6a-ca5099bf6b46@synopsys.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Jul 2020 12:12:02 -0700
Message-ID: <CAKmqyKMoq7A_n-i8ho-RSLK_0zu-eipxcOj9xJfFu_e61EVt=A@mail.gmail.com>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_152157_684262_51D8A7E1 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alistair Francis via Libc-alpha <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 8:55 AM Vineet Gupta via Libc-alpha
<libc-alpha@sourceware.org> wrote:
>
> On 7/10/20 2:28 AM, Florian Weimer via Libc-alpha wrote:
> > * Alistair Francis via Libc-alpha:
> >
> >> On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
> >> <libc-alpha@sourceware.org> wrote:
> >>>
> >>> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
> >>>>> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
> >>>>> abilist updates). Will do a full testsuite run
> >>>>
> >>>> No regressions in sysvipc tests !
> >>>
> >>> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
> >>> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
> >>> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
> >>> shmctl)"
> >>>
> >>> FAIL: dlfcn/tststatic
> >>> FAIL: dlfcn/tststatic2
> >>> FAIL: dlfcn/tststatic3
> >>> FAIL: dlfcn/tststatic4
> >>> FAIL: dlfcn/tststatic5
> >>> FAIL: elf/tst-libc_dlvsym
> >>> FAIL: elf/tst-libc_dlvsym-static
> >>> FAIL: elf/tst-single_threaded-static-dlopen
> >>> FAIL: elf/tst-tls9-static
> >>
> >> I see the same recent-ish regressions for RV32.
> >
> > Did you rebuild from scratch?  After the libc.so/ld.so ABI changes that
> > went in recently, it could be the result of incomplete make
> > dependencies.
>
> From scratch meaning glibc alone or the whole toolchain. I used buildroot and
> glibc-dirclean to nuke entire glibc but gcc was not rebuilt. I can try that too.

That's the same with me. The toolchain wasn't rebuilt but glibc was
built from a clean directory. I am rebuilding now with a rebuilt
toolchain.

>
> Some of the failed tests have prints about static TLS block ... so I'm wondering
> if they could be related ?

I see the same messages.

>
> | $ cat dlfcn/tststatic.out
> | .../build/libc.so.6: cannot allocate memory in static TLS block

That's what I see as well.

>
> Also while we figure this out, does this prevent ARC port from being committed. It
> is a functioning system otherwise: I'm doing doing cross run of testsuite with
> sshd etc involved and these addition 10+ failures don't seem to be getting in the way.

Good question!

Alistair

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
