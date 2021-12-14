Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462FC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Dec 2021 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=729mpaq/LZYX5zeMGRQmwUdzWTJMS7i+R/53E6p0QCM=; b=2Gwa3QchhNBW15
	s0QN4Mo4g0MmgZF1BOrlLnomr6kPTCJONIFKAuPsywsuZsLga54aI7MdCV4eHg50OiCl47s7uNoDJ
	tCWOyfV7FQakxr5k8IyB/PxmuEdhFC+meYVVYk8tYTUxtotdhWimZmWS3w77N1MH5DO0NhEVhoVT5
	bdHAic4rj4U5R2SEj1oJgWWOff3kg+jWV7d088INUUoOVBXptrB0IPYtPu6VOQ3k3VLo+DFs+1tRR
	HJJC3/QG16VhzFM+X7NVdBHpefD0vY35BGmWV2z4WmH5ucKTp24JFrHGlWfFkfH+c1BrYJxIMGcJx
	c+nikmchq859+KRR961A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx3In-00D3mt-9N; Tue, 14 Dec 2021 08:36:49 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3Ik-00D3lN-JN
 for linux-snps-arc@lists.infradead.org; Tue, 14 Dec 2021 08:36:48 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D52B1C5057;
 Tue, 14 Dec 2021 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639471003; bh=xAgqbismd+0YfdH2LGfF0ZBnxfHG4sJjmEHEhTCh5wU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=USnvii1GK00YoB8ECh8FzSXT/7sxV9od0Hpx8H9vCKNcdB3Hgtdzk1vkRcZXfYT1Q
 KW64bGzarl69jNRLvymWeSpEEJsQzzeJ6f/M30F1EImHeQZuA0WO/O8ptiGP1oxM0v
 efo7xkpF/pIcuCp+jDTMWCjEV/HaDD/tVcN+5ZfOMIRl5E5tiU/DqJTtIt4+uCEjDI
 q9WApbLbkvoWM2c36GlFNgyxngJNEbOEWmNeRv3zXx9pDtapXJt1oByCmMd0WAImF8
 WKJoCmM5QR6rVU3PlJ5Gzlv8PG0xy1GG8LxPZD6JstzsV8K3P15BTndvkIHjYhA81P
 pFGcH82ikvzaQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5B099A0063;
 Tue, 14 Dec 2021 08:36:41 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E4E6D801FC;
 Tue, 14 Dec 2021 08:36:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=isaev@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="poZfah+Z";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhM5csur+qg6cZUp1CUKVC5HzZPVFw4oBUOw1mf3TnjCHyFSTCWyfXY7RqfxfIVfW5FgJZPnTC05Tb0a24Oas+t7lpKoI+TgQu8m5FUGSWh/SXl1tvwIU7kOyx59cCG6pRWc+mpeXURG9JCcnqpzokC2jaZvok2QB6zma2jgImSygxdkVtpq24dudTaXCiC5qFUrUOyN6sgIDqaP5iHv7qxXFQF7tYCgc6VHvvz6iuYJAgudNaGyqfRH8QVOw6lXTZcVw/a57DfYIwmoZ4ZBNiX9L69joULLZWTkxFjfLT5y1ZOESjTBoyFIBHXuxP+8zlUUaeTZ+G8T9C03zsq52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAgqbismd+0YfdH2LGfF0ZBnxfHG4sJjmEHEhTCh5wU=;
 b=ez/kBOXZ2fXfLAfpL8baajtzztMCK73l4ILklLaeNiD0G8OFbh/cP7AyS1/QAUCpn4JHPMyhFJv8gQ/26z1cLYHRCL6M/66vaq81qf6fWxR2r0OATewba7vNrhMTvLVLvSDPtdbENX8nsH7LI0oTKrS5t+R2O87TQ7VLfJJSfgTwtHsai4nsyhehlejWG04fzemUy3uGRK4r1kUhOEEDZFdsIo7jAjQlg7cZlmZNk9Nwb4REB061UwOWYCE+mKRiir1vxCxJ+3e09wOuq/AaqEWGd9P+Yw6Eu5xAWKSShj7Vu6jeg2JQL/a2db3rZJo9Xr2YEHmer/ant5dS7bbdSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAgqbismd+0YfdH2LGfF0ZBnxfHG4sJjmEHEhTCh5wU=;
 b=poZfah+ZTCA4xyJ8WcolZVuFH0QgtqsvuktbJjSL4ImAf40345hyh8mqBC6rwa217x6IND5QnqiScA3h1D+ARPzgZUkNJ7dqvFhFK9830QWCvGLlVKCc5iyTAfu+0dHGNaMX84/3vGxEsKJL7GQniOYTuW6fdfO6bzdXOksrqeU=
