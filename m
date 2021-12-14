Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D597BC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Dec 2021 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEiOUYaE1Y+YP21U2N/I6ZStus1ge0FJJKISLbQYue4=; b=RbaSKBbtPntbTD
	+eZAqcJ0rjFhsAQ45ESO2VC+U/STyo+G57Pn0ektC0mQCoOj92N9wys+bRRNI5kCHBHSftRve3CYm
	wK+icWVGSr7oKKokPTVxLgLbh4Q/4t+w2UJPl9mCF8TXEly1ytEeIDPX7Zy/uZc28N6c0pAmBlp+q
	UPnZQ9E10bfLlpn3uAWGrA4BZoS3gkdbZQc+weUbf3UFkcpJ8XIUhKKITjE3lbrI6YmvCve7hSS8n
	HKI529+YkNgY9/vPLPetTw4bL6U1eKZrFtWI88wCHRRAE3Em/NP4QRh0SW/z/4KNkAYuOAyHSgfkX
	lhKiGOlvCVSqEnLmAUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7Ia-00E3eg-0G; Tue, 14 Dec 2021 12:52:52 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx78q-00E08Z-Ma
 for linux-snps-arc@lists.infradead.org; Tue, 14 Dec 2021 12:42:50 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86BD2C170B;
 Tue, 14 Dec 2021 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639485767; bh=mOfI69J1NKzRVfJskUX3orOto76R71w5Ehvg4j7kI2A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RKgRO6n4rwNkcp1r/YB4q5rRSEn5TtWRQT/RUEN6YLopxG410M1ym7UpqHdN/hTEP
 /XPtezflHcmW1fNtFCqXRisJ1Eu+69WmZ34PclL5gX1eHQw0ncZpMXTjc2SQ1nr9yr
 gpVSpZsof7eJGfTKVgYEGjkgN5BQDOGLI0ZYponrJLTfajaKCrTSbQX8dMml1u1uXq
 CnHS6KcLIbNQqLcK02zlU5msvvuDw/YyRygqt6P3/0rwKB5axuhYuPlQJJxy7qdflJ
 bA86q9W9caxJiMBC+MTEX+5LLkUswwPSR1Kl3N59T8WJUhkBoM28J4kliYNVmjIxzt
 meJsbHyRNw79Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4357AA0070;
 Tue, 14 Dec 2021 12:42:45 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 98EB0400DA;
 Tue, 14 Dec 2021 12:42:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=isaev@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="N/iWyCI/";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JciXHib5PZQrAaScUw+Gdsr0ywDHpYSglhGu38zdXORZ8+GlS5E/UdBRWs7LSVO8OFkIwBpwhGIwySoSNVjECP0nY7BoiJT7feUr+zux1ZZ2GTnSz2VLkZXkLzqDAgJUMXxDe0wh1CxlyK/UuKM80ffrvg1lVMjTNcmJzXwVddXZwEs7Ts7pwhg7nwA2d4vlhkAxRm770pGRwcFZi9294dOqQw3+5vAVG55BWNIryNtXzAL5ho7zw1K5ATUO44A0Rcj74H2CYcp+PICReOx6Pdh94KmVUfRPiqNAtTgcz1ZEeXJ8XDW8YtpOlqdnBsoaNo027g6itUpRNLFjTeo4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOfI69J1NKzRVfJskUX3orOto76R71w5Ehvg4j7kI2A=;
 b=DLia6EkZTb6KcAJXBPeS5Ih0JBdqzYhJJwVp45KoMqi9yrSBQvtsyqG6U6bNl8oFHoEJ1bReyQN9pLbMAH39TQRadYnVhjVF8SkcK4Yp3k8I+UwDfNh/eBkvVJPMLbCFCmQA79cOtu3wjIjtiTIRaGc6R3B9QrV14aTkIr0nJ2BzltRHDydVycScGdywUSQd82kjGRI7YDLJHbXnd4FFlmPJBI40Y32tb+hfDMwwZb0QmTkmH/OD7vZ3DKsHqc4SiWG3x99E4WT11BK4LDPpz+QUmAxIgaki2rQ9jzuvpruj0BdkIFLnLojIDpk/vIWniI/GdpaCQ3khges6rWSpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOfI69J1NKzRVfJskUX3orOto76R71w5Ehvg4j7kI2A=;
 b=N/iWyCI/8co3k3zWTg8RRGtsR32ROuarjDbH0ngNDidWjymlXqQyprBMztjzQUpoFuc6FYxxBy6EzMpMwKaJxhr3fiRodhc72SlJZovlN6ZHwJM37kdH/MEcStgUWL5DxEBKLNuUBPxRLl5F5//I5g/fjXjuBWNkNjGfGJL2lgs=
