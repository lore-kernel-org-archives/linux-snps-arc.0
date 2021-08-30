Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765EDC4320E
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C68B60F12
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C68B60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXepmx8+UdMWPCv3oCGrlVyopPyhqn2OzF+Qv+tcDSg=; b=VAM+QJbB28h/gM
	V9xMcBXaoecRUrGW1ocDLIU5cmfK70jIZmj5XSD9iyZYRifM3Mm0ttsecy+7WLLuWDcEPGK2ZiGpn
	vfqh4+0QgLOpG/4iPdZkO/Hs5jRMqjQGOBjJUJBoCz/WEqwqDY5qt9Q7Vni8JwRSx+mKS+5gcgnGq
	w8NtZsMzVhHRuPFjKy/I3O/hSxziMi53WCOqSVB/pgQymOMZ9wfnPSFlG1UYQPVDOF1tXObMEPEgo
	cvO2FnNB2Pn8ji3wZ0YeFPbLo8+AroB4I5R/4tI1EPBA6UYPMKpiHX2M+XcojEa+b2IgSyyjgDVYL
	71jo+oGJ7OB5zrWupjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkdz-0008iI-G9; Mon, 30 Aug 2021 17:00:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkHf-0005oK-J4
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 16:37:26 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E85C4050C;
 Mon, 30 Aug 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1630341436; bh=gICJWNEd0CYwKU+enrYPNksvSQc+yUiGCbCaM6bpHls=;
 h=From:To:CC:Subject:Date:From;
 b=WEyflTnNw0rep0QXnz2N1QQ8PwQ6ge5V5WHjj5UpPHNfk4baXD7FJF1fuNFEk9oMb
 06m2wIMEa7NSFVi4qiuwL3BZ53G959iaQT7/ry+lEOD6uzP/M91yyLb0FR+1U/JLGc
 Oa3jiet1agBFT9jDG62TXsu4JcZQcPrZr1BwPZs5+nbIkL8YeHmgcdyApXZRMybyUt
 74FZW6Mk387OrmaCnb/Ho/YzpApGsqv/Berp42N1nLxURc7WmxOpOC2qFAPMnkiUHb
 BvXxVy2WlLpm6imAlMyUpKKOR4DEoyZTQwwSHLKI5ny9LmNftqg3hZDyEJLq1o/HnI
 IQGwz84oBJgKA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id B13FEA00D4;
 Mon, 30 Aug 2021 16:37:13 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 779E8400B4;
 Mon, 30 Aug 2021 16:37:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ecQEGk/8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIpgGdlOatPkZqos+UOP5DH8v1/YDw9i0t7ZY65kqTMPTqGxgOwSO3crKsMYvFp3RNtv/WnUViQpzPEMDj31m4/GkrBbV0DeNz6a6qIeS1IME8ep2LkcLACPtUSKha8gg7oumbaUYYutSm1m4Y1Kox/fDumxIpYGvPGLSgooATnuEbXcHtRS85b5bVYe1KHXflw48ZBbTh0QNPaqWhYBX2f1ol3BFBm+r/9Dnqd+GT2bQdgmzcpxZRxkFXFzMM86RKyTYVSEuCRuXw8N/q/hsi3tcsQaSBpJgf5Q5LJqjx4tWEUW3VwVm6+3ASQyVJr8LTlsmATvgZdHz8ziRB7gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gICJWNEd0CYwKU+enrYPNksvSQc+yUiGCbCaM6bpHls=;
 b=HW24I2+cPi9BOWpi8hVwQE1meDeHQN7kq3WKsfZxiCYjk3aLlNBdiyBONB5K4ihQ5WqHGUdTqP4NgOsUM51bMeTsWuv/vvj/qcs4HN086neYKascsTVd/rWCQJvdVulnyClHLp32cXaU76iC3rM1qwdgmyplq2+Dha8hVw7/fKcK/qOc6cnhf86/mo/ZBJDNTG7DUtosczkahsd9sNqBqdiaZ/lajnNowKwPBCvb/Yb+qJCdFeI/SMlRqI/oEwneUMF0Qdt03PHzx7C/nRSCJtUyH7TbaxC+WBeL3Q27X5bXSb/Q3VOvzpzCzdZp3iUjWMaHb6uWExPinjVY/9pixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gICJWNEd0CYwKU+enrYPNksvSQc+yUiGCbCaM6bpHls=;
 b=ecQEGk/8s3XMAgtZ2COaxVTsYD8Mp5zIvaZkEaJesa4mNRell5i8E6ZpcobuONirhN5FwTlT03kKYKnSFbo07y35hjVco123OGKWUX62BRu86+wg2gOAXMZtUFcAzW2n2quxq+19B4HOr6LwwpxsWk40TUe1fdkmzAdGrj8iNyk=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 16:37:12 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346%7]) with mapi id 15.20.4457.020; Mon, 30 Aug 2021
 16:37:12 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "989443@bugs.debian.org" <989443@bugs.debian.org>
