Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55331C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nih0PaW9DzMILO8ja+Xdwg3quUpHazJAPgfheo131sA=; b=w1dUpxNf7d2CPA
	F1hBmDyzBMaVx2yKiPdtcl4R76gl998TmE/Aw0skohzbsCiWlUyxGFoDjDDS4iMiyaYH/QffsgCxq
	R1RnVuCqbJe5zva9KL2W1I8ErLaM8UqGERbrcHgMUfY4OIrMtCcnG8+SUZNpe9ks7LwB6jFhEuVD8
	msDLD4CFdl7xMRAO4lBNAMh9P8lmvoBTLFtzBBNk1hAs9z8O/ROwlEuRwG2umHJTnTkd5x1kQHppz
	O2zbhZK0+X2xyM4WEVOuIar48OXk5DR3LQkKPn50xT96+TlV23QyhHqRid+YD1qnCfPV1pZMHge4w
	ZdepTI3DnNjgjBQoefJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKT3-007Dgf-E5; Wed, 16 Feb 2022 13:35:37 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKT0-007Dcl-Hw
 for linux-snps-arc@lists.infradead.org; Wed, 16 Feb 2022 13:35:36 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-5-x7kvjQ_dNbmfJSCohruuVA-1; Wed, 16 Feb 2022 13:35:28 +0000
X-MC-Unique: x7kvjQ_dNbmfJSCohruuVA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 13:35:25 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 16 Feb 2022 13:35:25 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
CC: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "will@kernel.org"
 <will@kernel.org>, "guoren@kernel.org" <guoren@kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "nickhu@andestech.com" <nickhu@andestech.com>, "green.hu@gmail.com"
 <green.hu@gmail.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "shorne@gmail.com" <shorne@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "peterz@infradead.org"
 <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "hca@linux.ibm.com"
 <hca@linux.ibm.com>, "dalias@libc.org" <dalias@libc.org>,
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
Subject: RE: [PATCH v2 02/18] uaccess: fix nios2 and microblaze get_user_8()
Thread-Topic: [PATCH v2 02/18] uaccess: fix nios2 and microblaze get_user_8()
Thread-Index: AQHYIzdfY+IsqXyFuUGlEUsFmAHn6KyWK9Eg
Date: Wed, 16 Feb 2022 13:35:25 +0000
Message-ID: <4a7e026b07c94668a18cb4857ad6b7a5@AcuMS.aculab.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-3-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-3-arnd@kernel.org>
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
X-CRM114-CacheID: sfid-20220216_053534_898746_DF0A13E3 
X-CRM114-Status: UNSURE (   7.24  )
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

From: Arnd Bergmann
> Sent: 16 February 2022 13:13
> 
> These two architectures implement 8-byte get_user() through
> a memcpy() into a four-byte variable, which won't fit.
> 
> Use a temporary 64-bit variable instead here, and use a double
> cast the way that risc-v and openrisc do to avoid compile-time
> warnings.
> 
...
>  	case 4:								\
> -		__get_user_asm("lw", (ptr), __gu_val, __gu_err);	\
> +		__get_user_asm("lw", (ptr), x, __gu_err);		\
>  		break;							\
> -	case 8:								\
> -		__gu_err = __copy_from_user(&__gu_val, ptr, 8);		\
> -		if (__gu_err)						\
> -			__gu_err = -EFAULT;				\
> +	case 8: {							\
> +		__u64 __x = 0;						\
> +		__gu_err = raw_copy_from_user(&__x, ptr, 8) ?		\
> +							-EFAULT : 0;	\
> +		(x) = (typeof(x))(typeof((x) - (x)))__x;		\
>  		break;							\

Wouldn't it be better to just fetch two 32bit values:
Something like (for LE - nios2 is definitely LE:
		__u32 val_lo, val_hi;
		__get_user_asm("lw", (ptr), val_lo, __gu_err);
		__get_user_asm("lw", (ptr) + 4, val_hi, __gu_err);
		x = val_lo | val_hi << 32;
		break;

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
