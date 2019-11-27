Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF126C432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 13:49:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769FE20722
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 13:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ta0Lb1tr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UIOp/li8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="gGTZHtaW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769FE20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7T0fNyg+w2umCVKuAsNcr870ICRgCjyGKa0QbT7KU8=; b=Ta0Lb1trk58Uvr
	7WSzxJgF+YkM3f43xUDaP6e1D3aoy01OwyIz1l55W6wCAfMxbpcbg21uutEwjiGPfAZHiKGcBBTDW
	CSfxWWOUl5w95XnkVi4kiDbWbHMNdKbxw7xNvxyuSaLqVRKwz80pwgXSZgkfBMMHqYye8qiyEnikP
	ThvSMAY2/XSLx5k6jbVEdaykyBCDv+orz6bhsChiEWTCSdnspIcITiiYCNF4s6og5pDXHI0EGmM1C
	r0H9LqDOvJvq0uuZtWLz4jTG6+l4lIS7AwK+8EfjwORTCA3vzfOsWBDx5VP53bA/vAREUBeTFma0H
	kqGbxGK47oPqXpH26e9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZxhK-000343-66; Wed, 27 Nov 2019 13:49:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZxhG-00033c-T1
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 13:49:36 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D6C44C0095;
 Wed, 27 Nov 2019 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574862571; bh=KZiQWNf1lJ4TR73RvCDQW4r9WaLz9/T64oweiT/c3gA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UIOp/li8oJvgNKsLQoH9PqkQtGTs1eOzKFPD5fCrtKIoV1xIROuhRUW0RHPb9hOvd
 0Kb88cBY83hq/kMFgGf+Ku+73MxDlc30FFjT/Iem+o9dq28YLyQfixh72cOE5T3yjn
 Schr1z2c+O6JBw2YHTMoWgPbM4boZElcuQZSh1Yq7tFofSrT/5/pIgRncRQnqWFVMy
 D1+PTHna6oE/yqgkG6krasfeGFZWYyoOtPGZM0a/uNmWWRUhZgEq3e9kPGrsbErCmx
 Nkss06jJ5CvnUM+skMu2eixDoW6k8cYLO/qk1ZjyxN8YiNkXleHr47P/SHPMqO5KDJ
 HuM6aTpj9z3yQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5B506A0079;
 Wed, 27 Nov 2019 13:49:30 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Nov 2019 05:49:30 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 27 Nov 2019 05:49:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYv7UTZv6L0GUrZM+GXigCAzvxkgME/rbHKXKX81s5WGrdHd9i/o9eEWVhw/mMdXHanyjdeiLTCCFtEWSL7O/tro2z/uFWM3cp6E+0J/nTpbLMYj4rENmT67GHr2lyYY6hT0jNiazyOsc90D64aQmy+Ps1O6KMRE7/k8KmkIY9GIn5kIotwIRm0MMpAqX/ja+Tz1U+M7rHIJOv0cGbFRnycUbs8q05e/fqFwdI2h9/H6auw5sJoZkXff6lTSKS5BgeGCeG4X9+IF5bXfqOcznj4bHo5AKZaSlyF8oQhRQMGhV80II3I6VDVy6BZv3hWKs1lipQiJVQUea2Z8eztgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKe1iddQU2zNc4mVcQ2CudE5R7BYCsjjT2qg0OkqMuo=;
 b=gUuSzLo9XfOmhm4OuJstGTR3BNhRuGQUGj4T+993uEZUsA9pQBxf6jpzpZNMc/PaQHpVcD8bqRwD8Gt3uZEvYE7eU5ALRdfY5A34Ux92gigYQSxpFzkzgIGjY60g5LhuAktm0kp/IdHumZ2h5KjNY1XXiXtpq/28o2nND0H4jP+SbEkdUQ3R+n+gCr0fdHcHQKUSbKIGrs3RHwIPmurnHMqHoD/i+jtjdVCgUPf6vIXnY5wxJHYL4xZCS/2vlh5t5T+DWhm/bPnSJRTmubcIbFBVOyTFDhLHWSo4QKSgpUVMSPWZbOS64V+Bia+eflqvcRNgth5Tg/R8f8j4YxqQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKe1iddQU2zNc4mVcQ2CudE5R7BYCsjjT2qg0OkqMuo=;
 b=gGTZHtaWhSW2QLiyUT1xLQ9p5On+Oh+61XobTXra7TespLEH/bOvtgdfdM3E6tM13uO5FDnPYqy8xVdA62ZN0RqVbAIXtIbuWuJ3AkyXxuE3mYAwujklMvzuN9VtBNAnB+GUOkHcZbZCtaDMei4dy1QxNjSIWXLgg4g+arrrJGU=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0261.namprd12.prod.outlook.com (10.172.78.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 13:49:28 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 13:49:28 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Topic: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Index: AdWk9uGIdHrNqX0yQ6SZMMOjZA+q3QAE3eIAAAaVHaA=
Date: Wed, 27 Nov 2019 13:49:27 +0000
Message-ID: <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
In-Reply-To: <20191127100634.GE29965@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9904db2-b90b-4820-9ff7-08d773409f22
x-ms-traffictypediagnostic: CY4PR1201MB0261:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0261B803494BD09FBA80A229A1440@CY4PR1201MB0261.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(51914003)(199004)(189003)(13464003)(66446008)(53546011)(33656002)(966005)(6116002)(5660300002)(26005)(2906002)(54906003)(102836004)(3846002)(86362001)(186003)(7696005)(4001150100001)(256004)(14444005)(74316002)(4326008)(71200400001)(575854001)(81156014)(76176011)(64756008)(81166006)(14454004)(71190400001)(6246003)(8936002)(6306002)(8676002)(66476007)(6436002)(498600001)(9686003)(229853002)(55016002)(446003)(99286004)(76116006)(66066001)(52536014)(25786009)(6916009)(66946007)(6506007)(11346002)(305945005)(7736002)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0261;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8O+p/qwtoJuMDAKZYcY7s5xjXvs83069tU6teUMYxEKb1BhKBd+ZcCbNgUHnGK43/pfZ6AeTU64I89d7Rl/5Nqz7Md4eMFDcrzMXIndxRqSd0BCrYSq8vuDHMPWv78tLMonwtG/kVzlAr/+wgmlfztI6fHYl89crwfGJgngtzfct6//Ezj2kD7i75XwUmERtT2RxPZy4WijXeFi9d1HuEyiacWb9ehQ+C1yXr4uGwNp2fHj2cys3RRidsfKzfkqMXG/whjkT27F8TspfEZTUJBPgPapuMKiezssnRhsRL+Z2BB0KfeOoVOzdknl1nMPgUxlvboEl3rTZXUj3Py4VtymP/gYi6dZlLwgujX72V2SB5ka2HXUm6Pj1yaKM1V20t4s3NV3j5wc3tKfgxWHvfmdxsi8Vtdvua0efpFXy3+I3XFYTuZ0ynX0F5irYhndqwQPvioHCbZof7HSkf4lcQ7jo3xKRYrMS7dTAPkCluc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9904db2-b90b-4820-9ff7-08d773409f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 13:49:27.9233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrTNWazAGVKOMvtnlpcn02lU15kOautns2wyEX7VfSNfN7WP82iU869yd9fgNHQNYAJ1gQjDY0JO9gT13+cZzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0261
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_054935_065250_F2B59C6C 
X-CRM114-Status: GOOD (  23.22  )
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Daniel,

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Wednesday, November 27, 2019 1:07 PM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>; arcml <linux-snps-
> arc@lists.infradead.org>; Eugeniy Paltsev <paltsev@synopsys.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
> 
> On Wed, Nov 27, 2019 at 07:48:04AM +0000, Alexey Brodkin wrote:
> > Hi David, Daniel!
> >
> > The following changes since commit 8082731830a0b95f7f7a63b78de67de446013c80:
> >
> >   drm/vram: remove unused declaration (2019-11-27 07:51:49 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
> >
> > for you to fetch changes up to b2c68fb15a4c2e27f80353d3067dce30882a0972:
> >
> >   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 10:38:24 +0300)
> >
> > ----------------------------------------------------------------
> > Clean-up and fixes for FourCC handling in ARC PGU.
> >
> > ----------------------------------------------------------------
> > Eugeniy Paltsev (4):
> >       DRM: ARC: PGU: fix framebuffer format switching
> >       DRM: ARC: PGU: cleanup supported format list code
> >       DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
> >       DRM: ARC: PGU: add ARGB8888 format to supported format list
> 
> Uh, this seems to be based on some random snapshot of drm-misc-next, so
> contains a _lot_ more than just these 4 patches (compared to drm-next).

Indeed it's based off of today's "drm-misc-next". That's because I still get
lost when I have to deal with DRM trees which we have a plenty.

I guess there should be a clean explanation of which repo and branch should be
used for which purpose, right? May I have a reference to it then?

> If you want to move arcpgu to drm-misc (which would make tons of sense imo)

Could you please elaborate a bit on this? Given we have a couple a patches if
at all for each kernel release I'd prefer to escape a need to use yet another
repo, tools etc as this doesn't simplify anything but instead makes simple
things much more complex (if done rarely).

> then:
> - create a MAINTAINER patch to add drm-misc as the git repo for it
> - request your account for drm-misc, see https://www.freedesktop.org/wiki/AccountRequests/
> - and set up the scripts https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html 

Thanks for the pointers

> Or respin this one, but these small pulls have a habit of occasionally
> getting lost :-/

Well I'd better re-spin this, see below.

The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:

  Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-11-26 08:40:23 +1000)

are available in the Git repository at:

  git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27

for you to fetch changes up to 9c2acc26c899aa12ad009dff10a5573ef769a7fd:

  DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 16:43:39 +0300)

----------------------------------------------------------------
Clean-up and fixes for FourCC handling in ARC PGU.

----------------------------------------------------------------
Eugeniy Paltsev (4):
      DRM: ARC: PGU: fix framebuffer format switching
      DRM: ARC: PGU: cleanup supported format list code
      DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
      DRM: ARC: PGU: add ARGB8888 format to supported format list

 drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
 drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

-Alexey


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
