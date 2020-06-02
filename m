Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E37C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 20:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C121B206A2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 20:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBbuITLt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IyL7hdda";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pKod/ALC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C121B206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHic+RGMexv/gjfWUr1xKDxKoMt7ugiRnvyk5iTvd2I=; b=kBbuITLtGWs/ok
	e29trrhe97n69/Hm+QrVy2ljujt/cmIk3BC6PDwjsoMXQH0lTaXK8GxuaduCkW4fu55UXLyz9IYj/
	y62xuhU94qaC/Yn/RscFbrw7dRps/EUbZduflguMF1Cq3Z+RPqQNLsuKEZ/5zRMD0fGJhZd/DiZj+
	sYGYHW7udPlqAb7bKA/RNrgWz/HDIlwdzRLyrqrX7+lgs12/qf973xNiWkQ7AR2ZPoPoxEJZlL11p
	vLkCoACpTs5ytggxV2H1uUKihF7VULJAbF8Q7Kb1d3B54LEz0drPctSjKLZY4WAPUI0lbDflif3Hc
	83IqXcMMNNDHDcK//TIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgDZG-0001wU-Pr; Tue, 02 Jun 2020 20:31:26 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgDZC-0001vi-6y
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 20:31:24 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 284A440740;
 Tue,  2 Jun 2020 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591129880; bh=5Ki01RxnfgOSc/W+f+Mtnik3EzxYGaen+nU2GDv/tcM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IyL7hdda+lgh3o/Pi2V+Gpg/fDPHpi5pcCILiZcmwwoYscHxQPYIrtdk3Vd/6AHOx
 xFB0r1ekt88hJcZdauPpEPpzY5JLK1gX8W9h5I1kTbfAfx6mzS5rHWg9JwcKyFs9ed
 6vZC6JZJWgHKCsqpHBcY93jabFugIR5GsGR4BTn9pXglFmFEjhZ9qmamu1eksUnSsf
 LtGMfOF0ywCuJVaqsL8oNlpAy/TF6pfEj5UAgljN7csetP/Mqzv1nFcyzpmvKkpjHH
 OEvHVphaH3EEitS8wL7oMbH2n61IJnsog0R8HUmRiGedQksQBKElDJdtzsJoRi1oGQ
 S+2cSLFf1WQIg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 924DBA0067;
 Tue,  2 Jun 2020 20:31:19 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Jun 2020 13:31:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 2 Jun 2020 13:31:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoVNhIINVEduuKIoyT4ylptw2rp0X59Hp7N617W9e+vOACw46slJ97CuBdCKjGlHREsPN3crc9LGIAVembcio/e026QQTJ2NFF3rkpv5wccVfdS+hRnyuOOy94yZZi4p6dU+gN1+zY4CarBJSGNwUjTL9mb31+DtKG8zzsQnW2Kz7jX9KzmYaa/V+TmISfqCY2w39Bm/Wu7oUSqbKCoOd7AGp/H3RGbOVx0VF+T9FLBLX33JDkeCXhg7XwDcz+T/0PLZcxuFUkuV4gSddx8R6kqZXIHRJBBh6XBtapdBJc9bGZ/fRwP/BFN6btRoiQqgP7rSsaqTiObbmpZxMovR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ki01RxnfgOSc/W+f+Mtnik3EzxYGaen+nU2GDv/tcM=;
 b=XXjDC46isRHeTC/AKiZMnz8L1Mb/IFla38ahDL6SbGq6ybiNhZ5dNASB2Oqt6poamiJRUTQikGpAo0It5oVRCmKfPPalBEX0AkfA39ejwBG/YLpYawPOWxP5ik32oG1fx72fJ1M2+kqDrWYBG4l077PKIr6d4nL4OboZx1vqZcKCwgpJdAnnv4R7pLUnDlgLbhCn78zfE4JTWSIVDqxmjsa7hXuHU+XUypMavQ4IomtjTiouqL6eVb7ec8+8MheJdNQ3b5he+hJUEUzuKRlyv18P3D4W0gBKSV+nTf6l1o8+mNI3ChyUPAkub0QnvrLcsDtTtTIJIa+6ri3ZSswxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ki01RxnfgOSc/W+f+Mtnik3EzxYGaen+nU2GDv/tcM=;
 b=pKod/ALCaMMqMV10Dw/PWQ5sLH8jwIkXhRLJ1aixC/pi9AbDgkGOEQoSJBJ1rpL4ixSHbXKoN069a2Fn9us8urmxUS7VUhrVe5AGa6DG153VonkwxMSSQjtJ2YIV+jAG+VUaoNbDNKndJDglVrIx8A2udkC9lpsK7r6RYBQFI3g=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3303.namprd12.prod.outlook.com (2603:10b6:a03:131::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 20:31:13 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 20:31:13 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Topic: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Index: AQHWOIYggmcgEJtCX0+23+xG83+AoKjFoswAgAAlqgA=
Date: Tue, 2 Jun 2020 20:31:13 +0000
Message-ID: <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
References: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
 <20200602023223.13823-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: codesourcery.com; dkim=none (message not signed)
 header.d=none;codesourcery.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a80d6a9-8602-4697-bffb-08d80733e4ea
x-ms-traffictypediagnostic: BYAPR12MB3303:
x-microsoft-antispam-prvs: <BYAPR12MB3303D2B31A755532ED558B57B68B0@BYAPR12MB3303.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XUkzjww/n6MggW7U3dY1oTy6piRiuJVxJ3ZMarjeHVxCDevZH3Jj+G8mnT8EMzbXyqlocG5xAqlTOucn3q97Gy7TGD4FIj/bksTriIsiPLLwaUPVLTdQ4ESDDqh9YG5kFnekOIG2uHjav56gH4i9DJA7ktIkvM2hWYYCWVj6au8DiGWtzdlNZy0Xcl7u2sF77RgBMaSpHqDIpej0Si/T8hNugr0qT6h4QcA+/IxVVaay+aq9ItSgI4MqVIchYZo1rcAmwsvtnAWLWpU2+OeBfx6P8C2z0lcSSplk47brX83jNY96moWn3yWKAy2Gh0yVqLzk7NcJ7RFFKcH1JH25T1khL3DsFT2t8IUQMLETnuDxsUk54pBD+o4FVks2vMJq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(6916009)(6486002)(66476007)(76116006)(26005)(36756003)(4326008)(66946007)(8936002)(66556008)(54906003)(71200400001)(498600001)(2906002)(5660300002)(8676002)(64756008)(2616005)(53546011)(66446008)(31696002)(31686004)(6512007)(86362001)(186003)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OSHUGMGDMX07r1H7yxzhoPtYfYlGYh+VUtEejzx/K4tegtkE1kUqPKTXkxXY9ZoozE8dCD/INTgmGvX04e55g0OekGFFR3MFBlwga9F56hLvXu2OwRW9zsRrPGM7tiD8UkA/OK+rQsfWkQ0GGZh70JuluuZ6/p5RkG0U9yGDAAr7RZgYuIRy2crJBzajSN2qMqdKc6fn67vbLxecZYHfmPjrSZLqHwlaEKQx6Cg0BhxeWafDQOgvYRxsxYoA2lEMfABxjrzrOiCw8ymvHB+V+HlgceEGNIt7wQqeOSLto3hLhd4ujfe9UtPoGzaHMtz0T8yOOQKadUEvGg1QenJHLBydr6qBoAmDVxZaaSY11kE5XbBydTRL2AkOpZNgN8aMmCUPVikZX9gkyw7v9O/jhVTyWnnit1GXDaYgbw7lx3DSfF8l27d7jVzzO2AjHSp/l9hgIp1jsIje0GB0Od6TRHRJCrEC8uXcnfR1FTyhY/KtdLQThot8VQVPs2LasghN
x-ms-exchange-transport-forked: True
Content-ID: <7EB9BBED14963A4C9641435A56D75447@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a80d6a9-8602-4697-bffb-08d80733e4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 20:31:13.6142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DpKa8Tu2AVdPQSWXUwwqzzQyqJW37JAawYXdYBZ0Y453K9+Zy8rr5NwPjWSF5qRAzQlabU+4RFsafnVjaU9jQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3303
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_133122_324580_9F5DFE2E 
X-CRM114-Status: GOOD (  11.14  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/2/20 11:16 AM, Joseph Myers wrote:
> On Mon, 1 Jun 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Also as suggested by Joseph [1] used --strip and compared the libs with
>> and w/o patch and their sizes are exactly same (with gcc 9).
> 
> My suggestion was to compare the *contents* of the libraries, not just 
> their sizes.  Either they should be byte-for-byte identical, or if there 
> are other differences (register allocation, line numbers in assertions, 
> etc.) a more detailed investigation will be needed.
> 

Here's my diff of the 2 --strip builds

for i in `find . -name libm-2.31.9000.so`; do echo $i; diff $i
/SCRATCH/vgupta/gnu2/install/glibcs/$i ; echo $?; done

./aarch64-linux-gnu/lib64/libm-2.31.9000.so
0
./arm-linux-gnueabi/lib/libm-2.31.9000.so
0
./x86_64-linux-gnu/lib64/libm-2.31.9000.so
0
./arm-linux-gnueabihf/lib/libm-2.31.9000.so
0
./riscv64-linux-gnu-rv64imac-lp64/lib64/lp64/libm-2.31.9000.so
0
./riscv64-linux-gnu-rv64imafdc-lp64/lib64/lp64/libm-2.31.9000.so
0
./powerpc-linux-gnu/lib/libm-2.31.9000.so
0
./microblaze-linux-gnu/lib/libm-2.31.9000.so
0
./nios2-linux-gnu/lib/libm-2.31.9000.so
0
./hppa-linux-gnu/lib/libm-2.31.9000.so
0
./s390x-linux-gnu/lib64/libm-2.31.9000.so
0
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
