Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8846C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAYTBJ/jCY8dp/n/yXNvTefYj/OKWS5Ufz1grOMKzEU=; b=Ilg4bI/Uy23wED
	GkqMo2B+V2dGEsxEgc+PDrFzKrquJ8opOTC9vkR3UneU+Phl0zDy4mhkq7vuQ20EglxYfRhcTwrbA
	UzxEqyQ4MR/9vSRessNZd7AxhtVyXPq7iMwRZrcR1eLwlashlRJtDISc8tI/jT1dnZh9HSTZlhJw7
	XQgMEHgD2dCVeFIp18uqhdZtaZ5Tk1urak57NDLCffzN1Zm77lpfnA3eXJjrtXoj5nnB4R2s9LiDv
	IThykbgcmhM+L50ynY+MnMq6zkH2yzpjMrsqsBDZvpRd8W09ug2KkBFlNSi+YlVM4T88rM+P/O00Y
	wrD0yfZ4I8A/ZLU6QEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzh9-00DbVG-DX; Fri, 18 Feb 2022 09:36:55 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzb4-00DYNU-2o
 for linux-snps-arc@lists.infradead.org; Fri, 18 Feb 2022 09:30:41 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-129-Mn8CKvyFPNSuM9Bkc4i3uw-1; Fri, 18 Feb 2022 09:30:35 +0000
X-MC-Unique: Mn8CKvyFPNSuM9Bkc4i3uw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Fri, 18 Feb 2022 09:30:32 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Fri, 18 Feb 2022 09:30:32 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andy Lutomirski' <luto@amacapital.net>, Arnd Bergmann <arnd@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig
 <hch@lst.de>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "will@kernel.org" <will@kernel.org>,
 "guoren@kernel.org" <guoren@kernel.org>, "bcain@codeaurora.org"
 <bcain@codeaurora.org>, "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "monstr@monstr.eu" <monstr@monstr.eu>, "tsbogend@alpha.franken.de"
 <tsbogend@alpha.franken.de>, "nickhu@andestech.com" <nickhu@andestech.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>, "dinguyen@kernel.org"
 <dinguyen@kernel.org>, "shorne@gmail.com" <shorne@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com"
 <mingo@redhat.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "dalias@libc.org" <dalias@libc.org>, 
 "davem@davemloft.net" <davem@davemloft.net>, "richard@nod.at"
 <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "ardb@kernel.org"
 <ardb@kernel.org>, "linux-alpha@vger.kernel.org"
 <linux-alpha@vger.kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, "linux-hexagon@vger.kernel.org"
 <linux-hexagon@vger.kernel.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org"
 <linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "openrisc@lists.librecores.org"
 <openrisc@lists.librecores.org>, "linux-parisc@vger.kernel.org"
 <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, "sparclinux@vger.kernel.org"
 <sparclinux@vger.kernel.org>, "linux-um@lists.infradead.org"
 <linux-um@lists.infradead.org>, "linux-xtensa@linux-xtensa.org"
 <linux-xtensa@linux-xtensa.org>
Subject: RE: [PATCH v2 13/18] uaccess: generalize access_ok()
Thread-Topic: [PATCH v2 13/18] uaccess: generalize access_ok()
Thread-Index: AQHYJDLDvIZKe0fPGEirizFtCzB+zayZCg2g
Date: Fri, 18 Feb 2022 09:30:32 +0000
Message-ID: <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
In-Reply-To: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220218_013038_493394_8D90CF95 
X-CRM114-Status: GOOD (  15.53  )
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

From: Andy Lutomirski
> Sent: 17 February 2022 19:15
...
> This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
> constant that has a very specific value to work around a bug^Wdesign
> error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
> which userspace is permitted to allocate memory, but there is a huge
> gap between user and kernel addresses, and any value in the gap would
> be adequate for the comparison.  If we wanted to optimize this, simply
> checking the high bit (which x86 can do without any immediate
> constants at all) would be sufficient and, for an access known to fit
> in 32 bits, one could get even fancier and completely ignore the size
> of the access.  (For accesses not known to fit in 32 bits, I suspect
> some creativity could still come up with a construction that's
> substantially faster than the one in your patch.)
> 
> So there's plenty of room for optimization here.
> 
> (This is not in any respect a NAK -- it's just an observation that
> this could be even better.)

For 64bit arch that use the top bit to separate user/kernel
you can test '(addr | size) >> 62)'.
The compiler optimises out constant sizes.

This has all been mentioned a lot of times.
You do get different fault types.

OTOH an explicit check for constant size (less than something big)
can use the cheaper test of the sign bit.
Big constant sizes could be compile time errors.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
