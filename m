Return-Path: <SRS0=lceQ=JO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C717CC433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 21:17:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7475161354
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 21:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7475161354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l/UTI6JnVksHnHXueM5spRdK+ymS5b90pMDdwGQYe/s=; b=U6j55wdC+/d/RWQbwUROeAfu6
	3OlB0kb56eaxKVq3TrROUyTgg1M9ndsXDUxRpYWx9rMd/nRpX6mKnMfz7l9piTtz7UqUqanwpqxW/
	zoXilhpwgMBeHP2VqG6XKJ8kKDKGqvzyEsOloCnR+O1ptrTvTkZqEcm+ZrUYa/my3fxValDa6riyG
	9M5LLOlA8ZTFlCTvs7ooo2thyZSgqyP9CcChUz+me5yPvt/P9T36da9WFcIOnxkDxi0ySiohVekmb
	oyhSSxFXnWljsS/3FphCsgCLW5XOUTpbXFboP+KgIGaw7gQONzRdRWISEWDx/x6klQ0AGt0fCFnBK
	2FRIyUmOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXsI4-006HNW-UU; Sat, 17 Apr 2021 21:16:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXsHC-006HCj-SZ
 for linux-snps-arc@desiato.infradead.org; Sat, 17 Apr 2021 21:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Ge0qVaffGmyUfyMbrA6H8Oa7gYN/zNO6D9+Yr6Jq3AA=; b=eJXwXjS4uCd5Ehep1AMPo8akeT
 DEcbd7zrGQ8FKAcyq7ILjCgLT7FGPpsOtdztVvmU7WWm/8cMQeKd8qY79foTbZkoVaw20hKKU/3df
 WRXUV7pxSQZ5YAvLAHwFVOghJq6O/TBR+ZrsVwmbqP/3MaO1KhKEnylky6dBkvP7MjSwALf+UbAkK
 6Ozjd6Rel1tfE2L+psxs44QaQfT/Xas72r4RZfRRYh60obiW++Zxm3GTfVFOZHargfN7dW7COzw07
 tASvgxWGfLmwj9Lnq4CZ66JXMR/22JBzOWg/5s3r1JjnF+RKi1XOJR2oq7i5FVCdKOMB3KeFy0wYh
 nD1QATAQ==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXsGV-00BhaR-Mw
 for linux-snps-arc@lists.infradead.org; Sat, 17 Apr 2021 21:14:43 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-283-C6_jqWz5MbGPOBVz1Qeg8g-1; Sat, 17 Apr 2021 22:13:46 +0100
X-MC-Unique: C6_jqWz5MbGPOBVz1Qeg8g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 22:13:46 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 22:13:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>, "brouer@redhat.com"
 <brouer@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "ilias.apalodimas@linaro.org"
 <ilias.apalodimas@linaro.org>, "mcroce@linux.microsoft.com"
 <mcroce@linux.microsoft.com>, "grygorii.strashko@ti.com"
 <grygorii.strashko@ti.com>, "arnd@kernel.org" <arnd@kernel.org>, "hch@lst.de"
 <hch@lst.de>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "mhocko@kernel.org"
 <mhocko@kernel.org>, "mgorman@suse.de" <mgorman@suse.de>
Subject: RE: [PATCH 2/2] mm: Indicate pfmemalloc pages in compound_head
Thread-Topic: [PATCH 2/2] mm: Indicate pfmemalloc pages in compound_head
Thread-Index: AQHXMxVsZdI9ViPPQ0K+FhC9QXmJFqq5NiYw
Date: Sat, 17 Apr 2021 21:13:45 +0000
Message-ID: <2a531a42f23e4046833e0feb8faef0b5@AcuMS.aculab.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-3-willy@infradead.org>
In-Reply-To: <20210416230724.2519198-3-willy@infradead.org>
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
X-CRM114-CacheID: sfid-20210417_221441_515643_B3BD05EA 
X-CRM114-Status: UNSURE (   8.66  )
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

From: Matthew Wilcox (Oracle) <willy@infradead.org>
> Sent: 17 April 2021 00:07
> 
> The net page_pool wants to use a magic value to identify page pool pages.
> The best place to put it is in the first word where it can be clearly a
> non-pointer value.  That means shifting dma_addr up to alias with ->index,
> which means we need to find another way to indicate page_is_pfmemalloc().
> Since page_pool doesn't want to set its magic value on pages which are
> pfmemalloc, we can use bit 1 of compound_head to indicate that the page
> came from the memory reserves.
> 
...
>  		struct {	/* page_pool used by netstack */
> -			/**
> -			 * @dma_addr: might require a 64-bit value on
> -			 * 32-bit architectures.
> -			 */
> +			unsigned long pp_magic;
> +			unsigned long xmi;
> +			unsigned long _pp_mapping_pad;
>  			unsigned long dma_addr[2];
>  		};

You've deleted the comment.

I also think there should be a comment that dma_addr[0]
must be aliased to ->index.
(Or whatever all the exact requirements are.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
