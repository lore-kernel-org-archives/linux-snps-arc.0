Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065ADC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Dec 2021 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdCfv9GZaIGlrHCUUx0jzJf6m42ZKvOqjJaEVacx2b8=; b=OgD3EQAIiwnUKv
	2ConLz3Ez1QiWZFC+wvqwOaNFAuHmd9z5htDkRa74LpLHEsSvIrQIRpXcCqYURxW9tHGuhPH2kuIE
	EnzBPBDfe5sr0v+04MMrjHkpb3jDBWQSCTMAA6R6rqJ1T95z4IUMMJ+kcLjFGhhVA939PVz+/nEQH
	sokVqQerGiwbIJN+E7FrjAOmgmCUWo/hYh62uqbdvryIzhRXvv8DPFSByU1HUJTQZlN0CUreFUL/l
	dDcXxSLfxLC2tIqFratfi4VbXLeJ+youmk4lzgkAWvORJRNXTUIAkk/m8YI0l3zptJEb4VmSMfoUp
	Hc5fCtqQGkjNkjBOyS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29PH-000da4-6j; Tue, 28 Dec 2021 10:08:35 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29PC-000dYf-Bw; Tue, 28 Dec 2021 10:08:31 +0000
Received: by mail-pj1-f46.google.com with SMTP id co15so15563648pjb.2;
 Tue, 28 Dec 2021 02:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LdjVJCupkO66VZRPSdtPXWlxTkxQlblL8anKkt6w1Y=;
 b=lzfKUQ/WYOvM5xVrtG7IamQlszlb61p2UlpszHPihdY5mNuFlEGrewPwnrIlAdrT1h
 rTU9/Aeb2yDyp4g0o68RtgiOswqtdXQkPsdrRULuh62w/Y17ugSZkks5rKctDtmoV+ZW
 1l4DrWKUGrU9q8NxO79OT72+5NoI5i5LDleSRv7XHaUSJ0JDYDbvg8Emp4WFBcycqIxe
 o4tkHBr15ao00IuZeu/l8a8CQrFZNhiFg71URbjf6ogmEhaXY5wDH6SIQ2RYkcbp5zEL
 05fQGbjp5tcVI1jBp4DiJMvt6Hc3TdudICDSpZFUM9Cv2eWq0rcTb3Q3IK4hj1Anw++k
 v9Xw==
X-Gm-Message-State: AOAM53312UUFRhW2qys15CgxVpyyO3Zx6dCqfcxArQSL9VLHX69ZLGb6
 o0w1mgd5Z4+Y0/TLTbN3wCVIWHQWjPrMYw==
X-Google-Smtp-Source: ABdhPJzN3nz6+4DFHCt8+3YyitYqfXFbNQEyv/tUIYfRco6lfs/AT1BVLzZr+7dMTbudIRhjgrLRWQ==
X-Received: by 2002:a17:902:c214:b0:148:a798:7aa with SMTP id
 20-20020a170902c21400b00148a79807aamr21552102pll.90.1640686108369; 
 Tue, 28 Dec 2021 02:08:28 -0800 (PST)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com.
 [209.85.216.44])
 by smtp.gmail.com with ESMTPSA id c124sm19486152pfb.139.2021.12.28.02.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:08:28 -0800 (PST)
Received: by mail-pj1-f44.google.com with SMTP id iy13so15550512pjb.5;
 Tue, 28 Dec 2021 02:08:27 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id
 j38mr6293010vkd.39.1640686096258; 
 Tue, 28 Dec 2021 02:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-3-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
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
 Michael Schmitz <schmitzmic@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_020830_420103_92ACA02A 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Niklas,

On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> We introduce a new HAS_IOPORT Kconfig option to gate support for
> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
> of the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces. On these platforms
> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
> called will cause a NULL pointer access which some compilers actually
> detect and warn about.
>
> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
> HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis. Then a final patch will ifdef the I/O access
> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
> into a compile-time warning.
>
> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -16,6 +16,7 @@ config M68K
>         select GENERIC_CPU_DEVICES
>         select GENERIC_IOMAP
>         select GENERIC_IRQ_SHOW
> +       select HAS_IOPORT
>         select HAVE_AOUT if MMU
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_DEBUG_BUGVERBOSE

This looks way too broad to me: most m68k platform do not have I/O
port access support.

My gut feeling says:

    select HAS_IOPORT if PCI || ISA

but that might miss some intricate details...

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
