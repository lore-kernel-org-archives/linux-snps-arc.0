Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB2C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 22:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4ZWDGU38nEn6Lw92KZpZxXqQ72X9NSk6aCHkvThc+w=; b=1r1FHBP7sXt8l7
	AfEDBVDQ+NfLs1tq/NjlRWyOXehmk4MWAM2nqXUMHRcAfMmUE98qXXU7L1kTCT/QXdnv+CEuVMl5A
	hErvblGXZbkQ/1l00hhoI6DKWy4yfChmF+rCN8V01bq5atVHgaejkQFHhGRw24ysgL1IZhTZyCHAc
	awnI8F+yKL1BJ6/WLK4Ab8QXMC0Qh3BvCtyadk7skvtN7Ipl//QW2zdLtaf/XC+c0cPK4FBdD3XZ3
	omTt+Ui8wftJIBpVR0ibY/DE5hHpNX9mXtt5mOWiJ5KYIyCKJE7dREAfED/ReSpB51A5eEFHvnUxX
	gV9AH4r65o+DlThX0CSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJjbP-00HBqT-41; Mon, 14 Feb 2022 22:13:47 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJjbK-00HBmS-Fr
 for linux-snps-arc@lists.infradead.org; Mon, 14 Feb 2022 22:13:45 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-3-0IuFZHXpM1-VcUsNfepTpQ-1; Mon, 14 Feb 2022 22:13:36 +0000
X-MC-Unique: 0IuFZHXpM1-VcUsNfepTpQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 22:13:34 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 14 Feb 2022 22:13:34 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Arnd Bergmann
 <arnd@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list
 <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "open
 list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Max Filippov
 <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux
 <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arch
 <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, "Brian
 Cain" <bcain@codeaurora.org>, "open list:QUALCOMM HEXAGON..."
 <linux-hexagon@vger.kernel.org>, Helge Deller <deller@gmx.de>, "the arch/x86
 maintainers" <x86@kernel.org>, Russell King - ARM Linux
 <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "Christoph
 Hellwig" <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, "open list:SYNOPSYS ARC ARCHITECTURE"
 <linux-snps-arc@lists.infradead.org>, "open list:TENSILICA XTENSA PORT
 (xtensa)" <linux-xtensa@linux-xtensa.org>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um <linux-um@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-m68k
 <linux-m68k@lists.linux-m68k.org>, Openrisc <openrisc@lists.librecores.org>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>, "Linux
 ARM" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu
 <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>, Linux-MM
 <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, Dinh Nguyen
 <dinguyen@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>, alpha
 <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, David Miller
 <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH 04/14] x86: use more conventional access_ok() definition
Thread-Topic: [PATCH 04/14] x86: use more conventional access_ok() definition
Thread-Index: AQHYIeHe9n+22PBgtUWxf89GrdwkK6yTmyQw
Date: Mon, 14 Feb 2022 22:13:34 +0000
Message-ID: <2dda07f893cb4ef9b5ea2265adccb98f@AcuMS.aculab.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org> <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
 <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220214_141342_855295_AFBE27AA 
X-CRM114-Status: GOOD (  10.20  )
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

From: Linus Torvalds
> Sent: 14 February 2022 20:24
> >
> > x86-64 has always(*) used TASK_SIZE_MAX for access_ok(), and the
> > get_user() assembler implementation does the same.
> 
> Side note: we could just check the sign bit instead, and avoid big
> constants that way.

The cheap test for most 64bit is (addr | size) >> 62 != 0.

I did some tests last week and the compilers correctly optimise
out constant size.

Doesn't sparc64 still need a wrap test?
Or is that assumed because there is always an unmapped page
and transfer are 'adequately' done on increasing addresses?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
