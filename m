Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C7C77B75
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnIaC0vghOwCWws395YLxi/mKTq+iN+Ct4BapMNFAG4=; b=h62quBGgxBGrc/
	04PUbyvKIl8pVpUhI+8VLOblq2VMNN4FCfZysnEjw6rJryT12nZocqo6ojo43cSvAQ6q2cP7as5Q7
	zv1Y+paW+eBn850ze98rCjcCgaASV8wARYcPiO/MsWBlGAf5afrTs6gJjbWoQxEoZiJgSCVQmQQ3t
	EWE4mFlOlq+5HO/n9xSb12e01wt09rhUHjnYfrLbvRwrd9cDkaWxLCAu0a2MxqovZjaI3nkYeIMrF
	CXbnXsktF1ZfhbDSW/ZmKw6+larMFHCtY04xCJG/hyY/iQMB4yyDMGIg4QWex6acgpROP6WyOMGaL
	a+YPHjLU4IIVbVJA7n1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQlK-00BmvM-2c;
	Fri, 12 May 2023 11:16:38 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQlI-00Bmt1-05
	for linux-snps-arc@lists.infradead.org;
	Fri, 12 May 2023 11:16:37 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-249-VSjj4jpZOom7AJRUgPGuWQ-1; Fri, 12 May 2023 12:16:32 +0100
X-MC-Unique: VSjj4jpZOom7AJRUgPGuWQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 12 May
 2023 12:16:30 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 12 May 2023 12:16:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Thomas Zimmermann' <tzimmermann@suse.de>, "deller@gmx.de"
	<deller@gmx.de>, "geert@linux-m68k.org" <geert@linux-m68k.org>,
	"javierm@redhat.com" <javierm@redhat.com>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "vgupta@kernel.org" <vgupta@kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name"
	<kernel@xen0n.name>, "davem@davemloft.net" <davem@davemloft.net>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"sam@ravnborg.org" <sam@ravnborg.org>, "suijingfeng@loongson.cn"
	<suijingfeng@loongson.cn>
CC: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, kernel test robot <lkp@intel.com>, "Artur
 Rojek" <contact@artur-rojek.eu>
Subject: RE: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
Thread-Topic: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
Thread-Index: AQHZhLwIoJOHAKlHvkaeoWR92INTOa9We4fw
Date: Fri, 12 May 2023 11:16:30 +0000
Message-ID: <c25758dd7b4a4563b0d33c751da8cf6d@AcuMS.aculab.com>
References: <20230512102444.5438-1-tzimmermann@suse.de>
 <20230512102444.5438-2-tzimmermann@suse.de>
In-Reply-To: <20230512102444.5438-2-tzimmermann@suse.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_041636_351535_9198AB28 
X-CRM114-Status: GOOD (  11.73  )
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

From: Thomas Zimmermann
> Sent: 12 May 2023 11:25
> 
> Cast I/O offsets to pointers to use them with I/O functions. The I/O
> functions expect pointers of type 'volatile void __iomem *', but the
> offsets are plain integers. Build warnings are
> 
>   ../drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_wait':
>   ../arch/x86/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer
> from integer without a cast [-Wint-conversion]
>    18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~
...
>    52 | static inline u16 fb_readw(const volatile void __iomem *addr)
>       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> 
> This patch only fixes the build warnings. It's not clear if the I/O
> offsets can legally be passed to the I/O helpers. It was apparently
> broken in 2007 when custom inw()/outw() helpers got removed by
> commit 34a780a0afeb ("sh: hp6xx pata_platform support."). Fixing the
> driver would require setting the I/O base address.

Did you try changing the definition of HD64461_IOBASE to include
a (volatile void __iomem *) cast?
A lot less churn...

I'm guessing that 'sh' deosn't have in/out instructions so this
is something that is always mapped at a fixed kernel virtual address?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
