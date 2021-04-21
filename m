Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D86EC433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 08:43:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96F161426
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 08:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96F161426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNV/v2ziS/Zu4KQRqsyeNIPPfIlHraWRRykDTEW7B5o=; b=XrzBQe5zZ/nubCGlx8PwWveaQ
	o+9uqDCWIUiTf5xje4XkUzHSr++r87P0T5aCQB4IW++YsD8ElM3E9q8YduyGbTvsSP95Wp5X0bp3Q
	Fwuqt9MS1I/gwjUQIJ/8TUiKR/+KX5qBDJ/mKsM77qDWtJ1LYyGH0AgKCEKSlQ8fVifCeBGnlBCm9
	24wRPpb1WXRmTf2/ci5j64e6s3MAQ8lOZ6Bmic2uLJr41UuAlqrHAkT2dAebsp/zGWpY3eUn9jCmh
	s+qlUTL6HIb/Iy2+AErtBI+vzDDBic7x0PAfmmiwgUnacBHHduBSt4W4OeGRWUzaxKgjfKVKMBsqe
	cIE3jZwdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8SC-00Dzox-TC; Wed, 21 Apr 2021 08:43:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8Ry-00DznF-JO
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 08:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=UPrDl4IDBS4VY2/x4f5SAdiKSAE1cYdAc+J1WLYeIwg=; b=R2PUDCQxLxps9DlPF+npzM1jMe
 5Oxm1yTenIRRTQj7EFlh9JCcEL5Un/+dFAqTV+a8nUepKDl8VPDEVopumjAtDRnUPnDMwwTYURZ6W
 xm1yiyvfCDb1Cfp7BkOShNHWjT97Iu6RSIRD0cyfVNaCENgGjXfavEdAOJtIkE/B9b5r73GhcZMyY
 yn8okjggs14DxXolv0dbFWaJmxoJNfgE4HgHqInrrA+E3ElSQb3gr0kJCwfBgOdc9c0Xg+LS3NJWj
 N7BtyIeHeo9af3/016+7DaHHAY9K6KykZ8iZBl6Eyeej8DrS3NJXuw7n4oHKydb/l4AkRxRgheC3p
 PNtyciOQ==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8Ru-00CiVb-5d
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 08:43:09 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-118-CrBwdaVmPfOEx9eMOh2cMQ-1; Wed, 21 Apr 2021 09:43:02 +0100
X-MC-Unique: CrBwdaVmPfOEx9eMOh2cMQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 21 Apr 2021 09:43:01 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Wed, 21 Apr 2021 09:43:01 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Vineet Gupta
 <Vineet.Gupta1@synopsys.com>
CC: Matthew Wilcox <willy@infradead.org>, "grygorii.strashko@ti.com"
 <grygorii.strashko@ti.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "ilias.apalodimas@linaro.org"
 <ilias.apalodimas@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de"
 <mgorman@suse.de>, "brouer@redhat.com" <brouer@redhat.com>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "hch@lst.de"
 <hch@lst.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXNir2f1yRrc3ugkWz9MvyD1ZvgKq+pqyQ
Date: Wed, 21 Apr 2021 08:43:01 +0000
Message-ID: <5c41d562589b497ca3c1047e0e18b3a1@AcuMS.aculab.com>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
 <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
In-Reply-To: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210421_014306_504742_CEF0A142 
X-CRM114-Status: GOOD (  11.93  )
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
> Sent: 20 April 2021 22:20
> 
> On Tue, Apr 20, 2021 at 11:14 PM Vineet Gupta
> <Vineet.Gupta1@synopsys.com> wrote:
> > On 4/20/21 12:07 AM, Arnd Bergmann wrote:
> 
> > >
> > > which means that half the 32-bit architectures do this. This may
> > > cause more problems when arc and/or microblaze want to support
> > > 64-bit kernels and compat mode in the future on their latest hardware,
> > > as that means duplicating the x86 specific hacks we have for compat.
> > >
> > > What is alignof(u64) on 64-bit arc?
> >
> > $ echo 'int a = __alignof__(long long);' | arc64-linux-gnu-gcc -xc -
> > -Wall -S -o - | grep -A1 a: | tail -n 1 | cut -f 3
> > 8
> 
> Ok, good.

That test doesn't prove anything.
Try running on x86:
$ echo 'int a = __alignof__(long long);' | gcc -xc - -Wall -S -o - -m32
        .file   ""
        .globl  a
        .data
        .align 4
        .type   a, @object
        .size   a, 4
a:
        .long   8
        .ident  "GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits

Using '__alignof__(struct {long long x;})' does give the expected 4.

__alignof__() returns the preferred alignment, not the enforced
alignmnet - go figure.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
