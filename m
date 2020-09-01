Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCD3C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 18:46:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815D520767
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 18:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fEFTxJWv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XbEnX7n/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S4laibDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815D520767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dKr0WMSWNgYicAjxyr9Wtf4CY0eYjGpxU1VbN6u7/G8=; b=fEFTxJWvBeGakiRkyEr9Y+cF1
	7ILOEgXi+cdgZ7B77OZUpqwn8+CrRtjkUkXkg6JShvDU9OYKijd7dHrhPF+jYHBfi71xUypSulJie
	QPqG1VuCb8era4DYTgaAuOB3Jt5iGRKq7AVjKwwD3MafYIcWbnxFjQj1ShaOqWR6OABjXfoTfzFda
	IUDujoL/5rNCnXHSSzhm8fUJNucmGn0+LIGUdR1njBxZlUTStBuLPaSh0zzaiN6byg6LMclLB4Hom
	+rYwgOsWtN1ftt2At4UC4hj9DE7ifQa74wMAR3kZzfe1vH5o0OXN0W8J0m6CoC8TswBZugND54EUf
	FueD7uKGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDBIz-0007VB-SZ; Tue, 01 Sep 2020 18:46:53 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDBIx-0007UL-PY
 for linux-snps-arc@lists.infradead.org; Tue, 01 Sep 2020 18:46:52 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A09124031A
 for <linux-snps-arc@lists.infradead.org>; Tue,  1 Sep 2020 18:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598986008; bh=yv/LKL//rHZHYe6s/QREVKtA/0aG2ldtBjifOKvlCO8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=XbEnX7n/73ERkZ+p+DGjdJfD6pZFwqiUkiXlZQvscH4f0Hrx4+p9Uj1vCSOZBmUTG
 MY053vlCpaWn4Ze5izM47sYaGHqNgwaSSTqjpBoZZ0Q3vUnxvdgEVdtfbcr2iRKWXr
 7MR1mkjCFLradctnMoeZpvLaSgxqoPtPBIGzUat9SNw7FP1oGzwMI907hu8LlLF8Xh
 LDFTcYtjxwywQtJ/E56CDygh/eJz8qf4NdI55OYPcXnPJ9yejt7zg9p5gQ5L9KYzpS
 Xuy+KfDZ5SNFruT4h0C9nhtKSELjFBy3E5vPr4drWvQjaZEbzGteKVw7h5FWv3cWMN
 Extm/fVFdiljw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8F9D5A006D
 for <linux-snps-arc@lists.infradead.org>; Tue,  1 Sep 2020 18:46:47 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2E8104009C
 for <linux-snps-arc@lists.infradead.org>; Tue,  1 Sep 2020 18:46:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="S4laibDZ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyIxdEikHG0reIsALL1YUa0E5sXHoPhrpjSOFQok01jJGFTDg0t0h2nwYEVo1lj+we6y7bRMjX/mnTYV8STdh/yj1K/Nbv/iNRlzSn75PY8uOJSp/OLwfveW8DSow93dxBlS26gaXT5Pml4dO0IyckmQDp57gY2RgxVedWXuKPqg+T7lE3QEFP8Fj0MWbKFTQWL2AWThwVFB7UxO0DlQOYmDquokqSlNd0B9vsYJn5ZlKohZ6KrcDxSa+MAGZHMZaLqsSD7xKwmSabzHUhmNAX5O9/mCtGIfDGvu7vi1SWR2+yv8U3rTIr6EkVX38WAMuKE5biq7hrRmnjL/ZwI7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv/LKL//rHZHYe6s/QREVKtA/0aG2ldtBjifOKvlCO8=;
 b=YwnHq89ILUE3b/EfvfeKq3FRG8iDjeZcWrkMPnJbBH8KrSpqqAxfISho9pAFTrw+54zFbbetDvJK+/vnIN91eWE/2O0z2s1THzRdFKcF0Y6+HZog/m3By4mXgqN5G/9VBoIkYg8/J08yLgg9v8tpAZnhRTsIt2ES4Gmrl3Ad0xH3fEa8BpaDjjSHODdUl0Ewgj9SXciEW0Of7CBRgLK5ot6uUDi0qywtuxVjaZP5i2D4fLocO40+jJciaZ9eFxAFHcjRBXeB0dzKHNuiZCmAD+9dmidiDbVnbV8ing40aqTRW8cTI2GvKjnq+RhDPDyO/T1wuaXY7BfOBol2pTUPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv/LKL//rHZHYe6s/QREVKtA/0aG2ldtBjifOKvlCO8=;
 b=S4laibDZRrO8LHItn8Z/0DyVPagJ0y2jWx5oDBOmSYd13ECVOe9LuGEjwRWjILfHMdJc3M+Gi13W8YVc2u1DZqMqALIko9T1tEOaKXg79JO3dDHiw4V19ve5lQEu9N6Fg1aJuVLBYrTuCOmediKyOYIW0OoC/lR8LP+TsksWgbU=
Received: from BN8PR12MB3330.namprd12.prod.outlook.com (2603:10b6:408:43::15)
 by BN7PR12MB2690.namprd12.prod.outlook.com (2603:10b6:408:32::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 18:46:44 +0000
Received: from BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::4c32:5e3f:9c34:85f4]) by BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::4c32:5e3f:9c34:85f4%5]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 18:46:44 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
Thread-Topic: [PATCH] ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
Thread-Index: AQHWVHTCxT8WfWc4/0ykdoFKFNMzF6lUdjEAgAAAp2k=
Date: Tue, 1 Sep 2020 18:46:44 +0000
Message-ID: <BN8PR12MB3330DC2574F0DB4CE73621D7A12E0@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <20200707153858.13280-1-Evgeniy.Didin@synopsys.com>,
 <5ec34714-3a9b-be13-a702-d2cd5e6c2eba@synopsys.com>
