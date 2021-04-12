Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE0C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 08:16:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C5A611AD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 08:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70C5A611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IgWsxkFZxgDU3xnOHxIw063ZSKcPTFmw15kULxUbiAM=; b=Rmx8S0Nv7IKAJ9/eOJqzNsbKo
	L/yhLZ7Eiv7GRfrRRc8trAA+Wco/pLvdVJCMD4AtcgDO6u2sSpqb6Zco+hZRo4wYKrl93nw8xTh5f
	LAfOYkBx7X/1DVhtVBMX56+PE8ED6HTuOdt54p6Pf24oKWYmWkAmFTayuC0GkI2FFdJSuW8xStC58
	8GGpb+5liQV5pFlrjWdCgIsgFh3xO91dbh9guhMffVDNfAdVkZLrO6cvaBK10rEc7/z+W+bh8Q8Rr
	oxUP6wodx8Cm20JxEwoXtacScMMN4cq2UcQYlPjT39JE0Xj/3+3xpc3kERpk1Ell1wNF/FA8y/cnh
	Il1b6icXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrkL-0064uU-Rc; Mon, 12 Apr 2021 08:16:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrkH-0064tS-2G
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 08:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uDdOFoatKT+5zEWWAiJzJLrdDEXYwLFG1mwLVDQeZSg=; b=A0tETLAU1qwnPNY1trKQrWxjHw
 vrcz6rqxN31Yyu12IMP0bIrmaN31qhP+edkIGzcYhi85hHM/BRPzOf1ssQf0pJDmOMFmwIdDrNR60
 2e0RQsO47ccNSpk7dExAFE28Yc4C0wD1TQr27Kg2Bbgxow72Yswxel59OjcMV9XctItM5KzMHvGxI
 33fZ6C1xNG0ZrI74QQD4i7ghpFYHGBpA9go1H1BioR47IQIobxNCX2iG5PA/35InV80ECkzQY/dnb
 XD93OrmU3m9STIXxhHnYRj792BCxES4dA48/ZX3WM/H5dKb78k86G+WpivBWPcYOZx7cu9KadmTKk
 I1hhZ9Rg==;
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrkE-005xxO-49
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 08:16:31 +0000
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 13C8GChd020572
 for <linux-snps-arc@lists.infradead.org>; Mon, 12 Apr 2021 17:16:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13C8GChd020572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618215373;
 bh=uDdOFoatKT+5zEWWAiJzJLrdDEXYwLFG1mwLVDQeZSg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ChatkEem71FPJE1307DkBwk3EPN3NFOpzdXEboxnGfQ3DRCYX8wc4wg9Ihk3ndQb5
 RFUazZAR9nNmJcwhJIvJV1T/Y12+8RCbGkYJS64SQ4g9fDYtJcIid3UnlN7jRZW5mM
 kq1Foetoi6isuFQcp4M4PW8YDsrCiy/AG++mRyyu+VyqPU+XT7xVrfFVC15QVKq+Gg
 ZEEhMg0jObJB08TbnX2+tovpffpLkluDGnNlPElN+JT2E6fLFzYMT73bi/H4crUpGS
 6tUqPA9Cy1ovNGsl09vTE+KpBs9rVQtDOWRJQoKwEJIVh3sTj0Duu5nOEkUsMABc1C
 LUgQh95SyPgNw==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id p12so8773043pgj.10
 for <linux-snps-arc@lists.infradead.org>; Mon, 12 Apr 2021 01:16:12 -0700 (PDT)
X-Gm-Message-State: AOAM532a+2OuTY0UBCIKwWJhnwkC8VZb4g/yYed04mqFYCjYQl4wmZDX
 xQt7OKTk1/TjnWiaUMnTjK721E2QElEWJDk6OjY=
X-Google-Smtp-Source: ABdhPJwQIkyZ0y/uMUlvB54CDG4omqvVnzcbv+RlS3hqxhdudrm8EDbUg9sZzv6Fn9SFbxY9GFmI5rHOYOeaY6T9tTM=
X-Received: by 2002:a63:181c:: with SMTP id y28mr26531445pgl.175.1618215372220; 
 Mon, 12 Apr 2021 01:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org>
 <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
In-Reply-To: <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Apr 2021 17:15:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
Message-ID: <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use ?= to assign CROSS_COMPILE by arch-Makefile
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Helge Deller <deller@gmx.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Rich Felker <dalias@libc.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_011630_528321_3BAFCD5A 
X-CRM114-Status: GOOD (  27.62  )
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

On Mon, Apr 12, 2021 at 4:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> > when CROSS_COMPILE is undefined.
> >
> > This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> > conditional.
> >
> > This slightly changes the behavior; the arch-Makefile previously
> > overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> > via an environment variable as in 'export CROSS_COMPILE='.
> >
> > With this commit, arch-Makefle will respect the user's environment
> > set-up, which seems to be a more correct behavior.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks for your patch!
>
> > ---
> >
> >  arch/arc/Makefile    | 4 +---
> >  arch/h8300/Makefile  | 4 +---
> >  arch/m68k/Makefile   | 4 +---
> >  arch/mips/Makefile   | 4 +---
> >  arch/parisc/Makefile | 6 ++----
> >  arch/sh/Makefile     | 4 +---
>
> What about arch/xtensa/Makefile?
>
> > --- a/arch/m68k/Makefile
> > +++ b/arch/m68k/Makefile
> > @@ -17,10 +17,8 @@
> >  KBUILD_DEFCONFIG := multi_defconfig
> >
> >  ifneq ($(SUBARCH),$(ARCH))
> > -       ifeq ($(CROSS_COMPILE),)
> > -               CROSS_COMPILE := $(call cc-cross-prefix, \
> > +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
> >                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> > -       endif
> >  endif
>
> This does not seem to work as expected: my standard build scripts
> (using "make ARCH=m68k") no longer pick up the cross-compiler,
> but fall back to the native compiler, thus breaking the build.


Agh, sorry, this patch does not work
because the top Makefile exports CROSS_COMPILE.

export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC



Removing CROSS_COMPILE from that makes ?= work,
but it would break other parts.


Please ignore this patch.




> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
