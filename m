Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B35C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 14:26:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00CE61287
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 14:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C00CE61287
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uwD2Cj7taH+jdWnuOjHPSbC7KGozxc0O9cV+m8xmcD8=; b=FIwzDqxOGWIQQz7S3dX4m/K1D
	PI/UsXKqQrKZP/C0Bt9MQAjTk3CzJpOX6bFBbz5Zc9w5imR5HiS/HFKwFLTAmWe1GqbuAHz+MCrbH
	cqs1Q4NHvQXwEgtVr6gqL0dilQXbDxGNB/YyheFG7N0gMWA0GLjYKrIUI/44rH6LWHFxDi6Mwn8u/
	YPbul0yjZ4jh+ul7EijHuyXHN4QyUs3MPDf5KhzF21YYNT1s2jW48wxI1y+M2jChZS4S5w2X6tqkT
	JgAIORXb7upJgNIWv9RSUDYWzhpOOLY4DFPwI9VQjjT0NzQfi+NT8eK4wKhOOnYXMcAG5cYpZrmxI
	0t0/gFkrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxVy-006yHU-7g; Mon, 12 Apr 2021 14:26:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxVv-006yH1-Md
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 14:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=py+qWRwpv//wFRu73OkeRSTVEU1mB7ZJ+w//iq/a7B4=; b=ti+5NiYHl6s3PbZT8Fk5HnQGRs
 LdFEPmZtqaPvdgncE2vQOpW1l3b42cuKxYc95+soSM6KwjWKNEyg1/EYF5kOmSfIxGbPj5/XoxyYK
 PGpWhgSVzilBqzp40VSOL/EfcuebMqzcXS0uWrhwNbFSANHHumOYhvGCdrdadwPRbVGwkVe56vlbD
 dIOK0xM5Ixx4V+palHlQnNCDvj9DBo+GWt2jz8hUCiyEjkBsB3Uf2xRjrIAEduVqq95CkTtIOorQL
 XuqQp1RaEY17BLXxEVfsNDVthHDgnoFvvxaJZ7UucIYMeTkSc8gHc4eQydJisPgc81cWaCYnO90CL
 ExT14yeA==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxVs-006Izb-HA
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 14:26:06 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A803D4031A;
 Mon, 12 Apr 2021 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1618237560; bh=py+qWRwpv//wFRu73OkeRSTVEU1mB7ZJ+w//iq/a7B4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TgiSDoqw2eKOmE8cZmFYmuXvwctE6Z9s0KE+P2ePP9ztP2KMF5MJScdfTW6ilkq7O
 +yHg5piSxO3UgVtneRfflweh+XwpxqA5OsVxupSLaovZ0JGJDNWiEfTC0iBIpu1cvk
 tJzzXEDqAHjEuDVaDcoEghNk7gzIUC3w9FKS87AcTgcip8M6OczZYWHqy96RMnXIvP
 7NmgPCXBGVa4FPoGqkLtC59iAUUDMJa3hZgk+GMsBXVIJA9t27zj3upTnC14/cqCql
 IPEGY+waR8O1JmVrT85h8vbQRSoYcwvCoaqW9aAwZtSq7sdim9DRGwN/g5xzlwxwOg
 zRw5eR/0wCdew==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 95E95A006A;
 Mon, 12 Apr 2021 14:25:58 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id BC4D840131;
 Mon, 12 Apr 2021 14:25:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="k/nykEWc";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGp5VO9LNNL8XWLlFtAkQJ3diaXiHscBEAnY2WYY6BLxf3dgu0bXaB10Ofdh/pprnUfwomnthyVazmECoUiKPvBpVO/y55vD87gGU66NesU1o1t65702ehij70SrG0GiRZB5S6znxBgmziP8/OedJfFRo01t6LYWFgjvsb24SXD8cP9NFG4ZbbSCJSyomEG3lre5XqJ1w4VAI/Sb1fnioFltw9bD+bex19n5Qi5lDs34W45P1EXjlqYZqJqNTgkdGLbalY6n+1wFjhfb70SG2cCER3skd3YEVaE7nv4HkAV5myS+f2QDqRM9Rw9vW9SKvIQrM4WGYClYo/xWZpwaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py+qWRwpv//wFRu73OkeRSTVEU1mB7ZJ+w//iq/a7B4=;
 b=DmGHUdcovLO3lEdIzUwqlKtjnqALj3g6q9QrB5ehlExvL3XPHoqVr10IAQaGy6KZcLJ+OKyxJlyJ+JpfGZi9w9oFdxTUJNwWzAmR5hC6KVmWap1CNlkgmRbtN8z/KucXrUGRNjX/G4FoI6MLvcd9ZSIQ4IQiq/kzgwmZA9H4cGrPy2RJiwrqnA1bH+Sljyh950NEn8qVu+REEkFn72Ti0UlcWYqykvFfvN9vXDZyNK9JmxEV44aAiWnciVx2610KQU26Yqt8m5Eb4plP7Biv9SafGbAOy0hvwJkMTgibjfhDfbjCTzgB/7Eox9asHJSptsdbaLpATji5DQA2bCzIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py+qWRwpv//wFRu73OkeRSTVEU1mB7ZJ+w//iq/a7B4=;
 b=k/nykEWcpo8GeXT0uCoePe/HtOtvnnqPtAyhh1NHAocecZo0M0+HtABODU8dsY1fM7kGxhwU+aLy6TNAKT8V27Du94O6twFPNMhHYev3yrmwkMic75QWRgmbVE1Sui05VtDa2YGNA0g5KbpAelOMxNj+28kGbLrlzVa+12ECK94=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB3853.namprd12.prod.outlook.com (2603:10b6:208:162::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 14:25:55 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::ed43:bf3a:aeac:b2d5]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::ed43:bf3a:aeac:b2d5%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 14:25:55 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Subject: Re: *** ARC port for review ***
