Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A704C43334
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Jul 2022 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wd/VwpB8TH0GOAGa1OuwIS5DS34ujVu6b+kJsNlHN8=; b=iuExnpgweUDvUh
	YgoIWMs/piKyO25uCTlb0gYEVjgyfdUAB8nPwu4QUEo+0GQt+r7tIu4fo86D9qW5V2XatMBRKRsdV
	8jLL7O2jGHG8AA6hwGtPICbHUEVVS78ojP9BwUfoOFoofCMaEQd9sDj1zQi3TWWehbKYOmId2p1Vi
	+e7kqd203Ky29TrkCQ2hwzFK9WVZ8L0mVZJqbs7eRHA/fIJttQWahL5GcT1Lh344QdiPv2zB88fV1
	7nLw/qL3V5fr9+2wcuKL7/SSQJL+e2MFCgAZfzLPTnCOthmDQlmm2b4DO58hspYhOcDWCs9kn2w0o
	erGEPMZZN86vaT/wo6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAmL4-00GDsA-Tb; Mon, 11 Jul 2022 05:52:10 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAmL1-00GDoR-OF
	for linux-snps-arc@lists.infradead.org; Mon, 11 Jul 2022 05:52:09 +0000
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 26B5pbuC026223
	for <linux-snps-arc@lists.infradead.org>; Mon, 11 Jul 2022 14:51:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 26B5pbuC026223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1657518698;
	bh=nJdtwmIgrVPA0dtmVpPR8fp9Vk3EMrRlmk8wkbLbI2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=obxUlw7OF194lDxjAIa3n2rN6jPm7eELxwBq6iY3pQGba6zF0OcdR1XxugDvxyFdn
	 +cmOr74FTMVs+0gU6uh+hcByvVNbJR8I2QYpwNhtru9eOhOb5FvUfpouviOF1Ewh/7
	 oUpUvtwgcrMQvOhvJXXvRZENbaNQlTlJuvJDfmx+In98EK0xbxFuVHn0aEKVWOkEZV
	 lDThjLUdHlO8B06R7ZjtNJ7RtSYnNCaq7RIPT0TjsE6LmIt9kyQ44z/5HFtocPlBl/
	 BFWzF9ER7I9ccZIj0anEW4mmBTouEsiKeqXCfvSr1V2fNVeWtqVDu7T/ODaOT0tV8O
	 Vvzpcq9TjBMaw==
X-Nifty-SrcIP: [209.85.128.48]
Received: by mail-wm1-f48.google.com with SMTP id o19-20020a05600c511300b003a2de48b4bbso3005346wms.5
        for <linux-snps-arc@lists.infradead.org>; Sun, 10 Jul 2022 22:51:38 -0700 (PDT)
X-Gm-Message-State: AJIora+CgqpM3qTExncr+qKEkkN48lQQGwKbqg3DSSxnwgABiafpT2PR
	iB2ERJl0y50LrtvUYrm71zMahg2RYbREwcAN4zo=
X-Google-Smtp-Source: AGRyM1vsDrLJ6rtJwQeHonOKDhW3TOmc/Pg1e+zzajG3BZKqRdOLhg3kdPsXEWwSsp+e27u8+CqE7x9sWMupfSPLYJ4=
X-Received: by 2002:a05:600c:35d6:b0:3a2:e873:6295 with SMTP id
 r22-20020a05600c35d600b003a2e8736295mr2783183wmq.22.1657518696690; Sun, 10
 Jul 2022 22:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+55aFz2sNBbZyg-_i8_Ldr2e8o9dfvdSfHHuRzVtP2VMAUWPg@mail.gmail.com>
 <20220628210407.3343118-1-ndesaulniers@google.com> <2842572.mvXUDI8C0e@sakura.myxoz.lan>
In-Reply-To: <2842572.mvXUDI8C0e@sakura.myxoz.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 11 Jul 2022 14:50:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrgiJX7VGAda4YaXCso2wMufd_X1Q0XMYfG0yGg4mLBw@mail.gmail.com>
Message-ID: <CAK7LNATrgiJX7VGAda4YaXCso2wMufd_X1Q0XMYfG0yGg4mLBw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop support for CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
To: Miko Larsson <mikoxyzzz@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chris Down <chris@chrisdown.name>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Oleksandr Natalenko <oleksandr@redhat.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        X86 ML <x86@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>,
        Vineet Gupta <vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_225208_037603_D6350EFD 
X-CRM114-Status: GOOD (  24.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jun 29, 2022 at 7:48 PM Miko Larsson <mikoxyzzz@gmail.com> wrote:
>
> On Tuesday, 28 June 2022 23:04:07 CEST Nick Desaulniers wrote:
> > The difference in most compilers between `-O3` and `-O2` is mostly down
> > to whether loops with statically determinable trip counts are fully
> > unrolled vs unrolled to a multiple of SIMD width.
> >
> > This patch is effectively a revert of
> > commit 15f5db60a137 ("kbuild,arc: add
> > CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC") without re-adding
> > ARCH_CFLAGS
> >
> > Ever since
> > commit cfdbc2e16e65 ("ARC: Build system: Makefiles, Kconfig, Linker
> > script")
> > ARC has been built with -O3, though the reason for doing so was not
> > specified in inline comments or the commit message. This commit does not
> > re-add -O3 to arch/arc/Makefile.
> >
> > Folks looking to experiment with `-O3` (or any compiler flag for that
> > matter) may pass them along to the command line invocation of make:
> >
> > $ make KCFLAGS=-O3
> >
> > Code that looks to re-add an explicit Kconfig option for `-O3` should
> > provide:
> > 1. A rigorous and reproducible performance profile of a reasonable
> >    userspace workload that demonstrates a hot loop in the kernel that
> >    would benefit from `-O3` over `-O2`.
> > 2. Disassembly of said loop body before and after.
> > 3. Provides stats on terms of increase in file size.
> >
>
> Might be worth cleaning up the rest of the kernel of instances of -O3,
> too. -O3 used to build lz4 and mips vdso, for instance. Might be a bit
> of a digression, though


This patch focuses on the removal of CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3,
so I think it is OK as-is.

The rest of cleanups, if needed,
should be submitted separately.




>
> --
> ~miko
>
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
