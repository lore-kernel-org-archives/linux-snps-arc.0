Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D303C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 22:11:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1F2206A1
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 22:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ibg5IxOw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgJladsD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1F2206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jGXuPP+aeCzPmOIcxTQSDjFye7mRSOA8NHbFVMKsfv8=; b=Ibg5IxOwpC4/4jGmude6sUyzz
	adWlaaCo4wi61GEjTT0xbO+pEKAR419IqZZko3n/hWSxRgeOfJHQqD03Eu+YacRBHODyBemFfmUVW
	cC8iKiDj0L8JR5viPStGikgF2pGRJRS93s4su9F6BXKXXypXjRQQIz/rtvtXD6L2CXyYKvMMVE3H8
	6LgLe/xSZdhbE1fVwgXojDZ1K6kg9BbGDqty8u3Iw95+q3fCqBGNQeRS1dQvCJLa0ivFOV5AnLWOo
	QFoREMdJbkAiX1HsTisq6wlq9ztJPTA9vY4/HJPT4lU4BViO7YoLQ2TUO8vDy6taam0UxYxoC4e5h
	tN+FIhL3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtekv-0006uK-8p; Thu, 09 Jul 2020 22:11:01 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jteks-0006tL-Pa
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 22:10:59 +0000
Received: by mail-io1-xd41.google.com with SMTP id v6so4003097iob.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2020 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxaP2F3MjYcUJCpKXAz5DHVLAycUL1+ajoVvxtTdGOk=;
 b=dgJladsDBiApJtRamLDHg7RIv5oDhrrLbQwr7H0NJKmzwfHNtUFLWroTrONaW5aRNI
 8qqpFMF5sbEAHrp0yfnbq5uSpnnYG3k3WloM4nQ93rFDkw4jgiVrg4ul4DtfKvYWcKF0
 6MJ6Wxpd6GqPmzMGGjBXH7ig9Aisd5HBSEkyj3eMneVvslgI+kdEPyomQQVfVXfKd4Hf
 HcVvyfzUPGLI90e6f5zcIZRv0fsBUBI1Xp1j/jjkAhf1TgiPfs76D8fktbLaL21wgM94
 Et5I72TknaPLF13kcQHs67rlnZ4a5v1lFrRmPQWvNaLFODuGp9Sk8ft2h97sbrLitLZ4
 rfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxaP2F3MjYcUJCpKXAz5DHVLAycUL1+ajoVvxtTdGOk=;
 b=kx9VgIzw5K6vBEE7HUsUAbHzbJX3N/dmwQfcN38xKEHt9KCF54M7XuWql3eq81KK/F
 UGBohldj3HgNQJPxrXmXqAoUeP6oU1ClhucZrCxVVrxuuFeJeKSjcen2+FrkbGjEunDi
 gxNlfUdpvoLcHWSZJJaTgEp6irVOTTfC5WkkNN/QNYN3K8rTAYnT6mvLisg4uoThkW9D
 o0LqA39Ze38T5B7pxRU/f7JH8oBnh17QiuHXaQNuTWT07eSRJaN4s+GVBJg2oxTbF3Eg
 LoYhP5Upju4hk8P/kdaVssW+E/iLg9FWj1mxIbAkYoSYG8wbwOTZ2jzhRHXyaibjgFn2
 cIJA==
X-Gm-Message-State: AOAM530fc7QtRERA6Y44mNV8oRe9UCBEk9Oh2MPkItVdeW+g1uFjmwe/
 JegNQd25Ca6lyh0Tl7D1yKhomWmW5tnG0Wd26Fs=
X-Google-Smtp-Source: ABdhPJxcYVJ1YFs3KEDP6LuxC0GV/zAt+5Bt4Qz5XlZnpW7qlQ+VtG7lsbraCnD2OGyIF2f07pakBkqOGCSZ/BYev+Q=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr45499615ion.105.1594332654648; 
 Thu, 09 Jul 2020 15:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
 <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
In-Reply-To: <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2020 15:01:02 -0700
Message-ID: <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_181058_852543_F21B9972 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
<libc-alpha@sourceware.org> wrote:
>
> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
> >> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
> >> abilist updates). Will do a full testsuite run
> >
> > No regressions in sysvipc tests !
>
> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
> shmctl)"
>
> FAIL: dlfcn/tststatic
> FAIL: dlfcn/tststatic2
> FAIL: dlfcn/tststatic3
> FAIL: dlfcn/tststatic4
> FAIL: dlfcn/tststatic5
> FAIL: elf/tst-libc_dlvsym
> FAIL: elf/tst-libc_dlvsym-static
> FAIL: elf/tst-single_threaded-static-dlopen
> FAIL: elf/tst-tls9-static

I see the same recent-ish regressions for RV32.

Alistair

> ..
>
> Could it be due to recent TLS optimizations...
>
> | $ cat dlfcn/tststatic.out
> | .../build/libc.so.6: cannot allocate memory in static TLS block
>
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
