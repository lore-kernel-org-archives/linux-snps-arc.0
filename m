Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E419C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEkFnW3xcwWJQ0/x/eU/w4BAt1aSAnkFfoEi1YggF1k=; b=xAuDclGDMWMjsp
	XvFt2VbuWSqfvguAlEib8gVU3q4q4LvOU3fCL4UASB40lNDPT4XeZsO6sRQEKDNIRFErZZFpJuSif
	vBGolb8rZXdZ6Mu0oF3m/I1Ac2vxILyFCFnjuVoxFPdrbViewtSpua3jVTvYdhehJ8++cLUfFZCGz
	cnM2msYezLRiJQHJdgxHdRfh6fgJYI/NReMH9cD2soMk1GlD48Maw4tSUQ7I4jMwmF2PpDGfRfYbE
	X/lA/oVDiz2iY78WS3hKjdzcr52ktqQ2DqHLkYTbe7/OkHwdAkDSZvR4KiOhqD6VPG7G9OTkbwxVL
	0r1mffrsuSjsJhKhYRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL5SR-00FBCX-UJ; Fri, 18 Feb 2022 15:46:07 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL5SN-00FBA1-A8
 for linux-snps-arc@lists.infradead.org; Fri, 18 Feb 2022 15:46:06 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-70--4RjbVXtMcueaeoDqT_n6w-1; Fri, 18 Feb 2022 15:45:59 +0000
X-MC-Unique: -4RjbVXtMcueaeoDqT_n6w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Fri, 18 Feb 2022 15:45:56 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Fri, 18 Feb 2022 15:45:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Arnd Bergmann <arnd@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
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
 <linux-xtensa@linux-xtensa.org>, Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v2 05/18] x86: remove __range_not_ok()
Thread-Topic: [PATCH v2 05/18] x86: remove __range_not_ok()
Thread-Index: AQHYJJDV6CwChj5QoEqoVAdoFeMQC6yZc16A
Date: Fri, 18 Feb 2022 15:45:56 +0000
Message-ID: <905678e9e05d40b9a4e13e7b1a34cb68@AcuMS.aculab.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org> <20220218062851.GC22576@lst.de>
In-Reply-To: <20220218062851.GC22576@lst.de>
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
X-CRM114-CacheID: sfid-20220218_074603_668050_4992157F 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

From: Christoph Hellwig
> Sent: 18 February 2022 06:29
...
> 
> > diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
> > index 15b058eefc4e..ee117fcf46ed 100644
> > --- a/arch/x86/kernel/stacktrace.c
> > +++ b/arch/x86/kernel/stacktrace.c
> > @@ -90,7 +90,7 @@ copy_stack_frame(const struct stack_frame_user __user *fp,
> >  {
> >  	int ret;
> >
> > -	if (__range_not_ok(fp, sizeof(*frame), TASK_SIZE))
> > +	if (!__access_ok(fp, sizeof(*frame)))
> >  		return 0;
> 
> Just switch the __get_user calls below to get_user instead.

Is this worth doing at all?
How much userspace code is actually compiled with stack frames?

Won't work well for a 32bit process on a 64bit kernel either.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
