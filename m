Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDE2C432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 08:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB9E20674
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 08:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XyvmxqeY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F3LsEved";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="fEJT6kRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB9E20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bxUFwc4yBYiceqvIEN5Jxftqr1gIVYf2X8spSCp7gg=; b=XyvmxqeYsTMRrC
	X2kTX8hxUrGaBHMBO3J18ejIiWDjJ98/MI3cIwZ+tq76cXTQwUUuV/E/YOvSi4/Fxi0FF6sCEkkVv
	BMMG1AL0BoswapR6GyIoSvqJXLIFdVM8hgCUo9CH6U/Eb0o3Sk7ZaL5JZHhrT7js9XZ4Vf6qFGeP8
	9Py8Cm+UM+sy3oIbsfFxHQE6EpGBVGD5OQi6PnjSlhOyKPq1OqdwLHWAoc9jU3lvxgV1I8yfwpDd+
	QmwAUh+ylv5xjKNozx4uwWTxNF2qzjPS8Wx66QqhYUz938iRvjFBPH/h5EYQkpHFcLYkgoic99Vqd
	55RiGG/IrJ4mIFlyzoRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZsI5-0005Gf-7W; Wed, 27 Nov 2019 08:03:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZsI0-0005GI-7u
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 08:03:09 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB138C008B;
 Wed, 27 Nov 2019 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574841787; bh=azEe1nM/KWmtK3l+c5sRXJ+/LQssAIojsUpLgMIj4Oc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=F3LsEvedOpR3A3S0krLLYrs86A1UeRimtn5A+qFy3JvYtN1QtSGJzGCqPPXyFwGcZ
 pSySwT7cU7YHHaWsgxn24tLM4tK8V6aLjqdPkAGnAmLsFI2ToNnAp3LH88Hp9SDl77
 CVIAOIOzWGnsaycpNc1D8v6w1dkWiDeNM5Ceh1irj55In8eL6SAboXvmC8sXMrNwIx
 5UzUi+JDvhzFDlHOYObT5xOGr0bisO+KPO6GzGqYK9aZ25qpCi9PrEjUXmt4CnzZ+q
 eCnlnWl517UVhw5LWS8S4aH8iFCOUqYt7eszUYZVMbes0BaPS14Nxec9oRILPetL1C
 KmQZymF4fuiDg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6228FA006B;
 Wed, 27 Nov 2019 08:03:07 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Nov 2019 00:02:52 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 27 Nov 2019 00:02:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKUe26cdV5tGm9nW730usRslzKC1QCQfgnt8CPCAm55KL401skkrSDlsF2kjDJSV0t976/GdDqIPBHTlpaBvkAKvmf2e/vmZ+ya4C8IR0z0Sg78qhZiFdul95cprNAhRZhVGg025V4s/X2ZoL4+ydblcQ55Rp0UmfRJyV9BIvRO1htwAu+uIiWnFcDvsFAIqvqXOoPP9255HweMW9OKMnAsO61vonp5aJQTOYXzmrjMCEQks/F3gP9g0fQKGKK7XTc/brU6tyrBmWH1gBDDN5hfrRORrGHCcH4NeD9Wpgifrkta30p7M0L3oEy9xvG8PUI58glkU2Yj0GV+Jj3et+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbVxIUs3fKclqWA1j+CVrgkJqM9m8JwkdHm/pUaEenA=;
 b=fY8ACOSDIvCl25f7l15EUpcCb5XJkWvi9lGxcYgY0HanBUdPrYxeDWquHs7CjN09xPRj/VzMWg0bmBI7sg55dmsfzF2gCyaNSq2paQq0RNscuHR3U/mLREi3jI0/9UtzcFYxuU9pp/LKgEfBqWvk23bph01XqcRK6cH/sMdLbM5z8+uyN4s8aTSgILqxxAB4cZlWq55HFT6/6BfLEaG6BuP2s1zKq8BCBe9avpY5u7TVHDkQ1c57L2Xs2sOm4WtaV1OV4pIKNtF9RrkPn0dsXnQjMu7Bhg84AmqfO5smoryvbkMS612LE69lvVDVB4XSTh8RA8mJoiqYpyVYqImNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbVxIUs3fKclqWA1j+CVrgkJqM9m8JwkdHm/pUaEenA=;
 b=fEJT6kRE2yD1uyuaQDPLhHZBMFHMGw3Klbavq+9IN06xGzHrrSxSO/+LwP5guInn+l3DROmY5GhkQtDTCBX7ADlXe1MMXu2OCaPvV9MpRHM2TNeRrJRBn/w5fvcqln89WPjsgDMuMI9ty+yDWmgu8FJ6HS+pzE0t4Te6SdrTB3s=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0213.namprd12.prod.outlook.com (10.174.52.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 08:02:51 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 08:02:51 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] ARC: perf: Accommodate big-endian CPU
Thread-Topic: [PATCH] ARC: perf: Accommodate big-endian CPU
Thread-Index: AQHViOHYaz1MyBn4kUuKPCgMuDadHqds68WAgBAmUXCAGTPAAIAImmDw
Date: Wed, 27 Nov 2019 08:02:50 +0000
Message-ID: <CY4PR1201MB0120E9157C63D2A66C2949B8A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20191022140411.10193-1-abrodkin@synopsys.com>
 <20191026131042.73A7E206DD@mail.kernel.org>
 <CY4PR1201MB01208D47B2BEB18DA6E1382AA17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191121203942.GF813260@kroah.com>
