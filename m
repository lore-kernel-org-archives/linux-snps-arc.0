Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36E0C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSeSXHYGsYvYyiIpB8dzeNP4p0QMa2c2BTgpT+4/l3I=; b=ZSrN99REUMH6BQ
	zSkMQk/SNsFBcRwMeIYn2C6OEfYbNxnkF4jtKwwN4G4v1FISzk0qy1FWnpcyMwH+znAleZ8712LJE
	AXXRfQcicWri2OXpx36s+skri/6qMx+m+GrFJf0lrbsFCcen5C69aCxrlnMCt4ccUDSg8o7UM9+Om
	n/gdl6QysovwiDpSL8zZ/Y+P+neIWyjcEn768JpKg8n8UfKwa8mQi0TW91Fz0WD3Oiu5Y0ymZYLrz
	uZT1M5Rq7rmSersTl5J6ixhuJ8GjWeXjHYp7NWmH4bNYb3pStg0f4+JAI08h2yL+8HPpYbsKFISkX
	9xjq8vlTRrDJqoTen7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxtJ-002r9K-KZ; Tue, 15 Feb 2022 13:29:13 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxtB-002r40-HG
 for linux-snps-arc@lists.infradead.org; Tue, 15 Feb 2022 13:29:09 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-182-H3Rwu_w8NV6V0ZRo-LH3cg-1; Tue, 15 Feb 2022 13:29:01 +0000
X-MC-Unique: H3Rwu_w8NV6V0ZRo-LH3cg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 13:28:59 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 15 Feb 2022 13:28:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
CC: Christoph Hellwig <hch@lst.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Russell King - ARM Linux
 <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>, Greentime Hu
 <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne
 <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>, David Miller
 <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, "the arch/x86
 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, "Eric W .
 Biederman" <ebiederm@xmission.com>, Andrew Morton
 <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, alpha
 <linux-alpha@vger.kernel.org>, "open list:SYNOPSYS ARC ARCHITECTURE"
 <linux-snps-arc@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, "open list:QUALCOMM HEXAGON..."
 <linux-hexagon@vger.kernel.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Openrisc
 <openrisc@lists.librecores.org>, Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, sparclinux
 <sparclinux@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, "open
 list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
Subject: RE: [PATCH 09/14] m68k: drop custom __access_ok()
Thread-Topic: [PATCH 09/14] m68k: drop custom __access_ok()
Thread-Index: AQHYIlMtkSdfU5++r0iADsDmNo4Sd6yUlQ9w
Date: Tue, 15 Feb 2022 13:28:59 +0000
Message-ID: <665a8abfa86f4b5f9a66e294a79bb531@AcuMS.aculab.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk> <20220215062942.GA12551@lst.de>
 <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
 <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220215_052905_921411_56140C38 
X-CRM114-Status: GOOD (  33.01  )
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

From: Arnd Bergmann
> Sent: 15 February 2022 10:02
> 
> On Tue, Feb 15, 2022 at 8:13 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Tue, Feb 15, 2022 at 07:29:42AM +0100, Christoph Hellwig wrote:
> > > On Tue, Feb 15, 2022 at 12:37:41AM +0000, Al Viro wrote:
> > > > Perhaps simply wrap that sucker into #ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
> > > > (and trim the comment down to "coldfire and 68000 will pick generic
> > > > variant")?
> > >
> > > I wonder if we should invert CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
> > > select the separate address space config for s390, sparc64, non-coldfire
> > > m68k and mips with EVA and then just have one single access_ok for
> > > overlapping address space (as added by Arnd) and non-overlapping ones
> > > (always return true).
> >
> > parisc is also such...  How about
> >
> >         select ALTERNATE_SPACE_USERLAND
> >
> > for that bunch?
> 
> Either of those works for me. My current version has this keyed off
> TASK_SIZE_MAX==ULONG_MAX, but a CONFIG_ symbol does
> look more descriptive.
> 
> >  While we are at it, how many unusual access_ok() instances are
> > left after this series?  arm64, itanic, um, anything else?
> 
> x86 adds a WARN_ON_IN_IRQ() check in there.

If is a noop unless CONFIG_DEBUG_ATOMIC_SLEEP is set.
I doubt that is often enabled.

> This could be
> made generic, but it's not obvious what exactly the exceptions are
> that other architectures need. The arm64 tagged pointers could
> probably also get integrated into the generic version.
> 
> > FWIW, sparc32 has a slightly unusual instance (see uaccess_32.h there); it's
> > obviously cheaper than generic and I wonder if the trick is legitimate (and
> > applicable elsewhere, perhaps)...
> 
> Right, a few others have the same, but I wasn't convinced that this
> is actually safe for call possible cases: it's trivial to construct a caller
> that works on other architectures but not this one, if you pass a large
> enough size value and don't access the contents in sequence.

You'd need code that did an access_ok() check and then read from
a large offset from the address - unlikely.
It's not like the access_ok() check for read/write is done on syscall
entry and then everything underneath assumes it is valid.

Hasn't (almost) everything been checked for function calls between
user_access_begin() and the actual accesses?
And access_ok() is done by/at the same time as user_access_begin()?

You do need an unmapped page above the address that is tested.

> Also, like the ((addr | (addr + size)) & MASK) check on some other
> architectures, it is less portable because it makes assumptions about
> the actual layout beyond a fixed address limit.

Isn't that test broken without a separate bound check on size?

I also seem to remember that access_ok(xxx, 0) is always 'ok'
and some of the 'fast' tests give a false negative if the user
buffer ends with the last byte of user address space.

So you may need:
	size < TASK_SIZE && (addr < (TASK_SIZE - size - 1) || !size)
(sprinkled with [un]likely())

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
