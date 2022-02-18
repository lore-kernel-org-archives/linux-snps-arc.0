Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD45C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ca643KFifHUqWSNO0lHrw/Ab4QZsKdwASeSv5jBJtiM=; b=OqFLdJmczlTWEy
	B5JbOKglwU/wRC5tB9l+AWHPEbUMv/zK0vjZWVOEbeK1ZoeDED80j46jcxzKl15ya24avGDjEl1kR
	RqvCVgePtP0a1KSEyixP3M/PwcdadJSdJTcYeCfzoMwdEymLGZ/p3UJAWecQmmIY5pfbzhIn9nM6I
	TezZzZwM+Li0MxaQP887Ev9tUpXtyZQzo2/7RVrOhsVJOZhwQ+1QiaAFFfP+xeRpHRybiP7M6Y+Ds
	q1awBBINkf3Jw6/sE/KT0K3TcBK6wwhnfuK7LsSaom34Ds+ILgWNr7zTlunw5ont5qcK0BEeXCUzu
	ETN+Z60H+uqz3CGBMq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKxis-00DCaD-KG; Fri, 18 Feb 2022 07:30:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKxio-00DCZC-Gl; Fri, 18 Feb 2022 07:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17E7AB82058;
 Fri, 18 Feb 2022 07:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D59BC340FF;
 Fri, 18 Feb 2022 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645169428;
 bh=4Rk51yI7cy+h8GrR+wkZuFO6d6ZOgVmodthZQla/xGE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nfieHdtoc5pDqS5G+Vo+kHzqd26jkrD4pn8k7ivIDT01UdTHxcfE2U323R+wTs95P
 SjXGrQR5t3CflTK8gDO5o1/jpzLh/W0vSfOdjuhK0MIH8MU487qgYRsdXfgKdcQFwx
 Z8DEhvjyyFZMgz9C+eJMrEuZiHjh8LZtvTGanxRtkC8k+PDbRqYpHCGQOKOSBtyZxU
 MyMVskyvUrgBJrO2kGej5iymlF3hkaSLGHXSeI8Kz9+3fQqcMqX4eMOdbLXgfkVQqP
 FGgsr6IvGiXxq/3RTaYxvb7ljrjO/V1YQAzhZqfx99tLC1lGmBpJkwxKHbLeLzEQHs
 QPzG/1NULMG0g==
Received: by mail-ed1-f51.google.com with SMTP id u18so13905091edt.6;
 Thu, 17 Feb 2022 23:30:28 -0800 (PST)
X-Gm-Message-State: AOAM533jym1wik01CSTBj4+aZaV3FdJmqfyA28u3IHWxKPYciDGfOeIG
 7zo0Uihr/ZkZbgp/6lYMAPC+PqwF122vBvoIV5U=
X-Google-Smtp-Source: ABdhPJz4trlMwdvjT8y0UPggztkdijECp2hMuaf6QP4pGa8b+VYFZp4/tSgCA0YRdkm1OA4dObRIZr3wh6XhtS+RfLY=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr4942117wrm.317.1645169415535; Thu, 17
 Feb 2022 23:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org>
 <20220218062851.GC22576@lst.de>
In-Reply-To: <20220218062851.GC22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:29:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Dhn1Gsap1Wss2xpKBwe3jWLAmMYtL7S1-26tZ5D_2fQ@mail.gmail.com>
Message-ID: <CAK8P3a1Dhn1Gsap1Wss2xpKBwe3jWLAmMYtL7S1-26tZ5D_2fQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] x86: remove __range_not_ok()
To: Christoph Hellwig <hch@lst.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@codeaurora.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
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
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_233030_888422_8EFE5FF5 
X-CRM114-Status: GOOD (  27.43  )
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

On Fri, Feb 18, 2022 at 7:28 AM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Feb 16, 2022 at 02:13:19PM +0100, Arnd Bergmann wrote:
> > --- a/arch/x86/events/core.c
> > +++ b/arch/x86/events/core.c
> > @@ -2794,7 +2794,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
> >  static inline int
> >  valid_user_frame(const void __user *fp, unsigned long size)
> >  {
> > -     return (__range_not_ok(fp, size, TASK_SIZE) == 0);
> > +     return __access_ok(fp, size);
> >  }
>
> valid_user_frame just need to go away and the following __get_user calls
> replaced with normal get_user ones.

As I understand it, that would not work here because get_user() calls
access_ok() rather than __access_ok(), and on x86 that can not be
called in NMI context.

It is a bit odd that x86 is the only architecture that has this check,
but adding
it was clearly intentional, see 7c4788950ba5 ("x86/uaccess, sched/preempt:
Verify access_ok() context").

> > diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
> > index 53de044e5654..da534fb7b5c6 100644
> > --- a/arch/x86/kernel/dumpstack.c
> > +++ b/arch/x86/kernel/dumpstack.c
> > @@ -85,7 +85,7 @@ static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
> >        * Make sure userspace isn't trying to trick us into dumping kernel
> >        * memory by pointing the userspace instruction pointer at it.
> >        */
> > -     if (__chk_range_not_ok(src, nbytes, TASK_SIZE_MAX))
> > +     if (!__access_ok((void __user *)src, nbytes))
> >               return -EINVAL;
>
> This one is not needed at all as copy_from_user_nmi already checks the
> access range.

Ok, removing this.

> > diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
> > index 15b058eefc4e..ee117fcf46ed 100644
> > --- a/arch/x86/kernel/stacktrace.c
> > +++ b/arch/x86/kernel/stacktrace.c
> > @@ -90,7 +90,7 @@ copy_stack_frame(const struct stack_frame_user __user *fp,
> >  {
> >       int ret;
> >
> > -     if (__range_not_ok(fp, sizeof(*frame), TASK_SIZE))
> > +     if (!__access_ok(fp, sizeof(*frame)))
> >               return 0;
>
> Just switch the __get_user calls below to get_user instead.

Same as the first one, I think we can't do this in NMI context.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
