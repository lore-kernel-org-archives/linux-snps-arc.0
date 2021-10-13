Return-Path: <SRS0=sfpc=PB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9AAC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Oct 2021 08:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59DE861074
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Oct 2021 08:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59DE861074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G52/Fznss6S9qogsDGjAWwLNFOL2KKqxYodA6xjpmx8=; b=GhT1Sk+XtMsz6T
	hcr6nzF3AeXh7KrWbXFCK5r6ZyD/yDzRB3MU9wkaPmZOWM55pMsnlHxOa030oMLQ3F9rEwvbLrPBa
	Gkgzx/MzSrOJBzr0PVcCP0843JqAbdCaIcAsxghSyEuSpksnHEGtNudVkjzjAvlnS/v39njByVkJR
	Z0/c9iQkqZunQxhd7dDXAXsTI3fRMjwSFpNoL/4ahElzuTk3MCESvQOWooZOJ4y0uAm6wSCqUJIeu
	s7YPePOvRH1yYMR3+ViDFkwjsbiFZ6j7/VqEY6tNYu8ycPPBwnardXlQA3h4sOXPb6vsFCItdftHc
	nVVFL3G1gkgbWv/4CSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZVc-00FXoS-Ci; Wed, 13 Oct 2021 08:21:08 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYEO-00FF8K-QA; Wed, 13 Oct 2021 06:59:19 +0000
Received: by mail-ua1-f41.google.com with SMTP id r17so2512436uaf.8;
 Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLmWoWym/1fKiJu7c9gpS1cDGT+57poTvw7kTscrC00=;
 b=h0MDBG6h8xW98neCl3gUYy7+HHO5D7f1JGFwd1P2v3y2T3WxCPpWgwIsqM3gflGD7u
 VMkUgBNlyjWZW2C9noXKDqUw6wo+Lb7ni/5HcgpPaC9HEWRaBiW347IfJFOZkctskzrD
 BTjmIoKokNjpesZp542iPE36hAXKG5LQ7KZ6qN1N1ajz4AH0xRqT1lgC6av5pWj53gO6
 2Khsf0G6M3a72m6TZQcHh6mas/MLpzEfmOsBvGY7E6urnzzno1P6Kl85tvKkPJAD2Pgw
 bnTkMZQUXXKt/fGntW4AJlnw3HwGHTVyYK74XSiili6zzP5uniNieuyBOr1ox3BxP3ov
 b3LA==
X-Gm-Message-State: AOAM530ujwMNppcJcZ8UAyQkeoxNGHewo2BwKA/S1jEe+ovRYQOO/8vd
 oX37/2KTcPjv84jT+qlO/RL3xjG2c2MmgIbLEk8=
X-Google-Smtp-Source: ABdhPJzwsQvQy07KzSSKF36slqOOCBmzhi7G4XFKh+MxO1aqVfgv6UylAsUlKqrZrwFEymqmWaysD4XtAMh8gSFAJlY=
X-Received: by 2002:a67:d583:: with SMTP id m3mr36353545vsj.41.1634108355035; 
 Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 08:59:03 +0200
Message-ID: <CAMuHMdUQVpvvq=ZqjL97gV6AxS5eGm4mRS=gL4PPwWiBS-v5AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jonas Bonn <jonas@southpole.se>, 
 Jonathan Corbet <corbet@lwn.net>, Julien Thierry <jthierry@redhat.com>,
 Kees Cook <keescook@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matt Turner <mattst88@gmail.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Michal Marek <michal.lkml@markovi.net>, Michal Simek <monstr@monstr.eu>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nick Hu <nickhu@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Rich Felker <dalias@libc.org>, 
 Richard Henderson <rth@twiddle.net>, Rob Herring <robh@kernel.org>,
 Robert Richter <rric@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vincent Chen <deanbo422@gmail.com>, 
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Will Deacon <will@kernel.org>, William Cohen <wcohen@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 alpha <linux-alpha@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 sparclinux <sparclinux@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_235916_902711_AC0E6C58 
X-CRM114-Status: GOOD (  21.74  )
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

On Wed, Oct 13, 2021 at 8:43 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Documentation/kbuild/makefiles.rst suggests to use "archclean" for
> cleaning arch/$(SRCARCH)/boot/.
>
> Since commit d92cc4d51643 ("kbuild: require all architectures to have
> arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
> all architectures. This can take advantage of the parallel option (-j)
> for "make clean".
>
> I also cleaned up the comments. The "archdep" target does not exist.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

>  arch/m68k/Makefile                 |  4 +---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
