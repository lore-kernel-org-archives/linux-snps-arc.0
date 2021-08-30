Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0041DC432BE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9739960F12
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9739960F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hrxtr/qDNqyVW1WMvWjKDwHiLFNqKNlKMFTrLaZaxKQ=; b=OkJMe9gNCd9Vzm
	zuqwY12U0CNwyUTLDd/4uq/kFCSflfGZSNtdldbl0wgxXoGfUn5GN4WgxoNIJwciqWfdC6I60IJnU
	uh5iTVXrjPLGLCotWnlQDVBypTVyVA20JbBrix+jQT7K8YxoIJXTkiTA48+kXY+b2gbaCYJ9D5ydw
	BRfbLt/2aHHaE0iSCVIa+JMmRKAsIj85RGCeAF9HqAl0yfQ3wiGGY00r8fTWilgUN5RODQJ3l1pRm
	NxjUxJd7wvJXOEY0NiY0dpXZ8RhBzTxZdkt7XjZsfawTFpSYfK1kAuA1hCY8pOyfOewDl9KuLxYt9
	sNZga0A0oRT2orb39p+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkdy-0008hy-Vp; Mon, 30 Aug 2021 17:00:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkHe-0005oM-NW
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 16:37:22 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4918540554;
 Mon, 30 Aug 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1630341436; bh=V/xyPQoZ3L4y/zUTTf/A1Qenc/JEQhn+SwxiLsTm2Ao=;
 h=From:To:CC:Subject:Date:From;
 b=P5dSOsEtwOIG+M/xzYgne3uqNnq635qYdDmGB2aWjqGut+81BCxJU3OIxseH78IS5
 nu6W3ELd6MBRNXL7iz/7jZAQ2+bddO+VSE6FUv/St1hPxRx4/8p3J84entarIMWPu/
 D7sDUNwob8aBELmzZXvVQs2ZzcMx+Q454qxSZtl+9iDUmqmKNMLDw1JSZh+IJ5vjZ3
 bur8+xkKiyozEhxFGWtPUG7o6bblF0wXoMNmsCtiH9/8Z/8ez2hXWXMlwUUun3d7OU
 +B+eyYRUhwyxihJWrtcAboWiKUDa70it/qz4/khbD2fhkj+Skou2z33bD0dVPlRHGK
 j2YKlfZq0bU7A==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 75A1EA0096;
 Mon, 30 Aug 2021 16:37:13 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3817F40095;
 Mon, 30 Aug 2021 16:37:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="OBVYuIfk";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHH4dDyDSzLgM2LY84NMFFExiySAR+Cc6tMbzo+eRT1zi90cdFFNLooaoo+tyVswyyx9zOQGL+uG5dvb2OY0lTLrXwVMKTAxbOYICSlR40XzswRUm/llI4JEEF8m/9m2+W66Mk4qrUxoIapdVIjTx4aB/tiHw8FgjXKuKFTf22WBpFhli0XfjTKf1afvshrbypWIr7fWTvbgCRtIEEObWxVujPcGNSr/y48LlZfkwGnvkGSEaBW1qBvuYutyIsaPLaZ1DTBfpwPrd6XDQHTfyPNW/3dwOahhHPXDLHyLRqmpehthiEajxGbCqaFN0btIlYaRXLIhU9o/UzCsjzYTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/xyPQoZ3L4y/zUTTf/A1Qenc/JEQhn+SwxiLsTm2Ao=;
 b=CFa2xQha+YvjDxVGHYQ47Lh5t9xfYSp7jSj5R151qhlBAwD52BDsu/lHxUKfoXpP449CPJbVl5LujSiEuRtOOPh9befl2T5aKCx3bzxh/id/Q3skcdkNkEjvUZfM2iWYuM6z4F5Hne+nF33VqnNZPqgR9dxAn0IYHSGPaFyHoaYvePVoK8nZ2xaDURR2gSPlAlaXDsoz9udxg8j5y5PPqLGhbTsYd5l1YaymaHDjCjU0BMzx+kW/XJ5+H2yThpvsJaj2tf2QASxNA9gSa/yGPG7Wj1TzRpMIAGYcUmfDyTyOjSLvVtGcw5C6gQYz4lB+qvlFz8ifLz+qR1wtI0wrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/xyPQoZ3L4y/zUTTf/A1Qenc/JEQhn+SwxiLsTm2Ao=;
 b=OBVYuIfkni5rHPcjGdyGP7R9R7NsQ3ovxM3KvSUabQDRk0qHHqmlN/ZUl1sDMCRwoIrAw5rNb6AmXrDih1H85ZaeqJs2q3ZigzZMGU6ZoK0BRaRWYq8mMas68QctQYep/1+UvB9i9KW3q7KEDhocsQbZq1zznW0z8tk5KlhbM28=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 16:37:11 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346%7]) with mapi id 15.20.4457.020; Mon, 30 Aug 2021
 16:37:11 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "989442@bugs.debian.org" <989442@bugs.debian.org>
