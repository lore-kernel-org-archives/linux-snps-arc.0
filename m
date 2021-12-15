Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D4C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Dec 2021 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tofkvDf/2j5TimdazZBM5oPFLjPryurb21sdoYW7jO8=; b=VEEgwqL7EMGge/
	MLEt6U0m1XaIE45GQ9zwQhzG31uNvBK9U9Rr/k5k8IR5c3tgC+U8LyqUNtm1fhrc9zxCVnz7v9/TW
	QA9q0gXM1H4ntoGdEmrS7+OX/2am+saXOilpMO4uh2TP8Qzr3SNhpWv4ztn8LrBjAjgv4eMsQ5TmE
	r4kju7T9FmNJQpdNHJKXjY8Soalski1svYqCVUgKWFQCG1fVMEz4s6WR+Ouemt3wXDGk3NQs99NBm
	nXtcNHsmXzKY053PvbU96OV5IEBkvFjZaNC09cZKfyZIv/V7GocSXLd1CJtoewZVfV7cdYyvs0POU
	LLzAQ0h8+cnEkRdguSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxVUJ-001BFU-CQ; Wed, 15 Dec 2021 14:42:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxVUG-001BEF-M1
 for linux-snps-arc@lists.infradead.org; Wed, 15 Dec 2021 14:42:34 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0A4ECC514B;
 Wed, 15 Dec 2021 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639579349; bh=yhr6vtc40pFMK36Iyt03ryoDlIHg96v+j4NYgFyvix8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eXbYKbP70vb28PWcizXiMFsaikQAoV5vKQJU3Y3b+hliiL67Dz6E6XEjgLkGFjNyy
 JVohlddEr/Ne8K/yRoX8uI2udT6U2mumbzHxO0bzlEdIXYc/rJKveX2aIQkBAiSqz2
 pXJLDO8YBWymKziVicpuBBmo31gswcjJbJbLJA1v8Cf2hy9IJoyUEqY+54r5jdxUv/
 JARaMcyoGA//twWAoKQNbFa8nmon1L2LC1N27stlDdWwOe5PFnpEWTpxq6HiuGTLHa
 hewNIqRyDS1qA8lOKr8RtgsMyq58vgrQGkuRhVaU/FH75AhdOjRAlorCgvJ8kofMy6
 XpyPeZsZu3utg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9B459A0071;
 Wed, 15 Dec 2021 14:42:26 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B4CF14009D;
 Wed, 15 Dec 2021 14:42:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=isaev@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KKhnZ2V3";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe4YUysyorKrFJ+zZ+9Co1oo+++SxhFKHzrpSkenq6YxlzZOgB1VPIMHvnfpMLZxPaYtBQhhXxjHQHd1t2rWdSvO5/F7y7xykUMuIBbCAVdd110aKfOEtMA+i7f8KuLTgO+RfCzu7LrDB5bLvnmjj6KgAgq//R7OJsfN6xogI4KHJdzdLp07nz4ZYv7NYoWRlh05Gi5nSIf+JuoPgS4HXSIhAbbW5vdHGYBoHy5XMArn4ls5H2JZv7BFjrOlpGURQq99+jYMosUUJkIFs8G74GHVDPAPAwxPWEEqpro13veZjaz7t+r4YM5FA7NLtotnW0pl18OgyF8GuE1yWyoXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zMrru3uy3Gjocz/QLJhV/WLSKU9s/PzsFEvKFWvG9s=;
 b=gYJfeFO7vyuBxPfSN1JHxU77VkQpghPOCVLM87DGG2bkZD8X8ENqIoKcgdj2Ztk9ueRnoYB17it2TnCuzX8AZtHDXe13JUsvm+nNHK5NGYWt3KFTiLLfgppGHtIRlKvBmZOmRxyT+sKncmaBZyqpp3vm8Z8ZSRuLwuIHGGyiR+DyGhJH3XUe2ve50MstjGBtX85Qy+K9X2zg186c4sa3UB8kWFBYmPw8aR94FRY2CgVf/4eWO/qJhkpDcrdY6Xj20y8U+jTuPT1yhHW1ZlS26u9VvVC6bsHZdFn2JGLWbcp3A3UIb1smREyy8lRwUVmOargAo5iUDPmFtayvssgxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zMrru3uy3Gjocz/QLJhV/WLSKU9s/PzsFEvKFWvG9s=;
 b=KKhnZ2V3BCXRLB1mYl/IbPFvntk4olIgC+52iISIstJC4IHMgFuj4lJAU4ePvQgPUBGCnRgulV7RZACgMCe0T5WXRKTKl3Nl7CuI34Yipd2wF5w3kJLwn6kCKZJ89hSuMlFUbi0QMgcyOplxzYqhin+0tyZz2eoNltG7eIeSIWk=
