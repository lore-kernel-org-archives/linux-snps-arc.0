Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2858FC11D04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 12:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB001208C4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 12:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Imla7OZN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB001208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dq3n5PZ7/Wus4VSLFFdjcExOLuLnPKRUGziVjDL7vE=; b=Imla7OZN6nsGc7
	h+m2o1ZaoXJFyIyMrZclLqGzJ0uU7/4+62YWrDArXDUOm1QLvQ2Xml456wMp/WTFmji8QxIgoHsQe
	wCoSnNSwY+uNMP2M0YsgIWjnnZkSHzVnsq4v7lqdZAYr4IsZlKastQyT0veRRzKCehDTI0140qbVl
	vwtEcVfd2OlkP/DDu7HSi/SIRHU7AI3K5aecngnqFsnNEVio6y5ZQeDd5fwHyvc3gc8uxSGtd35uh
	F+G18jTWj6RqAgy3LhLbT0j4HNeboAky7q0qRnUs9c/LYHj3qMRnuemvYyOylZsKyCCM4IxwipFth
	CtTkujFnvpn4iu1qKxoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4l5O-0005uE-9p; Thu, 20 Feb 2020 12:37:46 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4l5J-0005th-7r
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 12:37:45 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MKKdD-1ijVLL3tZH-00Lkcm for <linux-snps-arc@lists.infradead.org>; Thu, 20
 Feb 2020 13:37:37 +0100
Received: by mail-qt1-f174.google.com with SMTP id w47so2719219qtk.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 Feb 2020 04:37:34 -0800 (PST)
X-Gm-Message-State: APjAAAWKj0HSFaMidHtg2mXdfsYf7FvQ7sI0D7v72IlJpijkWE5pkiwb
 FLl4mOjA6kpnoQFibV0tq//gFnzSGnl6nE2I4E0=
X-Google-Smtp-Source: APXvYqyc6beXt0+oO0fYGvL+9EnCXlic00GKSc3PFKNXmj/DUnIKI1RGetLueHgdiRIAfY4y12ePryeKbYp9grNQSqQ=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr26025838qte.204.1582202253664; 
 Thu, 20 Feb 2020 04:37:33 -0800 (PST)
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
In-Reply-To: <20200220103716.2f526933@jawa>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Feb 2020 13:37:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
Message-ID: <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
To: Lukasz Majewski <lukma@denx.de>
X-Provags-ID: V03:K1:chkIoPvbYrJysNUyhSOpF4YxcQqbpPLEb14+gKfQsXpYUHefhbH
 EXgfKFqdR4dQQUKylwdbI1UG4QUQWZqPLVL9aPssxR/m2AwhjAV1pxyFGJEWdraghm0NoiW
 nokGre97GiPs4tu/f8h4KAQ9sZYMDAeygn29yUyklCK51aY2wQqY1idPIzWbWYMNYm4NwfQ
 CmNmA2vhjbpvCJQ9oG3hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cfTKW/V4xDY=:ya0BRVUQXHBgaVYMyOMz1Z
 9QQphPdPy4wlPF7sjjuYPSheutU8U4FWYVRuFumJ5jQZHNJJqPSPtTN/zgzqRXVzAxkT/Kdm2
 Osa7j+rQ+nNaZoeTZ371jEK9fdOIRHTWW5siMOMv+RliqeGS2+WTn1Rg9XoxpnrSpsbFsvnMl
 XSOsLsO06wdAWmxGdzYZTrvsFPqGLhpvy2k9seqceTUe105/J5Q4p0UBpMRE/sPF7fhS0sI3s
 n6EGiZnl6IwmvLsPXuvhnTgs+3LiMkmNVXrymRqUHFRpmsXPCpkM4fC4qB38dZfZmVPR0Hbyn
 wcN9w/kbq4d17qhVOMauWzDM5VPHbmYxjORlFd5alQX6N01tI9h9ATwCIcJEMEp4o++A1Uzim
 oaRQd3TxrjdOD5oqRmKNwSziBkOBgzWgT5OvD4dwrh5h8nOmpG9cSm7hxmrcyNZbK+Oja3W2w
 EQONS/lenNNKRfr7yB5jZtC1RJMTMb9bIuow4Dfx+cSEtwAJF8C+o5yJATSHz2OJmTQ48ZRev
 MYT3DLlT1aodFhmg8ToUFy7qoaZBU7OZw3nJUkQwtMQ4eoZNe4qxN8UYhiB6Rdhsg/f8aeMY4
 uFg4rxjHyuWeZaaduvJUXvTgJq+1al4RtTFyuk6M+OjDeegH9y8spU+PLpR2sjf8cn2ojderT
 MMC4j+CZs5nBKHesBOIRKhEZa355wiNyL48WnDwzZAVBnnKdj+3DSQ86Uvp0o4nQeSp6WEs4l
 gBpHIQIEYUCiCsql9yekZhzpVSWDdXDKNwvpHPhlN74XPNkn31qoPv7l0cSRNfp4xWTuTSH5j
 9/vO0IrP5oTelP2www/F+DHsOAoHgZJ7+SJaFPQSL6ezysq3p4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_043741_572472_FB89C558 
X-CRM114-Status: GOOD (  20.49  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de> wrote:
> > On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de>
> >
> > Would it be possible to take a snapshot of your glibc tree
>
> The description of the status of Y2038 supporting glibc on ARM 32 can
> be found here [1].
>
> The most recent patches for Y2038 supporting glibc can be always found
> in the 'y2038_edge' branch [2].

Ok.

> > and start testing this out with debian-rebootstrap [1]?
>
> I've been using OE/Yocto for testing as it allows building glibc
> sources for x86_64, x86, x86-x32, arm32 (probably also for ppc32 and
> mips - but not tested).
>...
> However, I did not yet tried debian-rebootstrap. I will look if this
> can be reused as well.

The reason I'm asking about debian-rebootstrap is less about testing
glibc itself than about testing the rest of user space to figure out better
what needs to be done when rebuilding with _TIME_BITS=64, and to
start fixing more upstream packages, with the hope of having enough
of it done in time for the Debian 11 release.

> > Are there any glibc issues that prevent it from working correctly,
>
> I think that the glibc wrappers for most important syscalls are now
> converted.
>
> What is missing:
>
> - NTPL (threads)
> - stat

Do you mean that code using these will fail to work correctly with
-D_TIME_BITS=64 at the moment, or that the interfaces are there
but they are not y2038 safe? Without pthreads or stat, we probably
wouldn't get too far in rebootstrap, but if the interfaces are there
and mostly work, then we don't need to rely on them being
y2038-safe just yet. An obvious next step would be to run the
resulting code with the RTC set 20 years ahead, and that requires
it all to work.

> - In-glibc test coverage when -D_TIME_BITS=64 is used. I do have
>   some basic tests [4], but this may be not enough.

This is probably something where debian-rebootstrap could help,
as building and testing more user space packages will excercise
additional code paths in glibc as well. There is also some work
in Linaro to ensure that LTP tests the low-level syscall interfaces
in both the time32 and time64 variants.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
