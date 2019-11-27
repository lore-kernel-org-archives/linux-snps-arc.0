Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B269FC432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 07:49:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBA02071E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 07:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKA3mHHE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JYxSjMbn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HTeezfkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBA02071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YyBGnk3fhbOc0HBtrwudIJ9A4KUC/x2nwSBkkVty6SY=; b=AKA3mHHEAyVGXL
	GGd57jHapIOXrJWvQlsx5o9xz+oU4MNlT3iV5KBNZQfSNUIe9ip3wxECT+h+Wa4eRiWGHADI+rO0f
	Trkdr8lQYq9nRLfni0zaFg3Ecu4O51HfZIXEzAl4Ap3rpsQiWZSvMKm+KO2KArkvp1W08xhWDtdEt
	ZKIF0a81LeTwnFvn9dbNrYDdyI7j3EGNccMRtgWDbfRkqHjCpdtvLAbIgUReiWd0kSqsSIhTQFNZt
	4V61zNdIOAyv4c1sJg67NuvNCQswYQ34fI2iDCxdPyJ1hfR6LhfiiPrZpyp+tebAG1hJTmsqWe5KI
	6Jwu8vBlY0V8nj4j33gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZs4M-0000AB-5C; Wed, 27 Nov 2019 07:49:02 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZs4J-00009n-S1
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 07:49:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 287D8C008F;
 Wed, 27 Nov 2019 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574840936; bh=j+JxVLun5KMJTetqvtzbMunQK5SoGQGC3QR/l8xl+cs=;
 h=From:To:CC:Subject:Date:From;
 b=JYxSjMbnEavkY47ZJskwCzq3WQKMvoDwU/65OTg89xgHjnwZzx63E6QKkZ4Vap2qU
 cmCwbKzFdJQyDd1Vs8uEeAV1JwYACy0GbIgwpxaH1WTHOL9YV5HD++vZUBAuGd6r3Q
 prpTf3zMJuy1ZTFc+qlzJnQci6oXVfjGmW2Tk2h1799Ke/pvE+yZuj0q1pVR6f6n2A
 CD7r6XLOsFyKROoIeYMjnDOtjlhI3sYJAP3voF+K4HPymfIKMkxqLFxkS+oDuElJD0
 KZ0C0hLdWOos/kdcY7L8sEpVx3ZlEXmCIYi3UB+bbNLvIPR7k29iZXynHe9pABZVbc
 rj5aA4Qxuxa2A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 71607A0069;
 Wed, 27 Nov 2019 07:48:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Nov 2019 23:48:06 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 26 Nov 2019 23:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7NjrtWsjCqyG7+CiAHd6Ul+KY1gM4BsoDuXPo5CIxs/ixjBjOAu7/VSYUIFJ8P/Lw7MfNsXOR+ecPigjbVNi6Km7V/zl+XB+m9iFrn5HGlS+bcPBGIJ1BAdi5X4NLuRimxEeHglK1EfCbZ5C5YO5cQXZrpGrPVljZoBMPCeC+1/g3aBCXlxWquPO9dNdf/r+7N40nmSdUkht8NHTtUw0kncCxsAEL/S59nNPOSNnJYyz8rxiuHXLQVx6laNpvzja/lGtwkMcRFPwF2h8/oemnsc30H2kFkptsAC5YXp11mV1OaH+9/zUF7N640PdKvqeoCelbK/LjHhs7gvNZKLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q4ii8KQulDFHwssmIsvl2zKeXzwBQw5EdPyuUEaUMA=;
 b=iDiu8QmnlbJaqAmZbumOMYmnUbQ4kBIBloVPRcy2ZpXpBpFnIq3N3keV0hyYyZOqMXWWYKby0D85r94a0RUnXM7anjIrekZXFn3sduUVumRK3E/1LEFSPM03Lvv5ls0VvNi/Lc56rCnFw5j60ECR6lCdELlXNT8zxWBHXGffQsW8+W0tSNPG/dd8qgGygKr0/gJ01IY+cSVdPjIbmSYEfYF1gsL7UmY8bryEEXQ1Hwnp5nPzo/A5WkUM6lUJViGO6eHzV22Nn9TBObOTTpFxzpTz3WR9kL+txQtZ7Em/WJfO8LerKq2SV1I7NPqKPuJzSqQQ+Mk68N05zh3S4/VCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q4ii8KQulDFHwssmIsvl2zKeXzwBQw5EdPyuUEaUMA=;
 b=HTeezfkMrO9+35MaIr25pmcB0DNJUCbzbecgrsdsw6YEfFIIRcI/0FkL+SG03fcJnl8KT0umrgkirZL4OTU+ZZ/3FEqycicyxCBHjL//qKDThidOXsGHkrRm2c1cJiFTsZdlX8tKwt2Y6n1Lc7InNlaIEGNNs8l+GNrjMJCWi6g=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Wed, 27 Nov 2019 07:48:04 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 07:48:04 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Topic: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Index: AdWk9uGIdHrNqX0yQ6SZMMOjZA+q3Q==
Date: Wed, 27 Nov 2019 07:48:04 +0000
Message-ID: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0d801ae-2443-43cd-cff2-08d7730e22bb
x-ms-traffictypediagnostic: CY4PR1201MB0102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB010264DB131B8C065FABCB9EA1440@CY4PR1201MB0102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(4001150100001)(102836004)(7736002)(74316002)(305945005)(99286004)(6506007)(5660300002)(256004)(9686003)(55016002)(316002)(26005)(33656002)(186003)(8936002)(54906003)(71190400001)(6436002)(7696005)(66066001)(3846002)(52536014)(8676002)(6116002)(66946007)(81166006)(66556008)(66476007)(66446008)(478600001)(64756008)(2906002)(81156014)(14454004)(76116006)(4326008)(25786009)(86362001)(71200400001)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0102;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ujKGM7dlpDYLUbsE7nGYOmbS1yai/wPYklJvzlunDVi77e+rk296v5HkaCw5sdOI8+l+0bLkfDuMt8y8eRyP4mUj4GkQ4vj2RFG3txD3wRh36SrLOykM2HgcV1Qag3KZ8/hw3K1dwV+m5wHdR0/DeQa+zpzJ6XYXxD++f7DPM7tXToOpx0PjoII+f8yKinD1W+rIpAa9GW79o0jTyqyn1/AhPP8Q8+v2jxVRqeweTj2eEJGsI0ckjh/WH/7jZyw+GzZbaOBmfs81O6bevU+WkjrWqMJ6ipBjnqTyCF55lXWDW9sAL57sTmPhXad/M65I57YaQUBd164gJgMsPEdCBcLXfEF0ovhClgAgyEu5ZuZmKTjI2WDhuxYj8xeMQVosgMdIn0KlsAw3Nrt4xaqsGxoaf9UfRpMtKb/OHaxpm7j6nN6bLWjywNBbp3GFbza0
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d801ae-2443-43cd-cff2-08d7730e22bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 07:48:04.4285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YT7+/Oa/4/Lab1J7BsIBjRacCExzFwUHDFGgWMLa5Ibfl2Rgl0ftOuLGAI8HrXYzrJCk8YMQQGUnh/tjBZ6Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0102
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_234859_979161_90163E9E 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi David, Daniel!

The following changes since commit 8082731830a0b95f7f7a63b78de67de446013c80:

  drm/vram: remove unused declaration (2019-11-27 07:51:49 +0100)

are available in the Git repository at:

  git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27

for you to fetch changes up to b2c68fb15a4c2e27f80353d3067dce30882a0972:

  DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 10:38:24 +0300)

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

Thanks,
Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
