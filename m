Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76195C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZcS/VLEzE7g6A5xLCr7EJAjf+I3w1iIImZigT5y07I=; b=s15fwkl6RvZnqV
	3HSNgHhkro2eeMg2mZVzWf+6ea0hqWtb1If6p6+FinYbd9WuMGzfs3AZk+/fx2WTTPha0m5zX5t8w
	/yxFzH8Re6IAkopn5GLqU9AKehX57dZ/+8cq1nTomFH6Mp90hX1tjOf2eKkh/xbnsvUVNhbx0WsLe
	8FzYw55PEm5Ml2YJ393hhUHUDnCBIJkR6NSVbeCiDtS4TnbOfzhWGj5qWotb5mHXtwPLVYndZeCnK
	TBfaztcYW5cvBAsqQC5seUI6jHi3E0l5NprBZp+GdtfBZcdexFy4uopJbgMAEfEYiFwpF3vtR2jTF
	YBRbXLW3gh+KOkjQqUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKz8W-00DOBz-Ik; Fri, 18 Feb 2022 09:01:08 +0000
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKz8R-00DOA1-73; Fri, 18 Feb 2022 09:01:06 +0000
Received: by mail-pg1-f175.google.com with SMTP id f8so7282201pgc.8;
 Fri, 18 Feb 2022 01:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1nYL/qjPVlkIqK+5dnbJ/5QVdVKG9AQSDTVmJuSTxwE=;
 b=iHCNwCmh5CPdsAOyLx48UqBhJQ8la549mbnQ2nAHwWtBQW3J0siEsMl14e0NW3Gy9c
 7ALZupE6t64vujM8z2Zsr+GS38aA+xWg/7rZIPkZKCXOfPJBVYpRxUTrXLewZh/DEers
 iz/vTeQXYHbrPJcLuyPFgEW+vb6MJVVHWdlZ41wz/PQFpfNZEthzM8EnGWwRnz3l8l/m
 4HdirOeegVWTTNoBTRNVc6a5x36XmHnSb95LdOca94xYyc0qWEKGWHKc1JUcQaUBtYqE
 y6UoBe5+EhGzGFpUpvIN11JrYkxpzZ2lOeySE88+yl2lbZQZIHhH9DG1Hz1n+EPFN74D
 F+vg==
X-Gm-Message-State: AOAM530ox//N6Tgsn1aTt6TxGjMuH3zEK+MJNvQ3A5w/Yv71syYTDU2e
 c6Y+R85iVMJBBpdKHBjCZim5tBziinqixA==
X-Google-Smtp-Source: ABdhPJyO2jxzlIGTA0hqztucWDeXloLdH9RUuFhaS9bjmWlwoU4rQzGRGAMdIm0TEfMuRbN65wEVrw==
X-Received: by 2002:a63:4041:0:b0:372:c918:631a with SMTP id
 n62-20020a634041000000b00372c918631amr5612089pga.370.1645174861629; 
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50])
 by smtp.gmail.com with ESMTPSA id n13sm4064126pjq.13.2022.02.18.01.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id m7so8055828pjk.0;
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr3151546vsl.38.1645174850220; Fri, 18
 Feb 2022 01:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-11-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-11-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 10:00:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
Message-ID: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] m68k: fix access_ok for coldfire
To: Arnd Bergmann <arnd@kernel.org>
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
X-CRM114-CacheID: sfid-20220218_010105_535493_9BBB163C 
X-CRM114-Status: GOOD (  28.66  )
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

Hi Arnd,

On Wed, Feb 16, 2022 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> While most m68k platforms use separate address spaces for user
> and kernel space, at least coldfire does not, and the other
> ones have a TASK_SIZE that is less than the entire 4GB address
> range.
>
> Using the default implementation of __access_ok() stops coldfire
> user space from trivially accessing kernel memory.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -12,14 +12,21 @@
>  #include <asm/extable.h>
>
>  /* We let the MMU do all checking */
> -static inline int access_ok(const void __user *addr,
> +static inline int access_ok(const void __user *ptr,
>                             unsigned long size)
>  {
> +       unsigned long limit = TASK_SIZE;
> +       unsigned long addr = (unsigned long)ptr;
> +
>         /*
>          * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
>          * for TASK_SIZE!
> +        * Removing this helper is probably sufficient.
>          */

Shouldn't the above comment block be removed completely,
as this is now implemented below?

> -       return 1;
> +       if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES))
> +               return 1;
> +
> +       return (size <= limit) && (addr <= (limit - size));
>  }

Any pesky compilers that warn (or worse with -Werror) about
"condition always true" for TASK_SIZE = 0xFFFFFFFFUL?

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
