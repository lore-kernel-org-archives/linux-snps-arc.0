Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14776C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 12:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B5B2073E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 12:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UBQDxnmt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ogk1q58l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l2FoHd8M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B5B2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFnNwjVKWvP2FXZkAeJ17qMYMfLQtc333ibY95lZxYs=; b=UBQDxnmt7+9MVm
	B5wcb+GrtaUE3sRfMKdIP2HgQPDZ/P89KbFcSGWecimJtbP1RO86wTYkif60+scVfXn3GNXQSTgEg
	Z5HucgbSO+pG5EYK0KqHc31GYryCozZ8ATOKUWPdmG1UN8ujP6HMCSN+Mj0dObKNlR4JunoSgmyHo
	0c91YEK+NyyYcndDMBhs/7YFFqfspB075X7jS1PyU5t5bxW+y2R8Mj3iLcJN1Q0jseThe22InNT25
	iskWcTU990Kbh3qJnkvMHKBDayd7DEWBvydwHXo9XbSt2PRn+NuEogPC0WNjGDOHslLynx7JIUcT1
	J+EDsKthLh75WEp573Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHS1V-0002Z0-GO; Thu, 26 Mar 2020 12:54:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHS1S-0002YG-Kj
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 12:54:12 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 969C6C0F72;
 Thu, 26 Mar 2020 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585227246; bh=WB7YXj/sG0Gg0lIG2zSg8riSuD1gvHEAEzHmBWV5Jq4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ogk1q58lkQnZM5lNY6/m28dmp1xl1XP4qmRSGYM67WKFoOWmy/fcU67cNAAFYUNKE
 h2ioMUrDN8ImZYWUiYlhIOp/bN3vUsI9ESMNhZft80F/LGzmoU/gLpvhFA3g/AVA4H
 yqciL22eDtQUi5hatA0ShXd7Zsou4dGDMkJfmAaTD6/0PWc4cHBMzzAhTEvLf12P84
 QO24a52j4HNMALn8NX7XSca23FLgIiQkAn6hVvcA8A6ygt/v9Ze91bE3qCZDQ1feVt
 gxnsJYTAtZ9b1pNj7xsnJie2q1fLKx1rl1cF2avh6Hu6oG/T1aAPuhirub6kxfywbv
 rvhj45FUwtQnQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C712AA0072;
 Thu, 26 Mar 2020 12:54:04 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 05:53:48 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Mar 2020 05:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH+BftuaRoEDAhm45QXJX/Z2SskShNDhIOs7zdAHWDHn/rjbmcDwn7bkz+zPlo3hQRW17CgvZ4NK9M8jkcnbHktzWN06dGk+IgLOfPitthuSNRO3Im8YT/nrR5zJh+Dq2ZkBw4PkIylZtzty59Grw+m1cmj6/Q/FANOMT1CNDxItbzAnCg8pUbw/nDmbEBGYxjPNMKJ4NITcnj/fH3Mt2x1QGha+FtbXo0mMPmySTPVbyXknX9V9r+XdcqkwNwomMPeZNyzp1nuaC5prAk6mUyFAng9woZcTZQM3fcc/C7CsEbOXbzEzNtMQzSTRuaMf8Srt+qEbHyYaUKeKNGTJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWQ+3Kuh+Ki1u7H5RNTZD/OHr2rWSDDED39hOPJD600=;
 b=gz2e1rAKqyYPJByrkmt1Gyl8uSoAzyIaIeBwh4ZJzzNinNA5E0/YE02E2ShYKFCp7GLOZYQaLGXVY+q24Vp7EfTLbmyyr6e7neTcbKrqIVTFZR66kSTtSrZudZhXSECrI9W5QBXB7tByGKQBOVHXQ5JrFU5KekuFqrHXSyfEyNIr2Z313gijr8ytgaufQrb4bK6xfw2TO1Vp4yKkWez87AfwGNlrMPMF3p6J9bxsdZ2EPwZdHTgUb99vrSzV30DN5Q8kTjWlb+x3wrrc+cgnDWO5tXBJxdjgMOLBoMD1t3GBF+G3Nd1B/xB3OJtyrKN9GZYx4RV7IYXhCCsDWPgxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWQ+3Kuh+Ki1u7H5RNTZD/OHr2rWSDDED39hOPJD600=;
 b=l2FoHd8MJwhVDrVs7SgdL2ny6jDGxvn5Ufp6nn/5awK9Kiu9oHZfhtWmJ8xxhD+Opfj4bHBrRMPfr7XwzpWMkrncntGXeKyQcZp/CgC7bZG63EZpYvfQKdibDot+bVaqwlk2X9vEpU0QOBeDH7h56CFER4uQleIQqb3PkwVEkz0=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 (2603:10b6:910:1c::14) by CY4PR1201MB0133.namprd12.prod.outlook.com
 (2603:10b6:910:1c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Thu, 26 Mar
 2020 12:53:46 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44%12]) with mapi id 15.20.2856.019; Thu, 26 Mar
 2020 12:53:46 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Helmut Grohne <helmut@subdivi.de>
