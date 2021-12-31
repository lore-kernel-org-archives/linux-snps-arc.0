Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F6C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Dec 2021 21:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkQG/nOiUv9jj/F4MNLy2s96CqtsX+zDchxSp0r5Bro=; b=RnRCSK5/lCwWtmw8J4K0MPqX0x
	eiAfahpVwJx20VFtHX/ivK4v3nLVLHkeUfCwW7sVDeIPCD4rM6ig6obZC/wmi4lLFMENtf+VHi1HM
	A4qvuF22ZlmT2tDtw1rW0DjAXhRHTZfGaQFLPLnxU8nh6pcrgrTP2/0tcWzNPWcdJsJZg1Mvu2ATY
	AnYtmphj56CToIMbjevWO68e39x0LoPKqsBl+j0yjWAcMWpUQByqZ7KbDMXpJXP1/JPxcwemBwCsX
	j3kCrvxaKDKgZy4A2iMvBQI+g7J65pE5VamagVVi1KaJcIYXACEPQanhpMuGs4HEv1G+kuQu2co2P
	ddKFgNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3PsV-006YvE-Rx; Fri, 31 Dec 2021 21:55:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3PsS-006Yuk-8C; Fri, 31 Dec 2021 21:55:57 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so3649430pjl.0; 
 Fri, 31 Dec 2021 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=T1hx50UVDERByCQtA2jPhEceIqEPV53U/9yB8e5/FYk=;
 b=LjsOP7dtkJk8TTLzgH2x733jvWKdpcNmqgEkJGbhcliBN3P4mGcoa4RHGyc7AE+uv0
 1q6IiTtA1Dj+hFT4fbo5YFfHQJP3D3q9epLhg2FMsybdbsOcLxZAwPm0457fBAaRsDqQ
 IL99rj8gfeLcMykifXB/Gt0fb/qQevJBIrut1EB236pdFPwlsYQCiXgvL1uR2c1NkIEI
 s9mlOS/JU5lFDS2xWEDijv28JBOklmN0+7s5aGmoNcQDKeGvOeymMRfNiZGGdhERxmTx
 AwTYJpI5KYZX0tSyGEY8pkdXLvzdxOJEnG3qvPabZ4r2I9OhjOAaaBl0S4GhUjhjIInk
 c95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=T1hx50UVDERByCQtA2jPhEceIqEPV53U/9yB8e5/FYk=;
 b=gPQe131s8O4qhClmxRS5eGmgPHzepdf31nRoJ/CsPGfv+0QORC3YEz0DiUtjOz3jgv
 B5RlZ6vy4AVkJ0muGzopfUJrvIqT9XOPxzg+wozPxB2Ts+AxwVTiDvEWCNqi5Fo5+MCE
 5TLhWf85WMTVPa2FMGNmNhtr5ujMdP95O2CEMu01i+Z3QnFzYsqY9Az8P0ruKN1UthHK
 d2Lu4GwoPHw1M+kRdw9yK3muSAsSTyCFlVnJNrSDx/mrGARHR9+jvLIDWp3qD6t3N//H
 i2tP+psajf1j2BCBnL43ZR7Ldj15S8DnolkUje+ybiXLIyT324eJ/gNR1vI/zlUvDDmG
 hoEQ==
X-Gm-Message-State: AOAM532ujvCYd2x2NSWc4QStmMD4n/NvIjLVVFTqK7H6nW/R2aVxmrOH
 iqANbfVsauulxqnPWnI4190=
X-Google-Smtp-Source: ABdhPJz1F4nn7gYkCA3wVb/U0vH3yAlfu9Ov4LEv5tjkAkrde3xqL11hZ+AbHJ3jgiQyphWKkycvHA==
X-Received: by 2002:a17:902:bb97:b0:144:d5cb:969f with SMTP id
 m23-20020a170902bb9700b00144d5cb969fmr36731618pls.36.1640987753994; 
 Fri, 31 Dec 2021 13:55:53 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 p186sm13526661pfp.128.2021.12.31.13.55.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Dec 2021 13:55:53 -0800 (PST)
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
 <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
 <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, John Garry <john.garry@huawei.com>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Chris Zankel <chris@zankel.net>,
 Karol Gugala <kgugala@antmicro.com>, Jeff Dike <jdike@addtoit.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Heiko Carstens <hca@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Openrisc <openrisc@lists.librecores.org>,
 linux-s390 <linux-s390@vger.kernel.org>, alpha
 <linux-alpha@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a635e885-c365-8bdc-bf3c-e74d7d39a786@gmail.com>