CC: Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: Debian: libffi: update symbols for ARC
Thread-Topic: Re: Debian: libffi: update symbols for ARC
Thread-Index: AdecPuDoaLEWvgNRRdKpgjZDyi3nIw==
Date: Mon, 30 Aug 2021 16:37:12 +0000
Message-ID: <PH0PR12MB5401C01BF2A23A42FF1C8441A1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0yYTM1ZTZkYi0wODMyLTExZWMtYmYxYi1mYzQ0?=
 =?us-ascii?Q?ODIzY2FiYmNcYW1lLXRlc3RcMmEzNWU2ZGQtMDgzMi0xMWVjLWJmMWItZmM0?=
 =?us-ascii?Q?NDgyM2NhYmJjYm9keS50eHQiIHN6PSIzMTEiIHQ9IjEzMjc0NjUwODEwMTQ2?=
 =?us-ascii?Q?ODM2OCIgaD0iMnliR1lUaXl1Z2Y1TEFOd2psek9JbGc4V2tVPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFE?=
 =?us-ascii?Q?UXdJL3NQcHpYQVhyaDNSd0krV2V5ZXVIZEhBajVaN0lOQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 625b1744-8eec-44ca-3519-08d96bd46b2e
x-ms-traffictypediagnostic: PH0PR12MB5450:
x-microsoft-antispam-prvs: <PH0PR12MB5450709969C2F415DF8230D9A1CB9@PH0PR12MB5450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhrhxqkXS8OOOZWvxbW1b30DqfiQ5OmSBkShi9HwHQ2bw9P0EtQZDHHFcjo1ehiFAlBJBgQlwJI7p6XeRXkAuDskXIRzRZ6ig10y+MDXr0w7iELt5IXBADLGW5rnkVt+LLcr3oME/KoUMDSkFBAeu6QrVnPlsZkRl3/jhoTb7HDiDycNc2Y98WTvBRyb4qRjjnRGtihNkghKxQgL9syM5UBwnCqB2b4B2rUIfPDCZ+bBB1Cn8IDNPdJ/FtYNMmrwL6D7so/2rHLzTfMj3ajSV17OVAuUA1V28ugfjA472007vTpAjQ6mN+1/OrFq5x1jwMvr6GijKNlECHtPQOD0WyiozP8n1xk2pKJ1JiQ0aGttZf0w5Y0OdY/X6Ava2mx519HDATQqU1Z+lvJBtSq/gaVADawZChYypj+q4oB6+xX9SYOfV3KBjAFw+tC4DCcRnTnYCWuZ7ITrszWlTbT414hf4qBcCPXPAfxmVPdWwcGZx5KKk0UZE4KQh+rCGO18PoaLU7ReFNxVjfVz7ylEGPzND/m5F132VkJKI47JFJrTgXXHaYdK87ckuyp3DUEYJ3RsJVNOcX/tzOB5NNB3qaGJV1f//nXUST7w/WKsI6xdZL/tusIpC5fCxF8dbk76vDsZJpg626RmRuQ8+RE6dW9T54ZCEVP8lQVOpp7Z3mOLjgUHSXYm/pP4TEW+SzB8h5ipdNz7rfspjr9Zox5snA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(55016002)(478600001)(76116006)(64756008)(66476007)(122000001)(66446008)(52536014)(38100700002)(316002)(66556008)(71200400001)(8936002)(66946007)(6916009)(2906002)(9686003)(6506007)(86362001)(5660300002)(33656002)(186003)(7696005)(38070700005)(8676002)(558084003)(4326008)(26005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PnEiK9kzEfR/VNCtJKrfQY+zO4OAprxC+ddhA+9wF15L1fRwfUDYsK88bHLC?=
 =?us-ascii?Q?ZmFoF0tZfFDtRNm4WfOm3ES83VzIh3m1IHyiF1mngRA0dn1NCQcflYVfzeS4?=
 =?us-ascii?Q?c6dk0cJmYKeiAVRgAKqxO1AiUkz4tevovzDg5DDk50fCyPBA2ldkouUUi8jb?=
 =?us-ascii?Q?RRMOWGa4RNJ0jXQr/ClVgjxCQPIXNwpqmIx3FslixLqODHtelL7lGGOoBBQ9?=
 =?us-ascii?Q?bcvlxhaxpOSx5Og9LIw4ff1wxinmngSIyKs+9yu72sEwRVSD48rbO5vtZaN/?=
 =?us-ascii?Q?MJtC59fbgQlmZ8K6a1xfGMrRifIxbPXg1o9l5BBLXqgDu18fFdt6pwk9PxrY?=
 =?us-ascii?Q?eN0g6i0ZhZ73FOswj2J+AVSw1Oy/E7HfgugC3Yz7HokYu3hZdW19s/aAO7Z/?=
 =?us-ascii?Q?gPEIJ3Z2bw86ymOEV1l1Ks9FMC8v4S4qqVfsnYL0dVjrK0P5mcQoFQKBzRKV?=
 =?us-ascii?Q?WrD0wDY8gb3dzJcJTOIHgPQxpuiWDXLuCa1JNitTIWgsnMV8lkRShfUQtD1C?=
 =?us-ascii?Q?TTV0CvT0Kb5xARFZWEA6P48e0gYS2l67TVTexyUn2AkJiPW8+SX27oukugEP?=
 =?us-ascii?Q?tyiheSJQkzFWFMDm2OpiELzvK0El7iuKVzE60vZlAysaRGJH9e3wm6FbGl6z?=
 =?us-ascii?Q?iuaszRhc7jvw0k+vzxAKWj9ZItW8hQeY0v95TjReV2mE2OrqDsG1RHniL6Wb?=
 =?us-ascii?Q?+RfIoEVAA5OwBqlPbFvdfy09u+Eb/qaeEeEoAQ20hVvpZkJQiOAFhd9vkRwn?=
 =?us-ascii?Q?jQUwDQFhJHBJd4nYeULPYOaDNJW2Li56ipjlC8S2qnUX0VArPNuPrhp+wGdO?=
 =?us-ascii?Q?2G2PmaTjSAqbKMvuPVeQYF24Wy2ol0iz2A6cl6Tq0uRjJn+7AHdy2c1Fc55R?=
 =?us-ascii?Q?1zghYs2OdceHt4ByWiemu2ux/fLBO20LrTsnFFRLraKhpxSesro9sQzDcZYr?=
 =?us-ascii?Q?f4FgzOkcxjbdJD+U3qieghw56+z5LqBXxP4XDgI73TgIm32oQhrNXOVEmXrS?=
 =?us-ascii?Q?u2MHliQCtU7PtUaFtLnPqkyQ9Naanci1GDe5p0Zjw7S5PRXzCqY7fhpYR72I?=
 =?us-ascii?Q?gK43JGch/X6uCNygBMqZ83zzPDCRkDKGN2wrvLTzrKNyzWRBKi8oUpuSPqS+?=
 =?us-ascii?Q?nZCBmmq3XnQBhH0sbfh1EYMg/v0ULLqHIihF9MLzw5suud9pO+RsJkHk+OBo?=
 =?us-ascii?Q?d5vKKIFDVBVbP0MfGKrPJvjVzzi/qLtJ8RYF150iH015Ovmi3pvfUIU5hdGt?=
 =?us-ascii?Q?mOwDJ+40xYSLTKqHrSnNiImkZ6aD5odROsmtA+/6JRd3biYVxX6ybiP8iGrG?=
 =?us-ascii?Q?a3iWXrrzZWwoSeK5AekAc9X6?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625b1744-8eec-44ca-3519-08d96bd46b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 16:37:12.3471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUvycX891j3CAG2Wm7NLESeomtwaLQvz05FXVtcZ59+8f8+w3Mvzj4R1LxCujYn1Tt42PsRHwGRe9Bd7eyfTfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_093719_700929_81D5ADD2 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu, 3 Jun 2021 19:51:25 +0000 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote: 
> Source: libffi 
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
