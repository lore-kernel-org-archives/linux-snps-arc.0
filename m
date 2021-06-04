Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7551C4743C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 17:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926BF613F9
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 17:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926BF613F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pww1H6s7jELyaXMV73GYdkoIpuDjWd2Ctd5zg/Pua08=; b=sJ1JMELOdIQJvd
	5hqkABqWCRokgehD3oE0VUv/HqclS6+BOfZr+i3MExUb/BQpYHYBxw9LGXWa4SnoiR00oadMD8d8h
	H1/KlTabevz6gKIc6BCCbyO8891z1flAo5la6fHYt8hdFDWoucbs6kTZOVdceTBhyv3StNNJW9Dw2
	YgFT1Cxv/LyIQGcB6QY42ilkALbBhYdAE+pPA6AzRq7WF8uOU30cZJzjr6Hr1pWxNy/5dJ9fFwdqE
	Xg9Li2/NHzKRH6xkP7CbC0w6L/3rL75KiyF6s5m5ZvR0ZvJmWYNF1/pSaeOxweHeFZDqY0LuwUBpX
	m3V8H2V+DuJvUO+qbvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpDD8-00EVIU-4p; Fri, 04 Jun 2021 17:02:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpDD1-00EVGl-O4
 for linux-snps-arc@lists.infradead.org; Fri, 04 Jun 2021 17:02:16 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 50D40C0ACF;
 Fri,  4 Jun 2021 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622826131; bh=0A+RRRAJpBQRMwmhwtOHWzJzbxxxw/8uPG0bDdpQEPg=;
 h=From:To:CC:Subject:Date:From;
 b=eR56DjMu1RhtDeFtESmBXERUB6ehBEPwVXzznR9CIbUlJFly8cFiRIy2H3AgiVXvw
 H/eAoYQMBR5DkE/AUIWNds6d91aGX87tnuQzAeAgMVQs2CtUy6a0C+noAJXpcL15U7
 ABoHvVlQnavbbxdgT0kjjH1C1UeBg8aj0E+icQCpfFJXS5kNtD4ajEVxSwh7rAav0J
 otsdmh2pGBB5OU8+JKh7VKL3nTR38SLHULCr+/jq1p/XUNR9ChlfdGrMca4z7d2WZz
 AktFt+86K/q4NW31QOmRzipAdYQkhJpIaogVNKLFAFJU8c2ehI0JbMQAvULM7+Kj5m
 kyJUfHL4AW3jQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 02673A006D;
 Fri,  4 Jun 2021 17:02:09 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1C3D980095;
 Fri,  4 Jun 2021 17:02:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CHiDCRpZ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzWHxCZPOT30yhQpF3A/ufTuvOaE8B/c9xK0wmIdqtJtTZEPHIPbo1up7M3HBt1Yunw3TbsATNTixFj2VAfjB1zn1qPWFZUHk3j0yhFkIaqMoRTSvVEscSYn1Is/TuieJhCJSKVtp8Xn1OXGf5NbSjLUJ60O2emOKMY7yF+FHV9YzTwkFHjKh8MEB40YkEnUoPTfVseXtLxbRMbepxBBQWbg8sQ4eqZoA0csyfndaZMIniAgWNpmbgqfztR3VOzJembAYpyRWTcQ0a6FlaFLPFqIs1J+9GjKLCgVyDTSUpov4C2dT08cFWzKXJrzowlZ182cAXMAtuL9Etey09FtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A+RRRAJpBQRMwmhwtOHWzJzbxxxw/8uPG0bDdpQEPg=;
 b=Mh1iDJlxTFQ4DvczJDrgN73Hvne55cB96/Y7UyXbaqvW+34CXioGg4xmKVbBCbf+AJZg9t8v3E6wRGGfQ2vJiU8v6/QTZtxSM6+kpS/pb+S41PIJxVj/vwRx5fUbkPL63NCG+nah3GyNJv2FgFvq2GB/T5T6ucY6nXKnm9kImbKzUNI7/AAxZbt1sipGpaAMQ4RgW99YpXM9C+LDmjmSuStmJAjpNdVXnEb00wocmP0Rjerx+gk/o4e0eAoax5tNJYNeFEnnd+HA2d63O2iGRo7q0hjpjB6lo2pSvnYw1qS0aI2GOPXn9VN2+E06QVtYEaTs8Y3V2LpH7etb16Qtwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A+RRRAJpBQRMwmhwtOHWzJzbxxxw/8uPG0bDdpQEPg=;
 b=CHiDCRpZfwzTkTFlHZQcgbZQ3WpeXK9OT4gdL3IP2NNLBSs0fE99gKEmf+7wxM9PAMahZYchteUjEwhrbXhzhqpNijm4ekFogKxQwlSZmfVYKXPp4zAtQmwxwzh4YsyoRPDbMVL72E9Sn9tL8a25rhfIVS159BJ4sxOW9IZWSd0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 17:02:06 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Fri, 4 Jun 2021
 17:02:06 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "control@bugs.debian.org" <control@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "debian-gcc@lists.debian.org" <debian-gcc@lists.debian.org>
