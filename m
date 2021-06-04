Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C429DC07E94
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 14:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761D26140C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 14:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761D26140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elZJSBMdfwOW71zJw6wTfdui7ZdhZg1PkEYPYnMNjCQ=; b=QnQeXcweAVb1g/tK0/vNLIBEfI
	Cs4XSPqc6vIhdl3lO5BzHnNF0rLtQd5GJK7SHFg/66R01+JV9pGLm8LGAWIpUjdlRTVXzbPnrqzAb
	R9hRR9XcsjxKWhwax7VXO+7jqcjxnGnIY4sQ/WaokqqDiWFsbacaz3Dm6BIBmxTTYU4x1dSPE5hsW
	68yrjDW/dsV1eveFdKhp2lctXBFPordaqRL9GJbKc9OycDpaH5FaJ4LBwCnJ/rscuirmnRLGzHztY
	fRrU7Vlti4hODYdyPg+tFhz9JbX49KZ+tfKEBtlkha+P6mxE0cY9Ca8/RCDLbgbGpAkC8A2kRm2iA
	8kfFspBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBG5-00E1uT-1T; Fri, 04 Jun 2021 14:57:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBFz-00E1s8-Hs
 for linux-snps-arc@lists.infradead.org; Fri, 04 Jun 2021 14:57:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E0FB40826;
 Fri,  4 Jun 2021 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622818627; bh=w6rQOdhJfrtxzQpyL+Oog+lyorRWISt2TTiuFmNiOXA=;
 h=From:To:CC:Subject:Date:From;
 b=I/bU5HyubOCrFrSXydDgoOGG0nV4IS6MRMA0Hdt9HtR2FGSry4NA/ilIeWEabcCB5
 vAqEkvj3Lekl2LT1YMAPmUX4yjmwEn7DmYfyh3dUWh3imkroT2nG3G3Cd43HfYN6Ea
 5kujVAxAs3BTgV5fApsFM/HdVxS0pUeEbHxsI7ZmhMSXIIo5tgw7dCbnuJz9P5p/Wj
 FXLkWUTIV7eUWlKWb++TJmWC95esxe4ubH7eRzzm3va0L9l6T9ma45d5Hkb8gaRyxn
 UInqgmPW41x3knev9Q5eZFRCjH1GDcylZokp+PRHsFJXRZDJdMBrAVtI111AYS6DPn
 sI3HQZYKc5vIQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E0DCBA005C;
 Fri,  4 Jun 2021 14:57:05 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C32B7400E9;
 Fri,  4 Jun 2021 14:57:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="W8ZUuTXc";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGFlKbKF6x4xw/jmCBC8uxokoT8wLmFyi4InGpe0v9Q1S4DtvF1RmbU4HnkkPlfWQV/rc1TPrs2FsLvwksDN95+iF014jaD7Cm97wwJTKNMQeAN3HPbYj+NSLhm51vE9waCnKrpKzx/KJKwmq+oOfWIEH9v17y3AlOUHOP13MaHHzt3eCDd0v1DnkriVuT8lkPuIZg7e4RGsHEQvzIPkP0GcirHBs3v3bHdBjZFqTBT97b2tVwX0MB7LMNyqTZxQisrbtuoa10WuuYO4Mn5WjPf8kCaCUieJcWht2yxJgEdK9iWYynWpW6J+HgOarPdlREBW3mU9opLKl4LwTa7OEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55631efk6lZvuDEUUUK/ACbfN7oJak33eODgEhlNYiU=;
 b=ZU8MLETphJw3KB0U+5wQIqhuEcELb1E0H9pm+LodVPeBBsgkmMecVT08K8PC0VkeNGmNUICFwH3qGy07BDjoKrA6T1om5Hk2bDk3AEB+6MuCYWUZoiFbXzS6LcyzqypPKbi5H420jgawLYKx07O/83hmq+aDHxe63cgqYNo2cp8XJpmNOMpKV2+aVciWOyBuMU4AhvLZ6NXLXSWSmuoFpNQFdjHH89J3cQQqd9HmJE1yt9nQp2gFZPaE05Z+2tHpCn/1V+V31E4wrPCkkEt/hv4nAudMdIhS2mycMmR7Xmt1rm67HKyxy8d/7DYFJlwTKJZL0dFT6FdTL45Jre/uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55631efk6lZvuDEUUUK/ACbfN7oJak33eODgEhlNYiU=;
 b=W8ZUuTXcorW/4jwfUen87fwn0qqJ5hOjUYOYGJwrSSraQbHTKV2YuLJJpFwwtv9ZSDTxIVMJSw1hZTjjc3H1cMt/8/lLpKsegQ3LwzausA3ISsDhtTcE5Q11tp1jeh2SYPlsLBHqbYpy2vAAfILMDSG3lGDhSDQGeNw/AWTupZM=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB4727.namprd12.prod.outlook.com (2603:10b6:a03:99::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 14:57:03 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Fri, 4 Jun 2021
 14:57:03 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "989453@bugs.debian.org" <989453@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
Subject: Debian: gcc: add support for ARC
Thread-Topic: Debian: gcc: add support for ARC
Thread-Index: AQHXWVHgvHpPDIxu0kaoL2pB5vPEFA==
Date: Fri, 4 Jun 2021 14:57:02 +0000
Message-ID: <efef130b-ba69-fac0-3d34-9d9852ab6804@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a8233fc-5ef2-47ce-2208-08d92769034c
x-ms-traffictypediagnostic: BYAPR12MB4727:
x-microsoft-antispam-prvs: <BYAPR12MB4727F720874612F0550D005DB63B9@BYAPR12MB4727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kdzgkv2u88/RLvd0wAJjaHLCwb56yI/jCnO1sDqUOo2XJrr6YpQqooIfGTucTLZK6hpKYVk0ZGKWgGSDk7/XU7WssLzYCVRhGNc/b79nUyPhLq3cRo3pvAEdrdyKAd76dCTwi4WXYBcnv6GcG9QZHgHU6HGHhXXKBwfJ98mCREj9fDnnp7ur9bZwfFxJGuq/h2ZmVUFZfCbqv0Ebfpdl+TmcO8piFs/0J6ZA7vvWaV3nUSHbs7txGJSOb0EWqqVPWK8OzgZB9uwaUMlfxAvqcrVHaqdss4lMrWKYVWlNIK9Fxv37CvDL/AqLRofzlle1jg5NbnIsVZYRG2qhUljIkgzpvg1KrB6oj6cBSSof8d1VqZqpnaH3QQRj7k1Karh+YgPes1w4ymnc/3HqylhZk8Y3m7m+JoHKTV0nk50tbW/byiOuAroIaX1rXnG60o/7D8GNAczcJu6mlDr/KWOzdNvvb9MN45XPcd39xwUKEBgtv3n/IiHxh+xza75AaNZyQEl5Zgcxww9MEDGUzAwNVDA6xYzMT5+sY3teGdbxheq7z9dyMBo3BxgdNi0duQnzaigccM+ZkGBlXha6KdbIXRXxDP1qKC9FKprfsn6aHDUhlOQa1bjkvB+/PkZOzxfrvgOFT/kdMTPFJ3gOV6TIjRVtWY0Ak5qRiTxvatbXLiOxxZ4eAQZ45APbLI/rUtdB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(376002)(136003)(396003)(66446008)(66946007)(76116006)(5660300002)(4326008)(6916009)(26005)(19618925003)(99936003)(64756008)(66556008)(66476007)(66576008)(31686004)(6506007)(186003)(2616005)(36756003)(6512007)(38100700002)(54906003)(8676002)(316002)(8936002)(478600001)(558084003)(4270600006)(86362001)(6486002)(2906002)(122000001)(71200400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RVYwcnYrRGkweGhKdExKUGlnWVh5RGdhdlI3TXVyNFRpcXlidmJWUWdhLzlB?=
 =?utf-8?B?Tk9Mb1ErcHI2bk5EVWhoWWFzem1pdVdHZmh2a28yODRlbnc3RklqWGhHWGww?=
 =?utf-8?B?ZGRqdDEzRTFuQkFiWTV6amovUGNIOUIwcDdxVGcxbkExTlFuWEk2YklkN3Mx?=
 =?utf-8?B?ek9pUUlqTWxMKzlFRmNoTStxUC9yN0F4QjgrMG5lb0xhTHh0RXZCYVkxU1dk?=
 =?utf-8?B?b3V1c2RvYnpJZGUwcHgrRGNDaisxVHdoMDlNcHo3cWEyY2NTM2VDM2ZVa0dK?=
 =?utf-8?B?NjlLZHlEMnl1ekRSNnY5WjRuYWlnaTFqSVVBZVFvQ2xBc0d1K1FJMFNwY2JZ?=
 =?utf-8?B?bU5ydFYrbVB4N1kvWWhlRjNmRVhRUlNSN0ZnN0xzV1F4NWRmVmt0bkI2azdL?=
 =?utf-8?B?QlhWWEZHdmNhNXBMSzdUUlVZV3lZb1JUZlgzU3BacGNWUFplS2xETEZxc004?=
 =?utf-8?B?cGZ3UGcweWZ1dWcwWnV0bVZhTHZZM0VVdTFWblRsYTVCMTB1c0FYUEV6TTBQ?=
 =?utf-8?B?dGkwd1F3SjJqK1ljbHNDN2VyYm9ZbUdQU0gwTFdTL254NDYrL0FKVmZTci9y?=
 =?utf-8?B?VnhKeEpEVUoxeUFMMFJvSm42aHNJNUVTdXE3MW1TNEtiRmNqdEtOWkVpWG9h?=
 =?utf-8?B?M2d4M3BZZ29ic1pLY3EzaGNKL0ZXbWNWNlIzcUVIWHplOFJwY3Noenpad1Uv?=
 =?utf-8?B?NHdSVkFuYkpBN3hlMHVXMlp5L1llOXhtOUdLNVpHUU1Ld3BESGpSbitpeVhP?=
 =?utf-8?B?eEVnekwvV3dpS08wQXBVRzkzTHRkc1cyWGdmMXR6YTBjczgzOHVuVTA5L2My?=
 =?utf-8?B?U3JwYUVJNnNBRHZTa2MyR052VFZtUkNlb1BZNTlCSEk4WU5jeTZYZWRub3M0?=
 =?utf-8?B?QkRkL21uK0lLZTltYStEZDV3dHlVN2hsRkE4eFJWTUg1Z1Y1Y2huN0EvZEFY?=
 =?utf-8?B?d0FpdmhKNW04cllCMXZJTlUxZmxyeTNJZDhPeUpxdlhrRTkrSnFOOUVhVEV3?=
 =?utf-8?B?S2ZTaEJPMm5meGIxQWRWSXV3UEhYOWttellmYnQ0dXcvNVFodldFWlkyb1c0?=
 =?utf-8?B?VzB2QmdobGExWDk3VUFLc3BVWlQ4bVhiTDBtd1BNWXBKSlN3M0lWeHBGS3ly?=
 =?utf-8?B?dG4yci9vTFM1TFNBTXIzdU8wNmtiMnU0YVlISjhGYlM2RTlWTHk5eDJOSk1w?=
 =?utf-8?B?azlOcGtOeUhqb3FDNU5nbXpjbDlnV0c2Q0JtYmJnNEZoaUdQNmRKMTZaUng5?=
 =?utf-8?B?MVBVV21aV0JrQjk4cHU1Ukt5OCtLWVRBaXo0TXp4UEdaQTZaK0FUbmRvWjNO?=
 =?utf-8?B?TTBUUkJJZXBZbTdaQWtGSnI0VUkyTGlpbXBiMzZkOTljK3lDa3JWTUNtbjNo?=
 =?utf-8?B?cnhlbmdYOGZiYm03Q0dJMlJSY1E1UHlBQ0lpNkpxNnp4RCtyK041VkxTMVNQ?=
 =?utf-8?B?Y3crbnR3NWMraElWZVdkL1lxQkJTWVhHazR2eEM0enkyTjBTSXdsZ1hoQnRJ?=
 =?utf-8?B?UlAraU1SbTJBKzFhWEZKNDl0MW1JTW9HTWVSS09NNEMzRDZPbS9VOFZDaDJL?=
 =?utf-8?B?Wm5iRkNsQ3U0S1JRUEx0Sk0vOG9qWHBXcCt2dklqbkRlVkRGOWZSZlJrbHI3?=
 =?utf-8?B?a3RiZjhFTENzdk1vU1Nnbnp1SEVmS3RWR1VrNDZ6OVhPYkRoU1NQbTVDZ2Qv?=
 =?utf-8?B?bnl1SlBCK2VEZWpoOEs3MDNzSFozdDl5ZE53bmlvQUl4T2E1WFhHSW1EaHlY?=
 =?utf-8?Q?ddfs7yZG/sr47XRmbc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_005_efef130bba69fac03d349d9852ab6804synopsyscom_"
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8233fc-5ef2-47ce-2208-08d92769034c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 14:57:02.9096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxzCEmmekqwSZ4ZPZJq45AN8CoI7LaCfHVT6v4ZTBkZtzB1i/oE+5a4Qyfg4/04g/nIObPvZdjQh//5q3ahi+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_075707_701537_3F48AB6F 
X-CRM114-Status: GOOD (  22.32  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4818FF98185CC4F89254FC0A5A32D9D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

TWlzc2VkIGF0dGFjaGluZyBwYXRjaGVzIGluIG9yaWdpbmFsIHJlcG9ydC4NCg==

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_
Content-Type: text/x-patch;
	name="0001-ARC-upstream-gcc-driver-default-to-hard-float.patch"
Content-Description: 0001-ARC-upstream-gcc-driver-default-to-hard-float.patch
Content-Disposition: attachment;
	filename="0001-ARC-upstream-gcc-driver-default-to-hard-float.patch";
	size=1814; creation-date="Fri, 04 Jun 2021 14:57:02 GMT";
	modification-date="Fri, 04 Jun 2021 14:57:02 GMT"
Content-ID: <669B617F6B5B0D4D8FDCCF41F003ECD7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBiMmJiM2ZmMzQxYTQzYTFhYmUwMzNkYWE5ZDZmYmY4YmI2Zjg2ZmFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogV2VkLCAzIE1hciAyMDIxIDE2OjM2OjQ0IC0wNTAwDQpTdWJqZWN0OiBbUEFUQ0ggMS80
XSBBUkMvdXBzdHJlYW06IGdjYyBkcml2ZXIgZGVmYXVsdCB0byBoYXJkLWZsb2F0DQoNClRoaXMg
Y2hhbmdlIGlzIGFscmVhZHkgbWVyZ2VkIGluIG1haW5saW5lIGdjYyBhcyBvZiAyMDIxLTA2LTAy
DQpjb21taXQgNDZkMDQyNzFhNDk4ICJBUkM6IGdjYyBkcml2ZXIgZGVmYXVsdCB0byBoczM4X2xp
bnV4Ig0KDQpTaWduZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5cy5jb20+
DQotLS0NCiBkZWJpYW4vcGF0Y2hlcy9hcmMtaGYtZGVmYXVsdC5kaWZmIHwgMTggKysrKysrKysr
KysrKysrKysrDQogZGViaWFuL3J1bGVzLnBhdGNoICAgICAgICAgICAgICAgICB8ICAxICsNCiAy
IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA3NTUgZGVi
aWFuL3BhdGNoZXMvYXJjLWhmLWRlZmF1bHQuZGlmZg0KDQpkaWZmIC0tZ2l0IGEvZGViaWFuL3Bh
dGNoZXMvYXJjLWhmLWRlZmF1bHQuZGlmZiBiL2RlYmlhbi9wYXRjaGVzL2FyYy1oZi1kZWZhdWx0
LmRpZmYNCm5ldyBmaWxlIG1vZGUgMTAwNzU1DQppbmRleCAwMDAwMDAwMDAwMDAuLmQxNjJkMjBk
OWVjMw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZGViaWFuL3BhdGNoZXMvYXJjLWhmLWRlZmF1bHQu
ZGlmZg0KQEAgLTAsMCArMSwxOCBAQA0KKyNEUDogYnVpbGQgZm9yIGhmIGFzIGRlZmF1bHQgKGlt
cGxpZWQgYnkgLW1jcHU9aHMzOF9saW51eCkNCisNCistLS0NCisgZ2NjL2NvbmZpZy9hcmMvYXJj
LmggfCAyICstDQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KKw0KKy0tLSBhL3NyYy9nY2MvY29uZmlnL2FyYy9hcmMuaA0KKysrKyBiL3NyYy9nY2MvY29u
ZmlnL2FyYy9hcmMuaA0KK0BAIC0zNCw3ICszNCw3IEBAIGFsb25nIHdpdGggR0NDOyBzZWUgdGhl
IGZpbGUgQ09QWUlORzMuICBJZiBub3Qgc2VlDQorICNkZWZpbmUgU1lNQk9MX0ZMQUdfQ01FTQko
U1lNQk9MX0ZMQUdfTUFDSF9ERVAgPDwgMykNCisgDQorICNpZm5kZWYgVEFSR0VUX0NQVV9ERUZB
VUxUDQorLSNkZWZpbmUgVEFSR0VUX0NQVV9ERUZBVUxUCVBST0NFU1NPUl9hcmM3MDANCisrI2Rl
ZmluZSBUQVJHRVRfQ1BVX0RFRkFVTFQJUFJPQ0VTU09SX2hzMzhfbGludXgNCisgI2VuZGlmDQor
IA0KKyAvKiBDaGVjayBpZiB0aGlzIHN5bWJvbCBoYXMgYSBsb25nX2NhbGwgYXR0cmlidXRlIGlu
IGl0cyBkZWNsYXJhdGlvbiAqLw0KKw0KZGlmZiAtLWdpdCBhL2RlYmlhbi9ydWxlcy5wYXRjaCBi
L2RlYmlhbi9ydWxlcy5wYXRjaA0KaW5kZXggYzRhZTdhMDRjMWEyLi42NWZjYmY4ZTQwODcgMTAw
NjQ0DQotLS0gYS9kZWJpYW4vcnVsZXMucGF0Y2gNCisrKyBiL2RlYmlhbi9ydWxlcy5wYXRjaA0K
QEAgLTgzLDYgKzgzLDcgQEAgZGViaWFuX3BhdGNoZXMgKz0gXA0KIAlwcjk3MjUwLTMgXA0KIAlw
cjk3MjUwLTQgXA0KIAlwcjk3NzE0IFwNCisJYXJjLWhmLWRlZmF1bHQgXA0KIA0KIGlmbmVxICgs
JChmaWx0ZXIgJChkaXN0cmVsZWFzZSksd2hlZXp5IGplc3NpZSBzdHJldGNoIGJ1c3RlciBsdWNp
ZCBwcmVjaXNlIHRydXN0eSB4ZW5pYWwgYmlvbmljIGNvc21pYyBkaXNjbyBlb2FuKSkNCiAgIGRl
Ymlhbl9wYXRjaGVzICs9IHByODU2NzgtcmV2ZXJ0DQotLSANCjIuMjUuMQ0KDQo=

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_
Content-Type: text/x-patch;
	name="0002-ARC-debian-rules2-gcc-disable-multilib.patch"
Content-Description: 0002-ARC-debian-rules2-gcc-disable-multilib.patch
Content-Disposition: attachment;
	filename="0002-ARC-debian-rules2-gcc-disable-multilib.patch"; size=892;
	creation-date="Fri, 04 Jun 2021 14:57:02 GMT";
	modification-date="Fri, 04 Jun 2021 14:57:02 GMT"
Content-ID: <B03ABC0E7F349B41ABC609B47717A1D0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBjNDJhYmExNjgzMDg3YzIyODdmNGYyODkyNzAyMDdlYmUyNGU0YTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogV2VkLCAyNCBNYXIgMjAyMSAxNjozNzowMSAtMDcwMA0KU3ViamVjdDogW1BBVENIIDIv
NF0gQVJDL2RlYmlhbi9ydWxlczI6IGdjYyBkaXNhYmxlIG11bHRpbGliDQoNClNpZ25lZC1vZmYt
Ynk6IFZpbmVldCBHdXB0YSA8dmd1cHRhQHN5bm9wc3lzLmNvbT4NCi0tLQ0KIGRlYmlhbi9ydWxl
czIgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9kZWJpYW4vcnVsZXMyIGIvZGViaWFuL3J1bGVzMg0KaW5kZXggNmE0MDJmMDg2NTkyLi5j
YjA3Yjg2MWEzNWYgMTAwNjQ0DQotLS0gYS9kZWJpYW4vcnVsZXMyDQorKysgYi9kZWJpYW4vcnVs
ZXMyDQpAQCAtNTMzLDYgKzUzMywxMCBAQCBpZm5lcSAoLCQoZmluZHN0cmluZyByaXNjdjY0LWxp
bnV4LCQoREVCX1RBUkdFVF9HTlVfVFlQRSkpKQ0KICAgQ09ORkFSR1MgKz0gLS13aXRoLWFyY2g9
cnY2NGltYWZkYyAtLXdpdGgtYWJpPWxwNjRkDQogZW5kaWYNCiANCitpZm5lcSAoLCQoZmluZHN0
cmluZyBhcmMtbGludXgsJChERUJfVEFSR0VUX0dOVV9UWVBFKSkpDQorICBDT05GQVJHUyArPSAt
LWRpc2FibGUtbXVsdGlsaWINCitlbmRpZg0KKw0KIGlmbmVxICgsJChmaW5kc3RyaW5nIHMzOTB4
LWxpbnV4LCQoREVCX1RBUkdFVF9HTlVfVFlQRSkpKQ0KICAgaWZlcSAoJChkZXJpdmF0aXZlKSxV
YnVudHUpDQogICAgIGlmbmVxICgsJChmaWx0ZXIgJChkaXN0cmVsZWFzZSkseGVuaWFsIGJpb25p
YyBkaXNjbyBlb2FuIGZvY2FsKSkNCi0tIA0KMi4yNS4xDQoNCg==

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_
Content-Type: text/x-patch;
	name="0003-ARC-debian-gcc-defines-for-multilib-multiarch-enabli.patch"
Content-Description:  0003-ARC-debian-gcc-defines-for-multilib-multiarch-enabli.patch
Content-Disposition: attachment;
	filename="0003-ARC-debian-gcc-defines-for-multilib-multiarch-enabli.patch";
	size=1794; creation-date="Fri, 04 Jun 2021 14:57:02 GMT";
	modification-date="Fri, 04 Jun 2021 14:57:02 GMT"
Content-ID: <B7039CAE60DF4B4C902C0F79A9D52851@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBmZDk2OWZkMmFmOWE3ZDk3ZjhhYzY3NjJjY2I2MjEzODBlYTE1OTQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogRnJpLCAyNiBNYXIgMjAyMSAxNDo0Njo1NCAtMDcwMA0KU3ViamVjdDogW1BBVENIIDMv
NF0gQVJDL2RlYmlhbjogZ2NjOiBkZWZpbmVzIGZvciBtdWx0aWxpYi9tdWx0aWFyY2ggZW5hYmxp
bmcNCg0KVGhpcyBpcyBlcXVpdmFsZW50IG9mIGZvbGxvd2luZyBmb3IgYXJjDQogLSBkZWJpYW4v
cGF0Y2hlcy9nY2MtbXVsdGlhcmNoLmRpZmYNCiAtIGRlYmlhbi9wYXRjaGVzL2djYy1tdWx0aWxp
Yi1tdWx0aWFyY2guZGlmZg0KDQpTaWduZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBz
eW5vcHN5cy5jb20+DQotLS0NCiBkZWJpYW4vcGF0Y2hlcy9nY2MtbXVsdGlhcmNoLWFyYy5kaWZm
IHwgMTIgKysrKysrKysrKysrDQogZGViaWFuL3J1bGVzLnBhdGNoICAgICAgICAgICAgICAgICAg
ICB8ICAyICstDQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRlYmlhbi9wYXRjaGVzL2djYy1tdWx0aWFyY2gtYXJj
LmRpZmYNCg0KZGlmZiAtLWdpdCBhL2RlYmlhbi9wYXRjaGVzL2djYy1tdWx0aWFyY2gtYXJjLmRp
ZmYgYi9kZWJpYW4vcGF0Y2hlcy9nY2MtbXVsdGlhcmNoLWFyYy5kaWZmDQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi45MzY4ODNhZTIyODUNCi0tLSAvZGV2L251bGwN
CisrKyBiL2RlYmlhbi9wYXRjaGVzL2djYy1tdWx0aWFyY2gtYXJjLmRpZmYNCkBAIC0wLDAgKzEs
MTIgQEANCitEUDogQVJDOiBpbmhpYml0IG11bHRpbGlicywgZGVmaW5lIE1VTFRJTElCX09TRElS
TkFNRVMvTVVMVElBUkNIX0RJUk5BTUUNCisNCistLS0NCistLS0gYS9zcmMvZ2NjL2NvbmZpZy9h
cmMvdC1tdWx0aWxpYi1saW51eA0KKysrKyBiL3NyYy9nY2MvY29uZmlnL2FyYy90LW11bHRpbGli
LWxpbnV4DQorQEAgLTIzLDMgKzIzLDYgQEAgTVVMVElMSUJfRElSTkFNRVMgPSBocyBhcmNocyBo
czM4IGhzMzhfbGludXggYXJjNzAwIG5wczQwMA0KKyAjIEFsaWFzZXM6DQorIE1VTFRJTElCX01B
VENIRVMgKz0gbWNwdT9hcmM3MDA9bUE3DQorIE1VTFRJTElCX01BVENIRVMgKz0gbWNwdT9hcmM3
MDA9bUFSQzcwMA0KKysNCisrTVVMVElMSUJfT1NESVJOQU1FUyA9DQorK01VTFRJQVJDSF9ESVJO
QU1FID0gJChjYWxsIGlmX211bHRpYXJjaCxhcmMtbGludXgtZ251KQ0KZGlmZiAtLWdpdCBhL2Rl
Ymlhbi9ydWxlcy5wYXRjaCBiL2RlYmlhbi9ydWxlcy5wYXRjaA0KaW5kZXggNjVmY2JmOGU0MDg3
Li41YzhhYTFjZDkwZjcgMTAwNjQ0DQotLS0gYS9kZWJpYW4vcnVsZXMucGF0Y2gNCisrKyBiL2Rl
Ymlhbi9ydWxlcy5wYXRjaA0KQEAgLTIyOCw3ICsyMjgsNyBAQCBpZmVxICgsJChmaWx0ZXIgMi4x
JSwgJChzaGVsbCBkcGtnLXF1ZXJ5IC1sIGxpYmMtYmluIHwgYXdrICcvXi5pLyB7cHJpbnQgJCQz
fScpKQ0KICAgI2RlYmlhbl9wYXRjaGVzICs9IHByNjc4OTkNCiBlbmRpZg0KIA0KLWRlYmlhbl9w
YXRjaGVzICs9IGdjYy1tdWx0aWFyY2gNCitkZWJpYW5fcGF0Y2hlcyArPSBnY2MtbXVsdGlhcmNo
IGdjYy1tdWx0aWFyY2gtYXJjDQogZGViaWFuX3BhdGNoZXMgKz0gY29uZmlnLW1sDQogaWZuZXEg
KCQoc2luZ2xlX3BhY2thZ2UpLHllcykNCiAgIGlmZXEgKCQod2l0aF9tdWx0aWFyY2hfY3h4aGVh
ZGVycykseWVzKQ0KLS0gDQoyLjI1LjENCg0K

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_
Content-Type: text/x-patch;
	name="0004-ARC-debian-gcc-add-build-toogles-as-for-other-arches.patch"
Content-Description:  0004-ARC-debian-gcc-add-build-toogles-as-for-other-arches.patch
Content-Disposition: attachment;
	filename="0004-ARC-debian-gcc-add-build-toogles-as-for-other-arches.patch";
	size=1823; creation-date="Fri, 04 Jun 2021 14:57:02 GMT";
	modification-date="Fri, 04 Jun 2021 14:57:02 GMT"
Content-ID: <A262641F2064D843A2656A13E26FE59F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSAzNGVlMWVmZTZjODlkYTFiMDIxZjM1NTM4MmI5NGM5MDk0ODBkMDc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogVGh1LCAxIEFwciAyMDIxIDE0OjU3OjQ5IC0wNzAwDQpTdWJqZWN0OiBbUEFUQ0ggNC80
XSBBUkMvZGViaWFuOiBnY2M6IGFkZCBidWlsZCB0b29nbGVzIGFzIGZvciBvdGhlciBhcmNoZXMN
Cg0KVGhpcyBpcyBlcXVpdmFsZW50IG9mIGZvbGxvd2luZyBmb3IgYXJjDQotIGRlYmlhbi9wYXRj
aGVzL2djYy1oYXNoLXN0eWxlLWdudS5kaWZmDQotIGRlYmlhbi9wYXRjaGVzL2djYy1hcy1uZWVk
ZWQuZGlmZg0KDQpTaWduZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5cy5j
b20+DQotLS0NCiBkZWJpYW4vcGF0Y2hlcy9nY2MtaGFzaC1zdHlsZS1nbnUtYXJjLmRpZmYgfCAx
NyArKysrKysrKysrKysrKysrKw0KIGRlYmlhbi9ydWxlcy5wYXRjaCAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZGViaWFuL3BhdGNoZXMvZ2NjLWhhc2gtc3R5bGUtZ251LWFyYy5kaWZm
DQoNCmRpZmYgLS1naXQgYS9kZWJpYW4vcGF0Y2hlcy9nY2MtaGFzaC1zdHlsZS1nbnUtYXJjLmRp
ZmYgYi9kZWJpYW4vcGF0Y2hlcy9nY2MtaGFzaC1zdHlsZS1nbnUtYXJjLmRpZmYNCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLmRhZTZkNzcxOThiMQ0KLS0tIC9kZXYv
bnVsbA0KKysrIGIvZGViaWFuL3BhdGNoZXMvZ2NjLWhhc2gtc3R5bGUtZ251LWFyYy5kaWZmDQpA
QCAtMCwwICsxLDE3IEBADQorI0RQOiBBZGQgdXBkYXRlcyBmb3IgQVJDIGFzIG5lZWRlZCBmb3Ig
b3RoZXIgYXJjaGVzDQorDQorIC0gZGViaWFuL3BhdGNoZXMvZ2NjLWhhc2gtc3R5bGUtZ251LmRp
ZmYNCisgLSBkZWJpYW4vcGF0Y2hlcy9nY2MtYXMtbmVlZGVkLmRpZmYNCisNCistLS0NCistLS0g
YS9zcmMvZ2NjL2NvbmZpZy9hcmMvbGludXguaA0KKysrKyBiL3NyYy9nY2MvY29uZmlnL2FyYy9s
aW51eC5oDQorQEAgLTM3LDYgKzM3LDggQEAgYWxvbmcgd2l0aCBHQ0M7IHNlZSB0aGUgZmlsZSBD
T1BZSU5HMy4gIElmIG5vdCBzZWUNCisgICAgYXZhaWxhYmxlLiAgT3ZlcnJpZGUgd2l0aCAtc3Rh
dGljLiAgKi8NCisgI3VuZGVmIExJTktfU1BFQw0KKyAjZGVmaW5lIExJTktfU1BFQyAiJXtoKn0g
XA0KKysgIC1oYXNoLXN0eWxlPWdudSAgIFwNCisrICAtYXMtbmVlZGVkICAgICAgICBcDQorICAg
JXtzdGF0aWM6LUJzdGF0aWN9IFwNCisgICAle3NoYXJlZDotc2hhcmVkfSBcDQorICAgJXtzeW1i
b2xpYzotQnN5bWJvbGljfSBcDQpkaWZmIC0tZ2l0IGEvZGViaWFuL3J1bGVzLnBhdGNoIGIvZGVi
aWFuL3J1bGVzLnBhdGNoDQppbmRleCA1YzhhYTFjZDkwZjcuLmYwMDY5OTYzNmMxMCAxMDA2NDQN
Ci0tLSBhL2RlYmlhbi9ydWxlcy5wYXRjaA0KKysrIGIvZGViaWFuL3J1bGVzLnBhdGNoDQpAQCAt
ODQsNiArODQsNyBAQCBkZWJpYW5fcGF0Y2hlcyArPSBcDQogCXByOTcyNTAtNCBcDQogCXByOTc3
MTQgXA0KIAlhcmMtaGYtZGVmYXVsdCBcDQorCWdjYy1oYXNoLXN0eWxlLWdudS1hcmMgXA0KIA0K
IGlmbmVxICgsJChmaWx0ZXIgJChkaXN0cmVsZWFzZSksd2hlZXp5IGplc3NpZSBzdHJldGNoIGJ1
c3RlciBsdWNpZCBwcmVjaXNlIHRydXN0eSB4ZW5pYWwgYmlvbmljIGNvc21pYyBkaXNjbyBlb2Fu
KSkNCiAgIGRlYmlhbl9wYXRjaGVzICs9IHByODU2NzgtcmV2ZXJ0DQotLSANCjIuMjUuMQ0KDQo=

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--_005_efef130bba69fac03d349d9852ab6804synopsyscom_--

