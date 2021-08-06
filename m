Return-Path: <SRS0=yxcf=M5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B90C4338F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Aug 2021 19:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB16D60EAF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Aug 2021 19:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB16D60EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6Z/2HzPLLvoxVqqyzKN5lmtgafgKqipnBGw2M05WCw=; b=WEZvZVmvAOryIT
	6iJ7V32D401tzOAoxLtzLyAZHs8RZLDQQh5+6NeyP/5LJaiblb6hKbDdCD0Ww6YEFODcOPrpXf1Uu
	tcx/+6JNl2P4xPQy4XCPa8brFkjmq/bVwb8sQV1v78thuneOZQLzmTCj1qYEi7vex77ep+OXpkMM8
	aIVizKTlBitPKh7mS9xC8Yj6OJYjQbHsqeCZkw5HGfKGoQ66ap0aswi17fPYkvoV9weU9Tkvb/ASE
	b39US4rp9fWTIv02iek+fYui96/d2ZZv2A6SCcM6GQTz9C13pyViI6dCRhwILPd9LsK8vLeVnfXR7
	A2L5SWPY0UnbR+YiexNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC56s-00DEh8-41; Fri, 06 Aug 2021 19:02:22 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC56p-00DEem-5I
 for linux-snps-arc@lists.infradead.org; Fri, 06 Aug 2021 19:02:20 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CEB3A41089;
 Fri,  6 Aug 2021 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628276535; bh=VPXV5W1SE2064T87JVvoyFcv53Ty8fh/SyJ2O3HIQNg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Cqah8+3y2CK+2Z7Omz54P8LB4VJ5ghcQtI99WsbEXdnO5WvUr3oAICKuTBWragYic
 n2J3IMgqCnWziyEu6Q2lkPuXrpv+ynfDAvVz/YgQQK1aVadIOPyI3VIw4IMU/u+gya
 XX/fQAvDKYBsQexdpXODqZNciqI0lNY6WwzMYg71mYGF0HR42a8c6ONp7JeoRCejOF
 9YlwB2AJbphEPf3Y00JFdHwEOpa+cEDMY2gyS+eFgo1uhngnsXYzUtKSAgnWwpeahO
 /9+iyebZQXHZmUtnlfbqnkSf5c91MeaY9d6822N0qgMrnuXCELR5KKqUuxVZSiwU8N
 B8DOuYyh7reYQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1B049A00DD;
 Fri,  6 Aug 2021 19:02:12 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5078480219;
 Fri,  6 Aug 2021 19:02:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Wk0SSmv3";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoEOAUFYF6Mb4XoxSk6S+wLn467NU85gJ3JAYywB5VovxGoihdRd3pFVx/hXBrljdlq0Ob8YbHQUD/P+k6xpYmazOI2i4/Zhjsh/xad+Ox03ZpxAupuiWAgdaj/qzgXug5bSndagNO2J4BGZKfbbo44zYmKCWZyYoz8K8VFfK3haYT/rMDddj9FXNCoUEwCeW9YqTcQwziTZ92yxL2VdaSGs3msZjTp/lFHhM/cv8m5DAiwIVhKc3EPr3wwse+yZgYNNDWKBS0DWaxuSah8mbkmUnkrKrK/ZJfoiqIzN+I0q2ndTWa7I4cz4AymWCQ3PAPgRjAMumuLkeHYp/TegOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPXV5W1SE2064T87JVvoyFcv53Ty8fh/SyJ2O3HIQNg=;
 b=VR/ZWJW0iDx3OrTMHJrm30fa2GSHOE6ieUKjVZUZMyCI5uxga8tTJUeSXcF/3rgHal9lePhUHLgOik544RrfIBZTojzCl2S1R6eEUbGWIiM6iocfgi3YU9P3Fk4PZh/xTwnwt0moAS2Bt/8OQvv3CInYXBzEBh1/RZYoKnxcEo4886z4P30oxFmR7xrULr/g52BOOzwFx7FWEe308iRgeqjbYtc6S+miuboUXG5fyZFQgXkUId2ir1GUxeRdC6ob97MMuQciId7qp8sqGDIAF304qaCgx3krL4Typ7z5Wvf6a0m9hHIkWfEnzPZtQ3iJxg3jQgx6yJp0ROo5ONcydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPXV5W1SE2064T87JVvoyFcv53Ty8fh/SyJ2O3HIQNg=;
 b=Wk0SSmv3u+Od7b4/WeMdzQUTUWwoDs0E1mnlJAivCq2TsFJg4tRhOj+eqJl0tfymHDBCgtRrzHwl1R4tlxxNW6zn91M9H0VtQ88opuXnRF8B0Hcw6pJZpeSgC4ch8rY0kBaUOLVNQcRgRgohsbMvthkO6qkUJfQaIMVxLn3fFtQ=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3697.namprd12.prod.outlook.com (2603:10b6:a03:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 19:02:07 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 19:02:07 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Will Deacon <will@kernel.org>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>
CC: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Mark
 Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [RFC] bitops/non-atomic: make @nr unsigned to avoid any DIV
Thread-Topic: [RFC] bitops/non-atomic: make @nr unsigned to avoid any DIV
Thread-Index: AQHXii4WOTDVGX/qWky1PyNWg17Mw6tmfYOAgABZOQA=
Date: Fri, 6 Aug 2021 19:02:07 +0000
Message-ID: <d67f12c0-4ede-2a81-9de9-570beb662884@synopsys.com>
References: <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
 <20210805191408.2003237-1-vgupta@synopsys.com>
 <20210806134244.GA2901@willie-the-truck>
In-Reply-To: <20210806134244.GA2901@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ecea63d-1617-4e03-757b-08d9590caff9
x-ms-traffictypediagnostic: BY5PR12MB3697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3697688F27B788D9099EC05BB6F39@BY5PR12MB3697.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 76gDTepXpVA2svDw7/oMvXyk/Zz0jc6wqNFqzaKxJKliYqqjxT2k25PYEThxOezUC6RAN+iEH9faQdsoFsDHRJYP54+x11BBOtdxoLln8sKqQ8hMN+8aHiB3t/OiXi7FaRjX+TjgzcZjjnGOz55cv4DhyEob4EqNz/3kXt+sIffpCE5E6/9En2p6Wa83rGZMFr8UuzN/e9fBC6DSNLOuRvNEUx0798BQzfGJlm9KE24LtF6pvd8Vj1+0J8k2CX9K3I2UA9Js1ZtYsmgypllZndBuI4RTHetR3HWewHGdJZt8zocTGSlHhBBsT1kHf2LPvRO+QFUfNuupJhbnYDCFFPIqIsGy7rVrTuXc4nVdFlGrnRHQfE6booT7f9W/ctuGRzI06Xd3VeRXwmw7aWbeGfxNpskxr8L3ZWFH8YXYz+QH96kgiMFoQiK7khphOFIMVLwuVkDqDGFjhkmPzBi7jHOVn4Nf8pyY+HIn0h4N9j4lJaRo7Eq26wehM9CR/m9oETFKEq4WnoZnJ9Wufib8zdHIcBYl2n0bkD1bvdC2jjIHSiSn/XqketiaMI2F2ClOoZDXBjS/4q+d++Y2KkCF7IPjWCKiFNkYq0ta2f5nbig9QLu+NlYWrw7Cj0g9IzPQ3EyGby6r7/Sws2wu2fIIRN0FgJf4gLAhQoGRBl9rntyRHT+XQfrxKBFN/u+rq/HBuVrKmMbHoqsDk27fOszx0i7UNwv7oIODzrqQ96+9ZSeBOzwD2rxm/LvQrQ6vFfFE92yKPYJw4UgfQOiH7VL5BA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(64756008)(66446008)(66556008)(38070700005)(71200400001)(66476007)(86362001)(83380400001)(66946007)(31696002)(8676002)(6506007)(6486002)(5660300002)(53546011)(2616005)(6512007)(36756003)(31686004)(26005)(186003)(38100700002)(478600001)(316002)(122000001)(8936002)(110136005)(4326008)(54906003)(2906002)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHlWOUlmWmlmSFo2Vy9JODJxVEs0UG1SaCtINFNpWW9QNC9BU3dJcnlUdHUv?=
 =?utf-8?B?SVZnbHVJQUdKTm1zcVdmOERpVFhEWEI1SWlJQ05nMTlpNmVaZ0dhV0xKZ0FD?=
 =?utf-8?B?Ry9CREw3VDc2dTIycjJIMGVLcWhNdm9mTGpzdXVLaTVzakRMSmVLaVc1UnVp?=
 =?utf-8?B?a1VpT2VKM0xzN2dEclFsbUVMUzFldGtqNjdxa1FVTzNBTXo2NFZYRFAxTC8v?=
 =?utf-8?B?WmphNkpzQmoyd3pFcGFPQjZGYURBQjRTYi9aeXBsRmhMOHF5cW11TlJVZldG?=
 =?utf-8?B?T1M1bURPWDMyWlJRVWtEdVpidWdVVVJ0ZnlKRE9TN2Ztak0reDUycFFTTHVx?=
 =?utf-8?B?dHdhSHdhbUQ1Nml3dXpRNFoyU21iaHRwbUtUeVFGU2pYdkRJdHViM3d6TGpL?=
 =?utf-8?B?VGZab2dYTjlQQU1YaWZob09wZlNoMTlLYk5hYUdjVzVQMk83aWZQZzZYK2tS?=
 =?utf-8?B?WURJSFdaRFkxRzhmRTdkMjJCNm5VYmNsNk1Md2d6SFBtUkgyd1pjV3REYUNN?=
 =?utf-8?B?Z2g4KzYzVHlvZFhSd2treWJXRFZMVmJtMkxkdjByMEYyTGc0T0pSQXVhMkdE?=
 =?utf-8?B?ZXd0eC9XazhlTTNtN0tadUdyQUJvM0FTUnpPbGh0YlhJb1RjcjRHTVY3d0tY?=
 =?utf-8?B?c3RoVmJBSGxJVW96cXZlUWJSZW9BMlVJL20xczN2SzErZTNaVHNEQXFvYjNW?=
 =?utf-8?B?b1NiK1U5cEQvS1ZQYXpWdk4weTFPRTZLeC94UmRKVW1jMGlKME5xS3VYVlJB?=
 =?utf-8?B?eXc4dDJZU2Z2bkFLUDYreFNuL3gwMEpvSEVJRXN4aDRNNnNjRjlaRTQ0anh4?=
 =?utf-8?B?R3B4ZnZVZDJLZjAvTkJLSlZkQUphTjFXdGI0M05vdllwcXdaVUlmOWhyeG92?=
 =?utf-8?B?ZGcvRW1jWHpuMU95cVAyb0RJZjd5MEtydnZNTlZDdFEzSytsRFIwNGZKWTU0?=
 =?utf-8?B?K0I4azNXSlEraGk5SWpVUzRRbFFKSzlaTHhBQVJacndqRFpRSUdxbkM2QzhQ?=
 =?utf-8?B?VWhZU3R4a3pPbTRwTWZxOHBpWTh1bUZpSVRIUjhDU04wTjdYOW1VaHF6b2JR?=
 =?utf-8?B?MTB0S0Zxc1p6dTRtamFoQWlSVEZUR0crbDI4SlYxcGcxQVg0anJUazhIOVNi?=
 =?utf-8?B?aFhFNEdTQW5WYjAybnZvOE1sbDVRQWJJNm5wTitmeGEzWXI4Sm1keWE3NlhM?=
 =?utf-8?B?ZGhlOGR3djRsZGlHYkVWMTNic2FDT2daUnRucWRGSUZ3MUVyZXZTbFFkbG8y?=
 =?utf-8?B?SG5Da3lDc1pHZ3lrVll5TW5ybmwzb2hiOE0zQ21SMzFKTXgxeFROOTE3RFZO?=
 =?utf-8?B?SzRyVHRBTlJUbnp6VkhXN1ZtanFuNVozdzRCakVFanRoT2ROd0gvVXFucXRX?=
 =?utf-8?B?eTcwNk5sa0RDcms3VitTdngwTlhCbVhROHhpSzllTzRTeTl1VkN4d0VyeHlD?=
 =?utf-8?B?dFNSZ2tvazkyYU9vZUUvalhkQXh3MVpSNXdPREdJZzhjUGJRb1RTbm9uQ2x4?=
 =?utf-8?B?TkExcUY4dlZuUFQ2Unk1cDVzOVU5M0NpSXBqVUdVMWJGVGU4M3RYOWVoUzRV?=
 =?utf-8?B?NXBUUkduWnV4SVRzc25ZWU55em5XelNSbVNIRzJIUXM4L0JaOFhFYVJQK1U0?=
 =?utf-8?B?ZWx5N1FkS3g2RzRtUUtNd2xwcStDNXdhNUkza3EyREdGOHBJZ2hzdnFNNjM2?=
 =?utf-8?B?c0NQWHZ2NkpmQytObnIzdDRxOGR1UkdYZzRIQzN3b2hGbXhsdGR2Qk1hQVUr?=
 =?utf-8?Q?KF8snT+TM1QsRANQno=3D?=
Content-ID: <D85589D197A0394EB49185054034B434@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecea63d-1617-4e03-757b-08d9590caff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 19:02:07.4348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqkSAMsoDx6htIK8fPN9qNpHW/b6MPifpIadwcfqxT6etQCMMtGugUQacofndlyuFRQXgunW9WNyaU66QHc5Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_120219_256284_D08D71AA 
X-CRM114-Status: GOOD (  19.85  )
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

On 8/6/21 6:42 AM, Will Deacon wrote:
> On Thu, Aug 05, 2021 at 12:14:08PM -0700, Vineet Gupta wrote:
>> signed math causes generation of costlier instructions such as DIV when
>> they could be done by barrerl shifter.
>>
>> Worse part is this is not caught by things like bloat-o-meter since
>> instruction length / symbols are typically same size.
>>
>> e.g.
>>
>> stock (signed math)
>> __________________
>>
>> 919b4614 <test_taint>:
>> 919b4614:	div	r2,r0,0x20
>>                  ^^^
>> 919b4618:	add2	r2,0x920f6050,r2
>> 919b4620:	ld_s	r2,[r2,0]
>> 919b4622:	lsr	r0,r2,r0
>> 919b4626:	j_s.d	[blink]
>> 919b4628:	bmsk_s	r0,r0,0
>> 919b462a:	nop_s
>>
>> (patched) unsigned math
>> __________________
>>
>> 919b4614 <test_taint>:
>> 919b4614:	lsr	r2,r0,0x5  @nr/32
>>                  ^^^
>> 919b4618:	add2	r2,0x920f6050,r2
>> 919b4620:	ld_s	r2,[r2,0]
>> 919b4622:	lsr	r0,r2,r0     #test_bit()
>> 919b4626:	j_s.d	[blink]
>> 919b4628:	bmsk_s	r0,r0,0
>> 919b462a:	nop_s
> Just FYI, but on arm64 the existing codegen is alright as we have both
> arithmetic and logical shifts.

ARC does too: There's LSR (Logical shift right) and ASR (Arithmetic 
Shift Right).
So perhaps something to be done in the compiler.

>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>> This is an RFC for feeback, I understand this impacts every arch,
>> but as of now it is only buld/run tested on ARC.
>> ---
>> ---
>>   include/asm-generic/bitops/non-atomic.h | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
> Acked-by: Will Deacon <will@kernel.org>
>
> We should really move test_bit() into the atomic header, but I failed to fix
> the resulting include mess last time I tried that.

OK I'll give it a try too.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
