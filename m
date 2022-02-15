Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF99C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyYLGOF1Usc5LJC6ilPdeic0NPH979cnv66RpAsoe3U=; b=kk+LivcHa03kRX
	dKUJRgsS6MHNKYsfAAKVrvlAvmOatamf+VNLGy0SNkr67P3BVPrimVTuHa2MUiiXxVhXaKeaoUga8
	/2uU68mJjHcb7dObYnQpmkU3VYNejATYf+F2tW6KowVI8cX0MVV6yH8r3u/Zm9GQ0Cu5SUhON5Xbm
	13Hpn2uA72Q4T2q1MhmAk+lDExG+H4gsIRAGJ7lYcFLlIFtNLnGxoY9MOBWNnWqxSWZr5hGWUJa0k
	SrZOHtA5lQIO6fZ26+8yY2P9+32+Ip5VeQ7BnTIIaZkT+1gtfBS5B9Hm1Twtymxz5mfagggrphUIW
	8OSlXlY+/Vy8pkG6aKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuAm-0023W9-A4; Tue, 15 Feb 2022 09:31:00 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuAd-0023RR-Kr
 for linux-snps-arc@lists.infradead.org; Tue, 15 Feb 2022 09:30:56 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-156-02Gu5ovtPiqtLOI9bz8ReQ-1; Tue, 15 Feb 2022 09:30:48 +0000
X-MC-Unique: 02Gu5ovtPiqtLOI9bz8ReQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 09:30:41 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 15 Feb 2022 09:30:41 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ard Biesheuvel' <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, "open
 list:S390" <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Russell King
 <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, alpha
 <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, "open
 list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org"
 <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>, "Stafford
 Horne" <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "monstr@monstr.eu" <monstr@monstr.eu>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "open list:PARISC ARCHITECTURE"
 <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>, Max Filippov
 <jcmvbkbc@gmail.com>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Richard Weinberger
 <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>
Subject: RE: [PATCH 08/14] arm64: simplify access_ok()
Thread-Topic: [PATCH 08/14] arm64: simplify access_ok()
Thread-Index: AQHYIkSmToLbzZrgTk+lOdewxMJ8XqyUT0bw
Date: Tue, 15 Feb 2022 09:30:41 +0000
Message-ID: <153bb1887f484ed79ce8224845a4b2ea@AcuMS.aculab.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_013052_015466_64B18F1D 
X-CRM114-Status: GOOD (  42.54  )
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

From: Ard Biesheuvel
> Sent: 15 February 2022 08:18
> 
> On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > arm64 has an inline asm implementation of access_ok() that is derived from
> > the 32-bit arm version and optimized for the case that both the limit and
> > the size are variable. With set_fs() gone, the limit is always constant,
> > and the size usually is as well, so just using the default implementation
> > reduces the check into a comparison against a constant that can be
> > scheduled by the compiler.
> >
> > On a defconfig build, this saves over 28KB of .text.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm64/include/asm/uaccess.h | 28 +++++-----------------------
> >  1 file changed, 5 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> > index 357f7bd9c981..e8dce0cc5eaa 100644
> > --- a/arch/arm64/include/asm/uaccess.h
> > +++ b/arch/arm64/include/asm/uaccess.h
> > @@ -26,6 +26,8 @@
> >  #include <asm/memory.h>
> >  #include <asm/extable.h>
> >
> > +static inline int __access_ok(const void __user *ptr, unsigned long size);
> > +
> >  /*
> >   * Test whether a block of memory is a valid user space address.
> >   * Returns 1 if the range is valid, 0 otherwise.
> > @@ -33,10 +35,8 @@
> >   * This is equivalent to the following test:
> >   * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
> >   */
> > -static inline unsigned long __access_ok(const void __user *addr, unsigned long size)
> > +static inline int access_ok(const void __user *addr, unsigned long size)
> >  {
> > -       unsigned long ret, limit = TASK_SIZE_MAX - 1;
> > -
> >         /*
> >          * Asynchronous I/O running in a kernel thread does not have the
> >          * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
> > @@ -46,27 +46,9 @@ static inline unsigned long __access_ok(const void __user *addr, unsigned long s
> >             (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
> >                 addr = untagged_addr(addr);
> >
> > -       __chk_user_ptr(addr);
> > -       asm volatile(
> > -       // A + B <= C + 1 for all A,B,C, in four easy steps:
> > -       // 1: X = A + B; X' = X % 2^64
> > -       "       adds    %0, %3, %2\n"
> > -       // 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
> > -       "       csel    %1, xzr, %1, hi\n"
> > -       // 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
> > -       //    to compensate for the carry flag being set in step 4. For
> > -       //    X > 2^64, X' merely has to remain nonzero, which it does.
> > -       "       csinv   %0, %0, xzr, cc\n"
> > -       // 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
> > -       //    comes from the carry in being clear. Otherwise, we are
> > -       //    testing X' - C == 0, subject to the previous adjustments.
> > -       "       sbcs    xzr, %0, %1\n"
> > -       "       cset    %0, ls\n"
> > -       : "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
> > -
> > -       return ret;
> > +       return likely(__access_ok(addr, size));
> >  }
> > -#define __access_ok __access_ok
> > +#define access_ok access_ok
> >
> >  #include <asm-generic/access_ok.h>
> >
> > --
> > 2.29.2
> >
> 
> With set_fs() out of the picture, wouldn't it be sufficient to check
> that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
> That would also remove the need to strip the tag from the address.
> 
> Something like
> 
>     asm goto("tbnz  %0, #55, %2     \n"
>              "tbnz  %1, #55, %2     \n"
>              :: "r"(addr), "r"(addr + size - 1) :: notok);
>     return 1;
> notok:
>     return 0;
> 
> with an additional sanity check on the size which the compiler could
> eliminate for compile-time constant values.

Is there are reason not to just use:
	size < 1u << 48 && !((addr | (addr + size - 1)) & 1u << 55)

(The -1 can be removed if the last user page is never mapped)

Ugg, is arm64 addressing as horrid as it looks - with the 'kernel'
bit in the middle of the virtual address space?
It seems to be:
	<zero:4><tag:4><kernel:1><ignored:7><address:48>
Although I found some references to 44 bit VA and to code using the
'ignored' bits as tags - relying on the hardware ignoring them.
There might be some feature that uses the top 4 bits as well.

Another option is assuming that accesses are 'reasonably sequential',
removing the length check and ensuring there is an unmapped page
between valid user and kernel addresses.
That probably requires and unmapped page at the bottom of kernel space
which may not be achievable.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
