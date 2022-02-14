Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D530EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibkqWvUOR4lTkC04p90ojtsgqSIIxhsV0v5CaIzQRl4=; b=djt5DskrpK9Mek
	2sTh8Um4d7gEQ8IOwUKuYFrlFDX6Qw0K4aqQPhRMn3CrH9HJC7gMEL2xQiGQr8/YeFjwirqrm8hLV
	j4Nd7p2FCadyeCgqx4vZt+InwfEGeML0bpYNYPSS91hckgJqRzqI4kxSlx5B1COCZJ2SYZJFrSoLS
	1y6ku9kplHRV36Me4JInWi+1ySyKMTaDbXaLYAHAhaaUjJoEb8qMkbEvcsz7aN9v1pY3uFFhFNWoY
	6q2/haZPhxvwzX5fOJ3ootcpNz0pIQfa+k3FLbmvyPxO3S8HOC/KoE6wMN9E10abE5DHHvupHINQ0
	AjTdiqDIylLac5kIx/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJgz1-00GhpP-Nu; Mon, 14 Feb 2022 19:25:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJgyu-00Gho7-RF; Mon, 14 Feb 2022 19:25:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 587C06114D;
 Mon, 14 Feb 2022 19:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07B0C340EE;
 Mon, 14 Feb 2022 19:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644866751;
 bh=zLWY4rc6tKJzkfOHU66+tSLIxceIVdBozj8MWHl9tz8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cLB0m+lUiyqzm6MkRXqfNjTidY0KSUw9y+g66SZETLNsFCZDZPIwWT08xV9J00P2W
 l9L1fdj72F+ncGMnQYYXBi8K1xN3L9GI/iTH+0AddTuNSArXu6AHUMLB6nQhx0bRSL
 A8T6+8ZjLQQjPJ/gbGjhUQbyDzWF0QKLQlROyDk3fZAmfOHwb3PPoOOW0tb1iFg+PP
 rf8f8XtKwJOZ5uBkE1sa68Pp4Y4hBS7eJSkvNo+qtRLNsAkxE5f947h8G6oQqOibfG
 kVu+PpivREVoaK8ki2hzusoUzjVUM7XR5/GUcSs+u3DNUwlj2eV/8BbJjYy8YosUTI
 530d3BBYOjNVg==
Received: by mail-wr1-f54.google.com with SMTP id k1so28523141wrd.8;
 Mon, 14 Feb 2022 11:25:51 -0800 (PST)
X-Gm-Message-State: AOAM532DqyyuifgEwazyneZXp+cwTKd0qs2mr2a+NCct+M/7p17Zti8Y
 BR2vI0xjm95TlrTGD2YIbAv5Ifaq3e+CAPagwgE=
X-Google-Smtp-Source: ABdhPJwrOpkav7UeztG9pweW7/OWsS+hZNYg7RZgUDmgoSoPSixwWLgUERuof4XivnroH6SdfUIEp08YoMpfbv7qa3w=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr422520wrv.12.1644866740020;
 Mon, 14 Feb 2022 11:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-8-arnd@kernel.org>
 <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
In-Reply-To: <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:25:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36U35DK22UT6id=WawWaJa-2+_W9HFgmwdDJ_tVYE5NQ@mail.gmail.com>
Message-ID: <CAK8P3a36U35DK22UT6id=WawWaJa-2+_W9HFgmwdDJ_tVYE5NQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] uaccess: generalize access_ok()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20220214_112552_968369_E7819B8D 
X-CRM114-Status: GOOD (  21.94  )
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

On Mon, Feb 14, 2022 at 6:15 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:45PM +0100, Arnd Bergmann wrote:
>
> > diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
> > index c7b763d2f526..8867ddf3e6c7 100644
> > --- a/arch/csky/kernel/signal.c
> > +++ b/arch/csky/kernel/signal.c
> > @@ -136,7 +136,7 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
> >  static int
> >  setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
> >  {
> > -     struct rt_sigframe *frame;
> > +     struct rt_sigframe __user *frame;
> >       int err = 0;
> >
> >       frame = get_sigframe(ksig, regs, sizeof(*frame));
>
> Minor nit: might make sense to separate annotations (here, on nios2, etc.) from the rest...

Done.

> > -}
> > -
> > -static inline int access_ok(const void __user * addr, unsigned long size)
> > -{
> > -     return 1;
> > -}
> > +#define __range_not_ok(addr, size, limit) (!__access_ok(addr, size))
>
> is really wrong.  For sparc64, access_ok() should always be true.
> This __range_not_ok() thing is used *only* for valid_user_frame() in
> arch/sparc/kernel/perf_event.c - it's not a part of normal access_ok()
> there.
>
> sparc64 has separate address spaces for kernel and for userland; access_ok()
> had never been useful there.

Ok, fixed as well now. I had the access_ok() bit right, the definition just
moved around here so it comes before the #include, but I missed the
bit about __range_not_ok(), which I have now reverted back to the
correct version in my tree.

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
