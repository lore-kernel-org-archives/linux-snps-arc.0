Return-Path: <SRS0=nRph=KU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835FCC2B9F7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 May 2021 02:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393AC61402
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 May 2021 02:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393AC61402
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaN3/R/lKpp16PqLlrfouTlddZmZWdxAQy9AbLqarJw=; b=Mgc/+8O9eDPreZ
	yS4ZwItG/s3m9ZQVCaPWM1aszSWehp+tRoRPTmKx7NUE0b9XBumhf48MOjEl7MasG76DiQl5i0lU5
	gfXI9vtF2K6gr0o9d+EgJDhkfi5cWDXhAo8OU0GN7zEdgbU7Ed6ibeC5osWW480aWoSC7A4Dit0Dw
	UsIWYMd/Xgp1OoNotlsVJvBwD6QDji1kP6bUq1adElq5NW/fx2pL5oX1qGtfnu9DAMgQMiH/cvwT1
	cqjQSljSnW96XmQA1sB3EWqdytCrXsxcQLvIbi/2FVRZH3sxG17x/wUT2hMFYX76DABqjm7ypnrwl
	NOXwPI4wdebWxOxc4VhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llMTt-002r1t-As; Tue, 25 May 2021 02:07:41 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llHOI-001qm6-Ph
 for linux-snps-arc@lists.infradead.org; Mon, 24 May 2021 20:41:36 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 233BDC00B8;
 Mon, 24 May 2021 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1621888892; bh=4r5LCaQF8M/JHNp+bsv6oQCRCEAdlyojYvo1uw+L5uM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UDns8xT/MIOwc1woyUB5jrQOC74+ps2exorJ1q3o0GspMV/89MXTJIDH/vRDHCMYI
 zbsOkX1aGwUYcraiSqjMCwvVzn2sH/Y5jd6m2hcEJ9gl8YUHnHuDNNI5IuEdlU6ZOr
 xYUww7PpW+y2SIIz2v7Vyw8IlS5XMNFaN9z9EihZjvvleasP3zUKVwiYbAxVzLQiXp
 zYtc8k03NnDpiGhFWmm87oyGNpb+dlyvSNKpkutdlVoNFeON2PrZzscEbf2OwgvZZt
 snBmpZeVi14RSXo922opcyU4qEPZZ00sl8AH2pqSp1Z6oKrHfQxn8Sb9RMVRJZp857
 L5Yy9vzn19rvA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 89A76A005E;
 Mon, 24 May 2021 20:41:27 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 889CA400CC;
 Mon, 24 May 2021 20:41:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vaBSS9js";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX6Yz/lCJ0BFQ5Ldm08v/Z6V41/yo6lHM1ER2W7DhrBpj3ikCQreqgl8u6NZxkPa7F4styZQf5F5l1T7ox6TN+d6LTwIcWfJ352tZWtxL/DkYYRAyPbMlXziKHNFCJY9dvpACxDsnvWmyd5Uh2Pbgk9uoi8XqL5p/KpmrEflZ643sBGBmbvNe9PZc2yZJkKcQmr+YlvLQb0Kqi3ZmScMxnFLhVfmyTWj3/K9qdndwC+otVuhRIUNEyLmY6p+/Q0pnbbM4Y43eWQtMwAVaPGn3YgFmNrX2t5CMNScFtuc9fS1SRq9+pWpqbj0FuSMfQoJEhlOmRPn0UuXsgVsqC/Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r5LCaQF8M/JHNp+bsv6oQCRCEAdlyojYvo1uw+L5uM=;
 b=HhT6IpPrLjvw+4gH1Srf2bGM+Ebm9yDGW+mriss1ZHgLEEje7/iRxrwmkh7xYUq4ju0XcNEWYh6Z/QJEpz6glBsFaW1TAENrWnTGTlQR/WgfZqjWRa7uf37exnpTYigg1UmQgL8gJilLDi+f+MqA7msr7MUN/4LRoUktvrt+1p+jKYV/gligBMutj86gw6Mw0uaT2/JsMMIg0krkWwTh+KeND0Fj/YOjlThJDYstxaVa5BZbTrBe8xU2A/c/2tTycFFQtKpUgkYDu5RrnBqlTWMUpm4H+oH19IoJgTwkHbUHoG+UJ5Ii47N8UyN7rFcsgqogH5NBQuVmEEPTFZhf/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r5LCaQF8M/JHNp+bsv6oQCRCEAdlyojYvo1uw+L5uM=;
 b=vaBSS9jscUisGwzLBbpoR9tRU5XvzyAOr2o4oucYh7YaYnIekZkspkogDJpP7k/wrgC/I9abJbAoI0+wWf2kfhC7z3HeArtY5YOjEds7CeYqGOo6+X/S1VGBZfQ0u1VRzRF+iEWgm2eOcOdS81zRm+NC3HZ6KytKPG2VNwhClBM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB5013.namprd12.prod.outlook.com (2603:10b6:a03:1dc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 20:41:23 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 20:41:23 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Guillem Jover <guillem@debian.org>,
 "980963@bugs.debian.org" <980963@bugs.debian.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
CC: linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Helmut Grohne <helmut@subdivi.de>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Thread-Topic: Bug#980963: dpkg: Please add ARC architecture
Thread-Index: AQHXUN0oitf8oU73oUO/tjushpYdzg==
Date: Mon, 24 May 2021 20:41:23 +0000
Message-ID: <4e8dbf4f-5e91-778f-7139-19a13e49ae4a@synopsys.com>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
 <f6ff72c8-46d0-db07-a741-fc9fa37f899b@synopsys.com>
 <6ca2d929-60d3-3846-876b-3b62dba635c0@synopsys.com>
In-Reply-To: <6ca2d929-60d3-3846-876b-3b62dba635c0@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: debian.org; dkim=none (message not signed)
 header.d=none;debian.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e31ff27-ef02-413a-db8d-08d91ef44b55
x-ms-traffictypediagnostic: BY5PR12MB5013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB50134891631BB72DBC635A72B6269@BY5PR12MB5013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBRvHgwNoo2ul12+Atfnc2WDioKB5ts9DNYHY4A/1eWsaHN6vQxF7Mxt5TlgzehtcN1mfnPZrSxpA3dNMTMVtuDN+tUS0qlXjpXpqZeZMHrtjXwg9RqgC+Ps1a+FGcqqcZEXXl34LXDdse0iNZV0YvKpzuaYk3WLIzVnjsehTq0P+OdzF5s0vYsHX7h7ruB3tHl/2eThb82ONRxVsZstekDRJhqa1zOknOeBTFlVLhxqbnRR08hbad/Nrzx7xP02ocv8eTBJlUEM9cw28mixC8w+HsxWjJX7ZT0iAeDFoI08Lw8Kd9wgdeJQXWQ5A8OtZjDy5yNaNrozqKa5I229ZLpwf5heoNGGE8mZM4/dxb/MQ2CgdmxFwbG2TuAxATGn8NwIK08SBjF34KG2eULyZVHUzTc+sdLtWozl4k4o0ZKpeZKD897nL9czup8FMYAjSd5vxayuZdt5WMmIIq87J7x4oRmwFRmLFGMxVQPqQuhUwwj/FmBypdbWqCfSu27QwgkXm9kxPUiZ1rmSNCz1AH9Ot7eY88b78bnog8gTKvgx3FMBYVCqqM/gHvd9UgYUxXR+MaKvak4K+CNHhfGzsFiiVn3jY1qaL/KOIbgMEMrnvXKAh2a1PpJhd80QyNzqRT6KNnITyQMfvI9pM4E3IIyJKZOU4PhZ4BAcuY7GZKANFBgIcKoRSx+pt9p14UQLhMo5OZfoUDXWROhFSsVRQdQSQqtT1zQrSRd0TUYtuMLE/2j3iC1+oLI/hZOdYUg6sw60nQOlfhT8VNnh6hesxPMSOOVJE7w589Yivyhj4QgHI4Ki73BeeSOkWIYMa75V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(396003)(346002)(366004)(86362001)(316002)(5660300002)(38100700002)(186003)(83380400001)(6486002)(31686004)(122000001)(71200400001)(54906003)(36756003)(66946007)(6512007)(66476007)(66556008)(64756008)(66446008)(6506007)(31696002)(2616005)(2906002)(26005)(8676002)(8936002)(4326008)(110136005)(6636002)(76116006)(478600001)(53546011)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dWNmTkdsUGxZeUZtbk4vYnQvbEpESW1mUVNnMmNMbnNPTVRGMEdNa0hyYmJN?=
 =?utf-8?B?UGtlbzNpc2ltZkF6RHdGNmR2RC9kekhjdTZLWHhBcW1FT2dyU1JUSmp3MXRI?=
 =?utf-8?B?cndtbVZocnB1cDBBcWRkQTlQaWVnR3pQYlMxVmVaSmk1UDJKVE1mU1JaU084?=
 =?utf-8?B?RDFvYTN6V3JpQ3NPVFQ5ZHZzUnZGVktHUG94cm9MdXpUZmV0eC9nNEVnL0ZR?=
 =?utf-8?B?cXIyWVFQQ1FpbEpZaTFDM09xTTBFSlF0enlQOHZJc3N3bzd2SWFpQ24rRlg0?=
 =?utf-8?B?VVNkaFd1dGhXaTQ4ZUVQSWxKZzVWakdHQnRnT2l6cDd2a1oyWGVIc2VkRWo2?=
 =?utf-8?B?WjRPWmloWUFvYWtzSlpkdE8za1JHWFFVZkZtU2w3ZE44U3FYNmtRSmoySnZ3?=
 =?utf-8?B?T3V4RnhwcnlhaG9ia3dwcGxSKzRQY1VyZmx6enE3R3JueVFkUmVpcjEzMzAy?=
 =?utf-8?B?WStFQzA4c2FPWi9GWWFUaGZ0SkZrLzdBcU53dTh4d21OTUNDM0x5WHdzQ1Nh?=
 =?utf-8?B?VEMxeVlGRUdzUlNzM0dXbWZxMHAzRVRXWldNUzU1bmJHNHZiMlZPUTczcDBG?=
 =?utf-8?B?cGN2WTEzZElXQWpHTXZoL2xkTjFnSlpFUlFxMjl6ano2UWN6dThUcGxveGVh?=
 =?utf-8?B?MHJ6ZDFIQ1JhNjVoVU9ZUzczbmFQdlVtZWJTb004aEhleWJIdDVkclhPeTVB?=
 =?utf-8?B?NVhTRjYwZVduOW9UVXFINzdGZ2VJMkhCdjlZU3Zxc3pZNWpwVnJoTG9mTDRq?=
 =?utf-8?B?VXV1RGU1MjAxRlNFTWJRY2d4SVBLcDBoYlVCUUMwMWpSeDhibS9qcXgxSnM2?=
 =?utf-8?B?N21JckVPUG1FVnVlcnVuMVcraHVWdCtuTDNBSmxaZjhWZ3VFNUZTaldTUnVW?=
 =?utf-8?B?UndaRUNRUGR0UkVMa2JQUGZubXE5Rm1qNFk3U3dlbk45MUVVTEc2MzBxNDZM?=
 =?utf-8?B?U05yM1dYRnloSVJYcXdORVFOd3ZjdDNlMjRBSWYxT1pTMGJVek5lUTNIQTM3?=
 =?utf-8?B?T0lCbGdQT2tjS0RiR1A2T01WaEs4ZExqdy9pWWFNQ3ZtWXlyOEFkVm9JTGlN?=
 =?utf-8?B?TmhsL01abzRHYVd0SXlPWmdEelB5ZkZwMU5rRHgwZTZOREJ3K1pTOU5RLzlE?=
 =?utf-8?B?MmRRc3g4MmtFSUNrYU41MURVRGFWU05qQUd6b1BpQytiNDc4cEFNK3hmOFBS?=
 =?utf-8?B?UjhvZGRtL0h5Q0pBVllGZWdEaXUwZGZPdTFsNVlyZm9HRk1wZDEyTWw0dldi?=
 =?utf-8?B?ZTVDWUgyVmRFR3pxZkpiQnFFWjk3SGZPR01QWUNyOWlVeFlDcW1sOE9XT2FD?=
 =?utf-8?B?eUJrQUV4WklTZnVCRks0N3VqTUdIcStGa0JwejRXdDRraiswSmM4WVprVjJJ?=
 =?utf-8?B?L3ZxNG1DYnF6LzQwb0NoZ2FDMmxCbzRnY3dqTkZKUGFoZ2xpcm5icENoKzhW?=
 =?utf-8?B?SHBGeHpNbldKY0FOS01xOGJZNlppRGl2N3NlSDNwaG10ZEtvNUpZU1ExZEFC?=
 =?utf-8?B?SGZMeE9mMG1Ha0pJTkY5b1M0Q0l5ZDg0Q3l0WVBYZXplb0cyOWlMQmRENkMy?=
 =?utf-8?B?RVVCcHF1ZDQ2enFNSnRLL2pHcG9uRENQWUlhN3ZvMnZFb3JSaWRYTksrMFVw?=
 =?utf-8?B?TWl3UGV3QUwzdjRUMVYrcFJjN1ZYVWxYMWR6RXN1OEt1YjF3TFNBeW5LM3gz?=
 =?utf-8?B?d2ZxUS9JY2Z6Nlk0UmlqdEdSWTV3RWdUbXVLRzIxL2RFaUpjY3pHZFo5SHk2?=
 =?utf-8?Q?7GcukXeOjPU+qOrRIM=3D?=
Content-ID: <13D9BAFDB951B0468D67ECDE655B22B1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e31ff27-ef02-413a-db8d-08d91ef44b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 20:41:23.3217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hg8to2/0HZwFvvESukX+Qj/03exrtOFP4PiZF2d21jOeZzBnTDw6mZGEbSSOxVCUcBiXhmeD9sohuFeiOAkFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_134134_990912_1D08013E 
X-CRM114-Status: GOOD (  30.65  )
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

SGkgR3VpbGxlbSwNCg0KT24gMy8yNi8yMSAxMDozOSBBTSwgVmluZWV0IEd1cHRhIHdyb3RlOg0K
PiBPbiAzLzQvMjEgMzo1NiBQTSwgVmluZWV0IEd1cHRhIHdyb3RlOg0KPj4+IEFsc28ganVzdCB0
byBtYWtlIHN1cmUsIHRoZSBHTlUgdHJpcGxldHMgYXJlOg0KPj4+DQo+Pj4gIMKgwqAgYXJjLWxp
bnV4LWdudQ0KPj4+ICDCoMKgIGFyY2ViLWxpbnV4LWdudQ0KPj4+IE5vIEFCSSBtb2RpZmllcnMg
KHN0dWZmIGxpa2Ug4oCcZWFiaeKAnSkgZm9yIHRoZSBsaWJjIHBhcnQgKOKAnGdudeKAnCkgcmln
aHQ/DQo+PiBBY3R1YWxseSBpdCBzZWVtcyB3ZSBhcmUgbWlzc2luZyBoYXJkZmxvYXQgaGVyZTog
QVJDIGdsaWJjL2djYyBzdXBwb3J0DQo+PiBpdCB2ZXJ5IHdlbGwgYW5kIHNob3VsZCBiZSBkZWZh
dWx0IGZvciBhbnkgcmVhc29uYWJsZSBwZXJmb3JtYW5jZS4NCj4+DQo+PiBTbyBJIHRoaW5rIHdl
IHNob3VsZCBhZGQNCj4+ICDCoMKgwqAgYXJjLWxpbnV4LWdudWhmDQo+PiAgwqDCoMKgIGFyY2Vi
LWxpbnV4LWdudWhmDQo+Pg0KPj4gQlRXIEkgaGF2ZSBvY2UgcXVlc3Rpb246IHdoZXJlIGRvZXMg
b25lIHNlbGVjdCB3aGF0IGRlZmF1bHQgdG9nZ2xlcyB0bw0KPj4gYnVpbGQgdGhlIGVudGlyZSBz
b2Z0d2FyZSBzdGFjayB3aXRoIChzYXkgLW1jcHUgZXRjKS4gRG9lcyB0aGlzIHJlbHkNCj4+IG9u
IHRvb2xjaGFpbiBkcml2ZXIgZGVmYXVsdCB0byBEUlRILiBPbmUgb2YgbXkgcHJvYmxlbXMgd2l0
aA0KPj4gcmVib290c3RyYXAgd2FzIGdjYyBkcml2ZXIgZGVmYXVsdGluZyB0byBvdXIgbGVnYWN5
IGNwdS4gSSd2ZSBjdXJlZCBpdA0KPj4gdGhlcmUgKGFuZCBwbGFubmluZyB0byB1cHN0cmVhbSB0
aGUgZ2NjIGRyaXZlciBwYXRjaCkuDQo+IFNvIGhlcmUncyB0aGUgbGF5IG9mIHRoZSBsYW5kLCBh
cG9sb2dpZXMgZm9yIHRoZSBsb25nIGVtYWlsLCBhbmQgaWYNCj4gc29tZS9tb3N0IG9mIGJlbG93
IGlzIG5vdCBkaXJlY3RseSByZWxldmFudCB0byBkcGtnIGJ1ZywgYnV0IEknbGwNCj4gcHJvdmlk
ZSB0aGUgYmFja2dyb3VuZCBzbyB3ZSBhcmUgYWxsIG9uIHNhbWUgcGFnZS4NCj4NCj4gV2UndmUg
aGFkIDMgcmV2aXNpb25zIG9mIHRoZSBJU0EgYW5kIGVuc3VpbmcgbXVsdGlwbGUgcHJvY2Vzc29y
cyBpbiBsYXN0DQo+IDE1IHllYXJzOg0KPg0KPiBJU0HCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBJbXBsZW1lbnRhdGlvbnMvUHJvY2Vzc29ycyAoTGludXggY2FwYWJsZSkNCj4gLS0t
LS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiBBUkNvbXBhY3TCoMKgwqAgQVJDNzAwDQo+IEFSQ3YywqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBIUzM4eC9IUzQ4eA0KPiBBUkN2MzozMi1iaXTCoCBIUzU4TVANCj4gQVJDdjM6
NjQtYml0wqAgSFM2OE1QDQo+DQo+IC0gQVJDb21wYWN0IGlzIGxlZ2FjeSBhbmQgbm8gbmV3IGRl
dmVsb3BtZW50IG5lZWRlZCBpbmNsdWRpbmcgZGViaWFuIHBvcnQuDQo+IC0gQ29kZSBmb3Igb25l
IElTQSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIHByaW9ycywgbWFpbmx5IGR1ZSB0byBhZGRpdGlv
bg0KPiBvZiBuZXcgaW5zdHJ1Y3Rpb25zLiBJbiBmYWN0IGdpdmVuIHRoZSBjb25maWd1cmFiaWxp
dHkgb2YgdGhlIElTQSBpdHNlbGYNCj4gKGZvciBiZXR0ZXIgb3Igd29yc2UpLCBvbmUgY291bGQg
ZW5kIHVwIDIgbm9uLWNvbXBhdGlibGUgdmFyaWFudHMgb2YNCj4gc2FtZSBJU0EgKHRoaW5rIGRv
dWJsZSBsb2FkL3N0b3JlIGluc3RydWN0aW9ucyBpbiBBUkN2MikuIEJ1dCB0aGUgcG9ydA0KPiBj
YW4gYXNzdW1lIHRoZSBhbGwgZW5jb21wYXNzaW5nIHN1cGVyLXNldCBvZiB0aGUgSVNBIGFzIGJh
c2VsaW5lLg0KPiAtIEFSQ3YzIGlzIGN1cnJlbnRseSB1bmRlciBkZXZlbG9wbWVudCAvIHByZS1w
cm9kdWN0aW9uIGJ1dCBzaG91bGQgYmUNCj4ga2VwdCBpbiBtaW5kIGFzIGl0IGlzIGtub2NraW5n
IG9uIHRoZSBkb29yIGFscmVhZHkuDQo+DQo+IEluIHRlcm1zIG9mIHRoZSBBQkkgY3JpdGljYWwg
Zmxhdm9yczogdGhlcmUncyBsaXR0bGUvYmlnIGVuZGlhbiBhbmQNCj4gc29mdC9oYXJkLWZsb2F0
Lg0KPiAtIEFnYWluIGJpZyBlbmRpYW4gZGViaWFuIGlzIG5vdCBuZWVkZWQgLSBtYWlubHkgYmVj
YXVzZSBvZiBudW1iZXIgb2YNCj4gY3VzdG9tZXIgZW5nYWdlbWVudHMgYW5kIHJlc291cmNpbmcg
bmVlZGVkIHRvIHN1cHBvcnQgaXQNCj4gLSBBUkN2MiBoYXJkLWZsb2F0IEFCSSBpcyBzYW1lIGFz
IHNvZnQgLSBGUFUgc2hhcmVzIHRoZSBzYW1lIHJlZ2lzdGVyDQo+IGZpbGUgc28gdGhlIGNhbGxp
bmcgY29udmVudGlvbnMgYXJlIHNhbWUuIEhvd2V2ZXIgdGhlIHRyaXBsZXQgaXMNCj4gZGlmZmVy
ZW50IGFyYy1saW51eC1nbnVoZiBbMV0gYXMgbGlicmFyaWVzIGZvciBoYXJkIHdvbid0IHJ1biBv
biBhDQo+IHNvZnQtZmxvYXQgc3lzdGVtIGR1ZSB0byBsYWNrIG9mIGVtdWxhdGlvbiBldGMuDQo+
IC0gQVJDdjMgZG9lcyBoYXZlIGEgZGVkaWNhdGVkIEZQIHJlZ2lzdGVyIGZpbGUgc28gdGhlcmUn
cyBzb2Z0IGFuZCBoYXJkIEFCSXMNCj4NCj4gU28gZ2l2ZW4gYWxsIG9mIHRoaXMsIEknZCBsaWtl
IHRvIHByb3Bvc2UgQVJDdjIgcG9ydCB3aXRoIGhhcmQtZmxvYXQgYXMNCj4gYmFzZWxpbmUuIFdl
IGRvbid0IGJvdGhlciB3aXRoIEJpZy1lbmRpYW4uIEEgc29mdC1mbG9hdCB3b3VsZCBiZQ0KPiBk
ZXNpcmFibGUgZm9yIGRlYnVnZ2luZyBhbmQgZmFsbC1iYWNrIGJ1dCBub3QgbmVjZXNzYXJ5IGZy
b20gZmVhdHVyZSBwb3YuDQo+DQo+IEknbSBvcGVuIHRvIHBvcnQgbmFtZXMgYXMgbWFpbnRhaW5l
cnMgZmVlbCBhcHByb3ByaWF0ZSAtIGJ1dCBzdGljayB3aXRoDQo+IGN1cnJlbnQgdHJpcGxldHMg
YXJjLWdudS1saW51eCAvIGFyYy1nbnUtbGludXhoZiBmb3IgQVJDdjIuDQo+IEZvciBBUkN2Mywg
d2UgY291bGQgaGF2ZSBhcmM2NCogLyBhcmMzMioNCj4NCj4gUGxlYXNlIGxldCBtZSBrbm93IGlm
IHRoaXMgbWFrZXMgc2Vuc2UuDQo+DQo+IE9uY2Ugd2UgYWdyZWUsIHdlIGNhbiBzdGFydCBvZmYg
d2l0aCByZXF1ZXN0aW5nIGNoYW5nZXMgdG8gR05VIGNvbmZpZw0KPiBwcm9qZWN0Lg0KDQpGdXJ0
aGVyIHRvIG15IG1zZyBvbiBJUkMsIHdlJ3ZlIGdvdHRlbiBwcmV0dHkgZmFyIGFsb25nIHdpdGgg
QVJDIA0KcmVib290c3RyYXAgWzFdLiBJdCBzZWVtcyB0byBidWlsZCAxNTEgcGFja2FnZXMgYmVm
b3JlIGZhaWxpbmcgZm9yIHBlcmwgDQphbmQgSSBzZWUgc2ltaWxhciBvdXRjb21lIGZvciByaXNj
djY0ICh3aGljaCBpcyB3ZWlyZCBhcyBwZXJsIHNob3VsZCBiZSANCnN1cHBvcnRlZCB0aGVyZS4N
Cg0KQW55aG93IHRoaXMgaXMganVzdCBhIHBvbGl0ZSBwaW5nIHRvIG1ha2Ugc29tZSBwcm9ncmVz
cyBvbiBBUkMuDQoNClRoeCwNCi1WaW5lZXQNCg0KWzFdIGh0dHBzOi8vc2Fsc2EuZGViaWFuLm9y
Zy92aW5lZXRnYXJjL3JlYm9vdHN0cmFwDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