Received: from BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 by BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 08:36:37 +0000
Received: from BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::a179:8d3:ce3c:a83a]) by BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::a179:8d3:ce3c:a83a%8]) with mapi id 15.20.4755.022; Tue, 14 Dec 2021
 08:36:37 +0000
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: Barbaros Tokaoglu <btokaoglu@airspan.com>, Vineet Gupta
 <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: Miika Keskinen <mkeskinen@airspan.com>
Subject: RE: [PATCH] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Topic: [PATCH] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX7iPAZzqOKo4ehEGf1OJVEc+hJqwxqzNw
Date: Tue, 14 Dec 2021 08:36:36 +0000
Message-ID: <BY5PR12MB41314B91969F89D2AC638C41DF759@BY5PR12MB4131.namprd12.prod.outlook.com>
References: <cdddfeee-1718-ec30-bb17-2971d74b89cd@airspan.com>
In-Reply-To: <cdddfeee-1718-ec30-bb17-2971d74b89cd@airspan.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYVhOaFpYWmNZWEJ3WkdGMFlWeHliMkZ0YVc1blhEQTVaRGcwT1dJMkxU?=
 =?utf-8?B?TXlaRE10TkdFME1DMDROV1ZsTFRaaU9EUmlZVEk1WlRNMVlseHRjMmR6WEcx?=
 =?utf-8?B?elp5MW1NVEJtWmpZM1ppMDFZMkk0TFRFeFpXTXRPVGd3WkMwNU5HVTNNR0pq?=
 =?utf-8?B?TVdaak0ySmNZVzFsTFhSbGMzUmNaakV3Wm1ZMk9ERXROV05pT0MweE1XVmpM?=
 =?utf-8?B?VGs0TUdRdE9UUmxOekJpWXpGbVl6TmlZbTlrZVM1MGVIUWlJSE42UFNJeE1E?=
 =?utf-8?B?UXdJaUIwUFNJeE16STRNemswTkRVNU16azROakkzTWpjaUlHZzlJblJhVkhK?=
 =?utf-8?B?bk5FRkJaRXg0WW1WWmJXUjJLelpSVkdJeldHWjRaejBpSUdsa1BTSWlJR0pz?=
 =?utf-8?B?UFNJd0lpQmliejBpTVNJZ1kyazlJbU5CUVVGQlJWSklWVEZTVTFKVlJrNURa?=
 =?utf-8?B?MVZCUVVoWlNVRkJSRWgyUjJWNmVHWkVXRUZWUzBKQk1EQlJkUzlrTkZGdlJV?=
 =?utf-8?B?UlVVa00zT1ROblRrRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: 0ba4c5f3-3a44-4c73-28bd-08d9bedcd7c7
