Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A8EC433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Feb 2022 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omnhf3ToVNmBrF8cLE3l6I4z2Q4Oew524WmC3Sbqzok=; b=ec5aziiYZ4eX80
	pPBgoRdCe8U/3dnToWOK/bn0TlMV5QHXtbbkOFO7klQGZ0ano0bIWAJPvCMs3i+zn0dFFRXnHurzx
	7OkB2oDHaV6LTq9OJlDw3fLnCP0p060Zc5RSjgGG59gkW3UWyYYDwK6qGQ0krxO4T+3MzMbhZF7eY
	IXJBJSfVRr0zxuFttRj78d0Q29gPL1ewzXtTNVyAuMExKHeQxFdmAJ5tTGHpOYxTa5i0toXNe717z
	Z+/2kUsq0EUFg13FOSV+VA3zkZQtWD7Jk/qb22VVYe9QWZwHxSwVu8vykpuM0QfcGLcUP1KRLruFn
	MG/D0OD6UkajDF3IHLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnvg-00DUhH-F6; Wed, 23 Feb 2022 09:27:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnvb-00DUeI-0T; Wed, 23 Feb 2022 09:27:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25F71616BB;
 Wed, 23 Feb 2022 09:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1B3C340EF;
 Wed, 23 Feb 2022 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645608438;
 bh=D2jUPs6ryRSFqPbSylqUkNdDZuOthbzsmeMEmvziyjY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SKrgpyqXylsWSzC6Jke+LfVvA98S3V1hwNGgXXKRud42EmIisgbymZI81L5oIM8mp
 mw5DWL0sNU8hCCvWKvsp+SBgn8bjj+HKnKFxnFeflIEd9au+mce0Hw3aLRVW80a+AM
 /AVDdT93d9ZF6bILhUfpabLryNRQjjaSxTK/qGFPXd4vMnpYX4UZrSXs860K0Q9SLH
 WeMHPOTIZ9s7KHumxQCA/CGImoWzUv/SjKao4FE1kI7n9xIS/FS5EyrqaIfGnFnIgF
 y2nHSD9ElCaHj0IQ8FenJY1G3UcSTNWGCt52fCO9FYTMUAGrG2+3TMepZqMcvwipHr
 Nl7q4bmu25oDA==
Received: by mail-wm1-f50.google.com with SMTP id w13so12863999wmi.2;
 Wed, 23 Feb 2022 01:27:17 -0800 (PST)
X-Gm-Message-State: AOAM532TeiN6Y4qqnpyXlFyHpqu+UEGfEwh3FVWJUMXwp8wdd/d3w8/W
 tx6tBQdHEGEHGxAUKiAxJF+8m8oaL+g1EammYKk=
X-Google-Smtp-Source: ABdhPJwtMkGkHNVPhtWq1LOTi2OcT9JVNmxiOoaUyabWMpAtHbaXvG0B+oJZMTvLmHy/MuDTQEaSkGsJ6B3oEOPptXw=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr6779098wms.82.1645608425823; Wed, 23
 Feb 2022 01:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220223074127.GA8287@alpha.franken.de>
In-Reply-To: <20220223074127.GA8287@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 23 Feb 2022 10:26:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nM3yPhjhMtUQyd5srgB99OkUvmapWv13KCuJXsf=euw@mail.gmail.com>
Message-ID: <CAK8P3a1nM3yPhjhMtUQyd5srgB99OkUvmapWv13KCuJXsf=euw@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>, 
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
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_012719_140750_44E821E5 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, Feb 23, 2022 at 8:41 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > index db9a8e002b62..d7c89dc3426c 100644
> > --- a/arch/mips/include/asm/uaccess.h
> > +++ b/arch/mips/include/asm/uaccess.h
> > @@ -19,6 +19,7 @@
> >  #ifdef CONFIG_32BIT
> >
> >  #define __UA_LIMIT 0x80000000UL
> > +#define TASK_SIZE_MAX        __UA_LIMIT
>
> using KSEG0 instead would IMHO be the better choice. This gives the
> chance to remove __UA_LIMIT completly after cleaning up ptrace.c

Ok, changed now.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
