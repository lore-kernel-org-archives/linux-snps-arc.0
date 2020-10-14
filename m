Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A987C4363D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 19:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 951E02224D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 19:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0OaSvSc4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iFiKRRnf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EouuL4ix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 951E02224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HryDmm3L0fBXUyQ8AlBEY0diT75yJfhBWrbX0zmGV/s=; b=0OaSvSc46qCMFGsywzJG43Un1
	u9lIM79Pe1Ppomj0Sd0Wxr3TX8nejhgYdC0lS80e+SQXFDmPBWDAg/q/omP3byNFWt5tqyZ4c7Ycs
	LuUzIas/mg9tKIcoWVoVKZVRpfsqp68R3CQOK15nLgOi8yQLQ+MbHd6W2fSo++WEP2jJ4vdLfKSNu
	f745qw2A10CE4lnPoYIRUVhvXn/+uLC7+UlkqitXRltx1+iXzXn9FbscXGCci0/dNjLx/v5Qiqfl4
	/eieoPEk2Lz6tRGWhnccdxPA94DDFFmmNUnH7vBmHazyjQ8b02qT+8x5tafHjmSJ99r/D2O9fiYm0
	Xn570jl+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSmDd-0001L4-4Q; Wed, 14 Oct 2020 19:13:49 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSmCi-0000qs-0r; Wed, 14 Oct 2020 19:12:53 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 38C0DC0098;
 Wed, 14 Oct 2020 19:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1602702768; bh=pNp+oRKtpJFt5A5X0gDrLRdOswAHsIIghJhXcuyTBdY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=iFiKRRnfhrVQteridnYVsijfpu+6Ul6PV1me8BfYiPrAnMNBSQ+sHB34UuSlWskv4
 6VNYYbnerPuG8C2Z+FEO17Yc3qEbVAY3LI4ENiGVC1HMhpaBKlWu9ZmAPHuARF7EdP
 TQAFcHSID+Ss/z+hg0UUJAZ1EgrIWcaExJy8zqlAnfK1ZriExfpPANQ5GBk95L9ogx
 OHqEgvbfj3+Re+zlMK7F+pnmk6SmRVqxshNuIE7vtDyUmCj2gbPLarL7/aBDuzHJPM
 feRw9foOQcFK6hDU24nM3xVCvqGaaEs2t1YMMC0MoD7DlRoxzOUb/EP176Q1c3vAc/
 ZaP45iYVPpt0g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 75D3CA0096;
 Wed, 14 Oct 2020 19:12:29 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B404D40107;
 Wed, 14 Oct 2020 19:12:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EouuL4ix";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCxQ+4hkVcTwcDHys9Un1kQxk1pZXP0Ox6tHbrIS6ilS6IReatYyBTsWTrGUqqPjbIDIvAbNa3LIlHi2iG9Wccl9okmguuuQRg8A3pSPGNn0+FK7E3i75VlpY7NhZtJ3KEwPyrKIsUPrBT2mSim1SFhfZIBLZCnMLF8KJhh+xLUaUxnnL09x21eIxaEw871qSJ3Mt9dTCyNiTBmHV59V4OKPSEK61us8JkOiqr72E6lCgD83bSxlED2Mofbf7x5R1CSCESRtN9LG6RDSYPuh6rn5CTs7aXSHa5iQE6XNORK0FeqeKB2UEEscRMJyuCaaCXV21iPXVBp93XKY6XshAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN3e/ZuCzd92MQejw9kOHfuEy72151UraV3iCDTfNrc=;
 b=WHo44BuvWWJDwqXrwcjnV0toV7OADwjo9iPhdQ/FTiG/dSB8mHKAHpc25koy2dEOfdY8Hz57S3L+NuDnM7USBILN9HE7TjDxKr5rLOXLW94MS7QzUl8ZQJzdIIrILNmdZCDC0HfDRDMjxVeY1Q/I/RT0Lk4oh4cThDKMB8Oc3D3RA+kzUMD7+sWxTc04Bsdvpif+0dLj4AM5cD0WTXarMZiZDRGwSXu5Epd2KoAlAbpZDctACNf7IoseBux2LCprADS3xPyjCOr97Evh43qF4SzA6fkwSAq/o3Nd6XRnKo0wO6ngVH5zMuAwDq1QnDiK0b72zxQvT+FKXY6aHC/Wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN3e/ZuCzd92MQejw9kOHfuEy72151UraV3iCDTfNrc=;
 b=EouuL4ixiwcYhYKCoYiw8B/IbkJWAIcmmGlT/FBRHDqSbcUh/A9CMIqMzRfkvG0yBav8cmyV9kcQOUut+21ASLGHcv3U4RuKXo1+wXrSf5lSNlZnbgW9661d0y6/augkufNvXUPHSsS0pKux+3dEt1/5i9oGIZ9XhwIstmyO2Ns=