Received: from BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 by BYAPR12MB4773.namprd12.prod.outlook.com (2603:10b6:a03:109::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 14:42:22 +0000
Received: from BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::a179:8d3:ce3c:a83a]) by BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::a179:8d3:ce3c:a83a%8]) with mapi id 15.20.4755.022; Wed, 15 Dec 2021
 14:42:22 +0000
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: Barbaros Tokaoglu <btokaoglu@airspan.com>, "vgupta@kernel.org"
 <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: "mkeskinen@airspan.com" <mkeskinen@airspan.com>
Subject: RE: [PATCH v3] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Topic: [PATCH v3] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX8b3aeDHWsd42pEWMGF591hSLt6wzn/tw
Date: Wed, 15 Dec 2021 14:42:21 +0000
Message-ID: <BY5PR12MB413147725A8AF16A9DF56304DF769@BY5PR12MB4131.namprd12.prod.outlook.com>
References: <1639577553-26909-1-git-send-email-btokaoglu@airspan.com>
In-Reply-To: <1639577553-26909-1-git-send-email-btokaoglu@airspan.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcaXNhZXZcYXBw?=
 =?us-ascii?Q?ZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5?=
 =?us-ascii?Q?ZTM1Ylxtc2dzXG1zZy0zNDI2ODAyNC01ZGI1LTExZWMtOTgwZi05NGU3MGJj?=
 =?us-ascii?Q?MWZjM2JcYW1lLXRlc3RcMzQyNjgwMjYtNWRiNS0xMWVjLTk4MGYtOTRlNzBi?=
 =?us-ascii?Q?YzFmYzNiYm9keS50eHQiIHN6PSIxOTEyIiB0PSIxMzI4NDA1MjkzOTcxNjIw?=
 =?us-ascii?Q?MjYiIGg9ImJBOTcyQUllTlM4SVBCUExtQ1plUzRsZVU4QT0iIGlkPSIiIGJs?=
 =?us-ascii?Q?PSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUhZSUFBQXFJ?=
 =?us-ascii?Q?SDcyd2ZIWEFkWTdja2Z0eitRbzFqdHlSKzNQNUNnTkFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFIQUFBQUFHQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFRQUJBQUFBaVBXVTlBQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0FiZ0Jo?=
 =?us-ascii?Q?QUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFIUUFa?=
 =?us-ascii?Q?UUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVB?=
 =?us-ascii?Q?QUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3QndB?=
 =?us-ascii?Q?R0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFB?=
 =?us-ascii?Q?QUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdCbEFI?=
 =?us-ascii?Q?SUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4QWRR?=
 =?us-ascii?Q?QnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0J0QUdr?=
 =?us-ascii?Q?QVl3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFIUUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSFFBY3dCdEFHTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRRQnRB?=
 =?us-ascii?Q?R01BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdjQWRBQnpBRjhBY0FCeUFHOEFa?=
 =?us-ascii?Q?QUIxQUdNQWRBQmZBSFFBY2dCaEFHa0FiZ0JwQUc0QVp3QUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFjd0JoQUd3QVpRQnpBRjhBWVFCakFHTUFid0IxQUc0QWRB?=
 =?us-ascii?Q?QmZBSEFBYkFCaEFHNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCekFH?=
 =?us-ascii?Q?RUFiQUJsQUhNQVh3QnhBSFVBYndCMEFHVUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BYmdCd0FITUFYd0JzQUdr?=
 =?us-ascii?Q?QVl3QmxBRzRBY3dCbEFGOEFkQUJsQUhJQWJRQmZBREVBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpBR1VB?=
 =?us-ascii?Q?WHdCMEFHVUFjZ0J0QUY4QWN3QjBBSFVBWkFCbEFHNEFkQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUIy?=
 =?us-ascii?Q?QUdjQVh3QnJBR1VBZVFCM0FHOEFjZ0JrQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg=3D=3D?=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0e28525-97e3-4b53-486e-08d9bfd91a77
