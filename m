Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D71C43216
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C49160E90
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C49160E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=22T7JLC9ThChz8K2a1tPfX7azoD4qxykJoBaWy9h2Ao=; b=eNnnmPFt6CQ9TL
	b4rrhe1hTyun1DBUNGMZ9sW6oZIw6Kz/T1Bh/Jz1d1PoNPbmeshMFTo+L5dnlAYlIua/JDSJFlI5M
	aTOKws7Nz2qBq5iNwB/wBfwpblyN9oDTHnoRISaH0ytiGwr6hFdvdyrgHrrYt7jYR26fNYMxZBxkI
	jklYRbFN2NcJ/qK1hxgl1Yc9x1EROkEd5ywe/5FsnNEEc0KsO5OdEClmb7EuGq3mUVEnD2W2ZnAUe
	ytfsw2td5RcKDVsNhUYchwpdwhJ4CUnLZGLC61dX/kc1MizWLBtswxihWgLx0KwulAZairtIQICgS
	WqB8rt+nZ9hA+mbOn0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkdz-0008ii-W7; Mon, 30 Aug 2021 17:00:24 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkHh-0005pH-Sa
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 16:37:26 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AD155C014B;
 Mon, 30 Aug 2021 16:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1630341440; bh=N67TBihZC8cg+ooaX/1FUN/Ub4biyZtZ4HrcYn9xHPg=;
 h=From:To:CC:Subject:Date:From;
 b=ES2Wg2Kye5DNf+YsNmHidDyBv9y0xQVUbA4/5T4bwFM6P39CpckkAkmJgcOnaGjK3
 m2ii9EocFyOGoMNlmCP7fiU51bBPqkXN0bXs8gXrRyAQ72PI+x3LArnnANXKleGnxH
 PjfDDD97fB7u0z5pZWrc8pWBnh6fVrz+EcjtoQ8MLcaRRe0kZ5CovPaI5kl3qYZpyf
 QYomwBU+mLfNTKMIAqrMfPez2KRMD2aXeLH01AEdUa+oX/2OyWfhqPkab58idhQlZ+
 H/Rb2w00SjOPh5j5ZQE6eAU1V9yqXw28YOT4zzcSJ+Y3BNIvJIg5bmhD1c6aldut2/
 VKJDxW6SZ04yg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id B4150A006F;
 Mon, 30 Aug 2021 16:37:16 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 213EC40095;
 Mon, 30 Aug 2021 16:37:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iklvAlS8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZzyleQ1GmGiHVwAdrBtRtbe4U6CaF/ZGIBRpRdUdgXv0XkeVLXnlRCP9+Wak3A2eXwR1P6exU++DInwTP2XbWH+RGQ7zX3APuRahoUIaO/3wMnIRqnGzFBfVm3fyl7Bkm9mTiDyHYF7D07fUvGvSKkos+6GB+9EV/C6qNjCvZq5qZjT/xUJ5KkEEnm6BGLQm0Iy8Qv1mRYj1/VJAbaYYM2jQSqFZPMq2Acocv4FFJ9DUQPwRukLW0BAIBehjmZPUYHnF844/JP5oQtAEKkiOd86mG2k1U+DOZxk1XGeDflvYDx65R6fhZ+3wgSo/yEB6Yeq1ik2CIkGMsOqjW5nbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N67TBihZC8cg+ooaX/1FUN/Ub4biyZtZ4HrcYn9xHPg=;
 b=XjvRI1eRNxhWn2A23Sj1RkL4y4tw7mzkzqP2//Q4J3wYZ8tPiecnhgwRlsGYYMnD9/Mob9ny3hpmRUCg1bn2TCQBBVgyKXf0uGxRVwHjSNkzt/47XX/7l4errMqG0GhFd4KEqpZbuU+fb3TFus2NVVzi92dV7Ll3wurScHXbVPiZn4IGIJsfde3bsvjy7hceh0wLblwoDTXi/MJDFl+qQviUj9i2fClq4MYH1GYMmnfpaRplS2tfShotZPgCCmxZfpPZGE3TQOBIiZLv04y+0yHnoWcWXq07smI+lGn1i1moFQpwGPImqGSfVE6uXzzzuDkF92+4/kKYWy1WZ8aBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N67TBihZC8cg+ooaX/1FUN/Ub4biyZtZ4HrcYn9xHPg=;
 b=iklvAlS8ySrn+X2/5Iiy1fuN+6X80rQ7YPUKjK5fREaf+OT8X5vpTQoV2PATfQcXJQZ0rG6xQh5LlkrFuPBWFlv/Z6brV4uV8iGnQmlP9UrhJOHQ1SglUPiEE7AwQkML33obitN8hxvTZqmVoGqIIXNR2Dx33LzKNOxjSSQRVzk=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 16:37:14 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346%7]) with mapi id 15.20.4457.020; Mon, 30 Aug 2021
 16:37:14 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "992091@bugs.debian.org" <992091@bugs.debian.org>