Received: from BN8PR12MB3330.namprd12.prod.outlook.com (2603:10b6:408:43::15)
 by BN8PR12MB3027.namprd12.prod.outlook.com (2603:10b6:408:64::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Wed, 14 Oct
 2020 19:12:19 +0000
Received: from BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::653f:cfaf:d858:a52b]) by BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::653f:cfaf:d858:a52b%7]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 19:12:19 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Paul Cercueil <paul@crapouillou.net>, Serge Semin
 <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Thread-Topic: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Thread-Index: AQHWohLONLr1JmaKTE2JNSOSXEmoVqmXcyuAgAADLfw=
Date: Wed, 14 Oct 2020 19:12:19 +0000
Message-ID: <BN8PR12MB33302A8B1549B03CA17A6BDAA1050@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>,
 <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
In-Reply-To: <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 097bda4a-75a3-40a7-7068-08d870751289
x-ms-traffictypediagnostic: BN8PR12MB3027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB30272E59E915D6BAB6817B91A1050@BN8PR12MB3027.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ukwa6663jm1N3EoiE1UJar0zVnvMKGx5J68OuAGTqoSnsUJaALS1BctfqNNQPhefsEbHpvCYNH2QJD5Gvdw94tH8oji8hVpUVyVq/85EPiiBAJ/YQdCkN35bQYk+sMcnLPXpwTAxys8JLWH6m1wfSD91UjhvoxMQd7o0l+tjnQO7w96oOizjD+woTWtfS7KJCzIsuKeOgmtO0vhGdhai1sDouzjZpgt8gM5AtVNs+iQxsCRvmvTZbeF5U198PxQQ8qbSXFFQc0TviLs+fmb9IzAG8cPo+3vem0OGbb7YiV/21xKB9NQcmPEfr9kUnO5q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3330.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(64756008)(8676002)(7416002)(478600001)(71200400001)(2906002)(76116006)(8936002)(7696005)(6506007)(91956017)(7406005)(26005)(4326008)(9686003)(558084003)(186003)(66446008)(66476007)(66556008)(66946007)(110136005)(54906003)(33656002)(86362001)(55016002)(316002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: y5OYozHKwhMxtZU9jB9xK1Io3tnB/qL8nVYnvWKcTR7SLSrg6zbLzEx7VGXeb8lVyp/8FZKTQbtgbFlF79T5bFSpRl/cytp7P6G6lN9LiMHZvYjaI/ZmgPKLl3MIge3HVCFEZkqOBxd1TiScYlRayDvIdFcWev7I85EoNWI1nMi8svDIt5h+6RK74NFNltOXzPI5za4S06+wgzbuPL+UFdUmHYWd58u1LvcQb93ouqC1x9DNoxLXMWVOHcDas+Y3+XotJPcEFcMMC9MGTB2VS4+lkYkk+fR3ffy/lAr0/AYOo3qeCr5Nor+3Z/XqP9lb5ooD19zXId47rEd2fUZYkVV8YbmgyIXGjkUNDJmtm5/44KT0wQX5/QyTz8bGma34SOU6kUZnvfwjcyJ9DPm33qvuet8+m4O7PjkVuBrGXT8IOdyc+BrK4JnItgBfGIfxwG9Hd/DPDy8JSEHLRLdMSb/av79agbT01Z21NSKClA3AFqPvCcrFycO7sEpfqxapZgfVrydKe19IL6G34qSMS/fchvfZB6adVp1MzvlI0TcXVqWkWQ7Lii6z3CN0KZqQqgLT3vLIV+zIo4xRE74ayXYD5mFD8O+bzuzDzTB0quXGLqOIxkqeJVMgZ6sUOiGqWKE0JtDE2PcaHdJLfGGLyg==
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3330.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097bda4a-75a3-40a7-7068-08d870751289
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 19:12:19.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMZ+eAPWq5G/hLMTcUL87K0/y4mkdUQBkZw3UOfkrvpHOhGAZIu/7aHHWWdcjMUJrzjMxwBiJ+bHsZf41i4BzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_151252_549229_3DB5CD9F 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?iso-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Sergey,

>  arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
>  arch/arc/boot/dts/hsdk.dts                     | 4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-

For ARC boards

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
