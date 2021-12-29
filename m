Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1081BC4167E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 01:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Yhl7iwJnaq42BKhKTrzal9NxIVrsDJNpKc2tW2tBzk=; b=Qpynl52Iek6nbkByOl0r86ejTr
	uIunIMZTNE6Tb9UrnZWp+X3x3cXYfQzF/r6BdqKjbFKTJ1iN9eC11klep/jgxmdF1nUBD3daUBGFH
	bqDHDj2rNHAL+HVn6+ZZVA/pslzKW+cOmGAVziyTNNLDZIMcSr7vG8ykq20hQgzEeEHgWHD2EQGQi
	Asm0G7BgW6lKuGgEQAUtTk06h5fiSDxNCR5ZQ6+gD/MsEWTfhjBmpnqnvyRBqsIvymfJQ74ztaQtj
	Wju5p0qQGbpqDnXInqMzH9v56flOuDT4LpeaUqIvSwXEXie99FOYBrCLL9ywssXrPnM6FwwX5Ne9X
	j0dgrieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2NeS-0025or-Gl; Wed, 29 Dec 2021 01:21:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2NeO-0025nz-MA; Wed, 29 Dec 2021 01:21:10 +0000
Received: by mail-pg1-x529.google.com with SMTP id g22so17219763pgn.1;
 Tue, 28 Dec 2021 17:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ce+QRujFh6Z6jXwpwj96Ajoqinq3qkVE1ootEg0tvM4=;
 b=HR4+5gEvbRK0rU8/dntHoBj1g+0X3qKpLMsP358svmvVe4LU0yAyJLNGs3fCG1IxN5
 M/QTR8OXVpknffzN/8b3pOWH0ImhkhbIhkjgUWsWwTRZMZ2woqwqIa5115FbA6Nf6xT4
 TiKsVnkG1OLJDDZ06iwYnbvfkz/MJz2DtOV5zSZDVPVN2jIRsDW3XOaMugqlveDm5gnG
 bFN6SiWtJfdMPi0YTy0yZg20PhHPIvQQsScpgCUPn8k9cu6v+natJ9ebpk8jSRGpwixK
 MiRCzMxl519LQW1SjZgL9Y49JFwBww9vU7/YKwkn2coaccmwFAJf32w2Pk2xT9akAsgc
 lavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=ce+QRujFh6Z6jXwpwj96Ajoqinq3qkVE1ootEg0tvM4=;
 b=E2q4d6dqTZSEilqDuJC3TRqtB6OqAyGZvr6bATbnUOvsSEXUUmaINDJfbMhou5f5k/
 GspbKbOtt3SGwfj9YebEmBW3wV8vvyX1jS0g3dwWB2UelveekMYAKK+QVKRoGexir5E2
 /BexOdm+AzbpTLElIU6KzU8BGD/eQjBiKkIsBtOrj5xwhLvdU1F7ztFqba+2lzFN9nD5
 Hd59D4u5eNwSZBIKF6GlA5K4m71m6rGBaVFkqCMxD0+lD0iFWYNhnuiVV4yMtaGPGtKK
 QDWGkLVwjKDNwp3s0T7LL/SEdWaOTLuKK5LZOcO2CRys/SItNIrr15VbK0vYUZX9SEiN
 Bg6w==
X-Gm-Message-State: AOAM533y1AqY4ntFGdZlxy4hSuzmAJ7089tNIWl+r5FhrBng848+ih7E
 YlCBLxiKRTU7G2ikIpRqH9k=
X-Google-Smtp-Source: ABdhPJx/po46hxln8jdEFq24zHXmQfZv0rMy1a+pao1gS+//RcuuYa1+uO7C36+ZKnR8X7vS6LfebQ==
X-Received: by 2002:a05:6a00:cca:b0:4ba:f5cc:538c with SMTP id
 b10-20020a056a000cca00b004baf5cc538cmr24584430pfv.60.1640740867094; 
 Tue, 28 Dec 2021 17:21:07 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 cm20sm18920963pjb.28.2021.12.28.17.20.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 17:21:06 -0800 (PST)
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Chris Zankel <chris@zankel.net>, Karol Gugala <kgugala@antmicro.com>,
 Jeff Dike <jdike@addtoit.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
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
Message-ID: <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
Date: Wed, 29 Dec 2021 14:20:38 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_172108_803410_04CE9FA9 
X-CRM114-Status: GOOD (  27.95  )
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

Hi Geert, Niklas,



Am 28.12.2021 um 23:08 schrieb Geert Uytterhoeven:
> Hi Niklas,
>
> On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>> We introduce a new HAS_IOPORT Kconfig option to gate support for
>> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
>> of the I/O accessor functions inb()/outb() and friends on architectures
>> which can not meaningfully support legacy I/O spaces. On these platforms
>> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
>> called will cause a NULL pointer access which some compilers actually
>> detect and warn about.
>>
>> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
>> HAS_IOPORT specific sections will be added in subsequent patches on
>> a per subsystem basis. Then a final patch will ifdef the I/O access
>> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
>> into a compile-time warning.
>>
>> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>
> Thanks for your patch!
>
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -16,6 +16,7 @@ config M68K
>>         select GENERIC_CPU_DEVICES
>>         select GENERIC_IOMAP
>>         select GENERIC_IRQ_SHOW
>> +       select HAS_IOPORT
>>         select HAVE_AOUT if MMU
>>         select HAVE_ASM_MODVERSIONS
>>         select HAVE_DEBUG_BUGVERBOSE
>
> This looks way too broad to me: most m68k platform do not have I/O
> port access support.
>
> My gut feeling says:
>
>     select HAS_IOPORT if PCI || ISA
>
> but that might miss some intricate details...

In particular, this misses the Atari ROM port ISA adapter case -

	select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA

might do instead.

Cheers,

	Michael


>
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
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