Date: Sat, 1 Jan 2022 10:55:27 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_135556_360351_D22F1124 
X-CRM114-Status: GOOD (  32.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Arnd,

Am 01.01.2022 um 05:04 schrieb Arnd Bergmann:
> On Wed, Dec 29, 2021 at 10:44 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 30.12.2021 um 14:48 schrieb Arnd Bergmann:
>>> On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> What some other architectures do is to rely on inb()/outb() to have a
>>> zero-based offset, and use an io_offset in PCI buses to ensure that a
>>> low port number on the bus gets translated into a pointer value for the
>>> virtual mapping in the kernel, which is then represented as an unsigned
>>> int.
>>
>> M54xx does just that for Coldfire:
>>
>> arch/m68k/include/asm/io_no.h:
>> #define PCI_IO_PA       0xf8000000              /* Host physical address */
>>
>> (used to set PCI BAR mappings, so matches your definition above).
>
> I think coldfire gets it right here, using PCI_IOBASE to find the start of
> the window and a zero io_offset:
>
> #define PCI_IOBASE ((void __iomem *) PCI_IO_PA)

Good - I bear that in mind if I ever get around to reactivating my 060 
accelerator and the PCI board for that.

>> All other (MMU) m68k users of inb()/outb() apply an io_offset in the
>> platform specific address translation:
>>
>> arch/m68k/include/asm/io_mm.h:
>>
>> #define q40_isa_io_base  0xff400000
>> #define enec_isa_read_base  0xfffa0000
>> #define enec_isa_write_base 0xfffb0000
>>
>> arch/m68k/include/asm/amigayle.h:
>>
>> #define GAYLE_IO                (0xa20000+zTwoBase)     /* 16bit and
>> even 8bit registers */
>> #define GAYLE_IO_8BITODD        (0xa30000+zTwoBase)     /* odd 8bit
>> registers */
>>
>> (all constants used in address translation inlines that are used by the
>> m68k inb()/outb() macros - you can call that the poor man's version of
>> PCI BAR mappings ...).
>
> This still looks like the same thing to me, where you have inb() take a
> zero-based port number, not a pointer. The effect is the same as the
> coldfire version, it just uses a custom inline function instead of the
> version from asm-generic/io.h.

Right.

>> So as long as support for any of the m68k PCI or ISA bridges is selected
>> in the kernel config, the appropriate IO space mapping is applied. If no
>> support for PCI or ISA bridges is selected, we already fall back to zero
>> offset mapping (but as far as I can tell, it shouldn't be possible to
>> build a kernel without bridge support but drivers that require it).
>
> Right.
>
>>> As this is indistinguishable from architectures that just don't have
>>> a base address for I/O ports (we unfortunately picked 0 as the default
>>> PCI_IOBASE value), my suggestion was to start marking architectures
>>> that may have this problem as using HAS_IOPORT in order to keep
>>> the existing behavior unchanged. If m68k does not suffer from this,
>>> making HAS_IOPORT conditional on those config options that actually
>>> need it would of course be best.
>>
>> Following your description, HAS_IOPORT would be required for neither of
>> PCI, ISA or ATARI_ROM_ISA ??
>
> For these three options, we definitely need HAS_IOPORT, which would
> imply that some version of inb()/outb() is provided. The difference between

Thanks for clarifying that (and to Niklas as well). Did sound a little 
counter-intuitive to me...

> using a custom PCI_IOBASE (or an open-coded equivalent) and using
> a zero PCI_IOBASE in combination with registering PCI using a custom
> io_offset is whether we can use drivers with hardcoded port numbers.
> These should depend on a different Kconfig symbol to be introduced
> (CONFIG_HARDCODED_IOPORT or similar) once we introduce them,
> and you could decide for m68k whether to allow those or not, I would
> assume you do want them in order to use certain legacy ISA drivers.

That's exactly the purpose (though we're overmuch pushing the envelope 
trying to accomodate legacy ISA drivers on too many platforms).

Cheers,

	Michael


>        Arnd
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
