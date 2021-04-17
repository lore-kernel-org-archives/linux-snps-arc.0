Return-Path: <SRS0=lceQ=JO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E444C433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 21:20:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D76661210
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 21:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D76661210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UjK59orVkofu/bsJfJ3sn26Oe+9ylTMIJqOTEl7DMRc=; b=RfIiKZXZnAZUZLZKqGqDZMOYQ
	Ln6ftxxunNLwgAefgJC2ISRYzAjdIsVng3tNQMOrOITtISKEGlcM6QMDoBLmZsEIsLYrv4MHJ1P9u
	uLkgefQ5tBuaXFEUhk8DGkKYclSNuMo6gSfuFNnX8WA+g4xQ76JvdKexbAe61FJ1FHhgiM5hs8Xxp
	EKB0jZGDmWGA/xnSS3Yps1uNy4ta7ISnuESRLeIbW9tJBCbeIt8J3PfXRcNDuojxrjJo+fz3pOiGc
	WAHWcgo8GFs+C4qytJFVKSzd+jOqW3r+XCf4PC1EfdS8dadrr7P4Y98JVmemw0OCIljr2vgIc1gpt
	AVcktCRog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXsMo-006ISX-9G; Sat, 17 Apr 2021 21:20:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXsLq-006IDi-4y
 for linux-snps-arc@desiato.infradead.org; Sat, 17 Apr 2021 21:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Si0pnxL89C+e7eTmMrmBl5h7DZh/cENUMffwzmg7sAQ=; b=XU5uWzYDgPdWz3bD6ZL1kTjjVu
 UWKiaSnSdLR1UI1LWCaazg93MJGW6LJJnXMeYpgUlukw/c6GL4Clzyq/JuGAtV7IV9DSE3O3CnXxK
 0/MNfMP4YoEGwjuHiRS1SzOQPWduNFgUlJtwg0TKja29jiEqBWnUIvm1yIzToiYHZEBj+i6qhVmPv
 PcnJWemN/qahf8lfp4mJrryx8FE12AMoOGKmZgpsLzj0K/eD5qtwwcW8Z6R3AsaJWLDs7+Nx525z0
 zxZiAhJxPuE2R8Diq6yGZ86QyUX3GnsDal10rZeaHyF/tfzuz9BMTvW9d3AKnlE4XmivrVcrIC5t8
 B/2OrnTQ==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXsLO-00BhsM-Ho
 for linux-snps-arc@lists.infradead.org; Sat, 17 Apr 2021 21:19:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-261-JBH8CRNiMlWoKO_dEnAufg-1; Sat, 17 Apr 2021 22:18:58 +0100
X-MC-Unique: JBH8CRNiMlWoKO_dEnAufg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 22:18:57 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 22:18:57 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matthew Wilcox' <willy@infradead.org>, "brouer@redhat.com"
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
Subject: RE: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXMzO/f1yRrc3ugkWz9MvyD1ZvgKq5Nwpg
Date: Sat, 17 Apr 2021 21:18:57 +0000
Message-ID: <386d009232dc42bdaf83d4cc36b13864@AcuMS.aculab.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
In-Reply-To: <20210417024522.GP2531743@casper.infradead.org>
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
X-CRM114-CacheID: sfid-20210417_221916_795474_09347100 
X-CRM114-Status: UNSURE (   5.52  )
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

From: Matthew Wilcox <willy@infradead.org>
> Sent: 17 April 2021 03:45
> 
> Replacement patch to fix compiler warning.
...
>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>  {
> -	return page->dma_addr;
> +	dma_addr_t ret = page->dma_addr[0];
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;

Ugly as well.

Why not just replace the (dma_addr_t) cast with a (u64) one?
Looks better than the double shift.

Same could be done for the '>> 32'.
Is there an upper_32_bits() that could be used??

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