x-ms-traffictypediagnostic: BYAPR12MB4773:EE_
x-microsoft-antispam-prvs: <BYAPR12MB47735E326C4CBBBCDFD597BBDF769@BYAPR12MB4773.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k5YpA4BgXTiwPoy4KsaGhe2CeU3U0xeS6JJZagTFUkQOgqOyLkGRbZBXVSNAd0e6isHMDZ+7ef6VdQf3+81DiJeBJzzJYo7Js1lTel4XuBzVCZe1wcMAKFmkfN+Z6ojZ41ScELnJIakF9jOjq0aLMW+oHshflS7opq8Ziycp+dHX6I0cigpqpYiGEBbN2QwLQ2qLJ3dpq3sKT51Jc/yKV5gfHUZX2QoTPZ9Olod2LB0PE5ER4A4knCuTQvPkvV2jclpkBv1KMDOaibX2vvgkzit6L3xKiedA2SvdP4ZRXhKqig7tH9YvaiNO+ocSQ9CkFCg8o7eCTsV2KOpWyTBNbp1AIpQ6qQmWwzdtB1c9Xmeu5WgxCnhR5hJlRRFYZjj9Zp82gYZg1p9yV/jbkGLYhhP78PcklCbveD+5DmVI+/8ePKpqQGbCs8lohxzIy7sdlIrkDKjGmxPBHEZeRuHaaJXIWwpFv/U3p7l/+5OGAWTrxeqCROTbfs90zhzDky0QLrmbWJ2eoSlSu5KDnRufxTRQyKOIf+slJE0bOurWeXwc/2cK8wuS5VSpEQQ4vnqqOaR5n7W+D643m54+ldQSfnjXUQWGx/1z5yOrGRBszGo/9BCHdExV3il56BrZUraRedDZGU0do1gBXWCkDrPNTsXvZQPG0uYnNWIp4/R4/XyfhVTuIklki3v4rQ22H7Ov987FCsIQJ31tuwJQwlelUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4131.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(64756008)(66446008)(9686003)(76116006)(86362001)(66476007)(4326008)(508600001)(66946007)(38070700005)(53546011)(6506007)(26005)(15650500001)(122000001)(7696005)(38100700002)(83380400001)(186003)(110136005)(316002)(2906002)(33656002)(8676002)(8936002)(52536014)(55016003)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eZWV4stitCCK4/Wnapfhv3cr4qkPnGvDL0EIKe5LeH2C6288in1myk9jn68z?=
 =?us-ascii?Q?NsFzswtOxqWv0kuejVSkntRKB01yQv6DemAc49pM7M/j2mZUI+RYBihdr2cU?=
 =?us-ascii?Q?g/+8PbuqxuX+bg+tg54ipVXG2CKCbu7xtW4JC6/O2VMadzDvR4cfyH2ttW8J?=
 =?us-ascii?Q?iVcX4Cs6sIZw3XOnZZAA0ZKbYhciRGiUIk5/erLws18+l06XGkvYLyslRfxe?=
 =?us-ascii?Q?pI2tWlsCQycHKUaPUSgPiiY+Z9UOrTEBPil28eWlaUeC7yS69wic4SN9tCp+?=
 =?us-ascii?Q?yT3tT+Xu/5ZQhiQ/TZ+cGeqzMLZgTApCmliINMLjTwGxT0pTNAwrBKoec1L8?=
 =?us-ascii?Q?xWpspnc53OzrPaP0LGGEBDFd4373OAU752GAOIv+7tl77ivYwntImWsz9R5G?=
 =?us-ascii?Q?k4cSxXb+VQPzvo8f+OLWV6yWPQzZsT8kmTUIIOZfskXy6SmdjolbbIA/jB/v?=
 =?us-ascii?Q?McUaZ8cdWL6sBo9uR0OSx1YIRXPcAlMGAvCuA3PUsDhga07TmE6V2OEHJx24?=
 =?us-ascii?Q?9V60k8cHlmtMmv+6/5wgz2ZHsPTQHmfwRYZ65fnHr4HTdLXINVvfWIUDesfa?=
 =?us-ascii?Q?VvACNeoJNhyuzUFzPWYBxbB3MksZa7oUbRK9+Xa1wi8ghkuyhRhzZ4xSjvzW?=
 =?us-ascii?Q?oC8sKvS8n62QxbZb8qUHhcv+wAqVheQj9+xMCU+d09Gklz3KA9pRPAls5+Pp?=
 =?us-ascii?Q?d7WjNrxkykHRNKiI6j9qFn2UzWdeuelR+tQmziuQRl7fPYOkopRhskgIRGcU?=
 =?us-ascii?Q?uAliHrcD7oJ5Uee9K++C4yQLWFLlpT6RCXWozmB7OSD2tRjik465W8zX0bGF?=
 =?us-ascii?Q?blqg5LV14ZXpEBQ6sm9RySIE+HZC1ug1uFoY84c1HqB/d3TOYfd20OuWiLwa?=
 =?us-ascii?Q?0uFB+ErEETYyXkzqKyyRrjYhVZSBvqpsy7Y3gQ0fBBagDA0VuAQLQRkKh4Wu?=
 =?us-ascii?Q?1VSL3VSFSqTzI9SbP9SX30skqD+UeBYdfEARDsL+yhNS/WwyldCRq38LaAr0?=
 =?us-ascii?Q?7VXHh9YKOvVc7chHaVFDrKNwa8ex69CVupvd7f4cjZ+bgW+0XMVIsQ1n1nOM?=
 =?us-ascii?Q?oWTUSgMKRqeYwp7N83o+RrzT5yUARJ/WL9/JHgz8f2dQalXsfwHnswmEBlyc?=
 =?us-ascii?Q?A068nnhMRuLjc9Xa6QGZ/LDFkyZxcpbiVzP7bYqK0Qz3tqf3GiEEv1iPIIC7?=
 =?us-ascii?Q?+NCuaMh9Svn1m1pPvgOISUjZYh5x+nRjrbyywGIrQ0nOzDDnfdnUmnmItfny?=
 =?us-ascii?Q?8ljfdO6MvUomLMLn2BWognvmYTMN5/fWdQh1juiJSkkrh7zZauW67RglD5rI?=
 =?us-ascii?Q?iWHGK/K9gJpb28O1H3vZ8sirsFKukqRVzscMbSIjvRLcNyrhULGlWlnk31zC?=
 =?us-ascii?Q?79GudxHcywtr2W5yhWkJusSMp4RpjXQuROaGX0fX/bDSK/wIB+w77C3+UnOT?=
 =?us-ascii?Q?vX2poCgnhcaKtARYm+KeMBvTCm74maoKxy0VRhIItigNZQzTY15Rzvfh8omM?=
 =?us-ascii?Q?88I7P9U3+Q9MGCnqYraAII/7g+dUqLAQokkZQfi6/8Oa4VwcXw9QsHP6d46e?=
 =?us-ascii?Q?hbjdn8Z0CWstkwQXdXmOjx0nv9AM2QJUdkpZhaBfdzKAwfk+q7DtLUBYBIYN?=
 =?us-ascii?Q?tg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e28525-97e3-4b53-486e-08d9bfd91a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 14:42:21.9442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5xqnBxcYLcKRA5Sf2jD6USUr2IqFhoJ6E3UIy8AmoyNpGvWQ6Cd3lam9B6M5QtNEeXgLBv9rFSMP3LI4F4VEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_064232_882667_4E69DCFC 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