Thread-Topic: *** ARC port for review ***
Thread-Index: AQHXL6e+wNi91dsMaUiUhISFXkOoAQ==
Date: Mon, 12 Apr 2021 14:25:55 +0000
Message-ID: <f898138f-50fa-d05f-7d57-a2ba000ed130@synopsys.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <6af34171-223e-55d8-d908-55dab5e63abe@linaro.org>
In-Reply-To: <6af34171-223e-55d8-d908-55dab5e63abe@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.79.37.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e82c99da-95a6-4a93-ebba-08d8fdbee251
x-ms-traffictypediagnostic: MN2PR12MB3853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3853812B793E1022DFD8DF54A8709@MN2PR12MB3853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cm9xxDhhpD2L1P3Ie5KbNj7v0ztYjHACok1GoX4kBCbPrt2+uJmvy6cthvt30pa//jt2qc9goscA896f0EPP7S3XN5KWb37QgVL57JWKvJWpfVvCbNg1fCpm2r8m1he+I/ywthKI/e3LnX9XUsF5YspiYk1J9byUAu3QCJ34gHU4vPQxPGIsvCq+huPUjs4HNIQZepAl8onxw7HtljRS9E1HiAW3GIVNv/8tfvWtgQWfrDKZQAyIe5zCdOJi7Yj34MNzVCeGjtRRV2l7Fy7kLq/mcRY6sD9Yc6z2cYsxcev/k0mnrTcUQu+gU+wziYz7s7fy5VnGxEPOlp/yaOfiYNKm4rLhgCGKQxl9FpLvgJ+EOeKEZsL5lqXeM/SzC54cHVb4WFVmHeKVtU2tSLtitpXftFcONOaTKo/g20IkSYZmpeY+jhKuKh7cVDD0m5pImXXzac0tZe5YuCsrch0RJKwP3aUE36nY6nKnhbEdPGPSbbvIdLdEDxooyLNetz28ZBI6vQzHaiJcvPytcv8mFG7mrrYKEjGPUt1k5lV9A2k7wDPmBXS37TbdNSUN9LlPYNjymjbotmnb+F5ygFOPdOEqSC5UeCsUKM4lhpw08b7hjfWtQ+lQLtVPbw8yhY45M2zKnGjq3ad3Ob8DFrvG7RS8PsbksYABqu19PvKx02zS0NtBfZitEFqjcgLd29RDQ8acp3YnX89nJY+uSNFkVbSgv6DUGjk1TV4JgmTzPGGARie8T+lS8fkeo3EzJC5m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(110136005)(71200400001)(2906002)(4744005)(5660300002)(83380400001)(91956017)(2616005)(76116006)(478600001)(4326008)(64756008)(54906003)(6512007)(36756003)(66446008)(6506007)(66476007)(66556008)(66946007)(107886003)(53546011)(86362001)(26005)(8936002)(31696002)(186003)(8676002)(31686004)(966005)(316002)(38100700002)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MHREVlR1TFc3ZlU5RWlrdytoWE9pa2tKZ2VjL3ZMNVZ3T0xKWkNhZzh1RHR0?=
 =?utf-8?B?VHNiV25IS3NNdU5CWkhmSDNlcStNQnhTOTZlNlJGYmVmMTZDTDVONzAzVE5t?=
 =?utf-8?B?NjY4MGdyZ2J3V1Vod2QxaWdORWlxUERTV21xUGl6cUFxb0JPdDR5NXIxZ3Fh?=
 =?utf-8?B?aG14V1JzNzVUMzg1c1o0ZHBIWDFHNFhBR0R5VXZWL1FCS3hyN09WdEtWZ0Vr?=
 =?utf-8?B?eFJoVVhMQVBPQitsMi95MmxacWxDVkV6bmF0RHNoU3BwdGpycjEraWJHOWh4?=
 =?utf-8?B?K2hpM2tZZGhvMTlkR1RSQTk0bmpZaGZUcGVjOUNsdGd5WS8wVzYxQVBSbDBN?=
 =?utf-8?B?dmhnTkpmbkFkVmo4NGx2OWpNUThlcDFQQmVMcTcvWWJDWXZ0UFphR3JWTXIv?=
 =?utf-8?B?V1dMQi8xckh0YStQSis3UEJJbUFTbG10aXYvalVEY1RxWWVROG9aaFFHeFpw?=
 =?utf-8?B?aWdtTSs0ZUdCSE5ZeGE5VHA0a0xQa0lGMDNuc05sR2VuZldtTEsxNzljZm96?=
 =?utf-8?B?c0VoejFpTnFqK1c1Y1ZPSk9kQmtUNHV5Yjdta0hvRk9kRDZoazBEMnowaHhv?=
 =?utf-8?B?NU4wVGE1QzE4Z0VxSVo1Zlc1ZTB6UnhSQnR3OU5HdlA3NkdVM3hNOEQ4VW9r?=
 =?utf-8?B?aVFaWVJ5Tm1CZlBkT3RjcHFibXBSY3luUUpwMzl0eTZ5SDRaejZndUVIQzdl?=
 =?utf-8?B?ZHZCMzBla3dQTG9aelBVL2VsTkRMT01YSXBjSzBmREt6YnJFKzNtYUFQUFlY?=
 =?utf-8?B?Q0FwTHhkN0NBcXVKVVBWaFF1UHdXKzc5VlJsN3Njenlwb0FkVHlDOGFpbTBU?=
 =?utf-8?B?c1NpTmtqSmxhaUV1YVladFFSdDFhc3lQV3BUOTluTlI2K0lRb2tzd0MwZVUy?=
 =?utf-8?B?bDR5WGUyNzNlU3RFYVhZSHMzMmc1azVzYVdyNEt3VG1oeWtHUURWTkdHNjEx?=
 =?utf-8?B?SGNWSHFJb0dkVjdzRG9EbS9ZMjNaZCtiK0lJTGE1dFpTNGhKVFNMR2svUktC?=
 =?utf-8?B?MkdzbDhIR0Z2L2Q1L1ZCTjhEK2VkUkxnMzdFRlk2bkJuempLYmhwcHhOanFD?=
 =?utf-8?B?RWFNeGovN3lLbkxzSzQrbng3dE03M0FORmhNTDg4L3BGUFRkR2l3MlkxWnR4?=
 =?utf-8?B?dUlhSGtCY2NPaGJpcUF4bkxIRys1MlhndVh6UmEwRDZSUzYvY2k5cFRobW10?=
 =?utf-8?B?bW1ibkQyTEkyODBydVRHSVZVQUZxd1BsZ3lZQjFFZU5aN0pucTc1WGN3OUR4?=
 =?utf-8?B?SW95STZZUXNUMFFoMWpSZGpUOXhuYmcyVGU3bE95RnUwd0FFc3BwaWgzbnRI?=
 =?utf-8?B?Wjk1ckZ5VVdhSjRxajRoYU9vVVZCcm94NVRhV1Q0cmM3Q294eURWcGhxSFdO?=
 =?utf-8?B?elF5c1luTE9ZRnZaWnFQdVhkWDJHNzJjY0pPTTUzSVJpVE1HUXBnOEhaMlhU?=
 =?utf-8?B?VVZZb0hLRmx1S29iZnNXU1VVaVpLM0RRVW9rNm90T3UzcnVKWC8waXlReGZi?=
 =?utf-8?B?OEI1eFZIbHp6VkpaRG04Zlo2Ykd1UlRZVUw4OERnck84UmFkKzNJa2VQTGR3?=
 =?utf-8?B?ZkZZWTB0cjZMaHJDa2RNN2xHcVI3Q3pvaVJtUkltcnB0QTdkanZVYXp4Q3VB?=
 =?utf-8?B?RnIyd2VaaWE5OG1pWlEvWlNrRDJTTGwrUU1rWkYvMDkzOXVjbDNDbUQwaXk4?=
 =?utf-8?B?ZGo0eXJ3c1p5dlNKNEwrNFNwVnJXTHlvcTl3NmU1OVZWTEg5b1BmSk5QWHlz?=
 =?utf-8?Q?9N3H4kKXwDHQod6+8c=3D?=
