Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CA1C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXjSMqeSQQhZvOVGwxHeuLTqzuOzC6VV8egjbjmXIvQ=; b=Kbn6gD7f0GMNtc
	ET+kdzbnQ5lFE4EpQzHDsvwOcdshg0xI6LKhEa4wqaiRDxIf+JgPs9f0SXvSSpuGyQSOUm5SfT6T2
	kypzGVEyy5FZ+ci8AGHq9Re9p87unjSPHsqlcJdqPnPHaoVBgq0npjsO38JtOfzU7lrziFdF+CeF1
	OuGRm06CQNp4MecdBDer8v1G3REBrkWKNhyn0aWlnu2awfieOVWeg9n5TU/Y3BCY3k4dM9bBa4cWA
	2BY3c9ghr5yT+gWB5dob1j39QKVkDZPTlPHyME/owViPBCVHGghhIb3el3xT6n2/G9GNfTxPZ+Q4r
	fiB/ZEvBxqGDHxbt/Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKSON-008Ra9-50; Wed, 16 Feb 2022 22:03:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKSOI-008RXp-Iu; Wed, 16 Feb 2022 22:03:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DE7F61AEC;
 Wed, 16 Feb 2022 22:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F17C340F7;
 Wed, 16 Feb 2022 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645048993;
 bh=ay/5589FenTcDxawo4c9r5D5w/FgYtE3zMvoHKiKBw4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SKBiXg1qMAxSOG7O/+fAEZVno6RY18W0gjWd48YvWVehxkUtMksFHxAKOXPaf1Nim
 qHK3jdeXyT7izApYt/dKY/APNToDbzS30oZ/3+FsRDGwHCYVq4RDe7vcie8TG09GCB
 VJT0268zX83XvVza5Mt2NT9M5MRvq5jsvfN9DDwEAft1MUWYI2uGvfXze8xcMLyYPl
 W5bKKzwddcuQftrn4B+eRiSOdBTv8tp7msayxnS9iimb1X7zN2rzIA/p/RbCumDYFK
 ozI4OSbpqbFd1JHV5fS/CeCxidkU8UzvVlyBvKvVSqnpavPgI6V4RqMDH4eF/+tdlu
 AnRmCFW169S3A==
Received: by mail-ej1-f44.google.com with SMTP id k25so2387732ejp.5;
 Wed, 16 Feb 2022 14:03:13 -0800 (PST)
X-Gm-Message-State: AOAM531lsjxqRKyq+Vq6xE7oDF3c7oCOVm4TiKPg8bq5G/dhwG1TCZdw
 DWAQtfxOQjkbgI8JuTkBXvuTdy0YI/abUzcrOTQ=
X-Google-Smtp-Source: ABdhPJyk0zQXj5EZ1uP9z1YUTizioO4kJ6rvneTTyuZji8J8rGr64s8uMSDVOcQeT3f3UOdAxVtCGFpnKRwe/RHh9ys=
X-Received: by 2002:adf:cf0c:0:b0:1e6:22fe:4580 with SMTP id
 o12-20020adfcf0c000000b001e622fe4580mr53483wrj.12.1645048981311; Wed, 16 Feb
 2022 14:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
 <Yg1F/VT4vRX4aHEt@ravnborg.org>
In-Reply-To: <Yg1F/VT4vRX4aHEt@ravnborg.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 23:02:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2gx2w=RDECNbrO4Zu3ZUTfz2UrLbNSz+ieCgMEFiK3TA@mail.gmail.com>
Message-ID: <CAK8P3a2gx2w=RDECNbrO4Zu3ZUTfz2UrLbNSz+ieCgMEFiK3TA@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_140314_710723_83A791A2 
X-CRM114-Status: GOOD (  16.64  )
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

On Wed, Feb 16, 2022 at 7:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Arnd,
>
> Fix spelling in $subject...

done

> sparc/Kconfig b/arch/sparc/Kconfig
> > index 9f6f9bce5292..9276f321b3e3 100644
> > --- a/arch/sparc/Kconfig
> > +++ b/arch/sparc/Kconfig
> > @@ -46,7 +46,6 @@ config SPARC
> >       select LOCKDEP_SMALL if LOCKDEP
> >       select NEED_DMA_MAP_STATE
> >       select NEED_SG_DMA_LENGTH
> > -     select SET_FS
> >       select TRACE_IRQFLAGS_SUPPORT
> >
> >  config SPARC32
> > @@ -101,6 +100,7 @@ config SPARC64
> >       select HAVE_SETUP_PER_CPU_AREA
> >       select NEED_PER_CPU_EMBED_FIRST_CHUNK
> >       select NEED_PER_CPU_PAGE_FIRST_CHUNK
> > +     select SET_FS
> This looks wrong - looks like some merge went wrong here.

Fixed now.

>
> Other than the above the sparc32 changes looks fine, and with the Kconf
> stuff fixed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org> # for sparc32 changes

Thanks!

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
