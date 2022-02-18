Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727B4C433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHi1LBKflIpCh5ssYszSI/YuLJgMF99SIBalmYHYDvY=; b=TBRfwFHu/kRxHd
	jJTnaZti0Hms8OCTXY2GTsjr+cVLCYA6jIVTtxC0WSg4/N2YC1apHHWzB6L6YsZjurOWV9StWASo/
	sf/czz6BacOqq59n7OxyL3G3fUIfe1jsZ6sM1GJWYuOev9Gp6N9Sqigay4Uz4ggtBTUhWzhZ4hd56
	bI67VAboVcZpKhjl2538RkrqeI6mKlKBuRJEgSW1GJMQkH4mtOtbtkie/rTegAHC27nRVV0Mru/uT
	BcmQkShYKx3TLdovigjzp4lpDbqOs3dQQGx7swxUXLVJyfrYFXOVM1B4llWbhicVmpLIwrGHPG9sF
	+17F/4Y0gc+xtrMmMBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzbz-00DYyA-D7; Fri, 18 Feb 2022 09:31:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzVw-00DVs2-2l; Fri, 18 Feb 2022 09:25:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50E9361C7B;
 Fri, 18 Feb 2022 09:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BC5C340F3;
 Fri, 18 Feb 2022 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645176319;
 bh=mMLLIykgh57Awf38lSwA8MWwDlZ8x8pcozF3MLrCnRg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sq4m3Dgo4gWgyVxTrIGW8PCTX4ye2wRDjntiwC1sV2Amlm/vMu+XNB1jESk+7PC32
 tszy9JzCEY//ujCoLQCrsK92mKLzyEge1dx2/R4Gy1Zs0d5yf4whvYuOVqPTNxWR/r
 4ncpylgSrdkiul2GiTrokXQ/sO85JURvv1y8jJjsuPhN9iM1KwRfv4GXsplWwm+9Zd
 LFcxiC4igD16VDiYF4b0rJqvVLEWrlWKePZZD32oLexgu9HQ+BYu0O7M2xb0MJHzsn
 jc0QSiHCRLZeSy1oiVnISFhpiIbzWbAorl6JRhqGcUfaow+2BCXUqm16W0MmplZW4/
 usLkIxy/wG5/A==
Received: by mail-wm1-f51.google.com with SMTP id n8so4796945wms.3;
 Fri, 18 Feb 2022 01:25:19 -0800 (PST)
X-Gm-Message-State: AOAM5329ezdQDc/Jm/rlEjZrhVtly5V+YbDGQlQ9qGOgvjt8yQZiSaGg
 IN6EXk4t1+AZIXLOgNBycnk+V2MYJlXS/rTfAno=
X-Google-Smtp-Source: ABdhPJwrWpJqc0egLA12RwkumDKsH10yWoelsJ0RehwMogjvxHhR3UEotiD7Fxqib+HetrYJWhy8e0u55+IMdrLJwD4=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr9729968wms.82.1645176306970; Fri, 18
 Feb 2022 01:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-11-arnd@kernel.org>
 <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
In-Reply-To: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 10:24:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hrjxzzAWk3ut3VTD3h=ZLpDwPdvqs+uKaC4_b6+Vbfg@mail.gmail.com>
Message-ID: <CAK8P3a2hrjxzzAWk3ut3VTD3h=ZLpDwPdvqs+uKaC4_b6+Vbfg@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] m68k: fix access_ok for coldfire
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 Linux-Arch <linux-arch@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 arcml <linux-snps-arc@lists.infradead.org>, linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
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
X-CRM114-CacheID: sfid-20220218_012520_237101_677DB6AF 
X-CRM114-Status: GOOD (  21.82  )
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

On Fri, Feb 18, 2022 at 10:00 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> >  /* We let the MMU do all checking */
> > -static inline int access_ok(const void __user *addr,
> > +static inline int access_ok(const void __user *ptr,
> >                             unsigned long size)
> >  {
> > +       unsigned long limit = TASK_SIZE;
> > +       unsigned long addr = (unsigned long)ptr;
> > +
> >         /*
> >          * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
> >          * for TASK_SIZE!
> > +        * Removing this helper is probably sufficient.
> >          */
>
> Shouldn't the above comment block be removed completely,
> as this is now implemented below?

Yes, obviously. Fixed now.

> > -       return 1;
> > +       if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES))
> > +               return 1;

I just noticed this should have the same change that I made for the
generic version, changed it now to

+       if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES) ||
+           !IS_ENABLED(CONFIG_MMU))

This is gone again after the cleanup patch, when the generic version
is used instead.

> > +       return (size <= limit) && (addr <= (limit - size));
> >  }
>
> Any pesky compilers that warn (or worse with -Werror) about
> "condition always true" for TASK_SIZE = 0xFFFFFFFFUL?

No, using a local variable avoids this warning.

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
