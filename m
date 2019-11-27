Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F9FC432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 08:30:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835072070B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 08:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Axtn0gQ6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QpCbWpVj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="TkSI2p16"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835072070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qoiuy8KNLOP1gZNDuSveCePu++oc5fcysPjE9PFXbIQ=; b=Axtn0gQ6gvb9x4
	URhaCM/ua+NhzIVl80XA4vL5QNpXiBxc+8lh8nb14ud0yM9w87lAzydR9Hxc7fqD3Ddm+XkOHuiIp
	UIFFxCcwxU305UdawLfA3W/EsoGnNTlUDTlXrVYocPYqJCrwWxAAr1mnT0D/zmXoW/WVYtlLMnm4f
	nHzKzAK6LjRNm+VSZcw3uESf7tlBqSSPDPeq4D7/cjfEvVJdazbj1NK2xeJ4rYUBGAkY4phGgK3TW
	GxVyZ0Cni/fCS6JfPD5hOQf9uSLsffrdp4mEPNkN4QsjyohYHUDHuAAx0Q1kYjNogSYMkTyC8m36+
	g2V0bCV5UqR+WgE+pHLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZsic-0007B5-9S; Wed, 27 Nov 2019 08:30:38 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZrhd-00011u-PX
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 07:25:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E40ADC0438;
 Wed, 27 Nov 2019 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574839530; bh=pZDjqzYGhYI1PWMP3iyKmo7naPxHu9iYYBNuXMNqWQQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QpCbWpVj0JnJMC5SR66i5/GwSDVO8NqdwDbhZUZ2lgpqkBWZtTamchX6C4upW9s7v
 HgLuA8XFuvVsTLI90UoTy+SXgrvQ8TJ8sinCK9b7Lmy0Ithy6J9eR/Hcxl9QsjgsEd
 ej67pu6Rr2WaIFIN7/sO7GeLXL/gi9OR+vgXMbtEWnYNOTK1qE324kJ1no/wsJS1Gy
 MtKrJUe6+pj7BoW6y7kg7ubPqGjjhgHIEJoTe2UxFxieJMHcoCtb4tI4NghFGAqaJ8
 xUyi5H2GR7JV/CD4yTDu2GIDsmKP8eQEEt3+LaNOlio5azxKXrRxhEM7eOXnvvPa+V
 QhtWUAp2Z438A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8CB20A0066;
 Wed, 27 Nov 2019 07:25:24 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Nov 2019 23:25:19 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 26 Nov 2019 23:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZobPUxBiTjGSETfQEk4s7LHIsY7tCJuycaXyA0VWON7vAySgK5mwoSZGBgRvPcGEbeHSpi4WdqfA0Faau3DqpEpXz7VwkVCVs1J7hVCaLIf2nGl7EjwrVvxv+bvlolIHPTT2tnf19NsAUVISsTgfSPXKlKZl0O+O+UCu+Gb9ziuOHmibBtZhUL2FR6X6jM4JHuBc9UK58GrD168Gf9cGdNQ6fD7Dt+7Q9hdknGgs61G95WjoebgBbC1O3SvaC6nxue4iJyvxNzhQhUvyFHNGB77UrxmoCL2S2ZlF06BwwgUZ7x3TbBbpCq7IbW0nfAxHKQvzUyBmObseAWBHtmHC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIB8WN8kcTtmMaVAcpwryw7QnEd7y999Jg+j55L0r/Q=;
 b=JWdDTJIzTWtEbYwWhB2cO45qshbOvtH1u/SvceiDkFaNw/fiI9jMpdVdHvN4Z0OXigBn62ePMooWw5F/HK5MUTEcJzD7ZcllFIoyqfcYI7v3tkGzygD3KljTOA3S8M+uA7zpgjyJS0Ey8xagJxTqTNslUFg3RcNagoDU8i59fOx1Z9aLkNqoLd7V93y6F+StyqE63vbp0GHtecpfn4CNfMn1aLaRbW3kDqa8ihGCRpAkhLdXXkN6x/Oj/dKtGaY45lNoiUrWJ8Lu6AIgaNBDZcXnihJuY9wMUTuctLvCqE4I8h63Rdr9KbBpbLbYZsGp6NAqVWQv32FmxkPlpFahxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIB8WN8kcTtmMaVAcpwryw7QnEd7y999Jg+j55L0r/Q=;
 b=TkSI2p16z+NIRX4ti+UQ+KVffIOaopt29c/W67b8juKIslwggKcfvO6kszjmEaeD9Sg9krsq5GR3ioqXjyQGtFN1C8xSsW0PFCL9bWUHy+y6HgfF6xaMM/ADfMaKjG8k90gdy7pmXHCJFlFrKy9onN4gVEKLrO9gfv+m+yTaQbo=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0263.namprd12.prod.outlook.com (10.172.76.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 07:25:16 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 07:25:16 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: RE: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrxdMyW8wArd+/9A=
Date: Wed, 27 Nov 2019 07:25:16 +0000
Message-ID: <CY4PR1201MB0120689F9B1F454DEEA75ECCA1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fae25ef-8370-45ef-8fd3-08d7730af354
x-ms-traffictypediagnostic: CY4PR1201MB0263:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB02630F09F965B23D2B4E362DA1440@CY4PR1201MB0263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:85;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(346002)(376002)(136003)(189003)(199004)(13464003)(4326008)(229853002)(76176011)(2906002)(52536014)(966005)(5660300002)(26005)(6506007)(53546011)(110136005)(9686003)(7696005)(102836004)(54906003)(6436002)(316002)(66556008)(3846002)(6116002)(33656002)(186003)(66946007)(71200400001)(55016002)(14444005)(6306002)(6246003)(71190400001)(99286004)(256004)(66476007)(66446008)(8936002)(66066001)(25786009)(81166006)(478600001)(74316002)(14454004)(76116006)(86362001)(11346002)(7736002)(64756008)(305945005)(8676002)(446003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0263;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n0SZx5Edtc1b+dmqxeKeTlbcvLVwK384XztxSHnmNgb/W9P1KqsVB4J+otp0LUQPoRTjTcnRgnrquxApPgIcNnRQ4vZcOA9KdzRfmFQMsSDncw/NOcavFVAfQaXxXn6VxafrqtyhEJtX3BxfnZwVuzKfl/9zgWvxnWm/CAfJoNdP7rxBR4ze/uG9oOTFNyqmb1f7DLXCxDwwgU83yKRKJpuXJqzf2eRxFREXu3cLtWjnDMAucV+N4FIY6B/nMVniAbRGcObgEx8k9OpyBvQFH7ci8R/1+52wXe3d+Yyn7ASGqvlagnAwEZilaLVSGAtvHySiZsvaIYIjSt0sGHEpxpBgCO0eJT6EeCFSY6CLux6ZLMQZl21jZEIoZjeBvwvgZ7NvWMBBPBzBWQv02FyTqzo7mAacFb8zopfbWtaLXavJAcPQLgM0cMM3dpeMA4oE/q68WpbgR4fZw7jr7EMh8NCqBrJkLyya8EIt0/gZqs4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fae25ef-8370-45ef-8fd3-08d7730af354
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 07:25:16.4717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCz2CwdFkWlRw1Q7AUFM/UbbLsij/LYK0HswN2RsvowHN6GU5fB8vsQnhN+2I11F0TfqtVzucKoPMh2aNeY4EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0263
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_232533_875011_12850FC2 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Daniel, David!

Any chance for this one to be processed sometime soon?
It's been quite some time since July when I initially sent
this pull-request.

-Alexey

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Alexey Brodkin
> Sent: Wednesday, November 13, 2019 2:30 PM
> To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
> Cc: arcml <linux-snps-arc@lists.infradead.org>; Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>; dri-
> devel@lists.freedesktop.org
> Subject: RE: [GIT PULL] drm/arc: Minor improvements
> 
> Hi Daniel, David,
> 
> > -----Original Message-----
> > From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Alexey Brodkin
> > Sent: Thursday, July 18, 2019 12:09 AM
> > To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
> > Cc: arcml <linux-snps-arc@lists.infradead.org>; dri-devel@lists.freedesktop.org
> > Subject: [GIT PULL] drm/arc: Minor improvements
> >
> > Hi Dave, Daniel,
> >
> > The following changes since commit 7aaddd96d5febcf5b24357a326b3038d49a20532:
> >
> >   drm/modes: Don't apply cmdline's rotation if it wasn't specified (2019-07-16 10:34:38 +0200)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.07.18
> >
> > for you to fetch changes up to cee17a71656e9e1b5ffc01767844026550d5f4a9:
> >
> >   drm/arcpgu: rework encoder search (2019-07-17 23:36:56 +0300)
> >
> > ----------------------------------------------------------------
> > This is a pretty simple improvement that allows to find encoder
> > as the one and only (ARC PGU doesn't support more than one) endpoint
> > instead of using non-standard "encoder-slave" property.
> >
> > ----------------------------------------------------------------
> > Eugeniy Paltsev (1):
> >       drm/arcpgu: rework encoder search
> >
> >  drivers/gpu/drm/arc/arcpgu_drv.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> Any chance for this one to get pulled into your tree(s) sometime soon?
> 
> -Alexey
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-
> 2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=f3bFSjs3gZI9vC
> LJW5sa6Kxu43yXUsCXhaUNhtEymmk&s=eFO6mnw8IJyfrQZYrMEbJ-bryplfw9LvcYBSCEyj5XA&e=

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
