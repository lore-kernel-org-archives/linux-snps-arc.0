Return-Path: <SRS0=GR/N=JX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8FBC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 17:16:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2722C6024A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 17:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2722C6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+MIiTtFy3/AnchjBB6Bowv+liUWl7PhN5wIZt6Nvv4=; b=dQUzyBsgCcdFd3bpJLdc4Q/AY
	Vtx02zL32keRYmiJHD7Kc2vEKCuHFRCbkwB6U6KSiymvLxX5LzV03NPbNkw2wqOkehJvMKqPu6n2L
	6WhS8S6zb2hYN/OYSWB2e/DF7FOHI9mMhbGNQY+0Fuo1b/37QgYZZOCRagkxy9ESUpfEWFb+iPmMi
	xaUPF7/3Cle52lZA4QNbDER8hnXfxCoPPdtKcKCHeimQ8IEFCP5qLN16IUyO14PLs6LBPcrXD9z8B
	4KpPcfFr+t8HBTnIcDDCyqIAEMiTaCWIb5+kRl/eTKi4ABr79X2ovT1Z+KxLdJMKPPHPrEWPKql7Y
	X7vyCw0uw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb4qp-0089Qk-Iv; Mon, 26 Apr 2021 17:16:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb4qi-0089Nl-Pb
 for linux-snps-arc@lists.infradead.org; Mon, 26 Apr 2021 17:16:49 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 223584066D;
 Mon, 26 Apr 2021 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619457367; bh=I+fvrsN1nfNEFnDQfUz7pmkpihbbDEsjeEUEAX+j2yw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FTJA2n3fCMQ0YurUoq4z8XRO7OfFOzdftK0yvYdBEJJjywo1mBKjeqpJ6rum5egzf
 5HIWGuW/BUEXMdyU2WceI2+SjTVA59slml0yxG+y1r3dcEY/bs5JaKdZ1PuY57G63X
 0H8zqIBuPA7vmtuQuXjRCzPROPQmZxLHOYzhkBFy+caAqvErjLK03GxcpsYoIqPUcj
 /CiauVGmvBuOLy0iLljzSmbP2JHnkKSzCAEVWCUykmwpJDsk86/nrKuf0NkKWULI74
 Zuqch8O9VBqYrV5Yiue6NUIz2BMeNdt55YAAg8F5cRClZaUJkK27FwlwT5+dMrXgn+
 ZqKa5mbJkq/Zg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3689FA0077;
 Mon, 26 Apr 2021 17:16:04 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EC72980095;
 Mon, 26 Apr 2021 17:16:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="JfGgHqpB";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAla4ibN5Xzj9br55+RiPIpdHfGDnP8lczJ6bc7t7gtVHFn66HnaHVO1NXyJj49xwvwbWry+f0m15BuTtQXHM3Xo7Q5NNALjdLXhT6+6MOlCFaTPyfK44BLu1LlLil4k4mN1LALs8kEWL9kXvpkKyp1lMysorUvQIPsWJAcQDNNYxMu5ve8mdJhptPBfVErfjdugR6cATddXXgdXeYiibMqYk7GQzO+NvYNehxvCvUIvh7+071TVKm1Uc31936Gp/58vDOcoRjnYUH9alpeteiAKAhwMdHRuWnyshiMODRIyf10qAZCK/gcBh1UZnznKGJW/AFPmzo3iYMOIwfvLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+fvrsN1nfNEFnDQfUz7pmkpihbbDEsjeEUEAX+j2yw=;
 b=Rndr9rqHdhm95McgoqK6gese+1Uij7+AF7tS2TU82xxEGZV6/IzBLoCjAoOpDYUwRXGTdoi7U2AW5zHSRNj2zqYQhKxckBeTPlrjiLcFcPhnNJ2GHbraaqSnXgUHDRAnmgmipvBvdoQubyervXlJ2657y/2NAAuKVfby19mc9clS0mGHkA2GEGHWUPB5i5X9f/6DzquCPMXaD9nB3C1GOB4k2ycBF7HT1i4iZYWk/Ny3JjggHWSb6fGJpslbA/jpP0Qu+xdmy4qRFajbbjRsGjxA8asYiaFaTvcm3+gjBB1PE+ibC585spu5UEZbfaJNU40hvBIXUm/zYLRwW/aSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+fvrsN1nfNEFnDQfUz7pmkpihbbDEsjeEUEAX+j2yw=;
 b=JfGgHqpBfrsBjWcPzOlrmVRrLA6ASt8QJtrdZzw2RSezQa0xrdTMUKSoNLXKKSgX77G0dGtDL01+Gc7shwrFEmu2G32pG23aJCvR4EuH/C25bThd+bLj9wQWtqTsXXibeyk6dXKrbnUusKr+R1SIzpu9Q6rVPZQHMU41RPhHBCc=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2853.namprd12.prod.outlook.com (2603:10b6:a03:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 17:16:01 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 17:16:01 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
CC: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ARC: Use 40-bit physical page mask for PAE
Thread-Topic: [PATCH] ARC: Use 40-bit physical page mask for PAE
Thread-Index: AQHXOoQeRoAsdo9ybEqvN+qAfiw8IKrG/bcAgAADygCAAAkeAA==
Date: Mon, 26 Apr 2021 17:16:01 +0000
Message-ID: <977ba565-6fb4-b0b0-b982-fa3ecc478563@synopsys.com>
References: <20210426100801.41308-1-isaev@synopsys.com>
 <5010e4f4-c881-6c9f-b24c-4a87d9a4d55f@synopsys.com>
 <BY5PR12MB4131E059EA9C630661349A0EDF429@BY5PR12MB4131.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4131E059EA9C630661349A0EDF429@BY5PR12MB4131.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e781beff-e309-41d3-00f2-08d908d6f724
x-ms-traffictypediagnostic: BYAPR12MB2853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2853D0EAF5D38C71D983D1D0B6429@BYAPR12MB2853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqKsBt73UgWLsZB3P1ImaWMkbWnGq5QHjSgBqlBq4XSO+18GTGNH2HFd1HrOd7oFPsGl4yJrrk8Q6z+eQB7aok4wvIcNq+gBs7cKWGycaMfERaFzeoyCrixk3+XaHiYREvN0DkO7NQYXwGDNd3/HjDTaKMgfcvonxHlhnlGucfAI6aJOXh1EY7E7j7irHfh7o4IwvesT3HJe9hD5+WeNTiQaggyzAekKsx2CNoDn3ygdZlfsibJLC9GIsDfThAl6ciE4gsaFa2tN5K8Z53u0NDcPMOYYNzrSjB70FKrNhDDoQlXMr1d6tK3sP/XqdIel/eX0hSktVg0nvQvRCarOQdgNlCSgQkWVDHF3h3QD1gzn5ZHCtTv0507z+nxrYCWB0PnT329Dl8ZjFbLhnf/njfOrxqsUDWPJvIud+Oz7rYbloeKNN/Pt0hq0nMBOcC8cooECqhLsAN5u88QfnPAjfS3waDfYt5ojb6VqIj4AjP6JbgJXygRZ5PrfFoe3MNzJH6+2TT6kwF1mN2jDcAycxsiBMncxkktnf6xi/pICVAvRfwuIQwDZizMBcQM/d3Z+EksT+oGUuseVz5ZAwMhGy4VqSicpNRuwpLTbbCI0RHapUejUQohokxHoMIUHkKh1nxZec9cVIU9f/vFbt4WSsxT20WYwi0zYpJa98A76XnQS7NWCuIFoHaELl6i4qN+8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(136003)(39860400002)(4326008)(8676002)(478600001)(6486002)(110136005)(54906003)(5660300002)(66946007)(38100700002)(76116006)(66476007)(66556008)(53546011)(26005)(71200400001)(316002)(186003)(31696002)(36756003)(6512007)(2906002)(8936002)(64756008)(6506007)(66446008)(2616005)(86362001)(122000001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bkFteFIwZnJWVXIrME9JZ3dXUWdIU1MyN2xYQURSQlV6TUExWjdGMm5KUGxE?=
 =?utf-8?B?M1hzTUZtMnhsNXh5cTl1SEVMQUgzZXJESTUyeWtEdys1QmtFMkZsQlBZbWJq?=
 =?utf-8?B?bE1mQTNQdjZybUhVRFlra1RlNWtxS1dUNUR1VGwyMzZ4YzVnQU5oMVVOemhP?=
 =?utf-8?B?SE9pSTQ3eGx6OEg1UHJoME8ybmNWa0svUjEzM0lWRlJCRktleStHVG1TbUIz?=
 =?utf-8?B?c094U0pWYU9uMHRGN1FHZjVjcys0a1FaYUxhdEYwK2lJeHR4aXkvZHRSV2Vw?=
 =?utf-8?B?WTZLRHpWVkNlOGwweFhCQ0QxQlEwcnhyc2dORGxUaUc2eEpkU2FJSnBVK1BG?=
 =?utf-8?B?bWt3SGtsY3o3cWtDVDhjS3RvcHlzN0d0N1J0RXovQ1BCWFVYOVp4elk4Y0Rv?=
 =?utf-8?B?NlFvcndRR0hiNGV4QlAyZ0RUVXFoNWNiNjRNVExJcFpMWWtmWG1oYVV1Mklh?=
 =?utf-8?B?RW5RV204MHpUS0ZZY2UvWHlBVENPZXRxdHQ4Rmp0eDFvaXl2NG8zWm5ZQlQ0?=
 =?utf-8?B?RG9iZW5KZ09pVkNjV0JZY2k1UkZFY0VQS005ZnM5VHp3NHRmMWpzRUFvcWdi?=
 =?utf-8?B?bzRVNWQvSE83eEgwTHNMN0t4SDQyQmJYdVA5ZHRFMXJySTVxR3R6MzRTNGV4?=
 =?utf-8?B?eVRnc2pwekFBTVd2YlRtb1kvNEdnck9ZS1FicjJzVjlhTWx4TmpWMUJyN0dt?=
 =?utf-8?B?NDFHUTJsYW9aWThPU2N4emsxYVdiL1BZczk0bWplRU5tN2RrbEJhb3JzSm45?=
 =?utf-8?B?UEUzaWF5eDZUK1RHSlRIOEFOOGpQRUhReTBDNWxHTkJjdWZKcE81eSt2Y2Mx?=
 =?utf-8?B?dUFDVG9pcU53aXR6UmlYZ0FleDAybGpJTU5tTWd3a0ZSU1kvcFNkRjZGbkR1?=
 =?utf-8?B?YlYrR3ZPTnBodGdocXlGSS9CQmNSeGd0eUh3Y1NUTTJKZWZ6QWpoRHZ6QXFk?=
 =?utf-8?B?VXlHd3RrRmdNMG1wcjVHRVRjNlo0UmhIMjJ2eXZSRnh2RXNlZUtVblNxaDdH?=
 =?utf-8?B?ZUdDM2laQXpWOHlYTHZjWWhGVVdHcVFLSHl6OE5NT0l0RjR6dWpEZXFLazZH?=
 =?utf-8?B?NGZ3QlNGcjdUZ1lvVjExdFJTYStjR1F4bjEzSjAwZm1LajBaNityZkc2c09i?=
 =?utf-8?B?QlJoSXduMzEwOGR6a1dSYW9qRVFMbVJ3L1lPZjNvYXFEb3MxSllXSlVlcUEy?=
 =?utf-8?B?cjdiT3c2UEtob2xYS2hlNlFrTzNqVi9wYkVzOTI4cDNaSnoyeER4R1ZKVXl1?=
 =?utf-8?B?K0RuVjVHUnp5aGlNSHhudkRkK2ZTcTV0c3ZSbzQ0Q2haRy9JRDZsTU92S0tD?=
 =?utf-8?B?UjN6S2dlNytJVUdqeHBWWlVTdVZXSDRKZERCQVhQM3k2STJ3blpMNHcwQWJm?=
 =?utf-8?B?VUZpYTVYN1JhWVFBbEVJQnVuQ2Q1c2NvZE05c0xWNEU1MjVJejB3c0J2bTI0?=
 =?utf-8?B?TzVhbEU3d0lpRjl4SFd0SEVqeHFCMlJWbHRpS2loOENrWlNOM3Y2SDN5dFhY?=
 =?utf-8?B?U0VBOG10UU4zZ0ZvRGtTQmk1Zzlzend3dElhaUJXa2JrK1VDVkRYYXl4ZTIx?=
 =?utf-8?B?MmREd2hveXBOSS9lSXR5YmxLRDVPbkVjZnVYejhFQkY4UlJEL1VxSkU5NGFU?=
 =?utf-8?B?akJVMjBZNUZVYlZSTDMxZFl2aSt0NTRxMUJONklkU0NDY0pkL0xIKzlEbHJw?=
 =?utf-8?B?TFNIdVNOcVhWRmFMVERhYW12Lzg4Yi9NTXRONjdoOXZlS2ttZHhUbVFlSy9w?=
 =?utf-8?Q?faDfYxEFgA3IQRDLI8=3D?=
Content-ID: <75E9AAA977E63844997DDA156B364A82@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e781beff-e309-41d3-00f2-08d908d6f724
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 17:16:01.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cl0qT3iEJFCGR+Af7OwUTUXd9UfTq+mLfRmSaaCPrPIi3czERUkbB2ynzaf7KJgACzxcHjE1RM5GAGz8ZyXqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_181645_200960_22B0FA6B 
X-CRM114-Status: GOOD (  18.93  )
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

On 4/26/21 9:43 AM, Vladimir Isaev wrote:
> Hi,
>
> On Monday, April 26, 2021 7:30 PM, Vineet Gupta wrote:
>> On 4/26/21 3:08 AM, Vladimir Isaev wrote:
>>
>>>    #endif /* _UAPI__ASM_ARC_PAGE_H */
>>> diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
>>> index fac4adc90204..eb109d57d544 100644
>>> --- a/arch/arc/mm/ioremap.c
>>> +++ b/arch/arc/mm/ioremap.c
>>> @@ -71,8 +71,8 @@ void __iomem *ioremap_prot(phys_addr_t paddr,
>> unsigned long size,
>>>    	prot = pgprot_noncached(prot);
>>>
>>>    	/* Mappings have to be page-aligned */
>>> -	off = paddr & ~PAGE_MASK;
>> This is offset *within* a page so upper bits must not matter. In fact,
>> with this a bogus offset like 0xFF_FFFFFFFF can turn into something
>> weird such as 0xFF_00000000
> I understand, but idea here is to use PHYSICAL_PAGE_MASK/PAGE_MASK_PHYS
> for any phys_addr_t variable without thinking. So if off is actually offset for
> virtual address we can use unsigned long for it.

@off here is for a physical address, but is it intra-page still so 
doesn't matter if virtual or phy. Indeed it is a good idea to fix it to 
be unsigned int (not long since that is 64-bit attuned)

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
