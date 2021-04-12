Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07522C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 08:28:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9286120F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 08:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9286120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o0BEL9805/SeJJrGVGkhKmByI4aXgn1rjNKJcCiCQkk=; b=HgsNgRKq/Oq+Lu+XmWvMUYSep
	IEInJDUyrHcH/CnM1lAZ5vocf8RTaK4BPLthlVeI9rDa8eK2L6TTJr8JDXyPlzm2I7v3klPs5EO9u
	EpZn+Bu/ptjnk2fy5FM3IfwkHpz5etB8bj2c8EqNujOKoZfMTW5evJlhdYklh+NwuMU891bm1O4wA
	rINJ+rxsGDcRY8m6N+cnkd0qKUFc17yFXj4b8qF7GPR0pCEUVHpwwGcupt86bp5oPNWV/SFwfmv8l
	AevTSmrWvsxykjqDecfr5pf90UAyPhrQN0GdkQkVNQ2IUW47W1e0OInT3DOox5casJjNKvU3mj4PW
	XqZYmrboQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrvl-0066M0-Hx; Mon, 12 Apr 2021 08:28:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrvi-0066Ks-2r
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 08:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c1IhrGLvzsIx4560qVz2GUCgMBQOnPKbvKurVuhpDpw=; b=DLR7TeZ1VBbSMlTeLEPu7xsSG0
 WPca9xxsy8sF2rP39HGSkrc3201kU/GZKkC71KlgKITNzSr7ucsfv7/xHIPErsWiHKa64BL+vMrq6
 jvD2IILGw4sr5VXqPZS+U5tCzK/FhBf3EACE0nQTT7FlvMD3qWfXQvtcpXqEJnaByDXOf0mfGTens
 YRNehqHKlrlNwWGHipY+0ja9PukDNYyeaDL84Hdm1trpGQOQvjfciLz7pohAlmQW/swubfoOj9Coz
 0QfJahz2TE3qbhG5JeI8P/BiKGr66PscGTLyKEygnrsqi2mpNMBq5udJFByxBsptGAZQTECGJdIyH
 5ETmf11g==;
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrvf-005yTL-8q
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 08:28:20 +0000
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 13C8Rq4r026818
 for <linux-snps-arc@lists.infradead.org>; Mon, 12 Apr 2021 17:27:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13C8Rq4r026818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618216072;
 bh=c1IhrGLvzsIx4560qVz2GUCgMBQOnPKbvKurVuhpDpw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NiP0X6hMLWgq+VYGZSmYki//AUH/ZBzK9e7UqX3Nc7waxrNwbhFxyHEB725a+o63q
 MPvrXc5TZXyNKoEXWhNBdaaU6sonVZvU6fp4Ao7AfArNLzNSk1lOHTLKEGJlPqPMqE
 evVy1V3/D1bkxH0uVx8fo0P+QN509ovV6WIsosGbENBhwEzLf7XE9QmcVBTEG0r98z
 NeOAU7Kk4vaKG80BfEnKZFQXPd0KJEmsBbjZcyo8w72cm76FWc+zKpa3U7zEdTKcSG
 LWJC8CYgmxyMIEYpliHBuk9SWZCew30ov29G2k7Mveywh3R4ic2sWoU5vPsOyQbZwT
 /7zDZ4gcwaVtw==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id b26so3588547pfr.3
 for <linux-snps-arc@lists.infradead.org>; Mon, 12 Apr 2021 01:27:52 -0700 (PDT)
X-Gm-Message-State: AOAM531ky3fuW4E/Nv7mauyAyBjAUPbZfGVBgnGhJxclywEFtx5YXshr
 vwgwQ3HHhMwE0y46yrw9dERckDwJOLnPlLcuRB4=
X-Google-Smtp-Source: ABdhPJxWu5eo6g5XkG8nagihI3vcZ1wy4ZPqpby27+EDqBuxW+ScHk7SWuoOKXUtPxm8cR3FKZlQdNvUi9T5ym2y7JQ=
X-Received: by 2002:a65:45cf:: with SMTP id m15mr16557488pgr.7.1618216071763; 
 Mon, 12 Apr 2021 01:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org>
 <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
 <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
In-Reply-To: <CAK7LNATozxbhq1Q4HtiOrE87KKFEmdC7Hfp-biXYG1e_eFzHvw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Apr 2021 17:27:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4AqtqHzDnscMtXV1KGzgHy7ZDoFFcZ=QNSv1fT+wKFg@mail.gmail.com>
Message-ID: <CAK7LNAR4AqtqHzDnscMtXV1KGzgHy7ZDoFFcZ=QNSv1fT+wKFg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210412_012819_554921_C292BB17 
X-CRM114-Status: GOOD (  34.20  )
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

On Mon, Apr 12, 2021 at 5:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Apr 12, 2021 at 4:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Yamada-san,
> >
> > On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> > > when CROSS_COMPILE is undefined.
> > >
> > > This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> > > conditional.
> > >
> > > This slightly changes the behavior; the arch-Makefile previously
> > > overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> > > via an environment variable as in 'export CROSS_COMPILE='.
> > >
> > > With this commit, arch-Makefle will respect the user's environment
> > > set-up, which seems to be a more correct behavior.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Thanks for your patch!
> >
> > > ---
> > >
> > >  arch/arc/Makefile    | 4 +---
> > >  arch/h8300/Makefile  | 4 +---
> > >  arch/m68k/Makefile   | 4 +---
> > >  arch/mips/Makefile   | 4 +---
> > >  arch/parisc/Makefile | 6 ++----
> > >  arch/sh/Makefile     | 4 +---
> >
> > What about arch/xtensa/Makefile?
> >
> > > --- a/arch/m68k/Makefile
> > > +++ b/arch/m68k/Makefile
> > > @@ -17,10 +17,8 @@
> > >  KBUILD_DEFCONFIG := multi_defconfig
> > >
> > >  ifneq ($(SUBARCH),$(ARCH))
> > > -       ifeq ($(CROSS_COMPILE),)
> > > -               CROSS_COMPILE := $(call cc-cross-prefix, \
> > > +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
> > >                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> > > -       endif
> > >  endif
> >
> > This does not seem to work as expected: my standard build scripts
> > (using "make ARCH=m68k") no longer pick up the cross-compiler,
> > but fall back to the native compiler, thus breaking the build.
>
>
> Agh, sorry, this patch does not work
> because the top Makefile exports CROSS_COMPILE.
>
> export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
> CROSS_COMPILE LD CC
>
>
>
> Removing CROSS_COMPILE from that makes ?= work,
> but it would break other parts.
>
>
> Please ignore this patch.
>
>
>
>
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
>


The following will make this patch work, but probably it is better to
not do this...




diff --git a/Makefile b/Makefile
index cc77fd45ca64..26bf482f0d88 100644
--- a/Makefile
+++ b/Makefile
@@ -506,7 +506,7 @@ KBUILD_LDFLAGS_MODULE :=
 KBUILD_LDFLAGS :=
 CLANG_FLAGS :=

-export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS
LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
@@ -681,6 +681,8 @@ export RETPOLINE_VDSO_CFLAGS

 include arch/$(SRCARCH)/Makefile

+export CROSS_COMPILE
+
 ifdef need-config
 ifdef may-sync-config
 # Read in dependencies to all Kconfig* files, make sure to run syncconfig if






-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
