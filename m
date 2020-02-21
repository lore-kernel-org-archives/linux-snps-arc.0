Return-Path: <SRS0=nIXZ=4J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19313C3566C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 Feb 2020 19:57:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9DE20658
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 Feb 2020 19:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jH/gD5zD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S87U37rz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9DE20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8tcfkAn8mR195DoFshzg8cIiePFLUj+K5kfLqaAnjc=; b=jH/gD5zDzsSFIS
	HM2SSO/8AMB3fimSqhl8NWlfGHH6NZln2X46v62gnWvRxB4RxjCJQ3nj1OTh3Du8eMfvoEed7DxmG
	8SY5izgaci7/hXA1hJek2MjxWg1iRViz0SadekfA5FZIlsb/ujwnmu/RgSySszWDsX9moJqNagQ2/
	LggAey1rVo8f6DfGi1/Vq4mC7xGKqYCUJFVtzLVT/bL38gRxd8V3ZREuBT0lJCCJ6m89iINpR3/EF
	BFBVLuajs2a5o6sox/n3P784os1g/1qNO2WPbK02PsOFD9VtMThTisdC0w3F/TyOkdRsj1tsFefK2
	rv/pAmlVSC1Sdjy/jtMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5EQA-0000go-UF; Fri, 21 Feb 2020 19:57:10 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5EQ7-0000fp-QL
 for linux-snps-arc@lists.infradead.org; Fri, 21 Feb 2020 19:57:09 +0000
Received: by mail-lj1-x244.google.com with SMTP id a13so3409776ljm.10
 for <linux-snps-arc@lists.infradead.org>; Fri, 21 Feb 2020 11:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oO/0oVAREgr5MfORTF+oGjH3ppE6bYdphuMutbzWe50=;
 b=S87U37rz4HAdl8X08Xan5Oeck91WSZLmvEQsW9EHVq6zXrZzArk62W6tVWAe/wgh2E
 O7/5XgcKLdZYc4sFW/TU/Wkh90ud4Qp7UKY/dOpC/wVPrXmnnkt/lZ/I2fMylk+HJ7Dd
 p/X3qIrBxAt5/IYqU7kIsS0G/U32KgOaYJDQG7Pel5YMHZYli0xywJ+OLmj2ROJIt5hs
 kj0pD/LIhEXBLk6ltBKFJqk3NhTi3fNq5DH8rfHWCT4j+A4F9Q9GTGRkeNPajkBpf4vl
 bMCIgQNKrg5eN8MqZqkXMVVeSM1tTJzbpUqdvYfSXpE+YL7o5V8x72tM5DAzlQ5XjB5k
 nQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oO/0oVAREgr5MfORTF+oGjH3ppE6bYdphuMutbzWe50=;
 b=aPb9SSWgLv+swgKXTY0sIbBiXEomrknV8T60rCqXE/1+m2XM3fnUBaj/WO+r3WNxCu
 lbwJbaoTklWg4eEN/5RJ02N5dybxzOep045eZffnyHgWBcW0ABJPe+gyH2HcmXQHDpvT
 nOmwV2DdAJ6qss5O/+XS+Gxcza6YHOhF0PgqkKufSgKDde4MOsrVyBtZ1FNhOxLuBAVb
 EwwfJeGGJSuGvUheDqekGWR3G2Avws70XZD7XT86ZorspoSxXibxQilxiU7uBrLXeB6G
 Q8BEp0R/dOPwuOV/QfJs/sGHwT5InA+nfVAGAMrOQlg8LDN6mMaughhh786mDXNpVed5
 kC0w==
X-Gm-Message-State: APjAAAXM+kFcXGb5YCIzDraWtKVb7kS40PjOgw6pdxCsJIdABoDUrrdG
 eog3ZLvPSh4FDViI/eTHWQWiA5ULPh4JJMzvYH0=
X-Google-Smtp-Source: APXvYqyA15fw+GBy2LBQm36S1dD7ppXchoj+E8qAUuilm2qEJvEg3A0eeazpf7RU33u2oPeZl+nAMoD+jAsMg31XIsA=
X-Received: by 2002:a2e:7609:: with SMTP id r9mr23017875ljc.238.1582315025381; 
 Fri, 21 Feb 2020 11:57:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
In-Reply-To: <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Feb 2020 11:56:38 -0800
Message-ID: <CAKmqyKMKZMEtzGNTz2x0VDGyU8YHp0rLFQNEJ+XU6r1BYAOExg@mail.gmail.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_115707_858314_609C9D03 
X-CRM114-Status: GOOD (  23.59  )
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
Cc: Florian Weimer <fweimer@redhat.com>, Helmut Grohne <helmutg@debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Lukasz Majewski <lukma@denx.de>,
 Zong Li <zongbox@gmail.com>, debian-arm@lists.debian.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 4:37 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de> wrote:
> > > On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de>
> > >
> > > Would it be possible to take a snapshot of your glibc tree
> >
> > The description of the status of Y2038 supporting glibc on ARM 32 can
> > be found here [1].
> >
> > The most recent patches for Y2038 supporting glibc can be always found
> > in the 'y2038_edge' branch [2].
>
> Ok.
>
> > > and start testing this out with debian-rebootstrap [1]?
> >
> > I've been using OE/Yocto for testing as it allows building glibc
> > sources for x86_64, x86, x86-x32, arm32 (probably also for ppc32 and
> > mips - but not tested).
> >...
> > However, I did not yet tried debian-rebootstrap. I will look if this
> > can be reused as well.
>
> The reason I'm asking about debian-rebootstrap is less about testing
> glibc itself than about testing the rest of user space to figure out better
> what needs to be done when rebuilding with _TIME_BITS=64, and to
> start fixing more upstream packages, with the hope of having enough
> of it done in time for the Debian 11 release.

We have started to do that for RISC-V 32-bit. I have fixed up some
things in Busybox and OpenSSL to improve 64-bit time_t support on
32-bit archs. In meta-riscv (and OpenEmbedded layer) we are tracking
issues: https://github.com/riscv/meta-riscv/issues/202

Right now it's all compile focused though, not so much run time testing.

Alistair

>
> > > Are there any glibc issues that prevent it from working correctly,
> >
> > I think that the glibc wrappers for most important syscalls are now
> > converted.
> >
> > What is missing:
> >
> > - NTPL (threads)
> > - stat
>
> Do you mean that code using these will fail to work correctly with
> -D_TIME_BITS=64 at the moment, or that the interfaces are there
> but they are not y2038 safe? Without pthreads or stat, we probably
> wouldn't get too far in rebootstrap, but if the interfaces are there
> and mostly work, then we don't need to rely on them being
> y2038-safe just yet. An obvious next step would be to run the
> resulting code with the RTC set 20 years ahead, and that requires
> it all to work.
>
> > - In-glibc test coverage when -D_TIME_BITS=64 is used. I do have
> >   some basic tests [4], but this may be not enough.
>
> This is probably something where debian-rebootstrap could help,
> as building and testing more user space packages will excercise
> additional code paths in glibc as well. There is also some work
> in Linaro to ensure that LTP tests the low-level syscall interfaces
> in both the time32 and time64 variants.
>
>       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
