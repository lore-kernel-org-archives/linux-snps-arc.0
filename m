Return-Path: <SRS0=mt4L=MZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B528EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 23:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A2E60EE6
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 23:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56A2E60EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8GFrSfRyQMROH2cJ5n4QBELOA88PgLRoR+fRgOfnzM=; b=VKIzDrLiQeRR8d
	9nVs0nrX6pFQSFXsuKXLBZlVoGfW3m7JwIM6wyt8q8okb1XRa7fjuoprVEPpLHZBmVUNxGzd2yxnH
	0cqNBmG1bqehY/wRSa/BlWwOzSxOAWLOgwWMzCdAcu+E+sNyABbYxUfXcyq9DiYSs5kQxkGe9heoL
	4/uiQSmC9IqMS8XQl+htwP+KSzQwP2KbNto7gb3iggvBoNcocoknA36hx2OD8k3l+1FRPNMfIQy3T
	iZnSMFV01NgzJyhUxwa9FfDjwGxwoeOdXCsWt2+FTPFI7U421YcPLoJgDaLy2a9LNr4mV0I0uvw51
	FIZkVjpSuxUR4aINM2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAhCy-000Zps-Sn; Mon, 02 Aug 2021 23:18:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAhCw-000Zow-IF
 for linux-snps-arc@lists.infradead.org; Mon, 02 Aug 2021 23:18:55 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 00667C0A75;
 Mon,  2 Aug 2021 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1627946331; bh=RSLUvMwjgWE2XO06wlsmG/q0yEyOKHYILvG+375IhQY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=aXYjYXw5S1KF85G0wssE2l43Tn08HKIGLNj2MB3+9CS/dzQokQfoYtAAyiOow2cJ4
 WucikV7BCqrUNBupHIccJoizYstd1VHHFPe7KrrpJKvuWrA6aPam++JWyvP6GBON4b
 6lRGKbzyOUkZ2bwTSZiIadCkHIDpJ8sIWpHqni6HwA0s1iNti3PizGe9penVGFi2NJ
 FvU+Hn1dk/gO48eFtYRk1FHvRftKcwSRuveT84L3HszPJy7XaGFUjlVCzBq7aTDL+/
 eLsT8Py+1uvkgBtwwAwh0RroDzkcR6L0kyvD9hnqoJ+eCCEVlU/jSfQJcCUCso2W0P
 0TBO1jfCtNNPg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8A895A005C;
 Mon,  2 Aug 2021 23:18:46 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9BA5740099;
 Mon,  2 Aug 2021 23:18:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="d1D3HOSG";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFXnzppcr1wMQ4p3lVo4m1j4k0lCJ7J0EmsLdxNBDxxL82WrpqYTy9QGXZnOa1dij2Te6m5Zk0ni6u1P2ltUWFKXcnvvgRtx8jGuV3E5dyWnjuJdJjcDrl/FAFDlyANsfril3J0es8HghVvES02cYg6d2DMqZoLfnvCYcEMMrA7RTbjUIA8fAgmZzjJ0es8AeQQhXVnRTqv45dw7255D8ettVf3H7VR0x4wcnBr3nJOanItbgdcAf8rOlcNu2wh/8pDx3P4XwYNNCP6d5YxEBDT9Q03yo2c4lfQIobo9iqTLxgRyTjJUFgqq8bT1gN8Kia/GP4u+fZgkVhh31298pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSLUvMwjgWE2XO06wlsmG/q0yEyOKHYILvG+375IhQY=;
 b=HMAByD6JOmeNRTwrVaLpPPFyw+g6QlRFLLr64d844Wgs3TaNcN4VVwn5QvXpHlD+0vpzFRewGatRM9bxSjg8dZ4liDda8rW3RjPPVLHmtKLCrnyMvaGEjU/uBVzpWqsWurppHCKcanGbmciLHeMLnQDYxGxNnYU7g5s+WR1L0Nkaoe/M/CnZu/fbD8OzVx07e+Yzr4AZpx8nYUGtGbBvVPR6PrqgJUeawkNKM4tOb7flMbXFYDvHzjZpqfyZGYkAuC1M1A148vU60w1dKYpd79LJZfZ4hCO57Y18NTLBhwbaeOGCCWKVMGYzT9+1FAcgJGTa1p+sbhLTpcrKZEVaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSLUvMwjgWE2XO06wlsmG/q0yEyOKHYILvG+375IhQY=;
 b=d1D3HOSGzBfZXKzrAe8X7ZFgmN6Nfm58CvsvVxscU83K6tnodY9/SQlN4A8o4XK1WXA0JPaKvL3BsZwb7Al72bGo96VHGGWDQ8rZMw1NOlVigJywdzNl+DwNdIYM3gY1mOJCt/UYJoqmsU1xvOrwBy4+o0SyfXKjsREEHMk/lDM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 23:18:41 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 23:18:41 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Vladimir Isaev via Libc-alpha <libc-alpha@sourceware.org>
