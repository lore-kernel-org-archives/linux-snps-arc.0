Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BFC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 03:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnYlZPHxSrMsIKR7rH58zkmqRIwdwG8XHZLOC/aMBZk=; b=B73ZnKv27XwzQ0
	UgoFV7keqZikng5SSZWqsL5+WINa1bM9TS+vHNzeAUR3YwMA2qJbxewe3FNn/Jnl2a3LQNGt4wyKx
	wUzIBhNaWomW4Lcq/sgvvT0R2sUF9pJEXiaWfJSfcr/Nr7KFJDzNTaiRTQX7OknPIda+KOuZip3hk
	UP6afXP1+SZKcPNZRx7kT++Pc9gtrVHNNyFthg5hywaQ+xhI10fpR0bx+sBAoFR6gI8brx1THkeVT
	9wMcrR0jYEmqD0QeW1h97nMj/0ktrpvyiFSeuo5TfHs5K/tD7qJRlZeEfriCTu48JukjUPLYieC7Z
	bYfYYeZIj3wbepJfVB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2PqV-002Cmy-TG; Wed, 29 Dec 2021 03:41:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2PqQ-002ClB-AC; Wed, 29 Dec 2021 03:41:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1DD2B81804;
 Wed, 29 Dec 2021 03:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A799C36AE7;
 Wed, 29 Dec 2021 03:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749299;
 bh=sMe3q8ad98okMs4HLXxIEZG5eWgoWBzrycggRgzNn0g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rMRnM0sy47mX6uuR7D+TwrJ7y7ozZF3yZLCEMGxXEAotZDKwmzaKKtYWX6ysJceh8
 TEgR6eIsrI8xWFWg/lZVP/llG47/437lCwf9YPuoPffvBVzcDoGP/h9e3txqXfKtm2
 bBedJQfjQDI5eZt6y4NhwsbcUGne/0qnzJYb4R+94+vUQcwataYvetF5FZYNa7PQlX
 2SoGPzrWz6M4JhB1Inz0mehc6DK5WFlSrG9Tjc3aHSv6kq08qajpcv/QyixqT9BYGC
 HZVAGqx1AU7WJYM9/X+k/w/xfA5rIX+vu4VnlvLe8n7xgxofu9qDw3fT1Vrp/ZIQTf
 2SrG3XIDAsb1A==
Received: by mail-wm1-f52.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so5374029wme.2; 
 Tue, 28 Dec 2021 19:41:39 -0800 (PST)
X-Gm-Message-State: AOAM530dA1wTsLZOY0JX3/bjdJg0DO9p9xzD6m5TBmPK7iu0jLIZGdlk
 6tmKKVRkvXUMzV6qn29CSfE/UXH9Sl6N70fXTqs=
X-Google-Smtp-Source: ABdhPJwExVf1S5yWbdFaQXvSS7m+9fv3xxH0eSVAhqrz/dUiLqmyF5p5xrdPthuPvZdKvgQOvhEXVEuNpJp0LGzgDhQ=
X-Received: by 2002:a1c:7418:: with SMTP id p24mr20244545wmc.82.1640749287841; 
 Tue, 28 Dec 2021 19:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
In-Reply-To: <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Dec 2021 22:41:18 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
Message-ID: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, John Garry <john.garry@huawei.com>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Chris Zankel <chris@zankel.net>, 
 Karol Gugala <kgugala@antmicro.com>, Jeff Dike <jdike@addtoit.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>,
 Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
 openrisc@lists.librecores.org, linux-s390@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 Greg Ungerer <gerg@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_194142_637218_0ADA1079 
X-CRM114-Status: GOOD (  28.65  )
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

On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.12.2021 um 23:08 schrieb Geert Uytterhoeven:
> > On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> >> We introduce a new HAS_IOPORT Kconfig option to gate support for
> >> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
> >> of the I/O accessor functions inb()/outb() and friends on architectures
> >> which can not meaningfully support legacy I/O spaces. On these platforms
> >> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
> >> called will cause a NULL pointer access which some compilers actually
> >> detect and warn about.
> >>
> >> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
> >> HAS_IOPORT specific sections will be added in subsequent patches on
> >> a per subsystem basis. Then a final patch will ifdef the I/O access
> >> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
> >> into a compile-time warning.
> >>
> >> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> >> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> >> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> >> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/Kconfig
> >> +++ b/arch/m68k/Kconfig
> >> @@ -16,6 +16,7 @@ config M68K
> >>         select GENERIC_CPU_DEVICES
> >>         select GENERIC_IOMAP
> >>         select GENERIC_IRQ_SHOW
> >> +       select HAS_IOPORT
> >>         select HAVE_AOUT if MMU
> >>         select HAVE_ASM_MODVERSIONS
> >>         select HAVE_DEBUG_BUGVERBOSE
> >
> > This looks way too broad to me: most m68k platform do not have I/O
> > port access support.
> >
> > My gut feeling says:
> >
> >     select HAS_IOPORT if PCI || ISA
> >
> > but that might miss some intricate details...
>
> In particular, this misses the Atari ROM port ISA adapter case -
>
>         select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>
> might do instead.

Right, makes sense. I had suggested to go the easy way and assume that
each architecture would select HAS_IOPORT if any configuration supports
it, but it looks like for m68k there is a clearly defined set of platforms that
do.

Note that for the platforms that don't set any of the three symbols, the
fallback makes inb() an alias for readb() with a different argument type,
so there may be m68k specific drivers that rely on this, but those would
already be broken if ATARI_ROM_ISA is set.

          Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