Received: from BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:42:41 +0000
Received: from BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::a179:8d3:ce3c:a83a]) by BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::a179:8d3:ce3c:a83a%8]) with mapi id 15.20.4755.022; Tue, 14 Dec 2021
 12:42:41 +0000
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: Barbaros Tokaoglu <btokaoglu@airspan.com>, Vineet Gupta
 <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: Miika Keskinen <mkeskinen@airspan.com>
Subject: RE: [PATCH v2] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Topic: [PATCH v2] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX8OSpc3XIvkPo7kSrkdg2fRQfkKwx7cGQ
Date: Tue, 14 Dec 2021 12:42:40 +0000
Message-ID: <BY5PR12MB4131707D6F78A850F370202CDF759@BY5PR12MB4131.namprd12.prod.outlook.com>
References: <588d5473-0344-3284-2a8b-b2a105eece8d@airspan.com>
In-Reply-To: <588d5473-0344-3284-2a8b-b2a105eece8d@airspan.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYVhOaFpYWmNZWEJ3WkdGMFlWeHliMkZ0YVc1blhEQTVaRGcwT1dJMkxU?=
 =?utf-8?B?TXlaRE10TkdFME1DMDROV1ZsTFRaaU9EUmlZVEk1WlRNMVlseHRjMmR6WEcx?=
 =?utf-8?B?elp5MDFNVFkzWlRrNU5pMDFZMlJpTFRFeFpXTXRPVGd3WkMwNU5HVTNNR0pq?=
 =?utf-8?B?TVdaak0ySmNZVzFsTFhSbGMzUmNOVEUyTjJVNU9UZ3ROV05rWWkweE1XVmpM?=
 =?utf-8?B?VGs0TUdRdE9UUmxOekJpWXpGbVl6TmlZbTlrZVM1MGVIUWlJSE42UFNJeE9U?=
 =?utf-8?B?UTBJaUIwUFNJeE16STRNemsxT1RNMU9EVXhNVGMxT0RBaUlHZzlJbUZhVUdS?=
 =?utf-8?B?eWFHNTFXVTh4WW5OcFduQnlTWGRKTlc5NWNIQkNWVDBpSUdsa1BTSWlJR0pz?=
 =?utf-8?B?UFNJd0lpQmliejBpTVNJZ1kyazlJbU5CUVVGQlJWSklWVEZTVTFKVlJrNURa?=
 =?utf-8?B?MVZCUVVoWlNVRkJRMDFwWWpoVU5sQkVXRUZqTlZSM1pWcEJhamxXTDNwc1VF?=
 =?utf-8?B?STFhME5RTVZnNFRrRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?SVFVRkJRVUZIUTBGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZG?=
 =?utf-8?B?UVVGUlFVSkJRVUZCYVZCWFZUbEJRVUZCUVVGQlFVRkJRVUZCUVVGQlNqUkJR?=
 =?utf-8?B?VUZDYlVGSGEwRmlaMEpvUVVjMFFWbDNRbXhCUmpoQlkwRkNjMEZIUlVGaVow?=
 =?utf-8?B?SjFRVWRyUVdKblFtNUJSamhCWkhkQ2FFRklVVUZhVVVKNVFVY3dRVmxSUW5s?=
 =?utf-8?B?QlIzTkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBG?=
 =?utf-8?B?QlFVRkJRVzVuUVVGQlIxbEJZbmRDTVVGSE5FRmFRVUo1UVVoclFWaDNRbmRC?=
 =?utf-8?B?UjBWQlkyZENNRUZITkVGYVVVSjVRVWhOUVZoM1FtNUJSMWxCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlEwRkJRVUZCUVVObFFVRkJRVnBuUW5aQlNGVkJZbWRDYTBGSVNV?=
 =?utf-8?B?RmxVVUptUVVoQlFWbFJRbmxCU0ZGQlltZENiRUZJU1VGamQwSm1RVWhOUVZs?=
 =?utf-8?B?UlFuUkJTRTFCWkZGQ2RVRkhZMEZZZDBKcVFVYzRRV0puUW0xQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkNRVUZCUVVGQlFVRkJRVWxCUVVGQlFVRktORUZCUVVKdFFVYzRRV1JS?=
 =?utf-8?B?UW5WQlIxRkJZMmRDTlVGR09FRmpRVUpvUVVoSlFXUkJRblZCUjFWQlkyZENl?=
 =?utf-8?B?a0ZHT0VGamQwSjBRVWRyUVZsM1FVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVGblFVRkJRVUZCYm1kQlFV?=
 =?utf-8?B?RkhXVUZpZDBJeFFVYzBRVnBCUW5sQlNHdEJXSGRDZDBGSFJVRmpaMEl3UVVj?=
 =?utf-8?B?MFFWcFJRbmxCU0UxQldIZENla0ZJVVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJRVUZCUVVGQlFVRkRRVUZC?=
 =?utf-8?B?UVVGQlEyVkJRVUZCV21kQ2RrRklWVUZpWjBKclFVaEpRV1ZSUW1aQlNFRkJX?=
 =?utf-8?B?VkZDZVVGSVVVRmlaMEpzUVVoSlFXTjNRbVpCU0ZGQlkzZENkRUZIVFVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUpCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCU1VGQlFVRkJRVW8wUVVGQlFtMUJSemhCWkZGQ2RVRkhVVUZqWjBJ?=
 =?utf-8?B?MVFVWTRRV05CUW1oQlNFbEJaRUZDZFVGSFZVRmpaMEo2UVVZNFFXUlJRblJC?=
 =?utf-8?B?UjAxQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGdVowRkJRVWRqUVdSQlFucEJS?=
 =?utf-8?B?amhCWTBGQ2VVRkhPRUZhUVVJeFFVZE5RV1JCUW1aQlNGRkJZMmRDYUVGSGEw?=
 =?utf-8?B?RmlaMEp3UVVjMFFWcDNRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVG?=
 =?utf-8?B?amQwSm9RVWQzUVZwUlFucEJSamhCV1ZGQ2FrRkhUVUZpZDBJeFFVYzBRV1JC?=
 =?utf-8?B?UW1aQlNFRkJZa0ZDYUVGSE5FRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJR?=
 =?utf-8?B?VUZCU2pSQlFVRkNla0ZIUlVGaVFVSnNRVWhOUVZoM1FuaEJTRlZCWW5kQ01F?=
 =?utf-8?B?RkhWVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVVkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJaMEZCUVVGQlFXNW5RVUZCU0UxQlltZENkMEZJVFVGWWQwSnpRVWRy?=
 =?utf-8?B?UVZsM1FteEJSelJCWTNkQ2JFRkdPRUZrUVVKc1FVaEpRV0pSUW1aQlJFVkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZSUVVGQlFVRkJRVUZCUTBGQlFVRkJRVU5sUVVGQlFXTjNRblZCU0VGQlkz?=
 =?utf-8?B?ZENaa0ZIZDBGaFVVSnFRVWRWUVdKblFucEJSMVZCV0hkQ01FRkhWVUZqWjBK?=
 =?utf-8?B?MFFVWTRRV04zUWpCQlNGVkJXa0ZDYkVGSE5FRmtRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQ1FVRkJRVUZCUVVGQlFVbEJRVUZCUVVGS05FRkJRVUl5?=
 =?utf-8?B?UVVkalFWaDNRbkpCUjFWQlpWRkNNMEZIT0VGalowSnJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVGQlFVRkJRVUZuUVVGQlFV?=
 =?utf-8?B?RkJJaTgrUEM5dFpYUmhQZz09?=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d354cc73-3665-4c16-3535-08d9beff37c3
