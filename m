Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEE4C43214
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3092A60F5C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3092A60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GTM7bKIAocjRYSuuSD75tjI055xIiXKiD43fJMVcf/o=; b=4mVfw2pldbsSH9
	pHExG7+u2TheLNarbmQOtC27UQbBtgn0id0dLR0mWLenOQXHhgMWJiarvqDeYPu00a2NLyFrgC+v4
	NBNMDfTfDZ5swIHY+eIeZOuAUFpMT87CFnurQpZ7T5F4Xr6SG9r56NnwlfWxaAgMcjEIFosEMP0bA
	mruLynpTqsA7GHj10IZuLxjE0RE5aFkZG2ZXFTpNrddGiVuOZSnQHcj4+JcxgYLyxqgfoGN1G8Eqp
	bn7jRstcfEFpE8fHI7HbNWRrI5xD/GocS0pKXR9TdhzN0a7KdKx3bYusRr2PO4KyTpbtRW1h5bR6N
	ynIfcHC9CHOX4xRjgvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkdz-0008iV-OT; Mon, 30 Aug 2021 17:00:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkHf-0005oL-Jk
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 16:37:26 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 281814054B;
 Mon, 30 Aug 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1630341436; bh=afMxsXIkR/cWFwD4IiYbEAabpWYiBhfcEuVEqFeTyO4=;
 h=From:To:CC:Subject:Date:From;
 b=i0BTl33IQ+0lj0Qwg7kwkI/3lK+XPMwiKvt3nsEeaaTSv64iNbD15MivdaUeHWPGn
 KpsYK6q2bKpgKxeFgfjRDxoFLMv6dOTiPoauPuM/MRcRYfT0OJHDMPOwYk9Al47z4i
 N6qWU3m8mh4Tgz4y44I8V06O0E3avElmKamM3RslZ4KQYJpAP7KAllMQAY/JUrKJIV
 j5+XJ0p+4lG26nU0Uw0VUTkYJ+x133ZmygG45gY/tXdayn6t0DfLVHPmaR3qrTbIPB
 cjXwjvbJWXHonZ/2QG9tOOF7DHt/KbcqN32n4bgp4BSsk4IHRkwBno7s8UeH72s3pP
 l4aQXzI8VpIpA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9ECFEA00FB;
 Mon, 30 Aug 2021 16:37:14 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 67DA940119;
 Mon, 30 Aug 2021 16:37:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="nBPN6LFi";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRiQyLghZYflp4H4nU3g8zDVcrjIUGoP05pv0/MSFZFSvY+kHBHHodFSDMJMFWhNK3d7sokg3YZXqi25RWoFd8rlrEoUPeCmoKbHO6j95OLH1IIRdQUeHuC8+BX+Y0rT2QJypqA4G/cIApGWk3SvdRrk3yGwNEx3OGBdr7D6zXUwaH4df05MYV0Qfd/z5XlJ2JUu4XvCvq7kG5ZxtxA0p+CXfaid3F9gqNt/xdGRahKe2Spxj29CTajXm0McD7ME9o1zzRoc5BVnEHZYOSwGfEBhVtFmUTQPBwiEnCI7TI8GlEsKs3uUUS2JOCCZIcUU+lf25kgagpbPTDmhyCXoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afMxsXIkR/cWFwD4IiYbEAabpWYiBhfcEuVEqFeTyO4=;
 b=QTg28/3olWQHWE02rR79P9jjZtz7iXS2y25FEgDEFzmL8pOt7GTXsc+39IcWJrllMgrnOhWA8vs5/NIsdYrUqCXVwLjKKkor0UlUSxrNUwhz0LanGkwkHpfQUKE0dmketSA1nB9fvEFMBxH+wwcVhXZPuu3tt1PBq8si4iBuSVfMhNCBhXXOnh5Z+GcPu2kLkl7Z1CSA0ACF+K4aKAlAgHUPlheWZZBFEaVwP2TiktGB8bydlZeuJ5sCyyldiOuld05ufVbVvTtpf5Wfr12Ys6vHpVGSXERo9154l1gWkodGF5kSHFRVrHiq7iJWhFt8tJPBMStV5q1Icwnz2HGu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afMxsXIkR/cWFwD4IiYbEAabpWYiBhfcEuVEqFeTyO4=;
 b=nBPN6LFieBMDJuERl9Y2OHsgJbnnfQp3+jHjEJH6BV0A3tNiTmTSY1qgesIdxDt3XcTu7hLZsQdaF1UPomGIYJytKvoTIwRW05e6e81BbVALjD9R6r48iOnJ1EqPYpb4YfYlAspRHdRO5XYHiHkAds33onVgNAMlKrEBhmasIBA=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 16:37:13 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346%7]) with mapi id 15.20.4457.020; Mon, 30 Aug 2021
 16:37:13 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "989444@bugs.debian.org" <989444@bugs.debian.org>
