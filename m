Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF00C432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 09:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA58B20678
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 09:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFHvA29e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i29fGQp4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="GExze4DJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA58B20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giot/gLhSwfg65n/DY4SAsYTgedgP7SULxUvUiUGLKA=; b=IFHvA29evoy4tS
	G555UqEwm+8ErYSTrIbD4tZxIGNQoX1OOCIR+hG/XeYpp2N1OfkB/yf+tR8d65bcQ4wRGPrUfzk/G
	eH5aALo+mvJzAd2oHiAzYUrLx2y+c0TMAbRxVZo9pK6K4Ol09ZFKP9uIe4gcKe8y3lut7r3KIP1Rt
	2MNka+NmMBIc9bQSIHj1SbEDQ2jQ72P/hSdcQADVAprU6yhyLlzSYw9tE35c4s7+pcswi8mWxhdoJ
	zNQVe+RyOylQDn6otZtyqIVEogy8cb7XM5s61HrgXEQRdM6PdpLdrSk5U7EWoSPJYYbtp50eM+dTE
	vpbFzYCfvh4JMqwITTfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZtnn-0003Wt-NP; Wed, 27 Nov 2019 09:40:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZtnk-0003IF-0M
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 09:40:02 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5EC3AC0090;
 Wed, 27 Nov 2019 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574847598; bh=q0EVu3au/0Kg2Sc+OpEIkaiO+2CcVlJTcRhKAznmZqc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=i29fGQp4Ph/poHAGtgJ/pkVwqPRXggITW0Uy9d885wPmJR0WeKGf8b72I8UElvZ5S
 pbAx4VwnNcSyColWB6ih69WQTr/tYsM9zapUPH0SWbj9gGy5oN2Twhd5Y8PeFULyVr
 7dLXAycaVEDd/Wh4kLPzeRs2cCBGYFFTPhbjYS5HCHQFQNsLiTnwBYWstrDSxDeRf6
 QdEQ4tgIPCcu14F4QvDah1oZtvczJ8tTb1GAg5ajdTDrx9PEggdOaLdY5mEdiH6+f5
 6AUO0fbmB4rPV1T9cNLit7/Qrn/lFndcOBGaYV70df+kj6/iuR62bnRWLBYF+/knfp
 0FJ31VF3pncOg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 51357A006A;
 Wed, 27 Nov 2019 09:39:55 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Nov 2019 01:39:52 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 27 Nov 2019 01:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBKbFkXt3+aYe+B1kU8qug3hUb2ZuS2lo7MEx19QPoF47rz8dK2pcY3gB8uWvFQKif8SrSJw1aAudD2PZVq6aGdk/0PeV1MTDoAnqzU6QEokbN5M28SqtYEnrsnXemCSclghuuZBZMG1Mfh1h77gk2G8GUE72Vt1BX1y0Paj5OVHkEt+dcwzdG9ralOh2hAJcL8wpI2KkzLdfmNSQu1GTYDf+j82MySRQzas4B0akGzJ5eACAawD8NDWBxZVuyxM8g+RaV1I5gU+XtS6/WTbf4KF1Zv7IhEwWLBD3Dm5i15GKKcBW+JEnMFWBYM6ZKTLDBWj3YlS1DY8RRvoe8jDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9B1/Y0ZjnXTKD343URo+Bd9wQ6K0js/yZFVwcRuzWc=;
 b=eCEVq2CfUbVfFOR9OkeSBdM0iNZRh0dKS0hxaKnQjPrbioXz0HZXQMb+1UOMPW944BxLF3chBIFHlleqh81M4DQ49rdSUBqQP1o8KkbiMuysg+8jOFM0PVmlu7J2B1x6OzCh2cDg5jjYc3TnvqC0vKFP6R1jPM6v+WFWk/vWEWVNKNb/gghJ5MmlIIgPScY6e1zFR/Lep9WyuKGPJH6qXf6omIYd36AKUVL5o+4O5ctRTztZV/4SJ3sZDMm1v8ZjxS8nmzhVCigKSgcNgoy9JWjKvgOZBr90g4KBSgzL2plV7U8IjgNT57lNHbT0h4Zsi+LbVBmMa/DImC1PAGmBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9B1/Y0ZjnXTKD343URo+Bd9wQ6K0js/yZFVwcRuzWc=;
 b=GExze4DJV+pjFoq70L9x8wKzuuXEkMxQQXidAy66sdxk3B2ujw8hXycynhXA+A6DYlJWdfNI9eBpHwzW2Z7avLBSzXFm6tRmO5PtdoCWidV7MeukmEui0K3dPT11sSFIO1h7sNjXhGKrLCY/l3mln9o/Eo/xgO5o6fgDQV1smvw=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB2549.namprd12.prod.outlook.com (10.172.121.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Wed, 27 Nov 2019 09:39:51 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 09:39:51 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>
Subject: RE: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrxdMyW8wArd+/9AABLZqcA==
Date: Wed, 27 Nov 2019 09:39:50 +0000
Message-ID: <CY4PR1201MB0120FFA559EAF0C4A773D266A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CY4PR1201MB0120689F9B1F454DEEA75ECCA1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB0120689F9B1F454DEEA75ECCA1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d088d25-33df-4a5e-5543-08d7731dc030
x-ms-traffictypediagnostic: CY4PR1201MB2549:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2549C216B0537C95EA0885E0A1440@CY4PR1201MB2549.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:85;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(396003)(366004)(136003)(13464003)(53754006)(189003)(199004)(11346002)(6506007)(71200400001)(53546011)(446003)(71190400001)(6306002)(9686003)(14454004)(55016002)(26005)(107886003)(66066001)(4326008)(66946007)(52536014)(74316002)(76116006)(229853002)(66556008)(66446008)(86362001)(2906002)(64756008)(81156014)(966005)(102836004)(5660300002)(7736002)(6116002)(99286004)(3846002)(66476007)(6246003)(2940100002)(186003)(6436002)(25786009)(478600001)(305945005)(14444005)(256004)(110136005)(76176011)(8676002)(7696005)(8936002)(33656002)(316002)(54906003)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB2549;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbvfTCMUOuAcDknECk4tl6yIkzzo/AhEIQOnByZb/73DZkY+Zc4I2hw1a1BOrKi27HXomyTrsCJUuS50ecq5vXonZgDvWpwVXZ7yg9psF1l8gSuyerSHnX9njR0cySwZUVMt6JALqIsl+g2PRUOZfX9jOVYULyQ/c02Sc6uiSUIZQutBYRL7fx1RIb5O2FpOAV/wNcIMI1kCcvyprZENZT6fSbKw2lEPo3ws8VzezgfSLAlTMoOdJGWR5+odKO0NeiZSn1+BrEKrCe39A+EwrLvj/QEaulFwT6u7/QQYW1whhxbIs8ahXF83HIg9PQ5y2u+lC+w0Ti8sYDRrUKTSotPDL/+PRlBEHNoma4T71rHKDgAfgNcJaTIPI7Gd7oY1WfIgV4MHy2H6x+wCknUPqBkzvzbeuPA4sj19eLc8PRh+C/esv/hMNVrIl84KAmUgpECnGvSGjZ0W7cjHSmqOhr3RskhzkqG83XQrQccdQYE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d088d25-33df-4a5e-5543-08d7731dc030
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 09:39:51.0164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4U8DEtsJUfSxKEeOI21uwAQzoHRSqG011EeXxqnJa36rlvIupwNKX8/onsFgt0Y/lIQBLhp10zdd+1OY+XraA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2549
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_014000_270978_396F9772 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, David  Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi all,

As Jose suggested I'm adding "drm-misc" maintainers as that tree
might be a better fit for ARC PGU patches.

-Alexey

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Alexey Brodkin
> Sent: Wednesday, November 27, 2019 10:25 AM
> To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
> Cc: arcml <linux-snps-arc@lists.infradead.org>; Eugeniy Paltsev <paltsev@synopsys.com>; dri-
> devel@lists.freedesktop.org
> Subject: RE: [GIT PULL] drm/arc: Minor improvements
> 
> Hi Daniel, David!
> 
> Any chance for this one to be processed sometime soon?
> It's been quite some time since July when I initially sent
> this pull-request.
> 
> -Alexey
> 
> > -----Original Message-----
> > From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Alexey Brodkin
> > Sent: Wednesday, November 13, 2019 2:30 PM
> > To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
> > Cc: arcml <linux-snps-arc@lists.infradead.org>; Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>; dri-
> > devel@lists.freedesktop.org
> > Subject: RE: [GIT PULL] drm/arc: Minor improvements
> >
> > Hi Daniel, David,
> >
> > > -----Original Message-----
> > > From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Alexey Brodkin
> > > Sent: Thursday, July 18, 2019 12:09 AM
> > > To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
> > > Cc: arcml <linux-snps-arc@lists.infradead.org>; dri-devel@lists.freedesktop.org
> > > Subject: [GIT PULL] drm/arc: Minor improvements
> > >
> > > Hi Dave, Daniel,
> > >
> > > The following changes since commit 7aaddd96d5febcf5b24357a326b3038d49a20532:
> > >
> > >   drm/modes: Don't apply cmdline's rotation if it wasn't specified (2019-07-16 10:34:38 +0200)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.07.18
> > >
> > > for you to fetch changes up to cee17a71656e9e1b5ffc01767844026550d5f4a9:
> > >
> > >   drm/arcpgu: rework encoder search (2019-07-17 23:36:56 +0300)
> > >
> > > ----------------------------------------------------------------
> > > This is a pretty simple improvement that allows to find encoder
> > > as the one and only (ARC PGU doesn't support more than one) endpoint
> > > instead of using non-standard "encoder-slave" property.
> > >
> > > ----------------------------------------------------------------
> > > Eugeniy Paltsev (1):
> > >       drm/arcpgu: rework encoder search
> > >
> > >  drivers/gpu/drm/arc/arcpgu_drv.c | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > Any chance for this one to get pulled into your tree(s) sometime soon?
> >
> > -Alexey
> >
> > _______________________________________________
> > linux-snps-arc mailing list
> > linux-snps-arc@lists.infradead.org
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-
> 2Dsnps-
> >
> 2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=f3bFSjs3gZI9vC
> > LJW5sa6Kxu43yXUsCXhaUNhtEymmk&s=eFO6mnw8IJyfrQZYrMEbJ-bryplfw9LvcYBSCEyj5XA&e=
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-
> 2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=c8DhCL8_-
> 0iY2tS35o8kpDyvbHZ_Cu762s4qtn2hDVg&s=sGFaDT7yPIbVcjW49E_rjb6ND82Nrq0kplYjbztlh3A&e=

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
