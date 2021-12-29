Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D79C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 04:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNl9tGOju5nEkk4xClG7Ek9FZLs3OYgGMtscMrRbesY=; b=S6QhUjPo7QK3xOnEwvENxRqnV9
	imaVeGJZnQxmOYt4ux3Kk3fA4XE2PrTcBLUPNp+RHVx1VBoQFuj28T27aLty3XWQlOPK0r8wcoFWr
	CinTniQkedsYJVHUTl7oz+qP/yq5Cevekg+jhxunwlGfYfFoAqu1OtMbtwtJ4olRRbS04UW3IoDIx
	bq9TNFyjc/6VO9nScQiN8j8EPse2spPp0f2S1QBXk6laBgcVJbbDC5bltNaQmYVB1D2ktsx6Aqx4H
	osN4tXp7gkXh6QMfK/r63xPakp4VSPoeef3g4IfexvIxWL+a4adOURgMDjAHtphn1GZD/CjGEuR9P
	9MVwBtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2QNW-002EHL-5T; Wed, 29 Dec 2021 04:15:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2QNT-002EGV-4d; Wed, 29 Dec 2021 04:15:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id n16so15011027plc.2;
 Tue, 28 Dec 2021 20:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=oo7gGMOkpKZtsifyQrF9uAkP4p/YBx2m/GIQa4Tq0YE=;
 b=SgUGGN6VhsGuSJ4+x7BV8WmUFGnq6AU/S3MGIbRuvgcmK5iemLDPInHX4HtGqsDBOP
 X+ShdKiY6WGvZxZzGll6Lp9gXc9Iofh3zmxzNCmw3Dn3KgxWg++og+5/hcFLsP9lz2Xr
 2GF2kpRya+BTKsokuDFYluzgdLN+9R6oDmfEeq5seHlKkuDQoWmHZpB5lsfFQJLsHHhA
 J+6fOy7KSqTSf4RHl5+/z/3kvG8PPaQjjUrbxIO/1twWStmOPd1O5hfeFSFRI+7/1KDQ
 V6duyLcOszOYryU8sc+sZAK9TuMnZyNEumxgE9K0xpEM2ht/1sy9t9bhV6U0QsHIl9qG
 4r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=oo7gGMOkpKZtsifyQrF9uAkP4p/YBx2m/GIQa4Tq0YE=;
 b=nUCQ9Bu0xoyq6CCzVT633pT35+WYTQpEsLuYSzVe9ZxIR8v21HMqtzTbdp5/+P0IVm
 wUJdVoob0tSPg8DMqODqvo0nmyvOBxnHR231PyBpg351wIcM3AsE+OTdVcCyGSmlBaVC
 egtjDnP+YLG3VvzwGbUiKgdNk80Nujvb4uSojWckPae7PPNrtTYT8bnv9XfZ9AF87HML
 a1JD7vJXP0qr5+KzvoZU3Tqo9zrkpYMzDiZ8oS4UIFos+8qRHS040GMr05SxZkL+U9pT
 y9+UGr5/sbUWdbr40ymClRgsUY2/C3AddU3FxkDeL96OWdb4tL34CZnuh5YAK3GS7Fy3
 u91w==
X-Gm-Message-State: AOAM531AFkG1hgCuDIib1JLG/mLs1TD9bWMDNGgaYwLrCJrLK6Ux3Enw
 DDM4AJoH8VgvyEmNG+RtqbQ=
X-Google-Smtp-Source: ABdhPJyjCqGNhQip5lk1bKe/Q9ifrO91rL0XFrD4WiMDGXXaVLZjRe+Yr2Tq1lIfNgSSQkzYLSFwkQ==
X-Received: by 2002:a17:902:d48a:b0:148:a8ae:7ab7 with SMTP id
 c10-20020a170902d48a00b00148a8ae7ab7mr24900237plg.171.1640751350387; 
 Tue, 28 Dec 2021 20:15:50 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 k9sm13406563pgr.47.2021.12.28.20.15.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 20:15:49 -0800 (PST)
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, linux-s390@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 Greg Ungerer <gerg@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
Date: Wed, 29 Dec 2021 17:15:23 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_201551_230451_42F87658 
X-CRM114-Status: GOOD (  21.24  )
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

Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
> On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 28.12.2021 um 23:08 schrieb Geert Uytterhoeven:
>>> On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>>>> We introduce a new HAS_IOPORT Kconfig option to gate support for
>>>> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
>>>> of the I/O accessor functions inb()/outb() and friends on architectures
>>>> which can not meaningfully support legacy I/O spaces. On these platforms
>>>> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
>>>> called will cause a NULL pointer access which some compilers actually
>>>> detect and warn about.
>>>>
>>>> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
>>>> HAS_IOPORT specific sections will be added in subsequent patches on
>>>> a per subsystem basis. Then a final patch will ifdef the I/O access
>>>> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
>>>> into a compile-time warning.
>>>>
>>>> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>>>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>>>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>>>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/arch/m68k/Kconfig
>>>> +++ b/arch/m68k/Kconfig
>>>> @@ -16,6 +16,7 @@ config M68K
>>>>         select GENERIC_CPU_DEVICES
>>>>         select GENERIC_IOMAP
>>>>         select GENERIC_IRQ_SHOW
>>>> +       select HAS_IOPORT
>>>>         select HAVE_AOUT if MMU
>>>>         select HAVE_ASM_MODVERSIONS
>>>>         select HAVE_DEBUG_BUGVERBOSE
>>>
>>> This looks way too broad to me: most m68k platform do not have I/O
>>> port access support.
>>>
>>> My gut feeling says:
>>>
>>>     select HAS_IOPORT if PCI || ISA
>>>
>>> but that might miss some intricate details...
>>
>> In particular, this misses the Atari ROM port ISA adapter case -
>>
>>         select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>>
>> might do instead.
>
> Right, makes sense. I had suggested to go the easy way and assume that
> each architecture would select HAS_IOPORT if any configuration supports
> it, but it looks like for m68k there is a clearly defined set of platforms that
> do.
>
> Note that for the platforms that don't set any of the three symbols, the
> fallback makes inb() an alias for readb() with a different argument type,
> so there may be m68k specific drivers that rely on this, but those would
> already be broken if ATARI_ROM_ISA is set.

I'd hope not - we spent some effort to make sure setting ATARI_ROM_ISA 
does not affect other m68k platforms when e.g. building multiplatform 
kernels.

Replacing inb() by readb() without any address translation won't do much 
good for m68k though - addresses in the traditional ISA I/O port range 
would hit the (unmapped) zero page.

Cheers,

	Michael

>
>           Arnd
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
