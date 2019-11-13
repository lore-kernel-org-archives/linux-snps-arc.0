Return-Path: <SRS0=eCxK=ZF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F05C43331
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 11:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4706B20679
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 11:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f4ugeGFu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X6B+IXvK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="GA4hWucN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4706B20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QRriCroUexZtVYwGNtkevcTPGLZ5Lt2MFo7PGtz1Bo=; b=f4ugeGFuX7wDuH
	DuFMGb86KcQZ9dWhHHwA3RE8/qDioJYEqdSY3nYpqE2RaLDPfV1A5JdFlaB2tHFgwRIu7a2LjaoTy
	w5qlDvPUJpjBtAHpfGaO3jtKEubr+z3PWUAZ/EddZrslS2slBoXzC1Wowwtl73yM/PRMXyDbO8w+m
	RQtTd7WfUV21M5ijPDqrv3fx9tqHT+H8TF2PJJblRD0xj9I3E7bMOS24qjbly5PczVNObFk1hwzNe
	BzUwu3X6e09VCJKC0gMwSdOtJvneN89SEfPt7edqY1/eIIFp1bj6dfQPhurjj94NopJnS/hZDfWfl
	9ixMQffuY+FZG3I/pJSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUqr7-00088p-U1; Wed, 13 Nov 2019 11:30:37 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUqr4-00088B-Av
 for linux-snps-arc@lists.infradead.org; Wed, 13 Nov 2019 11:30:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6215FC0E94;
 Wed, 13 Nov 2019 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573644633; bh=2jbuiDULVEcs/T9Z7F1VZPUV29jJc41wFANmGaKydIs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=X6B+IXvKnlm2fcLPQYkpW9a9nxHTGbTQkRRLgvjjcEetvPkyGjLB8KiM27St/azHc
 YINw6MhCmLv+g1U66zn4zDmAuA4fCb3MqPSc50OGI5Vs5+T64bxYaduoIgwEz+rj3J
 8YQdJ8oDZS7W32/zKy5kRkSlqLeAFtKY4O0h35oJZcpMOdEvBHeZMx6Ag7iCJ1TIYI
 kRYD+abWL6tx/iNDZxcDZhdYsccoUCUsK+DNodIb49brI5ZAOKKMX67e65/2uFcxEv
 rwy8CmFecth8LZwrOXVsixpAAwUSMGHZi1PSb9djvKMAGeao8Ym34ODWdjbsD6lxjb
 n1QeVXpiYdAhg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4F127A007B;
 Wed, 13 Nov 2019 11:30:29 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 13 Nov 2019 03:30:30 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 13 Nov 2019 03:30:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixz58hTuvyO96Uwwq8ceLdOxMwW9JBZV9hCnCeQtzxlHoaUebayshhm/v0+6qqg/DrIJMI65pXf9vIp26LDvAXOytVEZIH8SY8QXLVihgqi1PoH0FdhxFDd6vzXOu23YZKSPzoUFLaYv6dHZuFt2fwMsefDguIXlYcfvCW5N8TL386KMd9EMrFSZLfQFDw6r8ynQ8wt+qj0YSA/q3BCt/u4hK8Tl4iaAx2lHDv0iWRhx9OnVjQzKVVVO03SV3ALS3BQgJTdSYzSsXvqbrHYezFTNK3K6K6J11Z+OhgtnFZTWNqKVlBjIqzHHIaP1SQukaOewduFWkQ34Z1wtJ+rRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcXRyQC0vQiV6bTxinskrV4zuYqy6q4nVsYQhqbU4jA=;
 b=dAcV4NJplS0MjPuEU32bY9zNX3TxW7lVkDR/8ZtmHNlvxrlJjIk4VXeoz4ZSipEeM1NcPvi1E9z3BVa0hHq3D7WLfZpejJXKG/dprfjorNHJzKrXMaDZ9PR9Ym5ikjeUpIW25tCxeuQbrTJLmmCzdzxIlYKicVdJiuEld1r6dBda5LA5rPyNd1aeCT0E/0Nt+hidOzayvPj+1KkkmO/ARF60GVLoXmIKhkg1TwqrKtQzJDEoFlRM2iSYJfKiJzEnyKMur2PrDwyeNQLcVkjuQfNLUkKcqzASXMQDTLIt+G83hGhbcYceWvr63CBgLqBWbcKE3j0dLpu06qO7ypBsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcXRyQC0vQiV6bTxinskrV4zuYqy6q4nVsYQhqbU4jA=;
 b=GA4hWucN31VyziUZj7LIFQqCkWnpNCcYFI9NzZBMHDlxQT///F3ru0imB2GGN4QBXZ9QHKsq6GZm/22PflE91RGvdaUP52WakU56zob+LWtpfCvq2S/Qq+N6rg4O8Xd7U+TSDwuTrqRQGqt51L9gT7wmwR/asdZ4Drfr8GM+L2U=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0231.namprd12.prod.outlook.com (10.174.54.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 13 Nov 2019 11:30:28 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::3049:a98a:7419:838]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::3049:a98a:7419:838%9]) with mapi id 15.20.2451.023; Wed, 13 Nov 2019
 11:30:28 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: RE: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrxdMyW8w
