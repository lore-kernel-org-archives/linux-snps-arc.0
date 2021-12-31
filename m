Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE28C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Dec 2021 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHlN5NMXBpLbrSYVnZTEFOn6zRTcaBiQvdbuj84H7lE=; b=FNzt4Dcd8rYrzx
	5+DJxrwVTveojeK3cFStC0wlfEypbNaNWrgpUbz0qmHL5aN2Yv4uDajTQ4ToZOpm2mZ3y2qtnu6fp
	vhKACkTAVGjUVrPsQaI0Kh0L+JzyMEfeAnnBa0YRzzxt1L3j4SUj0BLWTHwWa8VaWxWf8vu6oe47f
	BcK2BdJCforiewlp/qAJJclbjYvvrvrHwKkK3WiyGJOAsD8s9RAaZoa1KBkNvnkV/2QwqULPuBrSB
	KIZp4hTgAKaeAmpyXPkOjgizKtMDwxVb0GP2EPHgrNbeJFe6Rz6oar+DOS3qazxlRoxBhgnzNXTeh
	XjYD9/E4QOFxeWoFcKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3KOg-006GF7-G8; Fri, 31 Dec 2021 16:04:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3KOa-006GDV-Ss; Fri, 31 Dec 2021 16:04:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A601AB81DA8;
 Fri, 31 Dec 2021 16:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F85C36AF8;
 Fri, 31 Dec 2021 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640966682;
 bh=pu3EOtLhubDoxaVwiYbh4e/NfH+lhjOkYe7VbmME5Z0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Euh2o2Kkz1tmQ8C8kKXTGxu9k+XiPQd+GTU54XC5K+WvaDvKNBp4YA1NTwxkHcNrP
 dN47x3ffGu9ycdEJVDOlkzGkBJEPoC5cg21t4SdMPAJxw5N1HvjiQJQphKfJiyGs6d
 uf5CS42EjMWWThugXEOPo5BtQq8sv7Lw4mktm6zLDmn8PHcqz1yH+wJt3hrDuHKTam
 9RS/G+HSoRiRErAy4zigA/AJavxFLKXIg+nWKjqsR7HmcihUHbUG+6azkLMjsxNimi
 ZfE4/FQxcZ6oBAiopKW4TjkRqnEpYlwvKoYfJ5kycPYcGxuez6Btxz414c9sAZtT8l
 2tJgQu9p9VY/g==
Received: by mail-lf1-f44.google.com with SMTP id g11so61036746lfu.2;
 Fri, 31 Dec 2021 08:04:42 -0800 (PST)
X-Gm-Message-State: AOAM5333Eu+jqDYlKJpape0KWJ33urlennPJWwUoxRvJVMk+2QI4/WzV
 kdXqo0Y63WEzcC3bjLmxxDKEzpSGZXVSol5V488=
X-Google-Smtp-Source: ABdhPJzApDVGjcuVEHw18tz1R9gDPlbk/Ui+m3pYQWhrQTDSy0tEhDoMzOEccUFjcDO7rPU48bSeyrks7IEcpaugXLU=
X-Received: by 2002:adf:f051:: with SMTP id t17mr29442418wro.192.1640966669503; 
 Fri, 31 Dec 2021 08:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
 <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
In-Reply-To: <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 31 Dec 2021 11:04:12 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
Message-ID: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
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
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-csky@vger.kernel.org, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 linux-s390 <linux-s390@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-ia64@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_080445_215501_E1D2667E 
X-CRM114-Status: GOOD (  34.10  )
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

On Wed, Dec 29, 2021 at 10:44 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 30.12.2021 um 14:48 schrieb Arnd Bergmann:
> > On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> > What some other architectures do is to rely on inb()/outb() to have a
> > zero-based offset, and use an io_offset in PCI buses to ensure that a
> > low port number on the bus gets translated into a pointer value for the
> > virtual mapping in the kernel, which is then represented as an unsigned
> > int.
>
> M54xx does just that for Coldfire:
>
> arch/m68k/include/asm/io_no.h:
> #define PCI_IO_PA       0xf8000000              /* Host physical address */
>
> (used to set PCI BAR mappings, so matches your definition above).

I think coldfire gets it right here, using PCI_IOBASE to find the start of
the window and a zero io_offset:

#define PCI_IOBASE ((void __iomem *) PCI_IO_PA)

> All other (MMU) m68k users of inb()/outb() apply an io_offset in the
> platform specific address translation:
>
> arch/m68k/include/asm/io_mm.h:
>
> #define q40_isa_io_base  0xff400000
> #define enec_isa_read_base  0xfffa0000
> #define enec_isa_write_base 0xfffb0000
>
> arch/m68k/include/asm/amigayle.h:
>
> #define GAYLE_IO                (0xa20000+zTwoBase)     /* 16bit and
> even 8bit registers */
> #define GAYLE_IO_8BITODD        (0xa30000+zTwoBase)     /* odd 8bit
> registers */
>
> (all constants used in address translation inlines that are used by the
> m68k inb()/outb() macros - you can call that the poor man's version of
> PCI BAR mappings ...).

This still looks like the same thing to me, where you have inb() take a
zero-based port number, not a pointer. The effect is the same as the
coldfire version, it just uses a custom inline function instead of the
version from asm-generic/io.h.

> So as long as support for any of the m68k PCI or ISA bridges is selected
> in the kernel config, the appropriate IO space mapping is applied. If no
> support for PCI or ISA bridges is selected, we already fall back to zero
> offset mapping (but as far as I can tell, it shouldn't be possible to
> build a kernel without bridge support but drivers that require it).

Right.

> > As this is indistinguishable from architectures that just don't have
> > a base address for I/O ports (we unfortunately picked 0 as the default
> > PCI_IOBASE value), my suggestion was to start marking architectures
> > that may have this problem as using HAS_IOPORT in order to keep
> > the existing behavior unchanged. If m68k does not suffer from this,
> > making HAS_IOPORT conditional on those config options that actually
> > need it would of course be best.
>
> Following your description, HAS_IOPORT would be required for neither of
> PCI, ISA or ATARI_ROM_ISA ??

For these three options, we definitely need HAS_IOPORT, which would
imply that some version of inb()/outb() is provided. The difference between
using a custom PCI_IOBASE (or an open-coded equivalent) and using
a zero PCI_IOBASE in combination with registering PCI using a custom
io_offset is whether we can use drivers with hardcoded port numbers.
These should depend on a different Kconfig symbol to be introduced
(CONFIG_HARDCODED_IOPORT or similar) once we introduce them,
and you could decide for m68k whether to allow those or not, I would
assume you do want them in order to use certain legacy ISA drivers.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