CC: Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: python3.9: Add arc-linux-gnu triplet
Thread-Topic: Re: python3.9: Add arc-linux-gnu triplet
Thread-Index: AdecPxrcQnyviRMgQd6s6HzNV8OflA==
Date: Mon, 30 Aug 2021 16:37:14 +0000
Message-ID: <PH0PR12MB5401BBE329F019C6D93DDFF7A1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?koi8-r?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5cYX?=
 =?koi8-r?Q?BwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5?=
 =?koi8-r?Q?ZTM1Ylxtc2dzXG1zZy02NmQ4NzdhYS0wODMyLTExZWMtYmYxYi1mYzQ0ODIzY2?=
 =?koi8-r?Q?FiYmNcYW1lLXRlc3RcNjZkODc3YWMtMDgzMi0xMWVjLWJmMWItZmM0NDgyM2Nh?=
 =?koi8-r?Q?YmJjYm9keS50eHQiIHN6PSIxMDQwIiB0PSIxMzI3NDY1MDkxMTg3MTg5MDYiIG?=
 =?koi8-r?Q?g9IjZFN2puV05WdmJQSXhFdGUzeEl4TGdoYXFKdz0iIGlkPSIiIGJsPSIwIiBi?=
 =?koi8-r?Q?bz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUhZSUFBQzZ3ekVwUDV6WE?=
 =?koi8-r?Q?FSNGNsUy91WnVOV0hoeVZMKzVtNDFZTkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFIQUFBQUFHQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBNz?=
 =?koi8-r?Q?VBbXNnQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0FiZ0JoQUc0QVl3QmxBRjhB?=
 =?koi8-r?Q?Y0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFIUUFaUUJ5QUcwQVlRQnlBR3?=
 =?koi8-r?Q?NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5n?=
 =?koi8-r?Q?QUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQV?=
 =?koi8-r?Q?h3Qm5BR1lBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUU?=
 =?koi8-r?Q?JmQUhBQVlRQnlBSFFBYmdCbEFISUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FY?=
 =?koi8-r?Q?d0JqQUc4QWJnQm1BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQU?=
 =?koi8-r?Q?FKNEFBQUJtQUc4QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dC?=
 =?koi8-r?Q?ekFGOEFjd0J0QUdrQVl3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlB?=
 =?koi8-r?Q?SGtBWHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFIUUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?koi8-r?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0JsQU?=
 =?koi8-r?Q?hJQWN3QmZBSFFBY3dCdEFHTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhBZFFCdUFHUU?=
 =?koi8-r?Q?FjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRRQnRBR01BQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQW?=
 =?koi8-r?Q?dBQUFBQUFuZ0FBQUdjQWRBQnpBRjhBY0FCeUFHOEFaQUIxQUdNQWRBQmZBSFFB?=
 =?koi8-r?Q?Y2dCaEFHa0FiZ0JwQUc0QVp3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFjd0JoQUd3QVpR?=
 =?koi8-r?Q?QnpBRjhBWVFCakFHTUFid0IxQUc0QWRBQmZBSEFBYkFCaEFHNEFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFB?=
 =?koi8-r?Q?QUFJQUFBQUFBSjRBQUFCekFHRUFiQUJsQUhNQVh3QnhBSFVBYndCMEFHVUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BYmdCd0?=
 =?koi8-r?Q?FITUFYd0JzQUdrQVl3QmxBRzRBY3dCbEFGOEFkQUJsQUhJQWJRQmZBREVBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQU?=
 =?koi8-r?Q?FBQUFBQ0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpB?=
 =?koi8-r?Q?R1VBWHdCMEFHVUFjZ0J0QUY4QWN3QjBBSFVBWkFCbEFHNEFkQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUIyQUdj?=
 =?koi8-r?Q?QVh3QnJBR1VBZVFCM0FHOEFjZ0JrQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?koi8-r?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?koi8-r?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFB?=
 =?koi8-r?Q?QUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg=3D=3D?=
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbb9d5e4-18d8-425e-f54f-08d96bd46ca1
x-ms-traffictypediagnostic: PH0PR12MB5450:
x-microsoft-antispam-prvs: <PH0PR12MB54508C10B3DBC607607880A6A1CB9@PH0PR12MB5450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9HDnEYzsxKJZbSh+AHfCL+TDFqGxEWppeaGYSei1BXgHkIZeQV72MtstPqzxmodhRyDPKmeW5zoUrDIPtDz5AVTT6H6NW/vjsnpiRAGTrUq7yT32hOAe5dCzB8yYqsvFYXl3B7aQQ1LmfRo39Dd/i7uzKnqJKQa49SN06dS0dRAfoLqlUsGuyP1Uf5GTwZaXBabZFCw43GjoXL3t5NVBBXNbkCietY309sjHfby/jY0BWpKiT/8mvABGynf3AxamA5TQ4X31GLEiG3yFruv+x0+eYSU2FIHos1dAoh2oF/XbBxsmZ5hID86iOeSLT4DT22hPQyWUdUDSqS89CnRcjTLYsu65KhLV9OsAIJMwlQDDl0Uvq0eKYL7LdkN29tysjL4J2xPx7Mupkz14W9mhBcBNfOGqvxXMRwzYTKykYVFp0Jf0QQW8ACI3ZyhCmindzu52oHB8wPJLLM3/tnYqwSec7wbk8hjPCKpBQdPSUvSgopSm2c1Awcd6oECiGeh54BoaziHON3IBHuYu/9YTnnPkTcXYpz4jbXGcy4JNrpwTQUClkARxeYh1lI8dXejCppmOC381igKC4Vtrfrcb+BhwJTcDRG9cGmp+dVpNdAN4saQgWrkBFgi+W2PaPvkCEJoPQNkRasV3mrdSm612URuz5pOY6OXJLPNm25wRKNpfxFXRke5ssgatZwahsIzCpanymNWGgDShhj/MvZ+1xd6RtGlIrZdeXz/9LbpnbQuMXh/uK4cgl7WprGVQCi89Tj/oQ5ir0CuInOlIQMpE4D1w4DkfXs2w+iSjL+a5y1k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(55016002)(478600001)(76116006)(64756008)(66476007)(122000001)(66446008)(52536014)(4744005)(38100700002)(316002)(66556008)(83380400001)(71200400001)(8936002)(66946007)(45080400002)(6916009)(2906002)(9686003)(966005)(6506007)(86362001)(5660300002)(33656002)(186003)(7696005)(38070700005)(8676002)(4326008)(26005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?p+9WPtUkm3BDDHQSW83p7yTtQCaDli3eaVVqYfMjIIpvpiO9ofYZfYOd5bsekK?=
 =?koi8-r?Q?19k6BYMLIJRNgtCIQ8fwg6JexbbYjEwPzhDwvfWrKoAJQCTiH+EjboKw6UqgRz?=
 =?koi8-r?Q?k37jKO+X4nBkT1fj9yokenlgRETXdsxE4qiJekWsbJVJGdN/cDWcrr7Bcq2pQw?=
 =?koi8-r?Q?B5PC0+rnubGJhZkm9aT3V1jyjhNwU/aB68vRtTVeAI1O6lEYjzLxNW7y4sRw4q?=
 =?koi8-r?Q?80Q2DdbG9dwe74AqbIa611CxYoehWmGtQ67GuR1ZSMGR9q3R3arBwCXtYnVGCD?=
 =?koi8-r?Q?FAmacRHVgBC5F4ujGJQvQosLsqRebN8/6XLz7ctqC2s90Ru9VOyFxTUELpYpKr?=
 =?koi8-r?Q?w7O+AaBA+sexQzOD+Ulcccgx/6Zd5lm4I7lnjqU2jQWpi90cdZc8eYVIeLA6K9?=
 =?koi8-r?Q?Gt1dxFixNl+oU5kescjgqcsYweD3tmogkn1HuGwC3rLYffVtoj3VoItD7vQs1S?=
 =?koi8-r?Q?JDZVBvqCbMRJzSU36xd7flPZDiqYIuTB2wH+kQN/f/UphfgNMCGy+4Kogb9PDM?=
 =?koi8-r?Q?Bvd2dcKedzzVsuUwDCgepMYlKOnoanZZT3rGNbbMjUMOUkp4X7y24B1VDWjkif?=
 =?koi8-r?Q?MJo12mKlwqTHlENvwAqpWFjBoGmd8LZ/HTI7jkViIUH7+tNLrwlg6U9eaPzQu9?=
 =?koi8-r?Q?wGPzPFQT7oTpMdHXXTsqQD4YQCqJhcS823ec+qib4FbCnkmMkwZMZzUhG71atc?=
 =?koi8-r?Q?85e2AkIyNs+wIlFnzd3EfeXymDs7Hk92ONRowTK0eXJ0d9ef8fBDz+y7A1G3MT?=
 =?koi8-r?Q?wodrmVQ05OHSOec1ZHl5dNSOgNJpaTLx6kzUuIme7UkV53nIRibnIpAQJTMK89?=
 =?koi8-r?Q?Lr9eu1aGPdfFxAzpxH+G7l/BAyCjWvtIoh/9EnOtsfgEtma5QNb1qIjrQlI4dc?=
 =?koi8-r?Q?iOEWnmxNxAdKpJxKZGCNnQnK9+hddNyvq3GAqi+AkivrFVyp7+/fxcDldYKTtm?=
 =?koi8-r?Q?7bZIX4O29fAxvcqFqxPNCrBlfBmJEvRjWxJchhRHADGdnz7dvpzlGaJoUTasdq?=
 =?koi8-r?Q?Q8ls4v8Sf0Wii+Hfla3jcAvnjPzFmPT+zRF47U8j5zKYVJTeL11M4gnjDGuco4?=
 =?koi8-r?Q?Ajr/ZlGG/yN+M09qwS19ZRzkB0olRjB01JxOq/Pc7NbQhkBwtf6xgkLru2Ruy1?=
 =?koi8-r?Q?HOC+AhFRIEtWUjG0K2SuogiWW31qbHq31j6Vs1Q6XXZ6Z7yPdm/U7nB/MhQXYf?=
 =?koi8-r?Q?+YxhOwTyxiBTZtgjoGsqLG2sBJ9Zgd/cdW0VZr6oolGiUG5fZ9ffhkKJo2KwEi?=
 =?koi8-r?Q?B5E/JLKkd6SOdPADD/+dd5o1qft02weuZ7BzHXBgL5?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb9d5e4-18d8-425e-f54f-08d96bd46ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 16:37:14.7576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5X3bwH1oOy0o/X/LeA+zVxwFJ69N4YX6/qEoJlkGaXz1BRqcDmc0mOzqvAwSMKfZMRZotiAe1L/ILjLD/G6IpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_093722_010532_EEF48C86 
X-CRM114-Status: UNSURE (   8.11  )
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
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMSBBdWcgMjAyMSAxNTozNDowOSArMDMwMCBBbGV4ZXkgQnJvZGtpbiA8QWxleGV5
LkJyb2RraW5Ac3lub3BzeXMuY29tPiB3cm90ZTogCj4gU291cmNlOiBweXRob24zLjkgCj4gU2V2
ZXJpdHk6IG5vcm1hbCAKPiBUYWdzOiBwYXRjaCB1cHN0cmVhbSAKPiAKPiBEZWFyIE1haW50YWlu
ZXIsIAo+IAo+IFRoZXJlJ3MgYSBuZXcgdHJpcGxldCBmb3IgQVJDdjIgcHJvY2Vzc29ycyAiYXJj
LWxpbnV4LWdudSIgCj4gZGVmaW5lZCBoZXJlIGh0dHBzOi8vd2lraS5kZWJpYW4ub3JnL011bHRp
YXJjaC9UdXBsZXMuIAo+IAo+IFdpdGggYWRkaXRpb24gb2YgdGhpcyB0cmlwbGV0IHRvIFB5dGhv
bjMgaXQgYmVjb21lcyBidWlsZGFibGUgZm9yIEFSQy4gCj4gQXR0YWNoaW5nIGEgc2ltcGxlIGRp
ZmYgdGhhdCBpbXBsZW1lbnRzIHByb3Bvc2VkIGNoYW5nZS4gCj4gCj4gLS0gU3lzdGVtIEluZm9y
bWF0aW9uOiAKPiBEZWJpYW4gUmVsZWFzZTogYnVsbHNleWUvc2lkIAo+mpogQVBUIHByZWZlcnMg
Zm9jYWwtdXBkYXRlcyAKPpqaIEFQVCBwb2xpY3k6ICg1MDAsICdmb2NhbC11cGRhdGVzJyksICg1
MDAsICdmb2NhbC1zZWN1cml0eScpLCAoNTAwLCAnZm9jYWwtcHJvcG9zZWQnKSwgKDUwMCwgJ2Zv
Y2FsJyksICgxMDAsICdmb2NhbC1iYWNrcG9ydHMnKQo+IEFyY2hpdGVjdHVyZTogYW1kNjQgKHg4
Nl82NCkgCj4gCj4gS2VybmVsOiBMaW51eCA1LjQuNzItbWljcm9zb2Z0LXN0YW5kYXJkLVdTTDIg
KFNNUCB3LzEyIENQVSBjb3JlcykgCj4gTG9jYWxlOiBMQU5HPUMuVVRGLTgsIExDX0NUWVBFPUMu
VVRGLTggKGNoYXJtYXA9VVRGLTgpLCBMQU5HVUFHRT1DLlVURi04IChjaGFybWFwPVVURi04KSAK
PiBTaGVsbDogL2Jpbi9zaCBsaW5rZWQgdG8gL3Vzci9iaW4vZGFzaCAKPiBJbml0OiB1bmFibGUg
dG8gZGV0ZWN0IAoKUGluZyEKCi1BbGV4ZXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
