Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B6BC433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Dec 2021 01:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuLriSchsIZ2kD9twVn0TvYskJjBUnvx97Kj0YFpz/0=; b=mkZtZ5Bci1rPvz
	13Hvcas+wApqodI8e6rqiyywmGcLnQD5pqjFBbhSdrpnHTZM/mMOvr7V+7UOEZkbb4E85oX/UcCVW
	AXmz3xwgGExXTuOhlOXqa11gfBWThTz/ZLUkr4RukUkrqCtFFKEwrwD+vf/lIV/8A0lL/+eDg6Hay
	aUNqpnCfwmEx+UrIllFVVE8aP2l6IEQDc7wICIzMiABDsPmfKmwRomDBGdylq9LIgkEJerN4lUrkx
	OrjdIQLVoMdDG98tVBVkcgKK2b9yGMU6v/78qlKfkqjsQxwCmiu8ebrxW2OMjrIdFgJOqP+Cj0qVS
	Djn7SgQzveJzu7XxDgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2kYf-003Yqt-JA; Thu, 30 Dec 2021 01:48:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2kYa-003YpM-P0; Thu, 30 Dec 2021 01:48:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E898B81A59;
 Thu, 30 Dec 2021 01:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDDBC36AEE;
 Thu, 30 Dec 2021 01:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640828918;
 bh=81MO7TacqQe8I5ko0Q8CwbDD4h/99BabB8aCDnWo0lQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jV/ycMyovnmu9pbcNLGboBsGNIaWSzFTvzZh+Mx9BwCcRQ4wkFdLiGVgRkSKcn1av
 ACLs6uhvkNBtfi0XHerEvqHG9aDTvnP0DnkZJ23UYJg1+rpYpog6ujNkprLhWymjWQ
 hVule2DRwuMYA/yBJYRWrQwKgFOWg5pmJP5humJTKlsctrnxGtyKKZV5MSDWgxD4iF
 I5CuYOMx73K52jL6eCERvW0K/qJG/CffLHmjFLJmfkBjIdmKueJ2GntN8tpN5P6Axu
 +/iJu6EgjHsacUxqabHsXc98pimqrGXyEBPg4rn/eSXczdd7VTgu9//4yKsbFR5Bjg
 v0Y95G8jR3CDw==
Received: by mail-ed1-f43.google.com with SMTP id q14so84707087edi.3;
 Wed, 29 Dec 2021 17:48:38 -0800 (PST)
X-Gm-Message-State: AOAM530//wIS5nq5qkG/C9vu2CuYXuhQfp2511vwch0r2WJ7j6sMIjRv
 82HKFYKNPxJoUREfYIjTHt3Sfs9a1Smb/f+3uKo=
X-Google-Smtp-Source: ABdhPJzYCdRT3l8EecUhPG5EkJz2cutHHKG9LloyzIQNKSKV94+pfG1Ig6YswCjGB6BOha4SzAwDhMxmrauWo4kartQ=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr22454231wru.12.1640828906053; 
 Wed, 29 Dec 2021 17:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
In-Reply-To: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 29 Dec 2021 20:48:23 -0500
X-Gmail-Original-Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211229_174841_098661_C58AA05F 
X-CRM114-Status: GOOD (  17.03  )
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

On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
> > On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> I'd hope not - we spent some effort to make sure setting ATARI_ROM_ISA
> does not affect other m68k platforms when e.g. building multiplatform
> kernels.

Ok

> Replacing inb() by readb() without any address translation won't do much
> good for m68k though - addresses in the traditional ISA I/O port range
> would hit the (unmapped) zero page.

Correct, this is exactly the problem that Niklas is trying to solve here:
we do have drivers that hit this bug, and on s390 clang actually produces
a compile-time error for drivers that cause a NULL pointer dereference
this way.

What some other architectures do is to rely on inb()/outb() to have a
zero-based offset, and use an io_offset in PCI buses to ensure that a
low port number on the bus gets translated into a pointer value for the
virtual mapping in the kernel, which is then represented as an unsigned
int.

As this is indistinguishable from architectures that just don't have
a base address for I/O ports (we unfortunately picked 0 as the default
PCI_IOBASE value), my suggestion was to start marking architectures
that may have this problem as using HAS_IOPORT in order to keep
the existing behavior unchanged. If m68k does not suffer from this,
making HAS_IOPORT conditional on those config options that actually
need it would of course be best.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
