Return-Path: <SRS0=IYFD=LE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577C1C48BDF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 18:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7398613B0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 18:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7398613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaFZhno2lPbG+SCb7cFpq8XeRvKqqgtxfnoufmFEars=; b=Q10kC+h0DplWUd
	8x8wCNim7Ck7TZnJeXgC86dJkUteO+U/q1cfM+pemkK9TKUUFDVJgHDiGE7hx42LPH9lD1z8A9LrK
	QDaYWDSfwAZ66ZTV/s1zRPeWTmaS0BlhkMvONDy/4xr5xzMUNvlI7mFAqAx/FQq8YqJ3OeNGeajvq
	RHsRgXFacqYQDojdrX5EY6jxBr9d1HZQ9UZpvTc2obp8w1Qqwjb5Hia/QHt9FHFP7jMNqEzGsk6Ar
	XTTyo+nZwygzT1qyXTqoZrxGiAMiX4T2NpVjJND+LMTJTJTlPW6TzCkF0P7QL0gvEa0Bfn4jvGrR/
	uOXUaCpM9mXwZhBnjS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrPrM-002DBf-Ab; Thu, 10 Jun 2021 18:56:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrPrK-002DB6-Fo
 for linux-snps-arc@lists.infradead.org; Thu, 10 Jun 2021 18:56:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF66540ED7;
 Thu, 10 Jun 2021 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623351413; bh=+BK8jrgm27sEi5WIqxbhFgDp139RjGl05vTTDOtaow0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TVj7WDvV99RLylpdsUp6eQwqfsMK/TFAk0CM5sGq8y4tPo1ll86KjOU7vs4sdPIaT
 R2RHQEj5mFKzA8BowyjTXXhmx1eu+MAgwZPfvdjaw2HURWVQ9yjAE9/endAdG8ENE1
 ov/FCE12b4s8qpaW3LcbqDk491vZ8vuGxcW9UZccHkVkDEBXa+kHNyt/CHA+qvEAvu
 IfoEa4JzxpghtjzwPstCP3Tm6Az3sbb6d2vXxT+gqx2rrI8lAWgXoo8P4Pa6hdSsM2
 C40/jfvHvpIXD348tRpmQeqHwoxNJOjvLlGLoezzLPenlks/utvBQYXJi2Z0BglDjO
 3Izx4EMKrIN/g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id B119CA0071;
 Thu, 10 Jun 2021 18:56:51 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CD587400A1;
 Thu, 10 Jun 2021 18:56:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ZyOcKP2/";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTv6oXEBFLxoK8vnAUPYqloADOPXoP+IG4j0bmjcyYwBI9/KPL/dC+TAh1cPX6OaVSYLjE7QJ7VuFHVcd/PLpY/kYRFS/BYxGrDdp3s8IOdtGHOjLdKzqbKqLmtOScTTBSsvnDkHdOOD6mxkaPC4S7cRDLUhv9EpTdokwkfwgW47PaZ+QKMpR6t5gjKEyOnB0DTR5nI6OWxJFoDxaGQYvVGUVPif6+KTqZ3Cd3+vpQA2rrsIub/HhoSikVAOkupPh63080Oz4vNH8MU0FV/XvR/sM/sQNNCrwLIDXsJonLosweJdEExGf/u7m2WKR1P9Ae51leC1h0VlP4CVQf29cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BK8jrgm27sEi5WIqxbhFgDp139RjGl05vTTDOtaow0=;
 b=UlhDKXEVD5o6mwf3euOoTbsoydcGF+WYnNMN3xew90ncDCIhdSD2vcaINIf1Z6GnD8oUjUydhqylt27bSDBkMU9odnZuvPxmDY7b5wqPE0zlDfZKynVdewqX0+thHgj/fkpH+CV4ek+SKCUfEeFFjhr39Tp5r+eXUl2nfVZK76cgfRsIBUEtOsmXCRlBphVBeix54kUcF7F0DkV23NhO68jYyG16grHy9rM2o0vuxMxnCUls9Ex8e9mSB9zuimmbr0/RSuLhOBuVkC1+8lLpbsl+ivJ4omAIZ1kmlKPxQm2VzUY6ffk/9FAIm4nxzEUhdMeG8TG9vgnXvqx1keQpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BK8jrgm27sEi5WIqxbhFgDp139RjGl05vTTDOtaow0=;
 b=ZyOcKP2/afV9xyCsu3ru1MDkRq28368+9DIJkOPHwHLrcQs/w/gHykK1F/6WZC2WVABOFpb2GJyE9fAkfUDLApckgs1I8VvYT2sD2VskEzsMjT9zV3NjrLijd++ZKBXKFGCpCzr8vRH3weLkxY0BVC84PLBNGRfRA6SjFl5Q+qY=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3096.namprd12.prod.outlook.com (2603:10b6:a03:ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 18:56:48 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 18:56:48 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Kees Cook <keescook@chromium.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Subject: Re: [PATCH] ARC: fix CONFIG_HARDENED_USERCOPY
Thread-Topic: [PATCH] ARC: fix CONFIG_HARDENED_USERCOPY
Thread-Index: AQHXXXyCf5WMbw9WXk6TXeQTkLP8BasNeb0AgAAgA4A=
Date: Thu, 10 Jun 2021 18:56:48 +0000
Message-ID: <53daee07-9c5b-9cf9-f08a-524afaee762a@synopsys.com>
References: <20210609221211.2457203-1-vgupta@synopsys.com>
 <202106101001.C736237@keescook>
In-Reply-To: <202106101001.C736237@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ebdb7f3-a986-4be6-f7d2-08d92c41802f
x-ms-traffictypediagnostic: BYAPR12MB3096:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB309681E77197A1C9BD772892B6359@BYAPR12MB3096.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 32/X2Ha+WJiN1KOSKhCQE2Ts6wC/g9bncOxd+OHXq6+fhdwta1VFYnaT8v9OrRrH9/aBGpCCILsk1heG98enLHIhesDljyfwJApnlo8VyA4+EBGCKddlo3IrEeWxIZxWt0myGBcr2JeTBNMD+S/hBHfnhpE7HBbc5vEQj/pgGkdRndpzpCmv7wKK1j8X7fZTCmp5WGTUdhN3jsKMpFeSIIT4JCPFezOkIuK8v0/cFsrZz40FdYsnAJrvSLSTk2GVOuA41bPKR2rs89kkVMaHZ5tdDpu1ZTHK2pNHP+EOLwh+x/29MhE7m+IgyOGlzIM3Wp8FkJBH1WnLqB1rH+BUYWEi4Bp9rgHlH+Uxc/jpyv4wStPHVY4RYkABPBG05q/GSu9B5sL/QNSRkg+24oOJ8PKAH8Fq9LczYoKPHoybTmRjD+jNE+M3OEFQJSCDyp4dnngHKrvtYCo2Ah/+oAbakgMW3uIaKAcfv92Duo4IMYuyjqCiB4QN+IYZWhdGPm4ZXbOkvoHO465leYjuZgI61TWYSkL4YXORj46ci/mKRuvHHad6KB8kkdd9XLmcCF6DYlH82MDuRWgrf76kPnEoyc1UhlaS77p9yuOHmVBpWdAdc/SkOofywRuqfoM/EFEVGldv7C5hbGL2EUv9MACSyK5TWWHJLw16EEwa6c47e8sZokee8Wd+5E73D3aYE3UE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(376002)(39860400002)(366004)(83380400001)(6916009)(66446008)(186003)(38100700002)(122000001)(64756008)(107886003)(36756003)(31696002)(6506007)(6486002)(54906003)(53546011)(478600001)(5660300002)(6512007)(31686004)(2906002)(8676002)(86362001)(2616005)(66946007)(66556008)(66476007)(8936002)(76116006)(316002)(71200400001)(26005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJ0Tk1mZVllQ3V5YjJ0Zm9rNEk0b21qTEFvU1U4SG1JbStTdlN6bkVyY0Js?=
 =?utf-8?B?SjJVTWs2Y21SdXBEamdXcnBGVHNvN0kra0hzYjRuemh5N0Y0VmtKRnlJems3?=
 =?utf-8?B?b3RacE1pVGVuZTZvN0RDYklrb1dFSzZsTnFka09WRnRCSlVWVmR0WWZGSTI5?=
 =?utf-8?B?MXRTbkJmL3UvaUZpMFBrWndyR3JlUitPNlkzRTNRUENRbjhZWFZCb216dXlE?=
 =?utf-8?B?c3FZVWRBR2pSZUZqdlNkSWNNLzBjb3A1NkQ4L1BpdlFYVDArWkpJcG5aVzJU?=
 =?utf-8?B?YTk5SmxhSlZBRitsQis4RXJZTXVuL09YZjNEQUtHTmFvRzkxajZ5Q2tYZVBE?=
 =?utf-8?B?cEx3SENwVE1UVXNwbVhDaUVpNStzRGlTTFg5TENxWWlaZ1E4OGRtTVdQb1F5?=
 =?utf-8?B?Q05CdEJFRDhDK3dYcGg1NnBtc2xkd3V4UmZSOUdSdzBYZW9XSmxWcWZoSGVw?=
 =?utf-8?B?dStiN0Rrc2hucnpLckdlbzRENW1aa0R2akdTY1V5WHl0aUszRUNHcDkzK2tI?=
 =?utf-8?B?SG5ySWlJY0hnVkhnNklFWTVBMzJGUzVIVHZGakF4dUZwdk5wNENKQmVsWndk?=
 =?utf-8?B?MXlhdjkxRjB6bEJ1TFl6bjFBOEVFK2JCSUZjaHYwYmZKQXZ5M0YwNnFkeDha?=
 =?utf-8?B?SEIxT0FORTgxejhSN1V0V3htVGZRZjdIbjlybG1rSEpsU0QvdlJBSWRWVWJW?=
 =?utf-8?B?TDExdzRWbERaVkFLcGlSbWxtSk5RdlVJQ3cxWkVsM0sxaGx2STcvY0ViQ1VE?=
 =?utf-8?B?KzZwTDJhR0JwNlV4b01CNFM4aGlZV0VPNzhKUjcrc2psS25uTkQzNHQ5V0Y5?=
 =?utf-8?B?eFVZcHA3SlFZSkJuV0N3OUNGdlRsRkFuTlB0WHJvVDFob2ViOC94aUlURElG?=
 =?utf-8?B?cFJNU1lCVjBmbTNNQ0xZbEUzdTVXdHJsaEhKZTZxcnBabkNsYmo4QTBHWHFz?=
 =?utf-8?B?dFppTGZkVDR4cEZSclBVbDB5akdCaTh2NndpaHdERmYzRXVCN3g5S3Q2UXA5?=
 =?utf-8?B?ck1qYVE1SmZWNGYwaE5MOUMwbW5wcXlSMEZwRlk3djBWaFlaSEtNaVcvTjNI?=
 =?utf-8?B?dklyS0Njd3FHMWh2c0NTTHJSZGx5SWhNY012cFV3Qzhva1ErS3Y2amFRK1ZL?=
 =?utf-8?B?RHR0bE9pTVVxalZDeWlqYW9YVjZOZ0ErQVE5VVFzY0ZUKzBIekVVeURheGlU?=
 =?utf-8?B?eVlsMjZIMWVjd21hNDZPeldHRFJEMm1XQnRNQWVic0I0RkJWMllwUzhWOHpJ?=
 =?utf-8?B?Mk9sMlBBR2dOWWZrcUZ1bW5NVmdGRmFtRGRQV2NwQkR4Y3FkdVp1SmhaVDFP?=
 =?utf-8?B?S0ZCLzZWNnhWM1NMN202Nlh1ZUFhakkzVk9IUVBWenpFSUVoSE5MRWV4QkZE?=
 =?utf-8?B?ZWVhV2l4TjU5ZzVQR2F2WXRaYTRYUHI0a2MyeXI3RlNqZ3lKVGpBZGk2UlZ0?=
 =?utf-8?B?MXkwa2doL3dhVUNJc1pGQnJKTnRrOUpLMW1NSVg1ZHZmNUtEVlR1N2swdlpa?=
 =?utf-8?B?aHR0UmpJSDJOZlR5cjhhQjFWV2ZJWFR2ZldhWU15bmZlYUxnb25wMGFSckFX?=
 =?utf-8?B?eXlMT25hTU5NcFZKKzJGMWxBUEtjTHdvSGRLWUMrNFBGRUJwYVdPSGN1RGpq?=
 =?utf-8?B?VldYRmQxSnpIZ1NscEJRTUlnS3g0NnliTmJNNUpnM0NCTGY1ME5Wa3pwdUZD?=
 =?utf-8?B?M0tqOFRLTEViL0JZSUNJYndaS2VkUU8xMXovWXZhTEtBeUdJM0pvd2RnQjhR?=
 =?utf-8?Q?OKVtjJu/POBmws+r3Q=3D?=
Content-ID: <8C41BAD3EC2C6A40865D360EAC5F3154@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebdb7f3-a986-4be6-f7d2-08d92c41802f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 18:56:48.2900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXbkvZGYNIPBXM54occSHGjOi+9ez328sbnWv69L0+ed/hDyQsm7RJ4PFVZq6RsrzCJROGnFdxV4ck5VPD0bOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_115654_624094_D086C1D1 
X-CRM114-Status: GOOD (  13.81  )
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

On 6/10/21 10:02 AM, Kees Cook wrote:
> On Wed, Jun 09, 2021 at 03:12:11PM -0700, Vineet Gupta wrote:
>> Currently enabling this triggers a warning
>>
>> | usercopy: Kernel memory overwrite attempt detected to kernel text (offset 155633, size 11)!
>> | usercopy: BUG: failure at mm/usercopy.c:99/usercopy_abort()!
>> |
>> |gcc generated __builtin_trap
>> |Path: /bin/busybox
>> |CPU: 0 PID: 84 Comm: init Not tainted 5.4.22
>> |
>> |[ECR ]: 0x00090005 => gcc generated __builtin_trap
>> |[EFA ]: 0x9024fcaa
>> |[BLINK ]: usercopy_abort+0x8a/0x8c
>> |[ERET ]: memfd_fcntl+0x0/0x470
>> |[STAT32]: 0x80080802 : IE K
>> |BTA: 0x901ba38c SP: 0xbe161ecc FP: 0xbf9fe950
>> |LPS: 0x90677408 LPE: 0x9067740c LPC: 0x00000000
>> |r00: 0x0000003c r01: 0xbf0ed280 r02: 0x00000000
>> |r03: 0xbe15fa30 r04: 0x00d2803e r05: 0x00000000
>> |r06: 0x675d7000 r07: 0x00000000 r08: 0x675d9c00
>> |r09: 0x00000000 r10: 0x0000035c r11: 0x61206572
>> |r12: 0x9024fcaa r13: 0x0000000b r14: 0x0000000b
>> |r15: 0x00000000 r16: 0x90169ffc r17: 0x90168000
>> |r18: 0x00000000 r19: 0xbf092010 r20: 0x00000001
>> |r21: 0x00000011 r22: 0x5ffffff1 r23: 0x90169ff1
>> |r24: 0xbe196c00 r25: 0xbf0ed280
>> |
>> |Stack Trace:
>> | memfd_fcntl+0x0/0x470
>> | usercopy_abort+0x8a/0x8c
>> | __check_object_size+0x10e/0x138
>> | copy_strings+0x1f4/0x38c
>> | __do_execve_file+0x352/0x848
>> | EV_Trap+0xcc/0xd0
> What was the root cause here? Was it that the init section gets freed
> and reused for kmalloc?

Right. ARC _stext was encompassing the init section (to cover the init 
code) so when init gets freed and used by kmalloc, 
check_kernel_text_object() trips as it thinks the allocated pointer is 
in kernel .text. Actually I should have added this to changelog.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
