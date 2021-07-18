Return-Path: <SRS0=qQBs=MK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F731C636C8
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Jul 2021 23:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4AB60FF1
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Jul 2021 23:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4AB60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=md1D7O+n8Ltc5oOAT11/ZFuOOStAmnn3zD1Q6vvEwc8=; b=PLSW0HG93wZS//
	1luF1GHnTcvOMtPuOad593yUH6CUeEFnt5dx4ucj+q7fvS8qbpO7mdRYJMF0oyHa6ucUh0QnKyBs/
	PFBnl3X1h+IztPSAszWyYRYvwikV13m1byXTzLSSCpNgvxWx6W/qTu92WVDGdDa9KdOYGust8Yxnd
	KdFu7CZ8INUyyRIL9zEWSxB9h3P7WGHbp0uWxjSDsPNUK+3gy6zoay+OSXwTuHCRYY3LK51GiYJS/
	z/JXdBJPv/CTpOGUDM5bdso8q/FvWdvSO52TQ6YzlNDpyHrHiNj6pLvnp3Mglr+gllZAwBC7cB8qO
	Ni8o71TCINiRiGJ2QxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Foo-0086GO-Gw; Sun, 18 Jul 2021 23:03:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Fol-0086Fg-Q1
 for linux-snps-arc@lists.infradead.org; Sun, 18 Jul 2021 23:03:29 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 29927C0B61;
 Sun, 18 Jul 2021 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626649404; bh=afNyAYhIInhT0PrMhmEeoqRky6G2JRjKMp66NgH1/fM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=J492rTBX72ftZuz8xJP2IGM6sotXYGHVz4b5T9ZYoDQyICq/7Ht6Ierc1BcRHrKDe
 LYbZeaGufLTxLmLqT8iI1aOu0g0WEs1+rm36JLxb953cdF9pUppqAR0kH7xbx4SzlH
 yAumy/q8e55RwDzPAN8+M57kvQPfY2FaE17+xHQC467XPQ+0qJWdmUH2XWWjcuLwht
 naB8G7CvxewsfvMIJtU6MpS4dD8SC7KlWe+On9Z/MHxGX+OyoMmev7a70N9aAOeYP2
 8ckMiuFOb85p1o+5bN4+h0omBqN9IeOaa13z/dGKW0YWYnwu7ASuvPDA3lS1N9RyQP
 kQtJIYfNzK5gw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C74B7A0077;
 Sun, 18 Jul 2021 23:03:21 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1569180024;
 Sun, 18 Jul 2021 23:03:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="J3lU+TKL";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRUZBHPN/NgWeJwX53RNFmh7RxjtLtdO2x5C0nr9jSZYQrmILY5BPf+TIu3/atRC9R1uma5YHndOqBqayN9cU694KYhz2ZfHdSWp1iC2+zWP5CX+eexfro2el0jcRvjA5Su3kIyG+PNeUGlGgnz7fU/Wd37iBnY7ynQr3BelUmZ1a7YLJYynxfi9oOxL+YpYNn40oLj5Cbvv2Vm2IkZ4IjzWUWNdWaBKx/T+PYwLb+p99e1VZKMTOVaWePxsGHSenaHA7rM9RPYfbS/+6jWehaa/Pmhzga9KKpFNNoqICCi9WiBCebUQnrNY81T1yLZqjmsKBRenoWFBcH3a1xKBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afNyAYhIInhT0PrMhmEeoqRky6G2JRjKMp66NgH1/fM=;
 b=AlSyywT0N5rSuiKCnj/2gw7YNBe4W4rb0Qvy/tozIQCZdMPt6YoJgx/6QaBO/iCbvy0Elzqa8LqYKtlHjyKepHBJhX98AXlLyHPgzBEPGkSE5OdPQaKM3rQ53KAgyiFNbrDV3mGRF2IRpZO+8LDHeQ9vY5Sv2dg8I1ODQZnxyVMujotP5pJtxo0WFrOs3DejCPywZEj83HkUd885LaX/wDpQpOh41ZYn5Q2efl5edSP2htg+Cjc594LkjXAQBsvLrHvKw5TKJXKAYqgje8vE6RPO6HocmUVik6d69lx7vwNqfO82HyzD0JerMDsbsWla4hJi5kv/1t1gWOnuh9ZMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afNyAYhIInhT0PrMhmEeoqRky6G2JRjKMp66NgH1/fM=;
 b=J3lU+TKL0fkpNYPvpVu0P50+ntD1mBzWtSPZuCEGlpb6Ob0czTQXHDFwfTRAST0YpeDC2NmZSoHHy1hhgqT/YEQocQPRX8QXrsMBvIY6AWSpNGATMT2o/Ra0B1SMNZloEN2c1ayhPboKjaS1+Ni+5/l5qtGT/8ilcSv0auRmddg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2951.namprd12.prod.outlook.com (2603:10b6:a03:138::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Sun, 18 Jul
 2021 23:03:16 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4331.032; Sun, 18 Jul 2021
 23:03:16 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arc: rename arc_timer's TIMER_CTRL_IE to avoid
 redefinition
Thread-Topic: [PATCH] arc: rename arc_timer's TIMER_CTRL_IE to avoid
 redefinition
Thread-Index: AQHXfBSemYvNgsuum0+Xq0qlikoXyKtJWgSA
Date: Sun, 18 Jul 2021 23:03:16 +0000
Message-ID: <e1abf074-5a94-d045-e5d1-ed70a4b28600@synopsys.com>
References: <20210718203632.3982-1-rdunlap@infradead.org>
In-Reply-To: <20210718203632.3982-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67b14305-c0c3-4097-3d39-08d94a403a2b
x-ms-traffictypediagnostic: BYAPR12MB2951:
x-microsoft-antispam-prvs: <BYAPR12MB29510D4BD923D6A5CE628C84B6E09@BYAPR12MB2951.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nh5Q3NIaphtuCAWoZPBVIixbRgAXKV0XZnPoTfXPSEz0/tLfxrWZWAdwbLqxcuBBZtDgB+D5AfgJmVdURXnhJy5YWXQmjvyBJCgEL0GXQrSKT4XH7feYcqZ79gVczmr5ssOV6iG0gKRHnqOTKE2u3CarwRib2f7/4KG7/ZULaP/udAus3cXfD1Xxdqmx7ORrzwyyhIzQy6fygWL+a6xc+TkvMoPJ0TaPgEhfWaw7G2J9l7weBt0ysnass8RpMAdKD6//Zh7sWEW5nvSEYIeigGMRvDUCtAAYpVin2A31KShe5AMGafTA8aWLfcxTnAJ1x7cF/hzi2MlD26vxlHSCmXmJvtVa3Abb7hvFMC1ItEURKoB2HOTCpUJ0Jq4uE3ZJ/XKnaiLlERIUbtHFZdDqnKpXQ0nIjrN4cmO9zlnkdccHkhGkajqI/HNYOE1C516qs57bMq0XDgaShJub0rHqaIIqe3NQ8HpMXT3GsaNjUSOA7ILHG5vox+1R/6twLcoKpyfAuCYIcG++lhdY5zlsdSh9V2rixtIGbw8itAlD1n4dteByyZ0hnxy79MVEMX1co9RwGPOy6oJUUIsBJPpxo9AB8sGLFSNydFvSI9EPb4Uslun5XJPi4/hJKA14bH6jfcO3wFeQ8F9UWNMFn65vF8YUtAd2iC9LO6Og2J5Pv5lfhUpURH6UN6Woc0D9g3IZEp7ZTNlaSLF0nKPDub1/zp9Kw6knDy9m3bHek5fg8NDdKd0LLYljlFVEwikWDafveD7gYPrBlir0wRhE/3VJbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(346002)(366004)(39850400004)(31696002)(2906002)(5660300002)(66446008)(64756008)(83380400001)(186003)(8936002)(66556008)(8676002)(478600001)(86362001)(76116006)(36756003)(6486002)(26005)(71200400001)(2616005)(122000001)(38100700002)(53546011)(6506007)(316002)(110136005)(31686004)(66946007)(66476007)(6512007)(4326008)(45980500001)(43740500002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVpZRENUTXFJcHhsWk1Deis0K1YzUm81ZEJqdkhNUUx5UVA5eXBUYVFkSUx2?=
 =?utf-8?B?UURxRDJKVUh1dU9uL2dnQ2FIazV3ZTJuaEdZNGVCeDZ0M3d2eThkMjZlcitX?=
 =?utf-8?B?TlVhM1dRYTJxd05WZ0d4Sk5Mb3g0N1p4bElwV200YXBLQlh4M1YxZEd6aW5H?=
 =?utf-8?B?cEFVVTZqd3NZc09URS9FakxGc25aK2lRc3d0QzQ3SDlrOGRzaS9xd2x4Zisz?=
 =?utf-8?B?eHFtR3JHNng3YUlaNVdiT0FVQUp0YzBuQUZtc3dzTEcxT1pxNFNjSndudS92?=
 =?utf-8?B?NE5CVDVlcEVzUkhMUUhYei9zR3FJbXl5d0NObW5xZFBZQjhaS2Q5aVpxa3d2?=
 =?utf-8?B?ZFU0M3Z5ZXpqYmU3ZVk3N2lPOU1Wb3pQOG85SnVlZTRhRFY5R2tOWE41a2lQ?=
 =?utf-8?B?elA2UVB0RmZzYWkwRmE4K2ZadjNIemFLQ2lWZU9GS1J6NXA1TlVqczlXeG9x?=
 =?utf-8?B?ZTdhSHdEZVJ2R0pkQ0VpNmg3T3BzTkFZait1ekNoRE1IemVnRHJYWVlrbGh3?=
 =?utf-8?B?MHBNMU53eDB0YnRYTVd3ak56OHR6WWpkZkw2NmY5K3QyYVA0c0pHYjI0Q1NI?=
 =?utf-8?B?NUIrbXAwZ2F1M2ZjMEhRaVVBSnBjQVRnc2ZiS3I1OWY5cVhlQlFvdEovaGxt?=
 =?utf-8?B?dzdobm0yMmx0cEd4enNZdUhnT1liSFgxRUpML1FzWGZWSTBxczVqajFsRzRS?=
 =?utf-8?B?LzkwdDdxeDB1c081eFlxUXpaaGZHb2t1WHNob3ZndEdmeGE2UWlXd2VNclNI?=
 =?utf-8?B?T0M5THV6eHNBNFVrT2pHKzYwTStjUy9yTWQ4RGpxNEo4cWRyOU1WYlQ1WGcz?=
 =?utf-8?B?ZUpoR0gwNzJaZTFBblBldnppOXhqSHE1YTEzajlhMUg4SDArUVluVllRd0V3?=
 =?utf-8?B?TEhmMnhycFVzT2VXK29LMjhQNndaVktvQkh6eU9yYnVEVmtiaTVkai81VThX?=
 =?utf-8?B?NUp0T0lhazIrdjRqK0ZvQ0dydStadGxuV2oxTzdUUEx6VU1YS3N1dDNCUlo3?=
 =?utf-8?B?bEJqQnVBTnhleFBMSzg2dVVjSEptdUFmTkFsRU8zMi9JZHV5TWRjRGZnSDRx?=
 =?utf-8?B?QkxucitNeGFjVVhFaUR1ZER3Y0h3d0tjZ1FWQWpTSnllUnNmSklqU3RhM0ps?=
 =?utf-8?B?REF2UjJwNzBnVVFuNzZLRjkvUnJKZ2VOeGVGcHloNk5iK0cyU3NPMjlMY2tk?=
 =?utf-8?B?WjRidjVQTzRDUkFYU1ZTSWJ3OXQ2ZUs3dHUzS1ovc3ljbUlURkhlcE5ManBJ?=
 =?utf-8?B?MjFDbFpnaW55UW9tazdOeEhPU1hHRWFBM3F2N1J5ZkNuZWoyM3J2NklYWkVE?=
 =?utf-8?B?ZnpKd3RUM2llWEo5MGFkWm50WVpJWVFiL3RsVThLVThqUG5UcGZ6MlNhaWtI?=
 =?utf-8?B?SUtOdzh6dWhIc2VnRCsrQ2Q3YTRwRDBzbGphTEVqWUdab3FobHk5d1ZWck5y?=
 =?utf-8?B?WlJUWHZRVkZjc0xFVFNEbTg5SWQyWE1xUWI4RGdrVUxZR25BU01kVUJZRDBz?=
 =?utf-8?B?MC9UUTE1QTFCVWc0MysveUF6SE9PRkpyZ1hsZ01DME05MG9DWkRrSzkxVEpB?=
 =?utf-8?B?eUtBeFFjTUowUWc4RkFJa21CR3hOcTBCb1M4VWRraVZNUG1hS3haVCtNSGRm?=
 =?utf-8?B?Nll4aVp4cFpMRVIyb0FKNnBLSHo5WXN2V3AvcXNoV3ZNb3g0YjJVek1PSlpv?=
 =?utf-8?B?SEVkb0c3VDM5MWNiVmFBSVZqWEZ5SlhXaHBRRGpKTDJnZkdkcldIcU1EQk02?=
 =?utf-8?Q?0/3ni4I5nRmuUCJHaM=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <9B989E7F1CDCEA4298FE90F7585C69F8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b14305-c0c3-4097-3d39-08d94a403a2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2021 23:03:16.2281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b6nvWEulscyrsf3NDGNYbtMZl5DE2N3vNn8WCfjLwS7IKhWF8zXjZCA4lUd1CzqSUc+T04PyuigLaLZwUaliBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_160327_918360_4ACF4E61 
X-CRM114-Status: GOOD (  13.02  )
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

On 7/18/21 1:36 PM, Randy Dunlap wrote:
> There are 2 other clocksource drivers that use the symbol
> (macro/define) TIMER_CTRL_IE (in 3 files). Change the ARC timer
> symbol "TIMER_CTRL_IE" to "TIMER_CTRL_IEN" to resolve the symbol
> collision (redefinition).
>
> In file included from ../drivers/clocksource/timer-integrator-ap.c:17:
> ../drivers/clocksource/timer-sp.h:25: warning: "TIMER_CTRL_IE" redefined
>     25 | #define TIMER_CTRL_IE  (1 << 5) /*   VR */
> ../include/soc/arc/timers.h:20: note: this is the location of the previous definition
>     20 | #define TIMER_CTRL_IE         (1 << 0) /* Interrupt when Count reaches limit */
>
> ../drivers/clocksource/mps2-timer.c:25: warning: "TIMER_CTRL_IE" redefined
>     25 | #define TIMER_CTRL_IE  BIT(3)
> ../include/soc/arc/timers.h:20: note: this is the location of the previous definition
>     20 | #define TIMER_CTRL_IE         (1 << 0) /* Interrupt when Count reaches limit */
>
> In file included from ../drivers/clocksource/timer-sp804.c:24:
> ../drivers/clocksource/timer-sp.h:25: warning: "TIMER_CTRL_IE" redefined
>     25 | #define TIMER_CTRL_IE  (1 << 5) /*   VR */
> ../include/soc/arc/timers.h:20: note: this is the location of the previous definition
>     20 | #define TIMER_CTRL_IE         (1 << 0) /* Interrupt when Count reaches limit */
>
> Fixes: b26c2e3823ba ("ARC: breakout timer include code into separate header")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