In-Reply-To: <5ec34714-3a9b-be13-a702-d2cd5e6c2eba@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [178.252.127.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddf8a882-2446-41cb-042e-08d84ea75f96
x-ms-traffictypediagnostic: BN7PR12MB2690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB26905E146868A71F52A6DD43A12E0@BN7PR12MB2690.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bPT9h29CYEXWV8PNpfeXcpc6v8F/fzwtLb31qa7yvK9XbEGjaRTwYVtV+xfo1kX3yL1jz+s5Tm6HI8WUFqiRL06uOdCUAeuwnpOrd46s80XPuFEyfWN3Io7VclPNxgCYTKwDTtFnwrxYtJpcB5QJfxP6IGMlDv+LEwFTDlV6R5wa0owzrHnbi1W5SZRF0Dxxw8HlMGtbANAHQE8hUYJo1BqAjSY6GyRVny3L3r2qDLahrVpJDqLtp+CHMFsR4forZ2U6APpKQGOJZ4u8U1AjhjP0Td6hGlMw4H4tgekAQ5DCZYg3kxfFMMU8SndlBf2t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3330.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(396003)(136003)(346002)(4326008)(7696005)(186003)(26005)(53546011)(5660300002)(52536014)(8676002)(8936002)(71200400001)(33656002)(55016002)(478600001)(6862004)(107886003)(6506007)(83380400001)(2906002)(6636002)(54906003)(316002)(66476007)(86362001)(66556008)(66446008)(64756008)(66946007)(76116006)(91956017)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DkMgaZEVhznzZLp2ShxpGdnoiCbSXhO1lWiAJA6ylTwwQeLlcKisg14gRSGbqrlXhq/zAb3e3ZShYpe3t2bHPEpGiH1U4qYFyhTl3OYD2FPzAepK+VyBblBQDzVRisZCJ5EwcyRk+6Vf9Qcxxc47HOwkoHDcEUd8yWOO/dHfXOgayloHVboh1vpn4wVOBS+ehzWX1paUca1C+E0MGHTikTlhq3tY8uG/lya2/pE7cU4kB50WW9kvkqalzDBb54Cns6Kf+MqYOO2QB8uckIl6lAtkqBlhR7XON6v7jaNpi1JukRxwLsIBUmPKawJ+UWbVB2bl4Q3gL2bprZKnSlpSmj4i2kPtGwBDrXLf6F61dF3xhsms6ApXz7n7xu1Oq172Jc3O+GUdtRZq93GLAW4222oY4sKps7yAT62dESNy9vIwK9omA0m2mKgpnm3InOVqpTJyussH+RX3A3LYWufA5pe6KRRE9HpIE1Xp8t/tlb6q8rOiGqgILpmlH/2CU9tlDtRlSDJ3pwJAlmBe1oxKfHnB0HO4hnpNr5F+fWNgLHnGpQEkZCRADWtlOsOLXzB4KSqSjvBG96dzv2bh8uXBJNwXARggPliCQXmwqIpen2ZZ5fifQ/yBr4Q9znx0EUYVYwCxXMUhH0NcEFrma3pxkg==
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3330.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf8a882-2446-41cb-042e-08d84ea75f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 18:46:44.2087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwtodNUK8xh5ogiIoY89HAabeEoxesfg6af5gOgXssZNmIbSXw7KVh9duJad3Td/XW6gzw4Ql5KluUJiUSgbfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_144651_971021_FEFF9FA5 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet, Evgeniy!

> From: Vineet Gupta <vgupta@synopsys.com>
> Sent: Tuesday, September 1, 2020 9:41 PM
> To: Evgeniy Didin <didin@synopsys.com>; linux-snps-arc@lists.infradead.or=
g <linux-snps-arc@lists.infradead.org>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>; Eugeniy Paltsev <paltsev@syno=
psys.com>
> Subject: Re: [PATCH] ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-=
id =

> =A0
> On 7/7/20 8:38 AM, Evgeniy Didin wrote:
> > HSDK board has Micrel KSZ9031, recent commit
> > bcf3440c6dd ("net: phy: micrel: add phy-mode support for the KSZ9031 PH=
Y")
> > caused a breakdown of Ethernet.
> > Using 'phy-mode =3D "rgmii"' is not correct because accodring RGMII
> > specification it is necessary to have delay on RX (PHY to MAX)
> > which is not generated in case of "rgmii".
> > Using "rgmii-id" adds necessary delay and solves the issue.
> >
> > Also adding name of PHY placed on HSDK board.
> >
> > Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> > Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> =

> @Alexey - u ok with this change ?

Sure,

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>

> =

> -Vineet
> =

> > ---
> >=A0 arch/arc/boot/dts/hsdk.dts | 4 ++--
> >=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> > index 9acbeba832c0..d6427d47e5a1 100644
> > --- a/arch/arc/boot/dts/hsdk.dts
> > +++ b/arch/arc/boot/dts/hsdk.dts
> > @@ -208,7 +208,7 @@
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 re=
g =3D <0x8000 0x2000>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 in=
terrupts =3D <10>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 in=
terrupt-names =3D "macirq";
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 phy-mode =
=3D "rgmii";
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 phy-mode =
=3D "rgmii-id";
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sn=
ps,pbl =3D <32>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sn=
ps,multicast-filter-bins =3D <256>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cl=
ocks =3D <&gmacclk>;
> > @@ -226,7 +226,7 @@
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 compatible =3D "snps,dwmac-mdio";
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 phy0: ethernet-phy@0 {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0>;
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 };
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };
> =

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