Subject: Debian: gcc: add support for ARC
Thread-Topic: Debian: gcc: add support for ARC
Thread-Index: AQHXWWNYhcMvvrcy9EKmNspkaE+16A==
Date: Fri, 4 Jun 2021 17:02:06 +0000
Message-ID: <e8d99b38-52fe-cd2c-f831-45a548f98fd0@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fd77946-37c9-4d5b-83eb-08d9277a7b98
x-ms-traffictypediagnostic: BY5PR12MB4083:
x-microsoft-antispam-prvs: <BY5PR12MB40836B901D3FCB1D265A3034B63B9@BY5PR12MB4083.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iwc7ji/aMBKwkrx+hpLV99GVdqYcHny6SdnnSGdcUK4ycaJ0J+lm/kvnuVSrebPLfrZ5yW8TkFWRWLUdzBMrQW9yg55RVnEFpqpaYCEfHNDy/J+TTEbstKEs45czR8cwkv4JDiTrwn3OfNqQCFGfclZffqABqyIWR44SsbLIROVFy2i8FNi3mts/vqiNhKonl85Xw16M/3vtFEXFNmxdpAMMnXPXT/Ws/JTZOkrP2EBkGtt0ufVtODJXcFeC0a7mXpTctNvN8hYgHVhA9rHhozhu9eGce6Jf6jB/FGpaM5S8in+VxReAYQP0WVFA+OaHnZq8nSdxYHxSJmi5YfD85jsZFZftibkPTcswzNDOvm1KeF178vuWhxQaah+HgGgidJOCuR/oL5kOKT7/fbgeVOquE/GkMiuTym9Q2sjoQv2D+sWXOJQYz0huZQLwknLMGOtQpXxS5SPPuD+thH+AmoszgKG0HJ3EzpBc7vmGvY6VwBJoGurDMWU9nrwHE/JFXqDzfzp41EpAvxTJwp5JAv1lgvCYXZIFsriqu6Mle5k9ibyK0wiYBegM0YkPdd2cE1TLhZhTE1K77DtOtOisUbsnTz4xPXi7veYfFttzNVWlVGnEpq33ygIeBIA2ebQ8mX5pEUFriV9v5N3QJkyP2cEvJgLFtKhS1Pns8xSUA7IQK2pVZl50CAxDWnXkVc4i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(136003)(346002)(39850400004)(376002)(4326008)(6486002)(6512007)(478600001)(38100700002)(2906002)(558084003)(8936002)(71200400001)(8676002)(122000001)(31696002)(31686004)(6506007)(66476007)(36756003)(5660300002)(26005)(66446008)(64756008)(76116006)(186003)(6916009)(66556008)(66946007)(2616005)(86362001)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eWJPTHplcmdIbW5NVDJxbU9BOEI5ZUg5UjYrTEM5UnhCS0JTNjVDUzREWmpa?=
 =?utf-8?B?UU1jT1RQY2d1dnR5emxSajhJdnlvdGtEYjRVNzJ2RitiWnpJVHBMTTdhNDE1?=
 =?utf-8?B?akFLUUwwM01sTkZxczFTV1dTVlJvVXZzeTJ6TWVUYzFsY2VtcFluVFJ5cFFp?=
 =?utf-8?B?WGtrUlAxd1EzK090SGpvbkNFMGRkNEVKRHNGNXRqRlY1MFRJS1puY1ZQQTBI?=
 =?utf-8?B?VEJBNFoveTJhNG81STRXc2dWNnZlVmd0VXhrS3FUYm9yaWxDV3BVNjZzaTU3?=
 =?utf-8?B?ZmpjNHV6S3BmNVBPdzdGU3hWL2ZQZDBWMVBDZk1pd1FicUN0alVKL2pFRS9Q?=
 =?utf-8?B?ekc4NmxNK0NoUUZUeHJ0NFNwSzlrVjYrVnVCRllGb1B0RUdRSkpSTkN1d2FE?=
 =?utf-8?B?UlZmWEMxa1NJaVViM0FMaFdLdmxzWW82WElQM3BkbHprN2UzZXc5bHQveU1C?=
 =?utf-8?B?bUluN0diRndwdnBPQjBtNUZRTzVka1RzUGdWbGtuUS9IN3N3L3lQbFRwL1R5?=
 =?utf-8?B?WjF0dzdtZUpJdWdjRGhKdG1ocnlsSyswWW9YRlplekJMWUFOS3N3dVNvQnpH?=
 =?utf-8?B?cTByVVhUR3E2T0grRlRXYnMyMk8zNXc5SzlTREU2SGxBUTdLSWYxVDY3Um5i?=
 =?utf-8?B?OUdEQVM1VzJpb0xlMUlpUTNkUEZHQkpjcWZwSG9IUi80QUNlQmxFK0FHR2Qz?=
 =?utf-8?B?U3lyOEpHSmJNU3VRbDZjQmQ5YVByTHRqakFkWDk0T1ErQ3dlOXc2Zy9tcHBN?=
 =?utf-8?B?bGpoTW9tMmliMTdYbllTQWRCNWUrL0x5M1Q1TlRvdkYyMjNSWENUall1aGZ5?=
 =?utf-8?B?eHVmRFROa0JUK2pZdFM1dkZzaHRrV0NJZmVsL1dMMzNYSSt3dEpLL2VYMW0v?=
 =?utf-8?B?OHVYcHBNZEFRUkY1ZzM0a01FR3JZOStaR1VJSDBMVVFGVmdjRlNwZjFxa2ZJ?=
 =?utf-8?B?bnF1eVFHTitVT1F3TU1PZVF2TFB5bmV0azAwZ2RrMkVkVjlpWVJnWldIRktS?=
 =?utf-8?B?QUszQmowQWtiTFpFUW9uUVFYWFl1NTFOQmJZWGRHdGlBcy9RYzFjeFdYbW00?=
 =?utf-8?B?bHF5bGpPcVFGNVp1aVZrSzMzVU5STnVubEltOGpZYzNNWnlZY012VzI5bE9h?=
 =?utf-8?B?cU5XemFEbG1MSmRSMzkrbnNuZWNaQU0xTWUrM2g1aitOZlhLdE9UbDkzeUlj?=
 =?utf-8?B?cTNvc3FCMXhvMVdIMEduWkNjS0NJN0pNM2RRWGdKYzY2cnJxbldwYjFsQjBy?=
 =?utf-8?B?MW1YZ3lFTkM2Z2NQN0dabUlxQUk0clE3UlQyWGwra2g3VlZqSWdjdUwzQzEx?=
 =?utf-8?B?a2E2Y0Vhc3cvZ0U4L1IvUmlHYkhaNWZOa2h5c2RFbHA1TGk4dHkzRllIbE05?=
 =?utf-8?B?blVPWVNGNUFON1R5RlMwSDNvaXEzS2MrbG4wMVNpV29IS0hRWnEzOG1xWGxy?=
 =?utf-8?B?RmFsYUlxUFpKdnBONnlRYlM2bE1jQ2JKbEM4OStTZTBvZmhNQUZ2Qy93YnQ4?=
 =?utf-8?B?NDZRSWNzNEVreDkvSUVwL01LUU1GTUlLdEZ0am93WXFqY3NPSms2M3VMVldX?=
 =?utf-8?B?YWVYUm5HK29TTWdUV0taeUs3OUo2S2xOV2k4MmlSUzhYQnpyOStBd29PMEFF?=
 =?utf-8?B?ZVZBM3ZCVURJM2FQdERXczNvUUdOTkNidVppeWE5UktxK3VyUHpwdE9yMWdD?=
 =?utf-8?B?dGppTnFMRmd4dWxzSitIS1U5ZUc4d1RZWlNKaHpEWU9LZklIR2hNVjB4Q0pO?=
 =?utf-8?Q?MGyfc+M+6E7Xbbw+9ZW8lMXEuqSXx5e+PIU5vyc?=
x-ms-exchange-transport-forked: True
Content-ID: <C4BE8EDC12BBBA4B9421849F08ADC457@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd77946-37c9-4d5b-83eb-08d9277a7b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 17:02:06.0873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VFJLMtMJ79AEUX6glU6f9HvwW0bKN9UDaLAMQxY6XW+M5y4xmaNkNqE7nlKtq5WXvByyeh4XgNjwC9EXDKxqUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_100211_871281_9CEC2597 
X-CRM114-Status: UNSURE (   7.43  )
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

reassign 989453 src:gcc-11
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
