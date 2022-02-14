Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B8C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYNyUM924mOlFa1gQVOwbnMj7RRB5IDr6iV3i6P6Iwg=; b=ORQv3pIkef3kzE
	Q2p6akWDAOTaZLOPyMrakZhaHAYoKc9kUQCNhw5NxhYtXA1tRwamQPIoZw84ofN9nizSHsJqzx9XA
	IL4g4/R+XDUGXQKXxC4bpne7IHKkHAZLgyWJoaiZXMAtXYDT20C4lcJo6muzt3lfpr9Qy3i0J13CN
	2NmIsTJw6rNx1JJczIF2ZOVxboYipOMijXZVj2Jv44eJdMRk5tPpP5jDZ5qQoZODd+h+JRGRNQwe7
	ov2i7n/8b59tnRFyy51SuEF5e2t3uauJEqC9sJkYAwSwj0Vsd9mXU82RTwU+BFztleKDesD0RPlIN
	lmRQFhN1SyPIwDEqK35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhIj-00GkBE-BP; Mon, 14 Feb 2022 19:46:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhIb-00Gk6k-Uk; Mon, 14 Feb 2022 19:46:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A080B8167B;
 Mon, 14 Feb 2022 19:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2052C36AE7;
 Mon, 14 Feb 2022 19:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644867970;
 bh=kZ0Ha+ZttRWbRYErkpKyuJC1dyK+QrO2i6Uu5KgHMvM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y0tFdEItPyIpX9Q57aljIliTeAqJEjfsGhV5sRnV7cHDKUAHBtZxnjnJQ0aG/E0DY
 ntmMdawRiR6T8SjqmJRkg+eiX9WIai06zkYCR7faiov+1eO6KA28Xd0WJ3G4HzZ7Ki
 PswrJdfwevWrM+GcXzzieldjGJJj+F38X56atyYmYHaGjvacQFUxk+Q3y53FA51+T8
 ZklKna1hQALqex7ucGzH+u+kKR6+AMMF6Gi34rWhxaWoueN0V5gBdQpdknscuvJdj6
 4dVyfkX9O/n11Gjix37hL+YmaFTxTy2u9mOy0+3ugdzfzd4uf88HSfSBljtkByDhnd
 ubPSK5lCMcVZQ==
Received: by mail-wr1-f45.google.com with SMTP id k1so28593145wrd.8;
 Mon, 14 Feb 2022 11:46:09 -0800 (PST)
X-Gm-Message-State: AOAM531CR4x+HNCCWT1Z8I7lJV7yLn9i8YyvOsJZEDGXEZlYeYcKbjsk
 gzzHVWZKsYBmsgVmEzy5GcekPNN8a3Wp2men8Hc=
X-Google-Smtp-Source: ABdhPJyfeYwWpAfp1t9O1z8BIiteD6oMiQUhUFLNHvAQyjgPbxD0FyJauHtAzbL5TNr8UyIGWRM1U9VPuoeyXIyyYo0=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr445399wrp.219.1644867968239; 
 Mon, 14 Feb 2022 11:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
In-Reply-To: <YgqLFYqIqkIsNC92@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:45:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To: Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 Nick Hu <nickhu@andestech.com>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, 
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, 
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_114614_323243_04091722 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, Feb 14, 2022 at 6:02 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:42PM +0100, Arnd Bergmann wrote:
> > +#define __range_not_ok(addr, size, limit)    (!__access_ok(addr, size))
> > +#define __chk_range_not_ok(addr, size, limit)        (!__access_ok((void __user *)addr, size))
>
> Can we just kill these off insted of letting themm obsfucate the code?

As Al pointed out, they turned out to be necessary on sparc64, but the only
definitions are on sparc64 and x86, so it's possible that they serve a similar
purpose here, in which case changing the limit from TASK_SIZE to
TASK_SIZE_MAX is probably wrong as well.

So either I need to revert the original definition as I did on sparc64, or
they can be removed completely. Hopefully Al or the x86 maintainers
can clarify.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