CC: Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: Debian: jemalloc: add arc support
Thread-Topic: Re: Debian: jemalloc: add arc support
Thread-Index: AdecPveNGf2t94bcSbi2kpbjlXoeEA==
Date: Mon, 30 Aug 2021 16:37:13 +0000
Message-ID: <PH0PR12MB54018BF73DCFFF1A80DB4931A1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy00MWUyYjA0Yi0wODMyLTExZWMtYmYxYi1mYzQ0?=
 =?us-ascii?Q?ODIzY2FiYmNcYW1lLXRlc3RcNDFlMmIwNGQtMDgzMi0xMWVjLWJmMWItZmM0?=
 =?us-ascii?Q?NDgyM2NhYmJjYm9keS50eHQiIHN6PSIyMjYiIHQ9IjEzMjc0NjUwODQ5ODU2?=
 =?us-ascii?Q?MTMwMSIgaD0iYUY4WXl5UHYrb3I2OTRSRU9zYThQNmhyanFrPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFB?=
 =?us-ascii?Q?VjZUb0VQNXpYQWNwSEt4b0ZvYUJCeWtjckdnV2hvRUVOQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 828738e4-2b45-4f4c-1b65-08d96bd46be0
x-ms-traffictypediagnostic: PH0PR12MB5450:
x-microsoft-antispam-prvs: <PH0PR12MB54509A2D232D6B0BA96217E9A1CB9@PH0PR12MB5450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F+1hjMd5oOs6X8qs/2t7lNhWozWgUhBmvxLERVMxMA9DPlcDTC69Z01uuGNqXHRQxyxeh7bSW403eAwy/2y42aryztGhJCnbYB3rX2u2ZTcZjL4QHiuL+HAJWTpT0ua5XfpbTwOhD0waIOoF3YowyW7Wsq9dBQeI8KswYnj2ilJw2It3qIRiEyUV/aRUBV+t0pP5uGFocrNHnbNdN/eQS0Yid4/AX0ZlT1WfpAGgaVT2KRmIIMKdaHHwWei1QgQBt9cOS3lI3P/vrV1PDA1t7ZlubIabrV438C5jqxwoj3Zd2In2HaVtdMXxcTC/UlQ5A2PXNwLDOCKSTQY2ydRE5r7ly0srYLQ82RP1rBgGx/S6EDuT9ZzzmkGCN8Xhcn1YNkO47iFCdBQJV1pO8RjrrngLikj7P+wTLkZcCXHDbIKnI43WcbYQQYmFC+f9dTmGDYcdzsHK974XDAs8VJ8eweT6VuRuj0ozSVGbtLjoCeRjwwKhTSiL7NGTzDVSX+ouJU7WNvOjUbpBtGwa9v0v5kVFMfzMEFscZiRjs1sGH66ImY2SVU+jPZKMO+GhT2CfoaFfmHEgJ2W4JV8QvIbctQxmj3hAAXo9o8y3oUnBomdwkMMkAzKfJ/YnSr875D3ryW5drSoOYm6GzRXlCf6TxoBAcspS1vdxQRndXGCgm++pmH2Oz3AbP4cPZrx+OUrnrdN+EMKMsY4o8rBBYWdM0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(55016002)(478600001)(76116006)(64756008)(66476007)(122000001)(66446008)(52536014)(38100700002)(316002)(66556008)(83380400001)(71200400001)(8936002)(66946007)(6916009)(2906002)(9686003)(6506007)(86362001)(5660300002)(33656002)(186003)(7696005)(38070700005)(8676002)(558084003)(4326008)(26005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i0NMmzBRog7vRAnpiincxKZScGahbBPCTQDIk/NcBTua478X7fmtFzwzk6EQ?=
 =?us-ascii?Q?1HY3Y+Qci+w+YPma3mUVuRwoaq/Tf1Ci7ia7IoBZvsnVfwOTh05jU9qlXnnv?=
 =?us-ascii?Q?vM2O4kmRKi+X9pkPBexmPX+s8qfKPUUVPNhas3XqVtMDh7FX5tnFR9xuAEDW?=
 =?us-ascii?Q?rsdwbdCp76FHJBJP4i3Pk+cHUg3w+im4FDTlZZtsWfFOam/pRaAtg6/h/w1G?=
 =?us-ascii?Q?1eRWGmtlrBZSNHr2QKeE8xVzroNu2DvAzR8AzA7y2/wuP+wFporzcgBFUEVr?=
 =?us-ascii?Q?qitZD8zX/XXpHktqeyhrjI54ZFPRS/RjtfeVt2kqMU0NwBexfC6i5XVDDnDL?=
 =?us-ascii?Q?+TblLQ1735KNSdgmIrYFpexWzkpD1a5QiWpztjTfNbEyqocD7NGMpXm3E9aw?=
 =?us-ascii?Q?Jn3oh1gEpPVjVAZfqK49MlwdQ7XMVBGxWTJM9Ndg0zWPj0Qd3vJqty0nohA9?=
 =?us-ascii?Q?sV8NsTS3pGNzs/Lie1gNws94/HcfZdS7wvhXRFagfFxsfydDLm6ayqPQu/OE?=
 =?us-ascii?Q?V0LNw0z/xFvGRoD+ZmMGtVZsr1yN8cYTM9p2Lw9xtWUGppjSuRWyhBwfVT/7?=
 =?us-ascii?Q?3zcEKjufPXmc+uAnEa1/ftjHDFNM6brArx06xUV2PNpmP3Fko7Gcza1pcZeW?=
 =?us-ascii?Q?D88CWDDmrHTmC6QpFT57CmMuNGhE6uaQH7v9CkNfyZrlIPohYRGxlY9xnEX6?=
 =?us-ascii?Q?dp6OADsG5bHvuKWcLu3kf8MBLExMWhuiOSCspOIsQI0rMl5z7T6cQUu9xuL8?=
 =?us-ascii?Q?vnB9xOuhewWlza/W1DBp/F6zP3y3XkHXegArQZYAWSuN+WmJ1043z/jiVt0e?=
 =?us-ascii?Q?U5s1RNGsED24BIQyCwZa8+pXJGEMFN6g9KxRp3Ol4Ucp87mvdoGRWgUmaKs9?=
 =?us-ascii?Q?1o8psxfTZtafzvmKZR8UGdo7ykqoKy6FEZRpeVO8F3cJfkliRu6H3a4oPdC8?=
 =?us-ascii?Q?ng1RMyYA3PjuzLnTIUAP2vHU81bpyHtbzXrcQSXRLSkhjHN80ImjNzBK28oX?=
 =?us-ascii?Q?UCLJosR8d+Og3LQ29uB4Bl/6zKCv9xT4PocrGxdDohZfV7JAQfbHNJSRNU+K?=
 =?us-ascii?Q?Wgdn6bVReumnDB5lOXdcZOSHXFH6KTXhNdwoo+SHYEE9oBkh6bH6F3HfqpJd?=
 =?us-ascii?Q?mgWMaBpp3oMJTF3hEuDukB1VjEBJ2lq7pS6jc8Z6uIFuA5AzwykD1QrFw+nM?=
 =?us-ascii?Q?MKJEX69jExEF5ZJibuQrU2WoGXRbtoXeFhez5Fn2+RzP9vKvtrT6ri8IbKIw?=
 =?us-ascii?Q?VqmPgJfgipKx/PZ9QVIDmBdda5Sp1PZpNKGGysu6la4EN+Myb4rxAEB6cXco?=
 =?us-ascii?Q?sgQ9Vmu+AUeuLF78LXz9g+g3?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828738e4-2b45-4f4c-1b65-08d96bd46be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 16:37:13.5519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1drZwoTLEHtpn2pwKzZdQRdHNZYY6/dtA8x7n5ufVgAZ7etiMJcLhCc0cOIKscEC1cuaNPMdvk1K4FPLDmQoGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_093719_701265_A44DB428 
X-CRM114-Status: UNSURE (   6.90  )
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

On Thu, 3 Jun 2021 21:10:28 +0000 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote: 
> Update: upstream change has just now been merged. 

Ping!

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