CC: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] elf: _dl_fixup*: make @reloc_arg 64-bit safe
Thread-Topic: [PATCH] elf: _dl_fixup*: make @reloc_arg 64-bit safe
Thread-Index: AQHXfvyj9mzmRTwOvk6RZk7uyYZyy6tPADDWgAAFP4CAEeYKAA==
Date: Mon, 2 Aug 2021 23:18:41 +0000
Message-ID: <4782a11e-fdf6-5b52-f805-06b485fda19e@synopsys.com>
References: <20210722132200.43895-1-isaev@synopsys.com>
 <874kcmzcur.fsf@igel.home>
 <BY5PR12MB4131E40A7C1EB2F154F36A30DFE49@BY5PR12MB4131.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4131E40A7C1EB2F154F36A30DFE49@BY5PR12MB4131.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df5f21b4-848b-4cff-20c3-08d9560bddf8
x-ms-traffictypediagnostic: BY5PR12MB4116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4116DA844C65F64223E74B17B6EF9@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:208;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4PQ9iCxZY94RJTGBauAKOWidYetehOMwr6PO3jKsSCaWiUzMWnzCYtZ/M/YIum7VkPPD9fG4KN5nm1yXErU1QwvygyDrEinoMsTAmHFBqrRSnPdrZr70NrthhXSrMMUOFuzlCLGObxNwYj2AGtRe0k/bCaaXWiv4MSuwKnt265DOQcl5wCba3tPVh/Q0crj8w35Ll/+RuGaTTrPQYn+yPthRVPYTrMlJ/S64s1igmr0lmuLtcwS/LPh3SM+sVnM1ui6TaK4oDrQb7fh+6WM+dhVnCb+4Bi3CiPnwv1uzSt7dd6ROsamK2+bh1HughH17KKbYsBWVZ+cj7kiYCZl0O4Wq9EGz3cQ6n3K9m5zYLdHZ+wGpB+qYb8lewJCFPVBtDQbflr77kIYGiAafWPTyGUbxvP1+UErqxJfIMDVgANterDpK2no6yRSJyBHWzef0dbBpLMhKrikUweCzpDmwHlxrOymnXPLQ20kpI+yaHjcUNIdJISjGTh14EG+ivIR8fAXTMLFPoadzcmxEEjvj45LxIuDwOxlcf4RkWmD421cnDJrfh25Gb2tB3UgeEmwrN54eg4QAbHWO7djAdhpjOInjwlLJt7gti7NFww/reC7Y6sLlTtCvWk3OVa+EHvZ5MDRoK7F5N5CuXLa8nKKLYRCr9BPoyCcswXbpGWwjouCVNYaU64KNm0MMwqIcC/a4nhA9lN27jvYQAxLoGTAOzES1x029uK8LJ3uQivs43mUvxG1uLohGVQSi5d7QZ2zppTP8QW/VljJHNSCICVWGIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(376002)(136003)(6486002)(36756003)(38070700005)(71200400001)(8936002)(66446008)(86362001)(38100700002)(66556008)(66476007)(64756008)(122000001)(8676002)(4326008)(6512007)(110136005)(5660300002)(316002)(2906002)(4744005)(54906003)(26005)(6506007)(31696002)(2616005)(53546011)(66946007)(31686004)(76116006)(478600001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHdsZk9lYTNuRmFNVitKeVJ4NldlRzFUZE5UNWtHUVg1U0pQV2hiVDIycDJH?=
 =?utf-8?B?QVdacE0yVTZZR1Ezc0Z3ZjdVeEpyaDcxdWtGM1NHZjlWazRFc0RPR29RUWN2?=
 =?utf-8?B?UWlnOEZ4bkxvUEtKYmdieXlQcTJUZno0UGYzZE9iZjZoVTRwUU9GZDFhZGMw?=
 =?utf-8?B?VHJSVHNBakxYam55TlN0cW5GWVg3MEtCSm4xUGJ1Vk8vUUt1SE91OFBwVm05?=
 =?utf-8?B?S2VPcXpIVVQrZ0lLUWpjL21idHhaZnB6bnF2dCtzUFJCa2JnNm1TMytVSHB4?=
 =?utf-8?B?STNBemJjV08zc2hyQWdGUGcvaGlvVlhwMWdEWnN4ZlJ6VEZ1UnhiNkExS21B?=
 =?utf-8?B?QWhHM2MxNzhLNG5qVStZSm8reFgxRWNFWURXVjNYZUlWQmVIdEx6bHp1emlq?=
 =?utf-8?B?TWxNRlNjY2tOSW5kUXU5UWhnZGs4eXlMcklFTzhDMlhZbXV5bG1HbzdsK3BL?=
 =?utf-8?B?ZHlsZkt0SE0rMmdQTlAva3FQTWlwblVHQXRxOTAwdTFzVDk0TnJKcUxkaCt0?=
 =?utf-8?B?OUNoNVdraDBxb2NzYkI1SHArMi9QQlFZOC9KdTJrdlNRSUV1MTlybUg2OVhP?=
 =?utf-8?B?czJ6dlNhL2Z6NWt5dkNjald2SUVaUTJkRlp5dVlwbjdWdWlKVlQ5K0FxN3Nz?=
 =?utf-8?B?N3NUR0NVYjBEbVYwME1qNXQ5cFBadXZ2RWdnblJFZ2s4Umc2M2VPZm5XbXhs?=
 =?utf-8?B?emwwS1ZRbVRJM1BJWktGVFVlYk5aN2RHRHF2YncxQy92eFpONmMvaXE5cnZM?=
 =?utf-8?B?aVdITExSaENGeXFhQnNHdnVXVFhnL2dVd1RrQWMwNng4WHVlTUMzZmxhZ0F2?=
 =?utf-8?B?ZjZNeURNdVpaaFpMUG1RNmZJdTJJb1E3VlZEajBjcHNoMVVRK2diTityVmZo?=
 =?utf-8?B?RjZEMWQyMklaV1dwMmhNb2lkUzlaQWVhWElITXJjMHdHRlhzdStTN0IyTGlv?=
 =?utf-8?B?RnUxWFBDQWtPeEJGekpZZEFiN1FZRU96L3JDL1o4cEh3VGJUT2ZKNTd6dGpy?=
 =?utf-8?B?WXZOWlVEY2ZPT1E0YU1lcjA1LzVrUHA5TXRCN3MyclRQL25DV1BBbzFsNlk4?=
 =?utf-8?B?ZE44UUVubHF1NWpreEdoc1BuWWFtQ2prbzNRUXRyODJsWnlaYW1rOEJ6UDg2?=
 =?utf-8?B?QnVvNERCdVV4WDZzOFg2cC9qNjgvSkNvcHRDWGRPbzYxZ3ZmemxYVDdrYktI?=
 =?utf-8?B?RWNiSGczc1BRWjM3RzQ0SHBaMlRHS3R1OWR6d3hBNjFJMkJTa3RjaW42L05o?=
 =?utf-8?B?RnIwOHN4alZYZHNTSXhuR0lCQXo2WkJ1YlFycGJLSFY4U1hmc2I0RndzaGVo?=
 =?utf-8?B?am5PYVRYT1R5Q2M0QVUweUJzVTAvRk5ISElKdkV6STA3M3NSdk4rdkwvcThI?=
 =?utf-8?B?eFR1ZHM3UUZsdWJiTjhPNTl0WGtIbmpXOVhvdnN1WU8zajdDbThQa1p2SkRC?=
 =?utf-8?B?VWZMdGxWa05UcC85R1F4Y3UwSGtML21LZGJiS0JpM2JOa0I4WEVldXNnWk51?=
 =?utf-8?B?cVc5cGtFclhDNk0xNVFZSTY2Q3dRRUt0a1c3cTAzS2hPWEZvOFlyRHAzTy8r?=
 =?utf-8?B?bHA4aXRnbEQwWXBLMGU0MUhqdTliVHl0dGdrcnUvckdJN2J3cHcyTldSSDVw?=
 =?utf-8?B?MUNJQk14SGJOMnp4WENiZ01wVzNCN2E2cThuTjF4cmtIdlg4YUYzd01mZFl6?=
 =?utf-8?B?MnhXOGRkUG42RERGNC9HTVQ3bVNmSVlRNldwTnVNOHEybHFxYkY1dUlrQ25C?=
 =?utf-8?Q?YBiEudt/jLgFWcnCVU=3D?=
Content-ID: <F27947EEC690EE4BBC6F7E1655A22A92@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5f21b4-848b-4cff-20c3-08d9560bddf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 23:18:41.7631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3gC/pK1Ng4SyhszNEjfid1ZIMiSZMg5y60ikkuoYUpUTSAW9fwyUqeZ6F7FNn10sVnbTyFZuLXrsmZ4URXJTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_161854_781379_F007B5CA 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Joseph, Adhemerval, Florian

On 7/22/21 6:58 AM, Vladimir Isaev via Libc-alpha wrote:
> On Jul 22 2021, Andreas Schwab wrote:
>>
>> On Jul 22 2021, Vladimir Isaev via Libc-alpha wrote:
>>
>>> diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
>>> index 9d0d941000..6099a44ffb 100644
>>> --- a/elf/dl-runtime.c
>>> +++ b/elf/dl-runtime.c
>>> @@ -56,7 +56,7 @@ _dl_fixup (
>>>   # ifdef ELF_MACHINE_RUNTIME_FIXUP_ARGS
>>>   	   ELF_MACHINE_RUNTIME_FIXUP_ARGS,
>>>   # endif
>>> -	   struct link_map *l, ElfW(Word) reloc_arg)
>>> +	   struct link_map *l, uintptr_t reloc_arg)
>>
>> ElfW(Addr)?
>>
> 
> We can use it, but I think that uintptr_t is more natural here because it is used
> in reloc_offset and reloc_index.

Any objections to this change - OK to commit ?

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
