Return-Path: <SRS0=LzHK=IY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F7BC433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Mar 2021 17:40:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081B5619B8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Mar 2021 17:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081B5619B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NrVm2lw5fULy8KirditjVzj2lGNda00E77hdDbOnpvY=; b=TS5xLHhjOu8qSbPBZTlzzARU7
	ZsMfwRvzpjkc9fiZ1IrLjMOdBBYQR5t4cQ1c7AHZQh7pKzWkqnuy12zVUH+QrnoFnDaRStAUIzl1F
	wavwocg1lXGei8G08RzU8AuXo7KJc60DTEgjlV8RR6s4+62QllqFMFcaShtAwV+nMPhZfJi0gJjV4
	PCKrJF3xlPWsfRTpjKwl0mBRmwh5MBOntA/Mbd/3hP0kBrJd6CbvBSPMyNyJTvyf3LnZHM5Jmm/Gw
	WVU2GBkIG/YVFDgrsktOsUFaV8oLCHonhmoel5Ugb3cHEtAmuYcwHQCg00aCI8fII+Zlvn6KF0IAc
	63wJCY3ng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPqRR-0044h6-U2; Fri, 26 Mar 2021 17:40:14 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPqRN-0044gP-Dw
 for linux-snps-arc@lists.infradead.org; Fri, 26 Mar 2021 17:40:12 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6FBD840153;
 Fri, 26 Mar 2021 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1616780403; bh=eIlffbDrfxA9lPYqFoJctp1ZbmdH7DKZjeMyT/B1cWw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KwyDt+rdfWMCaeqttBmwKtPLYM+jQ6iFEWWlGHgydErMe1RRGw6KwiKytI3Do7UmM
 HMzjMa+QsJW+C9GSMtNLw0I4nIG7MHW8UtyfLgpShQ5poe1A1DRXISMz8kw1BA05Hj
 LFZxCkIXgI1s9NkFDmsKyMjdhdSXAAYeF2TI2Isa9VqTnKCk5uqsiftYNJ2CDxaMnb
 HSp7b2sYHL7En0iHDbeLH7tZBjfTnnJRUgXQjKSusq3bUaSEEaRhCSPHygXQiIAevl
 LnUwwCzgX2mw6KDuBp0TJi39h3RMNjCAaOhvTRo+CinaJY9KL1sMFbRCOdJtYMeG0Y
 /GqE7gq54vDrQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 50200A00D3;
 Fri, 26 Mar 2021 17:40:00 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 78515801E3;
 Fri, 26 Mar 2021 17:39:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="o7VBV22t";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS1XKkZ0117jzUE+qypuukfqrJfTkT0OxWNnwRSqnKpaLdBTkN0tnkL6rNMdOcm8+fice4vb5NcBMXr40PVbQB9GEe0n7sXhAvZIxZMoWwoLQOX0Y7FrElrc9IvZ1COwvypJSN0CUzNUO2PUMgiMXoihhTpHlcsvM9tdswLU+mqC38d9nLtq1ik00pVnwnaz8+Row8j1soUdp8SrzqGN5psLbsMLyM7W+GlPq/2iytCpCKpCco8hZmYpxN1AdWbTI2+6ETi8Ot1skCDlVqrxNyWfZorBuQ+/+naIhkE2x5eB9oTc4GUsDqzUqKK8C9h73YxUXWCNGz7TzBPddxbAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIlffbDrfxA9lPYqFoJctp1ZbmdH7DKZjeMyT/B1cWw=;
 b=TA2iypBKnIm75nrfRH4qkMwLbU2L+63zWSbQEgZlOqrppV8zLPO9QMk0v4ICopk/2bPuOcj/x5LhyKzIfCRf4jhV7icYX6m5uqMdGvxd2yyUEpaD87ORwDNVRBmUj3XzzNK5z/J9D4Gn2X+yAyb2CJ+MzaI20cLFM1/09vBrti7f6NM4l3utcOTydpGesmE3N8Mzq8q8zRfhoRAmovMA+/C5ojV6JQwqx0LUGTjGjF1z8Y89m6oyWzm47axbRrByZXFzn+GCQ9b0CVxje6MYVYmJSJ0AlnkBFrJYrl01pi1q/7G2jY5FJN9W87FOfSVCaSS4bAPF4NbqAhtZsMisJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIlffbDrfxA9lPYqFoJctp1ZbmdH7DKZjeMyT/B1cWw=;
 b=o7VBV22tyOtbaBudZPNXAJ2qI7Vux3LaevfUvBkPkRcBpiSTkLgiC3ect/nSM2AUMQ4iXwq9naLjdqBsWaSSdTiOT+T7BQea1BQw2aanuBU5WBNAlu6hm86tMLaCceAMtsKRc1tiRRZcKjIlu3I0m3IxgPr6+1pLRsk2DoAZYYE=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3857.namprd12.prod.outlook.com (2603:10b6:a03:196::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 17:39:52 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.3955.027; Fri, 26 Mar 2021
 17:39:52 +0000
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
Thread-Index: AQHXImcGTkBTaJF5wkKY8W33tD4qwQ==
Date: Fri, 26 Mar 2021 17:39:52 +0000
Message-ID: <6ca2d929-60d3-3846-876b-3b62dba635c0@synopsys.com>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
 <f6ff72c8-46d0-db07-a741-fc9fa37f899b@synopsys.com>
In-Reply-To: <f6ff72c8-46d0-db07-a741-fc9fa37f899b@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: debian.org; dkim=none (message not signed)
 header.d=none;debian.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c062591-488d-4cdc-d715-08d8f07e295c
x-ms-traffictypediagnostic: BY5PR12MB3857:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB38571FB885FA0CC0EF23466DB6619@BY5PR12MB3857.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8FJqCWjDgevczetEPE4WtpL2oHgAQO9jNUW/reFDUmABdC83fPsAiXRGn3Yd9IGKtVht5q6gUOPKxpuelYRy/OgP56MtAV1ddSpAGY0opwEoaq7KS1UTO9HXcAF4D1ceRIYFwOV6hleg5nmAmokS1moI1DQesBki+CM2KXeBJ8SJ0frXN13RVNpHVbukb70jm7gVpQX+BJJv2jiQlYIKU5DyRcVlZ0i4csD00exNjm7XooHZxVVaYrP7VehEzRBMCvdLfpj4Hr+DxR1LQPXXasiBPpfaCHD8dWTB2wvaNh4wbvXiX2h917Bk+g8sKckU52iiJ07SAV7ezAI1/4WL0vT9Um0jvjgAYKVkUNP7dRgnHnKjLY0bkBHLtFE46kM8dIE02S99UxGLYleDYBStHRVDlHF2jpbXR/Aj17UVXZIWMrIakY6XDDIlCSOcNf1JZJ9wc2EeW+KR2+g0QvBybcrCZqJn7Uo4yWvtICWTCfr2TNgFkvkVEPfjahm6Jax0bmqLguJnDDLZ6s3kWQva3AfC0hVE7CTpsCUzZBQePYjNSmVySaQh4vKAR0sDD1pMGQm9/Ot8H7BDL6A7qx4Ba9l2efXQ17LfJ/U2AR7eLvlXcY8b68tmhxL2bmdulen0nVw0NC43OwxMDOUGefhKP/Nu9DXShqk3RujtysvepXeVo9o+h7Sj2LROjoSbj+Jq2X0+ldbljeHRaPYAO3jFQ3Lm2z+UZvkfZCbg9Klk178pTvwx5Tv/XyYtNdDTM0/7bFprIOLUiWwgAe1BvmTFreRdTRrUK7fCRDN7jNc4C/e3P+tGCZfTbPso+LPJ7aXO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(39860400002)(376002)(366004)(66556008)(83380400001)(66946007)(76116006)(2906002)(71200400001)(54906003)(66476007)(186003)(2616005)(316002)(110136005)(5660300002)(38100700001)(26005)(4326008)(6486002)(6636002)(31686004)(6506007)(6512007)(31696002)(8676002)(64756008)(36756003)(8936002)(53546011)(966005)(478600001)(66446008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VXU1dWJsOTBQWTRHN1NXamtUNjhQREFlbFd1dEIvaUk1cDhwNWw2elg5WUk0?=
 =?utf-8?B?eDdRS1UxbU43WEJzMTNLb1ZEOW1oc2RjNUxEd3hrVlY4OHFrVUF6K0Yrd2hu?=
 =?utf-8?B?RVRpSFRsSEdLeEl5QnpmYmRsUVFyL3lJUTI3em9Rdk9SVFJRdUd5eWw3dXd0?=
 =?utf-8?B?MmJTZjhkcE5RcERxd0hMN2tudnU1QTY3bzhaV3ZMRy8wTWFDand3RW9UVHNo?=
 =?utf-8?B?eWhPaGIrbTFyQjlZVTZpWUlmcW5wa0lMa3ZUcTl4TGh3RHc2d1BNa2lBclBk?=
 =?utf-8?B?Q1FZd0VxNWpOdjhiSHZPQzFnZHpkMEVsVkFZNWR1LzhNZS9vdGhkOFczVSti?=
 =?utf-8?B?bTIzMmFQYUFUbUlTUklqOHp5RlpqZEJ5cEhTK2wyVXJ5TVNGcDVoV1VKTzVh?=
 =?utf-8?B?VEdMdGV1VnlEVVpEbEd6ZGwwR0RXTDdpREFEeHBrdWRrSlI2bkdvSmw1WEpN?=
 =?utf-8?B?RExsY09ySldhK0xrbFI5WmF5RWhmT1U0bTM3M2NFQWlGVW5MbUg2bFhsMW9W?=
 =?utf-8?B?RmpEaVZ5TDgwMzJQMVFuTWtRSXNPcGtIT3FSc0tJWVh5eDRlQVpZYmJUUVY1?=
 =?utf-8?B?RWlTM1dHZVByYVlWeFlsWEJjWm15WndsaGtyTlR6ZU96MG5nN05MeloxWW4y?=
 =?utf-8?B?NGMxVWs3MkdzanhoQm9LV1dveEtya0FOb3p5SWNMcVBlcWdobVNsdkRONHA2?=
 =?utf-8?B?aHZvQzdCZmNaSDFNdi84M2hKanhDMWROTlp1c3B6TVpNNUY0VFlVQStXN0Uy?=
 =?utf-8?B?ZDQ4aHJabFg3VFRwQ1B3QXZGbWRJcnVsMzVYRUpYeDBpc0tSbHJHdEdROUJW?=
 =?utf-8?B?ZFBBMjZLQXkxU1RLSU4vZFhmSllWdzBUcUJWR3ROYWdEYVYvL1k3bTVDMGc0?=
 =?utf-8?B?T3RERHRSR2FJZmZQZWphQ3VKcC92bGpDNGFZaFl4a0RpbG5lL1Bka0JZSDRD?=
 =?utf-8?B?ay9JcXU1SnlnQUwwUzRCc1NQeTExeUhMaE1Qb1JSRWVScHBlNWNnTDZ0TWVm?=
 =?utf-8?B?L2pXZGxkc3RVQzRHa2dIZ0ZxekFyZnhNZ2tJbGlCdndrZHc1bm1UTk1Pbmll?=
 =?utf-8?B?VkwxMnZNcFI3NzRza2JsOEVPZFltMjNPVDYwV0JWa2NLMXdKTHhWNDJGdUhv?=
 =?utf-8?B?ckxqWWo3enNsdDhYdzVmeXZZTXNOTm5uR3p2SHhmSnBkTkk5NnlFK2RTc2xL?=
 =?utf-8?B?eC8wTnJ0dkM4OTY0Q2xRZXdLM2loL3ZhWVhKd2lSREVwNyt6OWQvZjJGbSt5?=
 =?utf-8?B?c0J5T2gveTB6V1ZqaG0wd1FHNmtBdXFUWmlOYlh3TTNWZjJXbjRkdkdhbDc5?=
 =?utf-8?B?dDVWNE5NUkg3MDQwZ0NNa0lUUzkvbEtKcm5uM3pFOUwvN0E3cytHdURQd0xk?=
 =?utf-8?B?OUlkVUIyOEZmYThiTjN5Y09WQTFlY0xLdUdFcjh1bE5tRU1kMVlJaGNSdVVQ?=
 =?utf-8?B?a3dPa2gwaW92eTl3Q0R1SC9YTHlYdnAxbjlVREwrdWppM3IxZFVnQzg0dGVD?=
 =?utf-8?B?WGpFc2NtN1E1NTc5QkRQYi9SUFR1cVRSYVN2MFBaUmtZOEw5Qk5Ia0pUUmNs?=
 =?utf-8?B?Sy9nZTBBTSsvWjZVajM1c2hrRTI5R3UvOGJBNldza3FhMWlkclNOVE93T0c2?=
 =?utf-8?B?RFRJSmVhdk5BWVVGNk5NN002MUhpNWZCaTBnQi9GcXBIVDNGdTRSTE5YVWtG?=
 =?utf-8?B?V2dnVzRQM1dXcjJwaEo0OFRaL2dPamhNczhiT0phWTBiL05QM2lyeVdIQ2Fl?=
 =?utf-8?Q?3n5onWQd5nHbLFr8ng=3D?=
Content-ID: <F8E59913408696498DFA976155623151@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c062591-488d-4cdc-d715-08d8f07e295c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 17:39:52.1831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljuSKt/XY0ZvRZbINyNB4BDHHp44lVJHuvwWU5bzpbUu212Y2ag2qXBb3U48zAvVoc8+wRyTyCSVlSEz81NSdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_174009_929484_F6608687 
X-CRM114-Status: GOOD (  22.21  )
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

T24gMy80LzIxIDM6NTYgUE0sIFZpbmVldCBHdXB0YSB3cm90ZToNCj4+IEFsc28ganVzdCB0byBt
YWtlIHN1cmUsIHRoZSBHTlUgdHJpcGxldHMgYXJlOg0KPj4NCj4+IMKgwqAgYXJjLWxpbnV4LWdu
dQ0KPj4gwqDCoCBhcmNlYi1saW51eC1nbnUNCj4+IE5vIEFCSSBtb2RpZmllcnMgKHN0dWZmIGxp
a2Ug4oCcZWFiaeKAnSkgZm9yIHRoZSBsaWJjIHBhcnQgKOKAnGdudeKAnCkgcmlnaHQ/DQo+DQo+
IEFjdHVhbGx5IGl0IHNlZW1zIHdlIGFyZSBtaXNzaW5nIGhhcmRmbG9hdCBoZXJlOiBBUkMgZ2xp
YmMvZ2NjIHN1cHBvcnQgDQo+IGl0IHZlcnkgd2VsbCBhbmQgc2hvdWxkIGJlIGRlZmF1bHQgZm9y
IGFueSByZWFzb25hYmxlIHBlcmZvcm1hbmNlLg0KPg0KPiBTbyBJIHRoaW5rIHdlIHNob3VsZCBh
ZGQNCj4gwqDCoMKgIGFyYy1saW51eC1nbnVoZg0KPiDCoMKgwqAgYXJjZWItbGludXgtZ251aGYN
Cj4NCj4gQlRXIEkgaGF2ZSBvY2UgcXVlc3Rpb246IHdoZXJlIGRvZXMgb25lIHNlbGVjdCB3aGF0
IGRlZmF1bHQgdG9nZ2xlcyB0byANCj4gYnVpbGQgdGhlIGVudGlyZSBzb2Z0d2FyZSBzdGFjayB3
aXRoIChzYXkgLW1jcHUgZXRjKS4gRG9lcyB0aGlzIHJlbHkgDQo+IG9uIHRvb2xjaGFpbiBkcml2
ZXIgZGVmYXVsdCB0byBEUlRILiBPbmUgb2YgbXkgcHJvYmxlbXMgd2l0aCANCj4gcmVib290c3Ry
YXAgd2FzIGdjYyBkcml2ZXIgZGVmYXVsdGluZyB0byBvdXIgbGVnYWN5IGNwdS4gSSd2ZSBjdXJl
ZCBpdCANCj4gdGhlcmUgKGFuZCBwbGFubmluZyB0byB1cHN0cmVhbSB0aGUgZ2NjIGRyaXZlciBw
YXRjaCkuDQoNClNvIGhlcmUncyB0aGUgbGF5IG9mIHRoZSBsYW5kLCBhcG9sb2dpZXMgZm9yIHRo
ZSBsb25nIGVtYWlsLCBhbmQgaWYgDQpzb21lL21vc3Qgb2YgYmVsb3cgaXMgbm90IGRpcmVjdGx5
IHJlbGV2YW50IHRvIGRwa2cgYnVnLCBidXQgSSdsbCANCnByb3ZpZGUgdGhlIGJhY2tncm91bmQg
c28gd2UgYXJlIGFsbCBvbiBzYW1lIHBhZ2UuDQoNCldlJ3ZlIGhhZCAzIHJldmlzaW9ucyBvZiB0
aGUgSVNBIGFuZCBlbnN1aW5nIG11bHRpcGxlIHByb2Nlc3NvcnMgaW4gbGFzdCANCjE1IHllYXJz
Og0KDQpJU0HCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJbXBsZW1lbnRhdGlvbnMv
UHJvY2Vzc29ycyAoTGludXggY2FwYWJsZSkNCi0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkFSQ29tcGFjdMKgwqDC
oCBBUkM3MDANCkFSQ3YywqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBIUzM4eC9IUzQ4eA0KQVJDdjM6
MzItYml0wqAgSFM1OE1QDQpBUkN2Mzo2NC1iaXTCoCBIUzY4TVANCg0KLSBBUkNvbXBhY3QgaXMg
bGVnYWN5IGFuZCBubyBuZXcgZGV2ZWxvcG1lbnQgbmVlZGVkIGluY2x1ZGluZyBkZWJpYW4gcG9y
dC4NCi0gQ29kZSBmb3Igb25lIElTQSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIHByaW9ycywgbWFp
bmx5IGR1ZSB0byBhZGRpdGlvbiANCm9mIG5ldyBpbnN0cnVjdGlvbnMuIEluIGZhY3QgZ2l2ZW4g
dGhlIGNvbmZpZ3VyYWJpbGl0eSBvZiB0aGUgSVNBIGl0c2VsZiANCihmb3IgYmV0dGVyIG9yIHdv
cnNlKSwgb25lIGNvdWxkIGVuZCB1cCAyIG5vbi1jb21wYXRpYmxlIHZhcmlhbnRzIG9mIA0Kc2Ft
ZSBJU0EgKHRoaW5rIGRvdWJsZSBsb2FkL3N0b3JlIGluc3RydWN0aW9ucyBpbiBBUkN2MikuIEJ1
dCB0aGUgcG9ydCANCmNhbiBhc3N1bWUgdGhlIGFsbCBlbmNvbXBhc3Npbmcgc3VwZXItc2V0IG9m
IHRoZSBJU0EgYXMgYmFzZWxpbmUuDQotIEFSQ3YzIGlzIGN1cnJlbnRseSB1bmRlciBkZXZlbG9w
bWVudCAvIHByZS1wcm9kdWN0aW9uIGJ1dCBzaG91bGQgYmUgDQprZXB0IGluIG1pbmQgYXMgaXQg
aXMga25vY2tpbmcgb24gdGhlIGRvb3IgYWxyZWFkeS4NCg0KSW4gdGVybXMgb2YgdGhlIEFCSSBj
cml0aWNhbCBmbGF2b3JzOiB0aGVyZSdzIGxpdHRsZS9iaWcgZW5kaWFuIGFuZCANCnNvZnQvaGFy
ZC1mbG9hdC4NCi0gQWdhaW4gYmlnIGVuZGlhbiBkZWJpYW4gaXMgbm90IG5lZWRlZCAtIG1haW5s
eSBiZWNhdXNlIG9mIG51bWJlciBvZiANCmN1c3RvbWVyIGVuZ2FnZW1lbnRzIGFuZCByZXNvdXJj
aW5nIG5lZWRlZCB0byBzdXBwb3J0IGl0DQotIEFSQ3YyIGhhcmQtZmxvYXQgQUJJIGlzIHNhbWUg
YXMgc29mdCAtIEZQVSBzaGFyZXMgdGhlIHNhbWUgcmVnaXN0ZXIgDQpmaWxlIHNvIHRoZSBjYWxs
aW5nIGNvbnZlbnRpb25zIGFyZSBzYW1lLiBIb3dldmVyIHRoZSB0cmlwbGV0IGlzIA0KZGlmZmVy
ZW50IGFyYy1saW51eC1nbnVoZiBbMV0gYXMgbGlicmFyaWVzIGZvciBoYXJkIHdvbid0IHJ1biBv
biBhIA0Kc29mdC1mbG9hdCBzeXN0ZW0gZHVlIHRvIGxhY2sgb2YgZW11bGF0aW9uIGV0Yy4NCi0g
QVJDdjMgZG9lcyBoYXZlIGEgZGVkaWNhdGVkIEZQIHJlZ2lzdGVyIGZpbGUgc28gdGhlcmUncyBz
b2Z0IGFuZCBoYXJkIEFCSXMNCg0KU28gZ2l2ZW4gYWxsIG9mIHRoaXMsIEknZCBsaWtlIHRvIHBy
b3Bvc2UgQVJDdjIgcG9ydCB3aXRoIGhhcmQtZmxvYXQgYXMgDQpiYXNlbGluZS4gV2UgZG9uJ3Qg
Ym90aGVyIHdpdGggQmlnLWVuZGlhbi4gQSBzb2Z0LWZsb2F0IHdvdWxkIGJlIA0KZGVzaXJhYmxl
IGZvciBkZWJ1Z2dpbmcgYW5kIGZhbGwtYmFjayBidXQgbm90IG5lY2Vzc2FyeSBmcm9tIGZlYXR1
cmUgcG92Lg0KDQpJJ20gb3BlbiB0byBwb3J0IG5hbWVzIGFzIG1haW50YWluZXJzIGZlZWwgYXBw
cm9wcmlhdGUgLSBidXQgc3RpY2sgd2l0aCANCmN1cnJlbnQgdHJpcGxldHMgYXJjLWdudS1saW51
eCAvIGFyYy1nbnUtbGludXhoZiBmb3IgQVJDdjIuDQpGb3IgQVJDdjMsIHdlIGNvdWxkIGhhdmUg
YXJjNjQqIC8gYXJjMzIqDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIG1ha2VzIHNlbnNl
Lg0KDQpPbmNlIHdlIGFncmVlLCB3ZSBjYW4gc3RhcnQgb2ZmIHdpdGggcmVxdWVzdGluZyBjaGFu
Z2VzIHRvIEdOVSBjb25maWcgDQpwcm9qZWN0Lg0KDQpUaHgsDQotVmluZWV0DQoNClsxXSBJIGRv
bid0IHNlZSB0aGUgYXJjIGhmIGV4cGxpY2l0bHkgQCANCmh0dHBzOi8vZ2l0LnNhdmFubmFoLmdu
dS5vcmcvY2dpdC9jb25maWcuZ2l0L3RyZWUvdGVzdHN1aXRlL2NvbmZpZy1zdWIuZGF0YQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBz
LWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
