Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAFBC433E4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 19:20:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF1092075D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 19:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ksCR0Y4Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in3uimIX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF1092075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4nn5IY/QuECH/2fIE9MW1WvAZPbs9O1eVyPsYZseQqI=; b=ksCR0Y4ZQW0e7buPhTnSKZAOr
	fitzgEK7OHijN0IvDZ+nrT4TiDLZyYMlyiSDxrKl8Z/z6h3NXNydgX46XLv38SDCIoVgvewI+cqk6
	y1LVhkvD5tehQyac8zVRjDyM474DxmHpak9FOzro0+IEkqNm7X/KsGlwu7YCP6GZE0Ctk5uWrAMet
	VP2Q/7amQ+3hKXj5FFh73HSxBseBe93IApa0SzWwCuRTvAxy4ZwcP2BL/VW7EhSqD90zsS1CZ5NLX
	giy7evJikc2yHIHVq3nytmrtRCKzzUVII2NWiCFo5csiudPYxuHWebUo6X+rAuH/yfMufb/rWdjQh
	n/urU30oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtyYy-0006TX-0y; Fri, 10 Jul 2020 19:20:00 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtyYv-0006Sk-AZ
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 19:19:58 +0000
Received: by mail-io1-xd43.google.com with SMTP id f23so7178507iof.6
 for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jul 2020 12:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpixEoJC9zEIj+XP07Dwgjc/+fsL2aLGm0+XP36BCoY=;
 b=in3uimIXevMsbsdER0LVXl4r7lKyP/xK7sqysp1WsqPuOiRktCVYw8tCz1ebrDF6nB
 C2CC/611ZC2vyhTxOdvrBkUNq6ufBvyGf3NujhsBfUs3/LTtGe00qrdhQ3C9yUb/XDGn
 7Wo6S16Brj4A8Hhx9tsocb2hukt5vynaeAhDW9iOrlAFjdZQVjQO7rYk8s8KfihoQd9W
 gj2HAOCOVlNWDXnen7DBzm6nyk73fSXNJs/YfLjz4L/3CEWhpWckQ3w4l/ZvJlQZoRov
 AcxEb9jOlx+5nu6wlW0xihHBOWglOHFD4Gw1xIhvhoBlI+l5esaht3eQbAEo+9gxyyzX
 jLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpixEoJC9zEIj+XP07Dwgjc/+fsL2aLGm0+XP36BCoY=;
 b=PyeCA3G6mUxgBiMUpVbZ367DfEP/PxlrasI3Y80OZaUi93RmqEYExXXFjuuu2XCUWq
 urpiqrSr94h/AbfT5sNhPx7MBKDGpyhLHiIp9dJp9Oy11P8iAp3EBVnrTXM3EFsNJQHf
 9CH1/6PLHPR9mVeAPbRt2Ux4KPWDAGmvGreocFqtFEFor74AMdyA3kklJ8VWC3XprtA4
 ddIwXtdfEQcMLxvfqt712ipi5YglnQmhfet279M95Q1w1oY6Q8fbufRoKNb3ARgbjhdC
 Kr6XOHhCs1jC3q2QtamCXhR64JQbgxrX2anNR6u7qyhQ/rikbWqqoHZhM+7XWJscIM8d
 wJTg==
X-Gm-Message-State: AOAM531N/1nlbqsn1IVCncqwG6fAL/xxZdL+lVVT+g59zDtL+380eG69
 JuLSKn8kX576D/0tQFzkGe2pPuloMDQPsexJQn8=
X-Google-Smtp-Source: ABdhPJxjkvO3vhYoSmYVelEX/eMXVglMETp17MyMtPl4acMMgrIrEJCI8Ld1W0v8v9z/sfdwtIFC4fS9Y1LiM1s2Pec=
X-Received: by 2002:a02:6c4c:: with SMTP id w73mr80934105jab.26.1594408795803; 
 Fri, 10 Jul 2020 12:19:55 -0700 (PDT)
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
In-Reply-To: <87o8on4t38.fsf@oldenburg2.str.redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Jul 2020 12:10:02 -0700
Message-ID: <CAKmqyKPppARfeh6Y37A6ZOttjDcQz_u-cLDkUPk5y9mncByfbA@mail.gmail.com>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
To: Florian Weimer <fweimer@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_151957_442530_CB609411 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alistair Francis via Libc-alpha <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 2:29 AM Florian Weimer <fweimer@redhat.com> wrote:
>
> * Alistair Francis via Libc-alpha:
>
> > On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
> > <libc-alpha@sourceware.org> wrote:
> >>
> >> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
> >> >> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
> >> >> abilist updates). Will do a full testsuite run
> >> >
> >> > No regressions in sysvipc tests !
> >>
> >> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
> >> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
> >> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
> >> shmctl)"
> >>
> >> FAIL: dlfcn/tststatic
> >> FAIL: dlfcn/tststatic2
> >> FAIL: dlfcn/tststatic3
> >> FAIL: dlfcn/tststatic4
> >> FAIL: dlfcn/tststatic5
> >> FAIL: elf/tst-libc_dlvsym
> >> FAIL: elf/tst-libc_dlvsym-static
> >> FAIL: elf/tst-single_threaded-static-dlopen
> >> FAIL: elf/tst-tls9-static
> >
> > I see the same recent-ish regressions for RV32.
>
> Did you rebuild from scratch?  After the libc.so/ld.so ABI changes that
> went in recently, it could be the result of incomplete make
> dependencies.

I re-built glibc from scratch on a RV32 setup.

I have now updated the RV32 host (GCC and host glibc) to be built from
the latest master and am rebuilding now.

Alistair

>
> Thanks,
> Florian
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