x-ms-traffictypediagnostic: BYAPR12MB3560:EE_
x-microsoft-antispam-prvs: <BYAPR12MB35601727A31E4C8E74A45AFBDF759@BYAPR12MB3560.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xtL7MYqlo8KmopBc1WehMe0si/NSKPlvthVsD3NDlCcxHMLJmgPU3k4+Y7pEbPpm7WobyjZXdPZbzJo1cvVQXDpA68dKJ4ZNst6rRQCPgu0H5GS/rNm47mG1rv6om++BRJFzCXXsEMl/0eCN0qt0H8p6/R7CF6Ovq2ctnBjVn2x8iFPMwpVEdOoJlVehOuvBnrfYk+c03iyqYHbCHRCOBNx5NpsbfYrVb6XsBT+KlbcLKYjLU5p8sCl8m/zO86z1ZlDdw70L/TO4xFrFeW43dpPk5vbtEoVWZVv3An/oAcRyvSvsb6D1YpXPYJS0aHdYtTW+K1OSozcK16YTHSDpppxfppVv0pue9RQmHiiTh6YfNBxXvMZUH9UQOqZ2G6kdxRjZ+acJB0qtEkvszfqjMoSeZgC+x6tE/2b406LVznTFKja+B8nIezSiVXf5enow7iWiB6Hyc4pKF0biExvDqg3m6bc9as3l0Vp0Viug427kSHWprA5k3THSw8BJiH2aFg6KHZvRZ3xYqmZo74u9zaBfVkkh07O1j/jTLDsEoa1rAKejr1Vmtn7YMEbeDZVeskKJ06HwfQEmNw/EzHpUdxXWjsA1wp6Xrr1CTValMpOzNsrUfB0EDyMrhP7zjlNeKCEDCQWv7G7KlFPuk5O34ahQnPnPLS415y6WkOtlK3JezOfybR6tR7wmY73yp86LFFilyjc/YPyVX7TVfUjsXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4131.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(71200400001)(55016003)(508600001)(2906002)(83380400001)(4326008)(5660300002)(64756008)(7696005)(66556008)(66446008)(38100700002)(66476007)(4744005)(8676002)(33656002)(26005)(15650500001)(53546011)(110136005)(186003)(38070700005)(316002)(52536014)(66946007)(76116006)(9686003)(6506007)(122000001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGk3RU5LV05xRWVTTWRKeHdheThRdDNIb2VsallhdUhTMFdVK1JrbElUZHd6?=
 =?utf-8?B?eE9zUm1ZbFhGb3N2NjBKNVR6QjY4NG16NFYzWnVtVC8zZWEwdm1GbWUyRjg4?=
 =?utf-8?B?L3RvNjRlb1lxUHNkNyt4RHhpQ3NzbnhUNGY1NzNXcGxDMzBQeEY1MkZIQ3hu?=
 =?utf-8?B?TjVyMmhnem1TczZUc2VZM0Rhcmh4c0gveXlqUU5YNlgvK3FhVWs2SmlQODFJ?=
 =?utf-8?B?RS9oN0FDRy9iR3dlOXZId0ZXTlNDR1g1VTMxTXladkJJL0YzUGIrNVBiMlVL?=
 =?utf-8?B?a2d5QUYvQlhJTjBSN1B6eTJ6cktvQkY2YTV6Q0kzNHNqRURJRHdXTnBsM1ln?=
 =?utf-8?B?T2VMNDhoMXoyM0tPMHJHYTFMNWRYdjN5ZUV0czZOZml3cmdITnZmczZKbWZU?=
 =?utf-8?B?ZG9wd3VGYkRPS0hIMlNSc1JDeGpKZSs0OEVqQzA1MTAzdTRsdmUzWWF1aVNE?=
 =?utf-8?B?NVU0dUFUa2JmemdabDNYckl5SHJwdHlQdnNRTlNUQTFBTURtNHloWlJZZ0pS?=
 =?utf-8?B?TjZrSmgvb2J1TVZ5d0NiYU04KzJzR3BTTFcvamZXNlV1WTA4RlRDYXozUHcx?=
 =?utf-8?B?dXN4dTZDcmlucFl0UG0xTk9wOXk4RWY4UlRGdUtrQlAyL2JQMndmWkMrRXpN?=
 =?utf-8?B?ZWQ5VVMzSzFRbkhvUWt2Tldza09iUnhqVGZjb1pNLzNxV3YzZUNpV2RzZmEx?=
 =?utf-8?B?SlI4di9Ma3Q2SkFacVh4MGM5Wk9XQkpKSktaUjNGV3BYV1VhdlhzSkQ5ZHBq?=
 =?utf-8?B?MG9OWkVIOHVtQnAzdGEvZEJRRG9xVGtVaWdxbGZobFlpRU1ORWYrUWVXUUMr?=
 =?utf-8?B?WHoycXpjWFVhQ1l2ckp2UUtIa000UGdIbTRUR1JkdFgwd3JNQjdRQmtSVTIr?=
 =?utf-8?B?NnBFQ3EvemVLUE5PclJzS3JyZUZXY1dueThKVnB1TjNxbU9sU3V3VVhoSS9P?=
 =?utf-8?B?VWV3bGsvTjVNb2s1bFJXeXFPTWJMZzdDZ1FBNVVZbCs0YXZxWXZ2Y1N3NWxF?=
 =?utf-8?B?WWVtQ0NCbEc2SXlFTXNyTjJMeFdCVUFCRko5QUpOaDRTUEQ5MTRmelZPSk8r?=
 =?utf-8?B?N0IzRTNWM0pqeG5iL2YxTkE2aUF0TXNQcUpCNmpOVUN6YUpIVERINHNPWjgr?=
 =?utf-8?B?bXFxeHFydFZVR0lRb0NqR045endYTVdYUld3SytxRXovY2pxaXJCRUVpUC9B?=
 =?utf-8?B?bzg3b3NjT1ZEVXFicEFRNG42SEJqUWxTRWJTT3ZVRGcyUnRDZEdBaU5URFNN?=
 =?utf-8?B?aW42ZXlJVjlLbDZtQk55Y2pjcWFBS0s2aTFFcHRweHlZSTFoR1loS1pzRnJy?=
 =?utf-8?B?TUNUZm5WNFhKSG5JdkhNdk5vVzBYS2RCbjFsdStvNlBKZEozRDliVGZ5Rmp6?=
 =?utf-8?B?RzVCeUxvdDNRNEVGaFNYMjY1VEtGRGt1T1MrKzFuSUFpaG5aUUNuV2hHOHJj?=
 =?utf-8?B?UHlHMmRENUNpN3laK2dzOFpaT2phQmJZRnNISXZ5NzZJendWSitYTlJwV1VW?=
 =?utf-8?B?UUpHYjBGSzFtSzZ6Y1BLYkpSYThLN0kyUHUxaUx5S1ZkcHAvM084QTViVGlh?=
 =?utf-8?B?UGhHZURxTjFGY1R1Q0ZvR0JnSjFGWXMwUUFqMFowRGlNazl4TU85aDZ6TWVC?=
 =?utf-8?B?MkZQMXQ3eVlvNTk4RUxVY25YVkpFbFdxcERMVVNRUFVHMEljcE8vL2F6dmJJ?=
 =?utf-8?B?RjcxRzByNVBlN2xyalphSi9GcmdkZkVHNVJBdlEyY0E2RDNpdG8zOTFucnVE?=
 =?utf-8?B?YVZaalI5S3Uza2ExYm9GVkNFelhHM0t3K0tUOTUxbXhJOTdaUTAzZDlyaWJ3?=
 =?utf-8?B?T2g3OXN0VUJ2bzd3clNCczJyb2hJdlFwMmNLRURTMjgrbG5FcnQ2VmU5dVRx?=
 =?utf-8?B?cjlDblRFb3N1eWI0U0pqTWxmTE8vVnBXdkkxSFVBaWdWZ0QwZmpiOWhJQzZa?=
 =?utf-8?B?ODBPK09PWVVpcmdwdUhDbm9aTWdEV0Y4bDJOdjdHWlVBV2E1d3REZVRpRktq?=
 =?utf-8?B?SDhocWhaQXpySlpKMkFNR3pUNloybmFocjFqc0JDalk0dEFLQndkNTdCcUJ3?=
 =?utf-8?B?ZC9VTnBBK0NUVnBQbkd0NkVUU1FvUDdZYzFkUUs3OVpOTE54enhVc0hhemVN?=
 =?utf-8?B?MXFlazlHRjhMWWNCb1c1NTFsSEtrVVJNcnZIV09zQVlVNDY0dy9XUkdqdHR5?=
 =?utf-8?B?UHc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba4c5f3-3a44-4c73-28bd-08d9bedcd7c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 08:36:36.9402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iay5QAy6Vp2BLByF4K+L2JFOCJqvPuoCunNlxzVaO/82vM8Vluew/FzYmtwIe2N8FhAidIm5/cMEOshYsUpWUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_003646_828839_D7F110D1 
X-CRM114-Status: UNSURE (   5.20  )
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

On Dec 11, 2021 3:12 AM Barbaros Tokaoglu wrote:
> This patch is for a problem we observed on an ARC770D and MMUv3
> implementation.
> The problem was although __flush_dcache_page() returns there were some
> cacheline
> entries that didn't flush to DDR. In our case updating ARC_REG_DC_PTAG
> register
> on each cacheline iteration with updated physical address helped flushing
> cacheline entries to DDR.

Thank you for sending the patch, looks like it is really possible to have this problem
for certain cache/MMU configurations for ARC700.

It will be great to have configuration which causes the bug in the commit message,
so it will explain for future reader why this change is needed. i.e. something like
'For X kB cache with X ways we have tag LSB (cache_size/num_ways) lower than
page offset (XX bits for X kB pages). So it is possible for PTAG to change even for
single page loop.'

Thank you,
Vladimir Isaev
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