In-Reply-To: <20191121203942.GF813260@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 724690b2-a365-457e-ec42-08d773103327
x-ms-traffictypediagnostic: CY4PR1201MB0213:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB02131A155F4A20BA2254332BA1440@CY4PR1201MB0213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(136003)(396003)(346002)(13464003)(199004)(189003)(11346002)(102836004)(6506007)(53546011)(26005)(446003)(99286004)(2906002)(25786009)(186003)(71190400001)(71200400001)(76176011)(7696005)(81166006)(81156014)(86362001)(8676002)(8936002)(316002)(54906003)(6246003)(14454004)(5660300002)(52536014)(256004)(66066001)(4326008)(6916009)(478600001)(6436002)(9686003)(6306002)(55016002)(74316002)(33656002)(7736002)(6116002)(3846002)(229853002)(66446008)(64756008)(66556008)(66476007)(305945005)(966005)(76116006)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0213;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /dbPNz/Sa6wiIhMOs5GPWEh1FJ6G1BgNKzahI3vaMS5wLnLxtb45XqeQ5194d7NIp1KrZBGAr/H0gzSC3dT9wILKlwne8w4vT152jQzzBbcvA2XkDUhWTjdOtqepIg5/PvL+Sn/RFUTOFkEWND0nTsH+rXVGjbxuM7XT8aQTrbyQSMGMAj6Txba4Kg5h5vjho6b2lksne8mzEDFInuhimAs7bgKvG0vBy9c00o+FWgG2YpVIbRRbAChGBEz4GLAiwuhpgGKyF0lbcY8iBpfDcvQA5y46dgKATVbJQa+1iX3wmFLWTkqzM+7bKdlITU1nTllnFHSSytmtIsD/BGdCnVno7dfnN5Zoce26I5BaMFwZBjZl/CavapVpmEfihJ2KuNCs/chfQRH5GwJ9tMehzPtU2i+RDhJxEE8IBKw2YTLpvJFTRqW56vzYkod/rDxDCp234Y05y/Wep/l0uzx20QhBrsisQmYimjsmzV3wDCw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 724690b2-a365-457e-ec42-08d773103327
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 08:02:50.9860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivbTXqIb9zow2CEA7rG6SaqFznfrhAXgtirlLHXFxVws3mqzq+jCz2nPaPEUUXGlnYgEWg6asFnq9Fr3KpL8GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0213
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_000308_352155_47112C4E 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Greg,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Greg Kroah-Hartman
> Sent: Thursday, November 21, 2019 11:40 PM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Sasha Levin <sashal@kernel.org>; linux-snps-arc@lists.infradead.org; linux-kernel@vger.kernel.org;
> stable@vger.kernel.org
> Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
> 
> On Tue, Nov 05, 2019 at 07:52:16PM +0000, Alexey Brodkin wrote:
> > Hi Sasha, Greg,
> >
> > > -----Original Message-----
> > > From: Sasha Levin <sashal@kernel.org>
> > > Sent: Saturday, October 26, 2019 4:11 PM
> > > To: Sasha Levin <sashal@kernel.org>; Alexey Brodkin <abrodkin@synopsys.com>; linux-snps-
> > > arc@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org; stable@vger.kernel.org; stable@vger.kernel.org
> > > Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
> > >
> > > Hi,
> > >
> > > [This is an automated email]
> > >
> > > This commit has been processed because it contains a -stable tag.
> > > The stable tag indicates that it's relevant for the following trees: all
> > >
> > > The bot has tested the following trees: v5.3.7, v4.19.80, v4.14.150, v4.9.197, v4.4.197.
> > >
> > > v5.3.7: Build OK!
> > > v4.19.80: Failed to apply! Possible dependencies:
> > >     0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
> > >     14f81a91ad29a ("ARC: perf: trivial code cleanup")
> > >     baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")
> > > v4.14.150: Failed to apply! Possible dependencies:
> > > v4.9.197: Failed to apply! Possible dependencies:
> > > v4.4.197: Failed to apply! Possible dependencies:
> >
> > Indeed the clash is due to
> > commit baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function") as tmp variable "j"
> was changed on "i". So that's a fixed hunk:
> > -------------------------------->8------------------------------
> > diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
> > index 8aec462d90fb..30f66b123541 100644
> > --- a/arch/arc/kernel/perf_event.c
> > +++ b/arch/arc/kernel/perf_event.c
> > @@ -490,8 +490,8 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
> >         /* loop thru all available h/w condition indexes */
> >         for (j = 0; j < cc_bcr.c; j++) {
> >                 write_aux_reg(ARC_REG_CC_INDEX, j);
> > -               cc_name.indiv.word0 = read_aux_reg(ARC_REG_CC_NAME0);
> > -               cc_name.indiv.word1 = read_aux_reg(ARC_REG_CC_NAME1);
> > +               cc_name.indiv.word0 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME0));
> > +               cc_name.indiv.word1 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME1));
> >
> >                 /* See if it has been mapped to a perf event_id */
> >                 for (i = 0; i < ARRAY_SIZE(arc_pmu_ev_hw_map); i++) {
> > -------------------------------->8------------------------------
> >
> > Should I send a formal patch with it or it's OK for now?
> 
> We need a "formal" patch that we can apply if you want it applied.

Done, see https://patchwork.ozlabs.org/patch/1201398/ and your inbox.

-Alexey


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