Date: Wed, 13 Nov 2019 11:30:28 +0000
Message-ID: <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2df98b98-dc8d-4729-279d-08d7682ce295
x-ms-traffictypediagnostic: CY4PR1201MB0231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB023147F11CF33A7070E3E8ADA1760@CY4PR1201MB0231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:303;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(366004)(346002)(39860400002)(136003)(13464003)(199004)(189003)(66946007)(64756008)(66556008)(66476007)(476003)(66446008)(486006)(14454004)(74316002)(478600001)(25786009)(186003)(26005)(7696005)(76176011)(11346002)(7736002)(33656002)(52536014)(305945005)(5660300002)(53546011)(6506007)(102836004)(446003)(6436002)(54906003)(4326008)(6246003)(110136005)(107886003)(316002)(9686003)(6116002)(3846002)(8676002)(99286004)(76116006)(81156014)(81166006)(55016002)(86362001)(2906002)(8936002)(256004)(66066001)(71200400001)(229853002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0231;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 39RXhrtZL7eui2DBXW/UenCYPQqUyt7Vj0ZeBtbyt6Gdp4AILqKK50qhD5m9oUX8Hyxl+QtK+x3V2gK8tffG+9/tCBBQQH14emgPZFGUw4Gp/FZeea8IxHnYF0SPM9ExxsjGzHxhDoDdf4obYri/zWA3Wxzsdn0fqVlihDlMrxniT7iVwCUDGQDM2vGHHGLbGYaNTHKaF8zp0oPIJo41lqTPTPn690UAkhzCTsU9RdtLjafO0ymYs28mtyjFrnwp80PrNJWRUvPelunXbrj0UdIZuQzUHvqBkLBUyCfPCk22W0h/+06Ucsk07QBJvQcdRqB5RPgpj9P5d0P2WFXvSBA4Tgaq/fgsxFcfLOzAPkU5gDuF+xi9rvpQwSarV/iAzca9JYtUYjL+p0nl39QGlDxfhL4t5R/pBmysljmE50aCW383irhxXdVwNCfohzDj
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df98b98-dc8d-4729-279d-08d7682ce295
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 11:30:28.4560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvbNFvkXf9YGzLWt+AyWVygbEpS7JftOCGyk9tNVfpM5jHTch3at2yXwkLj0V3d1Qle2cU8HbQrX5+oKCtBjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0231
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_033034_432430_75D88543 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Daniel, David,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Alexey Brodkin
> Sent: Thursday, July 18, 2019 12:09 AM
> To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
> Cc: arcml <linux-snps-arc@lists.infradead.org>; dri-devel@lists.freedesktop.org
> Subject: [GIT PULL] drm/arc: Minor improvements
> 
> Hi Dave, Daniel,
> 
> The following changes since commit 7aaddd96d5febcf5b24357a326b3038d49a20532:
> 
>   drm/modes: Don't apply cmdline's rotation if it wasn't specified (2019-07-16 10:34:38 +0200)
> 
> are available in the Git repository at:
> 
>   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.07.18
> 
> for you to fetch changes up to cee17a71656e9e1b5ffc01767844026550d5f4a9:
> 
>   drm/arcpgu: rework encoder search (2019-07-17 23:36:56 +0300)
> 
> ----------------------------------------------------------------
> This is a pretty simple improvement that allows to find encoder
> as the one and only (ARC PGU doesn't support more than one) endpoint
> instead of using non-standard "encoder-slave" property.
> 
> ----------------------------------------------------------------
> Eugeniy Paltsev (1):
>       drm/arcpgu: rework encoder search
> 
>  drivers/gpu/drm/arc/arcpgu_drv.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Any chance for this one to get pulled into your tree(s) sometime soon?

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