Subject: RE: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Topic: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Index: AQHWAwU7mWE+WSIdT0ax39G7iS8+VqhaX+MAgABYcpCAABR9gIAAB4kQ
Date: Thu, 26 Mar 2020 12:53:45 +0000
Message-ID: <CY4PR1201MB01202B2FF493C221420F422DA1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <CY4PR1201MB0120B23B823811B061CFCCFDA1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20200326122401.GA5669@alf.mars>
In-Reply-To: <20200326122401.GA5669@alf.mars>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1kMmE1ZDNlMy02ZjYwLTExZWEtODAzNi04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcZDJhNWQzZTUtNmY2MC0xMWVhLTgwMzYtODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSIxMzEwIiB0PSIxMzIyOTcwMDgyNDAw?=
 =?us-ascii?Q?MDg5OTAiIGg9IlRPK29XYWpmYkxSM2hjVXp5VGFXK09mbkV6WT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?QWVILzZVYlFQV0FSb1V6WGo5VG9HbkdoVE5lUDFPZ2FjT0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBTWpMczJnQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
 =?us-ascii?Q?Z0JoQUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFI?=
 =?us-ascii?Q?UUFaUUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0Jo?=
 =?us-ascii?Q?QUcwQWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFi?=
 =?us-ascii?Q?Z0JsQUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1B?=
 =?us-ascii?Q?RzhBZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRB?=
 =?us-ascii?Q?QnpBRzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFI?=
 =?us-ascii?Q?a0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4?=
 =?us-ascii?Q?QWRBQnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHRUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VB?=
 =?us-ascii?Q?YmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0Jm?=
 =?us-ascii?Q?QUhFQWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpB?=
 =?us-ascii?Q?R1VBWHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJ6QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFH?=
 =?us-ascii?Q?MEFYd0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpR?=
 =?us-ascii?Q?QjVBSGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3059bf2-92b5-4c36-e59a-08d7d184b8c3
x-ms-traffictypediagnostic: CY4PR1201MB0133:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0133FD3389B7C07C989955ACA1CF0@CY4PR1201MB0133.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(376002)(366004)(19627235002)(66946007)(316002)(55016002)(9686003)(52536014)(54906003)(2906002)(66476007)(478600001)(966005)(5660300002)(76116006)(6506007)(7696005)(66446008)(107886003)(71200400001)(64756008)(81156014)(81166006)(8676002)(66556008)(86362001)(33656002)(8936002)(6916009)(26005)(4326008)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0133;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UBt6DauMp91U4GbaoVjlgdC8xuIg2DuSulP5csMe8ROyQQRsGt0ZcjAPatpm9mTEMfl11hcnYQNax2w8AkCU2XCs4R8onJePM91fQmGwZqAqBzmG83jklculJCF8W1b1yTqhX8Yx+fDEhCOmJ4ZzS3z5DG+amwBL9rkaWVqcsk1v7D24wBz24H+LIhOReKYcWXLmZStIUBycbnEDUOCR6Tn7dYq617S3EIdmbJkf/IsNbJC18JXEEHb2tj5VNPUrt/OE6nPmSeAeqEXtPjczQvxjSBpgSAIIasFfKdtxG2fY+VsFczFM78XI4LwUioojrIKOBiWrKFqTMlYZ7RqqVd/DU0Lfd1RswbjO5OU8gk5VdhWS+Azhnrjb9MxBiPihWfBasYwXzamEyPOOgO0VUxJZTK+xNNqzjAASgM9kF3AXRKzmk2Um8k2SpQRaZHdhC0168QB/51PePaYlxiOWv7AWrEY00X3adRGTCJlKRIH3b1wfQHIzcwhFqSr6kLk/LCLfL3cwFqxjo1icfgsZBA==
x-ms-exchange-antispam-messagedata: CNWs7mh33wQihhBFHPaulZ/rR3A0SUGQZgPn3Sce1UE9dwuuSW6wgw5y+K7Bj1taZ1xD11o9FNOEV1/3Zf6NEj8eD+SYW5QgcH3Bht4lwZxJOVn7zhAxgkm2o0AizedTbsyaZZ9ZiOYWX+/Lx8EFnQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f3059bf2-92b5-4c36-e59a-08d7d184b8c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 12:53:45.9829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NRIrQyRF7xtkzBZmW/7BnqD83GxdClavWOAIS/gvs4a+ZKzzwociHM05zJohF8R0L3Xo/7+XgMelVK2VWGMzhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0133
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_055410_810754_9FEC66AF 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: GNU C Library <libc-alpha@sourceware.org>,
 Vineet Gupta <vineetg76@gmail.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Claudiu  Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Helmut,

> > 2. libgpg-error has ARC support since v1.33, see:
> >    https://urldefense.proofpoint.com/v2/url?u=http-3A__git.gnupg.org_cgi-2Dbin_gitweb.cgi-3Fp-
> 3Dlibgpg-2Derror.git-3Ba-3Dcommit-3Bh-
> 3D48c8f8ddfc80&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=_zJyx
> Gdx_-O_dKHjFp6S-2ZXebEcmuHfmUsgpc4uEXA&s=myC306ViTlaxOV8nbOJR8pC74k2lsKmmB1hCGQR0PrE&e=
> 
> This is only the native-support. For rebootstrap, we also need cross
> build support, i.e. recording the generated lock-obj header (once glibc
> is done).
> 
> > And only for "libatomic-ops" & "guile" nothing has been done yet so if there's something
> > that really needs to be done please let us know.
> 
> I suggest that you focus on libatomic-ops then. And on glibc of course.
> I guess that the other issues are easily solvable when they arise.

Sorry for this stupid question but I'm not very familiar with use-cases for
libatomic-ops so would like to get some more clarification on what's needed here.

I know that GCC has quite a few built-ins for atomic ops and we do implement them.
I'm adding our GCC maintainer (Claudiu) in the Cc so he may jump in if needed.

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