Content-ID: <3D2FD33A8456D243B2FA549FB0951C5F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82c99da-95a6-4a93-ebba-08d8fdbee251
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 14:25:55.4548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxweohY9sanAijCGb6eP/gzLx7aHmOC3OXW2kF+tS5vvv4k/ImP9MacCbAeYgIc5laAYTUSUbwMAycD4FfO1wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_072604_687377_6BB318A8 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwNCg0KVGhhbmtzIGZvciB5b3VyIHF1aWNrIHJlcGx5Lg0KDQpGb3IgdGhlIHRp
bWUsIEFSQ3YzIGlzIGFuIHVuZGVyIGRldmVsb3BtZW50IGFyY2hpdGVjdHVyZSBhbmQgDQp1bmZv
cnR1bmF0ZWx5LCBmb3IgdGhlIHRpbWUgYmVpbmcsIHRoZXJlIGlzIG5vIHB1YmxpYyBkb2N1bWVu
dGF0aW9uIA0KYXZhaWxhYmxlLg0KUGxlYXNlIG5vdGljZSB0aGF0IHRoaXMgc2hvdWxkIGJlIGFs
bCBhdmFpbGFibGUgb25jZSBBUkN2MyBnZXRzIHJlbGVhc2VkLg0KDQpRRU1VIEFSQ3YzIHBvcnQg
aXMgcmVhbGx5IGFuIGVhcmx5IHN0YWdlIHRvIHByZXBhcmUgdGhlIGVjb3N5c3RlbSBhbmQgd2Ug
DQpkZWNpZGVkIHRvIGluY2x1ZGUgaXQgaW4gdGhpcyBwYXRjaGVzIHRvIHRyeSB0byBiZSBhcyB0
cmFuc3BhcmVudCBhcyANCnBvc3NpYmxlLg0KDQpSZWdhcmRzLA0KQ3VwZXJ0aW5vDQoNCk9uIDQv
Ny8yMSAxMjo0NyBBTSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDQvNS8yMSA3OjMx
IEFNLCBjdXBlcnRpbm9taXJhbmRhQGdtYWlsLmNvbSB3cm90ZToNCj4+IEluIG9yZGVyIHRvIHNp
bXBsaWZ5IHRoZSByZXZpZXcgcHJvY2Vzcywgd2UgaGF2ZSBzZXBhcmF0ZWQgdGhlIHBhdGNoZXMN
Cj4+IGZvciBBUkN2MyBmcm9tIHRoZSBwcmV2aW91cyBlbWFpbGVkIEFSQ3YyIG9uZXMuIEJlaW5n
IHRoZSBwYXRjaGVzIGZyb20NCj4+IDEgdG8gMTYgZm9yIEFSQ3YyIGFuZCAxNyB0byAyNyBmb3Ig
QVJDdjMuDQo+DQo+IEhvdyBtYXkgb25lIGZpbmQgdGhlIGFyY3YzIGRvY3VtZW50YXRpb24gb24g
dGhlIHN5bm9wc2lzIHdlYnNpdGU/DQo+DQo+IFRoZSBjbG9zZXN0IEkgY2FuIGZpbmQgaXMNCj4N
Cj4gwqAgaHR0cHM6Ly93d3cuc3lub3BzeXMuY29tL2Rlc2lnbndhcmUtaXAvcHJvY2Vzc29yLXNv
bHV0aW9ucy5odG1sDQo+DQo+IHdoaWNoIGJlc3QgSSBjYW4gZmlndXJlIGxlYWRzIHRvIGEgcGF5
d2FsbC4NCj4NCj4NCj4gcn4NCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