CC: Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: Debian: openssl: Add ARC target
Thread-Topic: Re: Debian: openssl: Add ARC target
Thread-Index: AdecPsobmLvVoNX6Q5+TjoeCZXBAmg==
Date: Mon, 30 Aug 2021 16:37:11 +0000
Message-ID: <PH0PR12MB5401221D5C33C6E7BC9D440DA1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0xOWNkOWFiMC0wODMyLTExZWMtYmYxYi1mYzQ0?=
 =?us-ascii?Q?ODIzY2FiYmNcYW1lLXRlc3RcMTljZDlhYjItMDgzMi0xMWVjLWJmMWItZmM0?=
 =?us-ascii?Q?NDgyM2NhYmJjYm9keS50eHQiIHN6PSIzMDUiIHQ9IjEzMjc0NjUwNzgyNjA5?=
 =?us-ascii?Q?MDYyOSIgaD0iRXVteFRTcUlqT1dVeHcxV1VHMFcrYkloR3RjPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFD?=
 =?us-ascii?Q?RjBpWGNQcHpYQWRKS1BKaVV6czUzMGtvOG1KVE96bmNOQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQUdDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUE3NUFtc2dBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QnRB?=
 =?us-ascii?Q?R2tBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUhRQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFIUUFjd0J0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZFFC?=
 =?us-ascii?Q?dEFHTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR2NBZEFCekFGOEFjQUJ5QUc4?=
 =?us-ascii?Q?QVpBQjFBR01BZEFCZkFIUUFjZ0JoQUdrQWJnQnBBRzRBWndBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QmhBR3dBWlFCekFGOEFZUUJqQUdNQWJ3QjFBRzRB?=
 =?us-ascii?Q?ZEFCZkFIQUFiQUJoQUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCeEFIVUFid0IwQUdVQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFiZ0J3QUhNQVh3QnNB?=
 =?us-ascii?Q?R2tBWXdCbEFHNEFjd0JsQUY4QWRBQmxBSElBYlFCZkFERUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBY3dCMEFIVUFaQUJsQUc0QWRBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QjJBR2NBWHdCckFHVUFlUUIzQUc4QWNnQmtBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUEiLz48L21ldGE+?=
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2f169c0-23e1-496e-e9ea-08d96bd46a70
x-ms-traffictypediagnostic: PH0PR12MB5450:
x-microsoft-antispam-prvs: <PH0PR12MB5450C54F1BC315EB5D172034A1CB9@PH0PR12MB5450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lACy2GYL2IiWeaXhuQS2iW0do2BAQTTmFqQblY02w4qTfBDWsl5zuJqU+7FSNIibP5bLlav/g6Q3rwzMLHl9eEGiuK6MyQMQbEycjQcy7Uc4T+zz5+MI4PmFtXrI2NW+X8KasC26au0aSarMbfaVf7ESZ2LvB70+Ll2yzjQ9CRGtBkJKWhAIIjJuSmeQnC/Og8CT5Jbrsd2u8lrqvvkGXmmIeash0i1fcCSyRvig3grUxQZ9Kly0Z1LkpoS6CGjvwi7N6rSSySW8Ucq36SmJtYJKcVqOEz4pB7xmVv+ukc/es4V6hP2ptKTK9Ccjeeh7/okrHOS1WirIozogGaialODrcXolU3Yjh6E28noHGztYx71BTQ1EFbSymNOKDg2fIAY25XPdgTq670kVFxqJdKik0Sbvg55odYyCVSnRvhkAuB6x1wfsJruz9lrjKhCacV7BI4sZdorGOned2WI5H1iGLKhAmggLqqWMNhoOoEi7n49UXrTFfvEc42P+4XlXiLfgCuguMLL8zRNE5QEftaGDsYS7hdl+PCPmbl4N7Yn2HuryauAsLTov2Wchicc6COR7Y0WhQElfxEqAj8GpzJISjORBEJq/jVYCD0HxekaZJruPVuQcMzCEs1iGqMrKTV9pQrWwqaNgXtWETA6p/x6RPEkE3Mw+LlAeaTAkDCaGIArhSjmH3lFdnaxKCk3XuYqSMJG2iTvnuGt4sZCVeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(55016002)(478600001)(76116006)(64756008)(66476007)(122000001)(66446008)(52536014)(38100700002)(316002)(66556008)(71200400001)(8936002)(66946007)(6916009)(2906002)(9686003)(6506007)(86362001)(5660300002)(33656002)(186003)(7696005)(38070700005)(8676002)(558084003)(4326008)(26005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I2VvtLojE0fUHLPhB2jaWE0/vB8CDJt9Mn2gG3ZAlfdhSSpv2jv9P27c/g0/?=
 =?us-ascii?Q?A+DM/uRmaikMZaVlDv3qnBi8ubHdyMZUhK1234tRTueOA4O5CowFn5iRT4+C?=
 =?us-ascii?Q?HJbU6VtjP+xVH9AjROQlbAz0hA2BESp1NGiqcVmOU7oMkwN7Vvme8ZoSuHvq?=
 =?us-ascii?Q?U9TYO+LxxHuGX/+KxUGMW1hwTrZNO2z0nEP33sQElXudT2zN3k8oTBvFyxRq?=
 =?us-ascii?Q?hhsXQ4VUMWshOe6HKTpCUfkgzY/ReQ+Ny1PKI4L15/CXbckKdSDmVUr2u/Qb?=
 =?us-ascii?Q?RDD3z+zJ90rqRSHpziKSRAyYPC8THWi0aeEdDc/i1Bzqvlx5StjBzmrW7yDM?=
 =?us-ascii?Q?oE1UVvfX+ltQRCpSHvYWeaAd1MvNWQWy13COPO+sRKO2MS13h3mv6zOxWxgv?=
 =?us-ascii?Q?hij+rrifvi/6Z/U/XmQJakePVgPKdrpqb0A5w7FwO89tfcmVNp8ECFZj+Wii?=
 =?us-ascii?Q?Bawb4+AGPVCVcJPvcQLRfTjiKLM9sUkouNu/JD79HxbCovy24Y1+XtU/yYJP?=
 =?us-ascii?Q?Agzr7ZexFuvKWE1wFkw49lPysOSRX9bBWnZTEaAm9UuucrcpPHJrWQNOFpDB?=
 =?us-ascii?Q?eh1Mtdm5O1AAny7yVRMBvnN0+KAaNG390iiHz/dR6VmuMPdTCCa1jYff7XQf?=
 =?us-ascii?Q?auMjMFjqLp/ZUi692JXT0JtGJ01tbyogEXycOM0REbTCB/6aYyexhpDOsJKv?=
 =?us-ascii?Q?mZWM41gIA4XfNcNR3Ao2IWFXckKNHteK5jmi4ig/Rb+DV4ghsf25ZfUaWuOf?=
 =?us-ascii?Q?+NNwddoitre1ML4SkH2QgzhLksBepxsb4H0+JTwAyR88zG1xK3nzxxDxS0PF?=
 =?us-ascii?Q?nyTWQyI6VBpaQJgTZ2oaH28tJB1nxnfvpTcPQqCptkBoDANhOXFOWAiJMZS2?=
 =?us-ascii?Q?ANkLMtjER9A9QUsuw+fAl+FlQa99EyOiLmCRz4esWwESTsXKLWHX5mQcH2ow?=
 =?us-ascii?Q?eD46bBNindSC2Xakg9NkzTNHxP5EzC2lwfpRSIwm4kZS63WCQUTwyDjN4fzA?=
 =?us-ascii?Q?rguYTbYj4nARMxJEc3wMSb1t1IDl8hiFu69B2Rj1u60QjrrhchPCUmOZPyQl?=
 =?us-ascii?Q?iuiz1kQJHWX4kbP4VBmgNVEBshHapuIuLPcPykNsYSZgDqOTrVqMrvliwzxS?=
 =?us-ascii?Q?qVfRaiagnVHWsnuV0BsKV1nYrOZl8pSFpfFBVYar5kBXgGX2Mdq0m+DbslPJ?=
 =?us-ascii?Q?XlZAiD7aBWzUYolb/9aJfkipvlWeEbBdPJc3P+V8WWBDn8LBG7r+9fXyghuQ?=
 =?us-ascii?Q?mLQSzBPj9K6lDA462GIIo2yp0ldS4uB+Sre+LkXqa9SeewDYIt91l3keDrVh?=
 =?us-ascii?Q?Zgc5r3xz3vR/lW23FatC0x2E?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f169c0-23e1-496e-e9ea-08d96bd46a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 16:37:11.1355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HL75YBWRMMYpQyJzzZjTlRHp/Yn9SO8xzAcSLRjpLMsezLFUMeQy1mFSZB1DhcvVEBDJtIhwD1rv02PQ/KV/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_093718_884183_9F9E71B0 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 30 Aug 2021 10:00:21 -0700
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

On Thu, 3 Jun 2021 19:14:24 +0000 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote: 
> Source: openssl 
> Severity: normal 
> Tags: patch 
> 
> Hi, 
> 
> This is needed to bootstrap arc port. 
> Patch attached. 

Ping!

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
