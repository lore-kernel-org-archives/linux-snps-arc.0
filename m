Return-Path: <SRS0=ODk2=LM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC44CC48BDF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Jun 2021 17:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 782BA611CD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Jun 2021 17:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 782BA611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lqqfICv6v0OwMsKr2NmIIX6LX802RGkP1GHQrunVb0c=; b=RxyKVANBn0nYBd
	EqFsbr6OfsyS6pe808H6ayu85Ryrbw9HeYWrScZt+yeM3iJizS/6uPhMV/F4Z1Nir07g2dJE7QmT5
	C8iDm3IjawhAkfOnDZBqaO7Ln5z6m2NvsezN+qaqd9tCsI44hHO+i6hQM6T/s6llU93Lp14N7GtCY
	YiLWVMYeUjGAqAb7C1fest0I+NMnaOHtG8+2QLGUj1H87qcwyK2j2OfOQQfPQToSb3dVPRMZASvni
	ikNPZAeZv7NnIvWdrZ40sn5owruldBckXhS3j+PpDNGv24sivNk5wobAHr0zsv4BKqDNdEcs6NJgc
	zgp1GYYWEfQxXcusTYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luI8h-00F3K2-Tz; Fri, 18 Jun 2021 17:18:43 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luI8f-00F3IS-1U
 for linux-snps-arc@lists.infradead.org; Fri, 18 Jun 2021 17:18:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B8DC40F2C;
 Fri, 18 Jun 2021 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1624036718; bh=xMN8wK9yLGPUXdsOVnJLlefzdFZaX66tAMGh34bn3+I=;
 h=From:To:CC:Subject:Date:From;
 b=O26KBoTKLi/qzv2kG+IuX+j4sx1QtHd+h0KZMRrSnXuKitjQmODqjQ13LmARXp0Ed
 yIF8d9s/mu8uJmMrw7gFS0ou4myWntiZRoxGIXBoHHg6ske6RKuq9sibAu1yoOCbOv
 MVCDlhJvFqWpCDraKFGeG18lw96gCvhshIlk9sgbyn8h1pdIIActY9u2oOIiXj8Fr7
 F3c0k/QQ07RxL6aVfAALUb0SCWyw+tmVW1VgOSInAn5QIBsjDOx3oC8jyamVE78o8o
 s329lUm/zSf2D7eSjdk5o/cLXLaH4EmJjkx87eCD2CmN1IKX0Jn+ounstf/xH/0Knx
 ZgJr/XL+K5FPw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id CA4FCA0079;
 Fri, 18 Jun 2021 17:18:34 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id DB9AD801B3;
 Fri, 18 Jun 2021 17:18:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="U+s6Fo0E";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9sxLhQVrPinCggtwfWI1H/8h/LTPK497CpSeR+t+oPDhGf8kVnP7AeosvoMHaPf1JiP5iGtB67CzS7Pa54Xk6QEKcfMNW2NfQLFdFgMK9/PHTC6B51wKcOlELtjfUyRJV0XZu6nOD6SxLw1Fx2R18v5fztIlC3kHwYw8iY46q/swFmRFjQc4PShznuy7dVyif03vkV4kCc+8/3bh+586dk60+1zPcjD3YSpBybt088C6gyZwKtLQ/oRWwT4iRIFwyW9+wBlJO8+iiqCWqMpTgsphIjzEZDJRwenrgACCXpxul1OzFXhZOh6goMdli1dHy3EymC3vVV7QE5OqEDHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMN8wK9yLGPUXdsOVnJLlefzdFZaX66tAMGh34bn3+I=;
 b=OtqsliYvKAVTzsmYTFSMAHAyiaUclURzmsgDJ1Rm5zSkTjApvWoARUh68exyRIxQGGFEhsWPbl1m8GdD9ClBGKwVitTRai1Kr7iyv/xTy7g68cfwBZSVscV9AEzX+qR0AJWSarMXycfQQOoK8ZSQ753kGIhqDnhOX7iSJG+ayLoS0ODVh4msEE7z3Kogq5BDhBAOYMvbVTfSn2O0v6/jbzssHEHMC4MNp/VbuwYpJy7He8l113n33lx0KKqZsLrR/MLgGrCUGhF00fKWjtukoQ9AOr2BqOp3f6mqhScqaXzQ0IkRhaO1GQzTTDwzBVSLzypSEMXwWxlRyiZETecGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMN8wK9yLGPUXdsOVnJLlefzdFZaX66tAMGh34bn3+I=;
 b=U+s6Fo0Ew6uxzQRjOL4VmXs4ilZ45IAyeSZkcS0s2nV+JmhnV6N1q3C3Pi9+21M9cUlnpQb9J1lOEYEg8kCGwnjI6mQrSuaWJtL5qmrUyN19By6Fzp/+MotVVfD3EzbRvD4ExNYGVCbsX9aezD76CV955fOstJZuY9gaXWTphic=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 17:18:30 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 17:18:30 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, lkml
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] ARC fixes for 5.13-rc7
Thread-Topic: [GIT PULL] ARC fixes for 5.13-rc7
Thread-Index: AQHXZGX1UHtGTBqmUk2TiS+yTS/Z+g==
Date: Fri, 18 Jun 2021 17:18:30 +0000
Message-ID: <f29fc4e4-77ca-f026-eb1b-c82fab8bb30b@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 704c08b5-17bf-47e2-68fd-08d9327d17d1
x-ms-traffictypediagnostic: BY5PR12MB4116:
x-microsoft-antispam-prvs: <BY5PR12MB411669FFB88D95B73FD14F91B60D9@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dkOW5AjvoJKdXST3MWodIfTxn4MZUzG6AJ2ROKuXiNo9invaVcFyC8+3RT3/kTKsKayHG/dhnrs6jKxd91k/WbtaUb4w3oI5YPmfygc5Ps0lvuVdVoUctrbP4YHCXepqo1rTgo+ZnFnaj2GRXbpjvEDi2KAZp/NbbrIuGHoxodQQFrGmykaEni5CUzGoQxB1Y/og+QHS3uAzUkLo+uMZocC+iyQjX1NIiu1vQ/+tIgJX3i8J4FrApBg50k/NNYZxhVlUMDs5bG+SHNv+lpZQJfOArWKuTXNQwlvEjlpPruIQxIfylQyCObgzxiZ7MaD9psRW+z0Gp8LUlrZdQFZ2zajOlC8A3b/1dhVbFPcpMP5Ct3fQade7LtRxyHfkiaWLB6FAa1tIOjLSgcSkvKpa4AAog9nwJnuRhPZihls7JtXJiUS/UZg5r3idh7XLmyimK3VxgSvWTMvQQVZ6avGNQpdKNcDILuHT4076yifwyhVgPEAXaMnovPXCYuOkM+t+M4rIkXdyzCwroeYozcWwAGmlMj/gQ4/fb803DvkNvEBr98C9Fau7M1jfouvxdDqUyOHPMhzaXj96yfBvUR9wV0hEsSZHDDbnCBAidw7IDr113WW3R8CEbdWLeHg+xEb3dDsB7G1qrxA4m2xEtJkBIA+6I4OjyMsT/3tF24DxruklsyGrEXUkyN3LdHBxxG0V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(136003)(376002)(366004)(396003)(86362001)(38100700002)(31696002)(66476007)(2616005)(122000001)(4326008)(36756003)(66946007)(64756008)(66446008)(66556008)(6512007)(6916009)(83380400001)(186003)(26005)(2906002)(5660300002)(6506007)(31686004)(316002)(478600001)(8676002)(54906003)(6486002)(8936002)(71200400001)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M241a1J0VEpPMUxJZUErdjZ0RWtqejV3c0lqbUV3T3NBcnowdnVTKzBHak8x?=
 =?utf-8?B?cEd4VjMxQlJaTnhKSm8rdkJZeVJIWkh2YlZ0VzNuNkpva1BKRlVZa2xmaG5H?=
 =?utf-8?B?dXYvVnV6VC9SYmUwNlc1c3Ywc3RpSkNmSEh0TjVFekxnWUJQbTdPTGp3dGJT?=
 =?utf-8?B?aHUyRHpBaklwbW1JRXRCNEJyUmFGUFBPZWVqUm5mYWxzT2lpbFN6Lzk0cFMx?=
 =?utf-8?B?MTBUYXFhNlowbEIzRy91YzcvbmFjRGxuZlhvV0hYQXBhd1NMbE82SFArOTRI?=
 =?utf-8?B?SzlsTnlTVFUwYk1FU1BsaUJSVm4wYW91NEhZRE9nRlErM093eXFSc2VqNVhV?=
 =?utf-8?B?RzNEbG5hODM1WUdvV2YzQnlXM29GbXZYbld6YldSU1NZQ2dpVEZicm5qeXJV?=
 =?utf-8?B?V0FoQkhjMVhsUjB2c1lRZ05LV1BWSGgyZWVJS3c1K0g2VHFETVE2T28zVTNu?=
 =?utf-8?B?Sm5hZjZGdURUWjJUWjl5WEt6dFlCR2YxRE5KRHN0aDJGMEJYSzRVVDYzWWI0?=
 =?utf-8?B?WkFmanVSQkZhaExBa3M5NVMvaENjd2FUU1BzZkZqOHRqOER5d2FkUFNKem5u?=
 =?utf-8?B?TGszODhnNWc3QjBzZGFUdm9zR1EvTnozc2xjNkJhWFFJRndMTTRMTzl6eWFU?=
 =?utf-8?B?U2JiMVhBN3FHdy9vYmp0UE1Kc1FLVnVWcE8wQkxHSHpWWXBlRjZvWldESytQ?=
 =?utf-8?B?dThuVURKVGRNYmE2djk4ZnNxUHdnOG5oUHRubzdyUjk2MFE0WHlQVUJ2NGJ0?=
 =?utf-8?B?UFZ5c0h6UzgwUk5MQVVhUlBtMDdnWHdqTXVMU05nbVlyazUxY3VNbUxUSGVO?=
 =?utf-8?B?MEhTQzNiOGlmakR0RW1kd012eDBzb29LMitNUXkrT1JGY1huL1FZMUJLakJ3?=
 =?utf-8?B?R2gyMXlwRXFMT2JEVjdCUzQvTklObVhrYXRTbG54b0FjZXZGendmaDZnbHR6?=
 =?utf-8?B?L21idVRUTEtzbmhkcWVTdC91WTJQc3Yzem1FUXNPWUxsd0RqOTl0Q09pbWxK?=
 =?utf-8?B?Q1c3NEtDc0UySngvUGN6RUxlUjZ6K1IvR2lpMmJrU1RpSm5EaEhMdGl1V2lX?=
 =?utf-8?B?QVpMU1pCc3h2amdkMXlVSEdiMFQ0MVhTZVFGajBLVkxMVkl6cUR1a2V4QnYz?=
 =?utf-8?B?ZlE2N2Y1Zm9obll5SnNrV3JoSWpnbVJuZ04yZjBmdzBuNmRwa09jQy8vWkpC?=
 =?utf-8?B?WnBBOXl2c0JVbjE5Wjd3QTdzRVAyZWovaEZibGJIdDhiOVB1ODd6bEhPd2s2?=
 =?utf-8?B?NVBQZlNTVjkyeTRncFVDZzdYNWduTHNyOFpNbmJ4aXMvdGJocFpwSjB5ZkRl?=
 =?utf-8?B?MFFPdmpuWXpHRmlmUW5yejRZdk82U0J1SUcyZkt3YnZqRWJOZXhMQng1cCtG?=
 =?utf-8?B?Wm83eGlvdTJBMXlvWVdxbndKZDVzUFFUSUw4ZVFIalMxZmREdmtublM4eUdH?=
 =?utf-8?B?QU5jVHZkNXg0cDVXQm1FbWhDVGNhQyswczhLbDl6Q0poR2x6VkJxaHA3VDRr?=
 =?utf-8?B?a1ovVTJ3NWpMS2t1M0ZNU25velZBWm4vZmVvbXFyVHZUbGRNVExiWlg0ZWZx?=
 =?utf-8?B?UE93UWpsUGNVb1lTZk91WTV5by8zSitjN3JjRGt1UG9pY3h6SjB6M2N2Qmsx?=
 =?utf-8?B?anNHNng5R3c4ZHI4bDBKTGh0b2VZYUF1L21Fc1VuRzBxSlByQTBaRU5FSFQ0?=
 =?utf-8?B?WU9ocmJQV3U1eThCRm1Qby83ZzljMHBNMUtGcCtXRWIxbVZIWjBLQzBnVE95?=
 =?utf-8?Q?ICAPFi4N7qkCQKDKsI=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <EA595BAAEFDF3844854A726068CBA107@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704c08b5-17bf-47e2-68fd-08d9327d17d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 17:18:30.0537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dv9XnIBBRxv29+jQ0wWwzfnqx5yXbdyQlztbVRBncQVbseFnCalVx3oJc4D5Inz/OduiRola/am5wev2Z4e7DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_101841_229634_7C2B2E03 
X-CRM114-Status: GOOD (  11.09  )
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

Hi Linus,

Couple of fixes for ARC which can go in now.

Thx,
-Vineet
--------------->
The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

   Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-5.13-rc7-fixes

for you to fetch changes up to 110febc0148f8ab867344061d5cf95ee1e1ebb3e:

   ARC: fix CONFIG_HARDENED_USERCOPY (2021-06-10 17:37:00 -0700)

----------------------------------------------------------------
ARC fixes for 5.13-rc7

  - ARCv2 userspace ABI not populating a few registers

  - Unbork CONFIG_HARDENED_USERCOPY for ARC

----------------------------------------------------------------
Vineet Gupta (2):
       ARCv2: save ABI registers across signal handling
       ARC: fix CONFIG_HARDENED_USERCOPY

  arch/arc/include/uapi/asm/sigcontext.h |  1 +
  arch/arc/kernel/signal.c               | 43 
++++++++++++++++++++++++++++++++++
  arch/arc/kernel/vmlinux.lds.S          |  2 +-
  3 files changed, 45 insertions(+), 1 deletion(-)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