x-ms-traffictypediagnostic: BY5PR12MB4179:EE_
x-microsoft-antispam-prvs: <BY5PR12MB4179F2AF4EC10EA3B8C5F585DF759@BY5PR12MB4179.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Nx6gapnroS6V+ekHVOhJ76eS7eH6BKudiUK1q0l3PuNtD5W1iI0fdgWQ85UQF+hfb89LLNuz3ArwNIlE2IziIeM6VjK5cZcD2wRgYQi4a4vVFNyU38DTtM4ikCvAl5NYeaDTnZFrkX9vVGw2YvIPM3m6LXzmD3PlihSJ1fB9CFTAm1MaAIX7gNnagrYgglRr1Rp8nHol0jfYIDFMcmXKFASWu54Fkvvzwo5zqZ2KpPcC0jAMG2NtIex6yycRFeuxNtU3ePPyAzSlNbzDJd1sYIicZqZ6ODApBjxHOllV+zb5/hLgtABVRvcfkqjMZ5E3X7ms+RPN0S9vd/A+6XX6YMSbkKyVkScREFD78RSVB2Op+a6xHTY8EWqbHqdDMl8YGXJlcDITEHcM2wry/xo5rwJ8fh0aiZ4H3cpFSd+gRqZ96vWJaf2524TeL2ehXGn/JTYrmRkIwn1tOlOAfOs4P92TdcRr5ASsc3ZCcQyyuCoyDF0T02VMDKKtmyJW6q1UgubO1SFb01vYDH+2XTHLMA6p9nbjDQVFwhbAyKvD1cK8cLoydo9hCtdLZUaUk2FJAmQr//IAD0gbN7I1gGnEzaVlBI1VSKWUM6qv7qN0Y4NzMk6PgAlUwH6J9m1wdGB2j7EkaE6ipVCI3OWz7GHTvH22QC/M8UdfZ+su3+0LvW7QEElJPK0AB6UhOzhgxB804JS7JBmEH+/aXaEUhsckw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4131.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(64756008)(122000001)(66446008)(53546011)(6506007)(2906002)(66946007)(38070700005)(38100700002)(15650500001)(33656002)(76116006)(186003)(26005)(316002)(508600001)(52536014)(7696005)(8936002)(5660300002)(8676002)(55016003)(83380400001)(86362001)(71200400001)(4326008)(110136005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHZLbTVmSEd5OFM0b3JRTUZmazBsYThtZ3FBSHVrM0huY1puWlZwSlIzMEpT?=
 =?utf-8?B?Z1pMOTNJaG1xbXg1RWZ2T1Vhb0QxNjYrcHJ5QjJtb2dSckF5U3ZJcHJJR0hx?=
 =?utf-8?B?TnZGNSs1NzErZ0s1R2ZRdktUQnNxZVhxMDZmbDZZZm5HVFpEclh6WklHdFdw?=
 =?utf-8?B?MkJSNWtxYmhuUWdzYmY2RzZwUVBwMVYwSElVVUZ0ZmtXVUlnWU15UnhnRnFn?=
 =?utf-8?B?U0VmenBHa1ZVL1p6Tjl6cFFiN0Q4NE9FZEdUbnIxVk96OE92dVUxYitNaFl4?=
 =?utf-8?B?Sm5EV3ovWHBJUnFXZndYZ2xabmpWWXc0VjI3cFZSaXJMdTZpb3puT1FmZXlm?=
 =?utf-8?B?Q3lOYUI5R1ZZTUFiQjBZWU56UDNqZWgrbW5EUTk4dG03ZDRtaDNFVG1qa0ps?=
 =?utf-8?B?bXFBaUIyZGoyTUlpZHZ6N2FxL2crUjZaaHpSMzhFNmdjWXUvQlNWOUtJbTBQ?=
 =?utf-8?B?Um9TLzhNSStDK0JtNUZITVJzUWVybVhBeW9HU3d5MW5pTzloMTFGaDlBOEov?=
 =?utf-8?B?ZVpST3BTeUQ4RkZDYWdreURROVBjYjV1Q0lDWFBCaHpPaUhuUzgyTWI5emg2?=
 =?utf-8?B?M3k4dGdjSHcxaHBSWW5rRW1HSmFxN1VmZG5HdVE4Rzl5U2E5Uy9GNjlBdVZ3?=
 =?utf-8?B?R2k1U3RENzN5MlVGNW5QL1pLSitpYjdjQzI2OWU3RC9UeXBGamV0S2h1Ukhs?=
 =?utf-8?B?OXZCWnkxSi9xeDFRVGlRcjloc0FXeFAvUlFIb21NOHRmOFc5TEFGeHdSRkNs?=
 =?utf-8?B?NGRFVmw1VUdSQklGc09LNHZxeVNxbXZQRW9kZmF0M1o1ekt0ejk1UCsyaDQy?=
 =?utf-8?B?ZDVHZDZJSmo1cjA2YnpUR0t3U0NNOVRiaWhFM09UU3FERVdQdlk4RGVlMUVQ?=
 =?utf-8?B?NE56Rm92YjZmUzMzdWpkMjBaMHNUeFRNblZndE04OG1EWER0RkhLbG0rZXNi?=
 =?utf-8?B?MkQyQjlIVVk4SGVLbkNPSVNIdzRGbWJzc0w4RDJvNEFOTThlTlVudUoyVkUr?=
 =?utf-8?B?Z25CUk43UVdYNGM4bGlCZ3VuNGlBU2lmSGRodnM2b21PR0dZWUY2U3J4dkFp?=
 =?utf-8?B?NGxKSUJRSUU0eks2TDdtUXVxa0NJOWRQN1UySGRzYjVrTng5a0p4QWVYNUp3?=
 =?utf-8?B?VzVqZlp2NmJNMU5lRmYvZlBKMVRFQXA2RXplU3o5aU9CME9GbmZJKzU3aXlN?=
 =?utf-8?B?Q1ZSZm9TM2l0ZllFRklhKzN4MU1kSEdvZEQwVkZoVnRJbXJKNmJVQzBqREoz?=
 =?utf-8?B?bmhoTXV1bktCaVNaRTlRcE5DRENzdEphZVhIZktZUEtVUEdJeStYakNEU1h6?=
 =?utf-8?B?eHp4UUJpa1RjVWFjY3FXSzhPeW5FYTRGVUFaZ2pULy81dVR1dmdyV2twbndI?=
 =?utf-8?B?WDZtOXVFZWEzUU9FMHNkNFFiUEkraDRHT0pDamwraUJDOGlPWkdyaTR3QXB6?=
 =?utf-8?B?bTNqZkxDLzA0SFFPU0RpWnZmM2RXaitBTldzQ0krbmNEM2Z0MmNtVFZHazk3?=
 =?utf-8?B?N1dGaEk0RjJ5V2JKNjc1dzdERDhMdHR4OEx2azNBTGxXRndwTUtOMlNkYUJq?=
 =?utf-8?B?dUJtendrSDZwdGVyRTVjazY4Y1l2am5TNURVMDJ3UHVMWWpTU1hscC9jOEZD?=
 =?utf-8?B?NGtxSDlId2M5SnV5ZkNSTlRERFJVSWZnVHFBbzE3ejJsR1U4b2h2Yi9NL1pC?=
 =?utf-8?B?TXQ0SXBSUFVEa2VjN0haSG94MUd4YTZMd3BXSlF3d28xcXltendEeEdtKzJT?=
 =?utf-8?B?UFlTcWNnNEhWNnhpOWlLc1k2VEU2QXhOZjl2bUliUXRWbUhtTTNmdFE5eWF6?=
 =?utf-8?B?Q1FFQWZab1lpWDEybnlEZ3NtRXd5dzRZMzJhekpGQ0kxQ296NVYxMC9QN3pD?=
 =?utf-8?B?SXNWS0ovTlFxeXFqV0xSVSs4YjYvTUk2Rzc1N0Z2ZXNzU0NPZmlLMGhROHRC?=
 =?utf-8?B?NWtVVDJvdENDUkVTNHNGY090TURTNm9IcXNHT3F2RFdtanRNSloyVU8ySVpq?=
 =?utf-8?B?dGRWWHMzWlp3U25zVXhZSGltV1p5ejV4SVFZQ0dwTHh4R2ZOaDRJbk9xZS9s?=
 =?utf-8?B?WWRxelZ5a2liaFdzTHJqZG9xb2w0aEV2L3JmZnY0SjE1YnY1b3FJYjNmd3B4?=
 =?utf-8?B?eXJEbVJFU1F5cDVncHJQMm1sb0RoNFhvcUZLekgwYXh5Ym1DVVJxVERyVDlz?=
 =?utf-8?B?M2c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d354cc73-3665-4c16-3535-08d9beff37c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:42:40.9749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2knbYDWmXnxpdWZ8wYlDbdVYpAfSbuyR+vCcoJdZXUpEIz8uhAp5T6oRXm7O7yoH6OhNq1dJliCZZ+1eeEIouQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_044248_912835_B1535EEB 