On Dec 15, 2021 5:13 PM, Barbaros Tokaoglu wrote:
> For 16 kB data cache with 4 ways and 32 byte cache lines we have tag LSB
> [(128 locations for each way: 7 bits) + byte offset (32 bytes: 5 bits)]
> lower than page offset (13 bits for 8 kB pages).
> So it is possible for PTAG to change even for single page loop. Hence
> update ARC_REG_*C_PTAG register on each cacheline iteration.
> 
> Signed-off-by: Barbaros Tokaoglu <btokaoglu@airspan.com>
> ---
>  arch/arc/mm/cache.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 8aa1231..d0875a8 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -251,13 +251,6 @@ void __cache_line_loop_v3(phys_addr_t paddr,
> unsigned long vaddr,
>  	num_lines = DIV_ROUND_UP(sz, L1_CACHE_BYTES);
> 
>  	/*
> -	 * MMUv3, cache ops require paddr in PTAG reg
> -	 * if V-P const for loop, PTAG can be written once outside loop
> -	 */
> -	if (full_page)
> -		write_aux_reg(aux_tag, paddr);
> -
> -	/*
>  	 * This is technically for MMU v4, using the MMU v3 programming
> model
>  	 * Special work for HS38 aliasing I-cache configuration with PAE40
>  	 *   - upper 8 bits of paddr need to be written into PTAG_HI
> @@ -268,10 +261,8 @@ void __cache_line_loop_v3(phys_addr_t paddr,
> unsigned long vaddr,
>  		write_aux_reg(ARC_REG_IC_PTAG_HI, (u64)paddr >> 32);
> 
>  	while (num_lines-- > 0) {
> -		if (!full_page) {
> -			write_aux_reg(aux_tag, paddr);
> -			paddr += L1_CACHE_BYTES;
> -		}
> +		write_aux_reg(aux_tag, paddr);
> +		paddr += L1_CACHE_BYTES;
> 
>  		write_aux_reg(aux_cmd, vaddr);
>  		vaddr += L1_CACHE_BYTES;
> --
> 2.7.4

Reviewed-by: Vladimir Isaev <isaev@synopsys.com>

Thank you,
Vladimir Isaev

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
