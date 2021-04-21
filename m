Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853B8C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:25:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2486061424
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2486061424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zZBujvv08GIa81O7Htr8DRk3+9pCx6IvNJpYQlVEYmE=; b=G2x2Pb68WjBIS/2aX/uAwls4T
	IwYlBF9tAiOjxBtr8N/H9cIYTv4jWyIonpJkFwIqWyb1DXZMFRtPQSc7qYKJZHdYEgX7Zh3J3m+9a
	vMc6uSykmeN+g6ehWIxf+ytQnhu4sbLhVKlkGfq5SNYy4pdtDBvbLJMyKQXEddtvTUVoVTTkdjj3+
	YHii2LJLg7AeW05+kpOsWslrFnY+LAzaiLDT9v3LdEY+fjapCQEmBhmu/LL72+gdnjoanrarykU9u
	VSie6cuTxPnZyenvbNND5XC00uld9DrW6sHw8LFysd9Lzwe90uYbQlQyi2QldoBmzZGuXcKHE77sh
	+S4OKnxdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZAz5-00EItU-Rh; Wed, 21 Apr 2021 11:25:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAz2-00EItB-Ja
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 11:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=L25G5N2UMTPTq5F9JlRFZvEulN0sTpT+ZtvP1OOZRh8=; b=KmMkmvo2PclA5GsKoZ7kurkURG
 /HAMVRCxiYVoiVueOk0kLEcduu0dEzsw/EPjo/aORMX42hdwjI/+W04wjHhTkr9zXQ3uXUWpob2wX
 maC1iMDdi3IMt8uTPf3rpK285kIsL/gSQ2OBQSxsooMVUjBc49d/Xi0MH+qvPdSKsdP2S38tY8guC
 5+xNyPArd6TrYxOndyFcsGKLMkuTNPvmrLXw2j/FqGV8mwOPvBMgbJzRt78tdfbITmfSbDcXih2oT
 q7d76K2zu5J+V9ysXuCVF60hg/J5eLFhSbF7uXRJ/WiOK8iAQAZO2IT5jXZWiS2uKL9CzrsO0MDc+
 +RbWmXUQ==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAyp-00GROP-8j
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 11:25:20 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-145-Cn1hkKd9P9uw5RfL9DWEDg-1; Wed, 21 Apr 2021 12:24:48 +0100
X-MC-Unique: Cn1hkKd9P9uw5RfL9DWEDg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 21 Apr 2021 12:24:47 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Wed, 21 Apr 2021 12:24:47 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Niklas Schnelle' <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Vineet Gupta <vgupta@synopsys.com>, "David S. Miller" <davem@davemloft.net>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, "clang-built-linux@googlegroups.com"
 <clang-built-linux@googlegroups.com>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "sparclinux@vger.kernel.org"
 <sparclinux@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] asm-generic/io.h: Silence
 -Wnull-pointer-arithmetic warning on PCI_IOBASE
Thread-Topic: [PATCH v3 3/3] asm-generic/io.h: Silence
 -Wnull-pointer-arithmetic warning on PCI_IOBASE
Thread-Index: AQHXNqAK6EZxeEzVYUmXQlgF5xc7+Kq+079Q
Date: Wed, 21 Apr 2021 11:24:47 +0000
Message-ID: <bb21141706d7477794453f7f52f6bc98@AcuMS.aculab.com>
References: <20210421111759.2059976-1-schnelle@linux.ibm.com>
 <20210421111759.2059976-4-schnelle@linux.ibm.com>
In-Reply-To: <20210421111759.2059976-4-schnelle@linux.ibm.com>
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
X-CRM114-CacheID: sfid-20210421_122518_937219_E716006B 
X-CRM114-Status: GOOD (  13.44  )
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

From: Niklas Schnelle
> Sent: 21 April 2021 12:18
> 
> When PCI_IOBASE is not defined, it is set to 0 such that it is ignored
> in calls to the readX/writeX primitives. This triggers clang's
> -Wnull-pointer-arithmetic warning and will result in illegal accesses on
> platforms that do not support I/O ports if drivers do still attempt to
> access them.
> 
> Make things explicit and silence the warning by letting inb() and
> friends fail with WARN_ONCE() and a 0xff... return in case PCI_IOBASE is
> not defined.
...
> 
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index c6af40ce03be..aabb0a8186ee 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
...
> @@ -458,12 +454,17 @@ static inline void writesq(volatile void __iomem *addr, const void *buffer,
>  #define _inb _inb
>  static inline u8 _inb(unsigned long addr)
>  {
> +#ifdef PCI_IOBASE
>  	u8 val;
> 
>  	__io_pbr();
>  	val = __raw_readb(PCI_IOBASE + addr);
>  	__io_par(val);
>  	return val;
> +#else
> +	WARN_ONCE(1, "No I/O port support\n");
> +	return ~0;
> +#endif
>  }
>  #endif

I suspect that this might be better not inlined
when PCI_IOBASE is undefined.

Otherwise you get quite a lot of bloat from all the
WARN_ONCE() calls.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