X-CRM114-Status: UNSURE (   4.98  )
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

On Dec 14, 2021 3:18 PM, Barbaros Tokaoglu <btokaoglu@airspan.com> wrote:
> For 16 kB data cache with 4 ways and 32 byte cache lines we have tag LSB
> [(128 locations for each way: 7 bits) + byte offset (32 bytes: 5 bits)]
> lower than page offset (13 bits for 8 kB pages).
> So it is possible for PTAG to change even for single page loop. Hence
> update ARC_REG_*C_PTAG register on each cacheline iteration.
> 
> Signed-off-by: Barbaros Tokaoglu <btokaoglu@airspan.com>
> ---
>   arch/arc/mm/cache.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 8aa1231..d0875a8 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -251,13 +251,6 @@ void __cache_line_loop_v3(phys_addr_t paddr,
> unsigned long vaddr,
>   	num_lines = DIV_ROUND_UP(sz, L1_CACHE_BYTES);
> 
>   	/*
> -	 * MMUv3, cache ops require paddr in PTAG reg
> -	 * if V-P const for loop, PTAG can be written once outside loop
> -	 */
> -	if (full_page)
> -		write_aux_reg(aux_tag, paddr);
> -
> -	/*
>   	 * This is technically for MMU v4, using the MMU v3 programming
> model
>   	 * Special work for HS38 aliasing I-cache configuration with PAE40
>   	 *   - upper 8 bits of paddr need to be written into PTAG_HI
> @@ -268,10 +261,8 @@ void __cache_line_loop_v3(phys_addr_t paddr,
> unsigned long vaddr,
>   		write_aux_reg(ARC_REG_IC_PTAG_HI, (u64)paddr >> 32);
> 
>   	while (num_lines-- > 0) {
> -		if (!full_page) {
> -			write_aux_reg(aux_tag, paddr);
> -			paddr += L1_CACHE_BYTES;
> -		}
> +		write_aux_reg(aux_tag, paddr);
> +		paddr += L1_CACHE_BYTES;
> 
>   		write_aux_reg(aux_cmd, vaddr);
>   		vaddr += L1_CACHE_BYTES;
> --
> 2.7.4

Acked-by: Vladimir Isaev <isaev@synopsys.com>

Thank you,
Vladimir Isaev
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
