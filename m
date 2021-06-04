Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EBBC4743D
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 16:45:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3EB0611C1
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 16:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3EB0611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6S+aB9gyieECnVnUUBpSMWmBtqoOJtJVE45dbhtJP3g=; b=KRzWMHamP8Z/NV
	NlxHVLX/5fljG4cKOwF3eQ4XzDLn+b2dmr1npWMt8W81mMTtwlNfSEp93gkqiVwKzqD17TOLW8u0u
	vhWOxD0kYX2jO+Zmh5bmOkNqWEzTYRJicgy57MCEBRRyG70wM5Z2HhizZk+8pha9ryVWCdTq474wy
	HJzN9lMkiJkAUq0m6ta2IeY3HWyUZU6iXHynb27qH0sAcaggDNaDEGG0nzTyT5Jw0QUPZ5YQ0PY9/
	Re3OH2X4sdzO6grSTbghrntf0yx3Jsgdqk8LMXL1IqclezRXC2Z2Ktl0V0bhPGyL7U/6+wd+imCLO
	wWUuV5ADnCT4OTp1IVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpCxK-00EPgS-BK; Fri, 04 Jun 2021 16:45:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpCwR-00EPLv-Ed
 for linux-snps-arc@lists.infradead.org; Fri, 04 Jun 2021 16:45:07 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D7266C0ACD;
 Fri,  4 Jun 2021 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622825102; bh=nLsNryhcszmDVxsuYW8qs//GGRoZjt0h4hBlmYi68ec=;
 h=From:To:CC:Subject:Date:From;
 b=kkl8wXPD3bQUAOz4c0heOM40aHlzhtW4poP8uqHQ9mqjMYaJs2ycCXa9Q8WbSWH99
 L6Qx4Gqzwwr9imDg0QumRe7vN9ClSlL+I2cYp1MvrR7ZlSWwyNeUPwXd2zt5KKq/hc
 Z4mTsX+CfNMGO8nwHEHsE9fyRa6sZ5nZksLZC+C4XWVpGtgwHLONr1MI/7U2sazsfy
 Im/lANHL9QgQUu6qi8BGpdyKEURLxnOrjBcOz2OsGbeJsrKJGrlvu8EfCmGneApPL9
 UeHzYtLzRl99lnJduucZTPuIeWDujj4Hl64LCIZGu6u6hRzvPQ/9vBnSKGyfh5QQck
 YWY0zT/qvqzLA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 36F77A0080;
 Fri,  4 Jun 2021 16:44:58 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CBEB640134;
 Fri,  4 Jun 2021 16:44:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UBDKJMKm";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZUCk/lU34Ooro/UxsV+Ykm8gFQCmYFq1sbfqhN/l7VJqMxzSiXi1shXsQQYsgmMGW9xlh8R92V00bb99K+8umTjIRf3cIKhe0ECXsEqWuohrDDj1X2xLbkbvhhcgic01oXUEf2bcQdI7lg7rvT8d5EMApZTOXuFEoWmdV+qu+zaND4cjBl+F4xHXX/JhmXzFKYrEjNBfFRprSGfrtEv4XSp2fSGRl6vwwlfv4GoKF86xEyYO+OTEx+mfUo4fK2kAWBRq7AVXgrpN2qzQ7aHhQBK2ACefXyCg2rzbEJOIkZHCi3NrumnUSYpm6QDclJrsIEvsU05MvVWaZ54CAOvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLsNryhcszmDVxsuYW8qs//GGRoZjt0h4hBlmYi68ec=;
 b=hMPbqDUm43pp8auKTJ05Ktbbn/bJ69076LNIb20qEm9q+BJpnOLuuWnLYiaBDPljMN+m4e5khNQhVMD6pwc01ZuAwr3KhsEadBeawoh6Jyw3rxNbf+JZaG8gve0F5edXC7FyqfaDR1Zuii0e3hOQghANhxMgHaMoIc2i8HQ1OAZhnXgpbXxJqQVMhIsukC+wFPqiGXgXgkNrsFZ2te3m4G3T7XhSxtP6CeaSX9fijhBc4p3HtUGlQFQzH1r3LW5NuQwPk7jvAHUk4i8T8vDi+nLPCqOyYQhBjplO+t8avg07PFP8c81CWDnhUCLJQcz/N4TSqy7VyLCjqsGCXdMuUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLsNryhcszmDVxsuYW8qs//GGRoZjt0h4hBlmYi68ec=;
 b=UBDKJMKmy8g4xXeWcw4+Y2hJKW4ZX6t245GKZ3VfEw4kTxYcIv4YmGGPjIIv6rqWwAtIFEWcWKAiChc0g7hs67imQQDyYbTGFbwQVGPeELyBt5F8a4KuMnvRleUsUxAqevEfJUhXxD2WcrRieiND7hLcvtt3QQ45stA0qvIjp2M=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Fri, 4 Jun
 2021 16:44:54 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Fri, 4 Jun 2021
 16:44:54 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "control@bugs.debian.org" <control@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Guillem Jover
 <guillem@debian.org>, Helmut Grohne <helmut@subdivi.de>,
 "debian-gcc@lists.debian.org" <debian-gcc@lists.debian.org>
Subject: Debian: gcc: add support for ARC
Thread-Topic: Debian: gcc: add support for ARC
Thread-Index: AQHXWWDyWKnoG77Qxk+ln/K0mPxd7Q==
Date: Fri, 4 Jun 2021 16:44:54 +0000
Message-ID: <ae60d7a8-24ed-869f-c791-bfa9706ebffb@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 8a5a20e9-c3d1-4294-0b49-08d9277814d8
x-ms-traffictypediagnostic: BYAPR12MB2663:
x-microsoft-antispam-prvs: <BYAPR12MB26632507B6A0FFACEA07DB39B63B9@BYAPR12MB2663.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLAUsDh05cCBGPK+45dwi/MEqkhfmKQGRXXtfxqEQWaCvwlmehc9MAHDQpWkUaB7KFEhTXc7V0BUrNqeuaHrZV+pr5z8vngPGm7PgOYFGtJZnoaqawsu+8p3M/O7AwpCkXsKWlVpVo6TXRKO1SAQXvsUGES/oLHbLTpiX250kMq6T51VDRqywpoLfDHDi3WvXqaWoL6Cg4Br4wtK/vZvTJgle5ev7ZKfl8lNZIJmopMA7eLuiTGcokn6fqZh+QK6iRWqEm3JiFmYbQbibZkj4ChmbhdYrXmV0jD1iesJgIA2I/74Ne3Cj4u2ZiDrGp9Uyty9Z5w1i31d74ORasN0SAG9eaAXQxWswbc5XQTPzHmUNz5ibcQEHWmCnlUEbylepZ8owd/hfT5UKa7DIm5RP9UfHWATWCE1wPKLnPZOh6bT9DPRb7Er5bFpL4kcvAN3DLeFccLhDuZT+mYJWpy4xAkffIjqMbMuHiVAIC5F/S1cbEWzlm6kYtCR91HrUZZslvIb8jWVPngWIu26NqLGckhMS/JdiFfIqj4/qj2F1JZnUO7d/LiPqW6aFIAs4KLX2lF7Wzd2J6/LbCBObreFOvh9e8+Y9Qp0k8NulNEsr/kElUYp1vCaEJ4xOAZJjjoYLYxqeW/e+kkAzmLYV9VD+aAvLnamXiwvuH9EzC/hpnDVFwIudmm8GKDxeJE7NQ6z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(39850400004)(346002)(376002)(4326008)(8936002)(54906003)(6916009)(316002)(71200400001)(5660300002)(38100700002)(6486002)(8676002)(76116006)(6512007)(122000001)(6506007)(186003)(558084003)(66446008)(478600001)(2616005)(66946007)(26005)(64756008)(66556008)(66476007)(2906002)(86362001)(31686004)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RUJLako4NE9ZUDd0dEZwd09KNW9SYlpJUDFOZS9TeHJjQ2x6Wm9ySlcvRHNy?=
 =?utf-8?B?NC9oNTJnYU9YS2pCaG5GMVlCWU9Tb2YwRmQ1dzV3a0pFcU5sMW9TQ294R2p5?=
 =?utf-8?B?ZzMvSTlRSjdwM3A0OEtxMHdjYjRySVJvWk5EaUhCUmgvb1JEVy9SbEV1Rkd2?=
 =?utf-8?B?Y2pNQmVscGloRHFPZXJPaVV0T0NOc0pSbHN0eDVaRWFEQm9RL0sxT0xkTVk3?=
 =?utf-8?B?dTA4VWdISC8yNnVJdFQrZmhlcG40cmJBQ2IxTmZVM2tCeS91VUYrbTlOSWJ2?=
 =?utf-8?B?ZTczVDRZYTV5MWg4a3psYmNDMEFXdGoxRFkwVWlGUENEdnRja0xxQW9KdWxK?=
 =?utf-8?B?R2NsRnIveFlCTWI3aVpFdklyTXVacExpSUFDRGc5cFJFOTUrMWxGRXV4KzFw?=
 =?utf-8?B?emxqNTFYZERNUng3SE9CSi9SZXNrU0dQV1BPZGNCSU53R0tqbE45WlVUcmVF?=
 =?utf-8?B?d0ZBSFRUOTJhZkRmSGVIb2cvZEd3cDBaZ2dYUkdyYm5DZkpPUVdQZ2YxUXFE?=
 =?utf-8?B?cDBrc3BMZWhKZjBxMi80dGs2VWRTNmtUeG95MElQOUFjMEU3MjVoM2dZU01W?=
 =?utf-8?B?Y3hOWmc1eExtbzh0akkxbmx1cCtyVGJweFB5eGsrV09pdDBycWIyOFlERkpP?=
 =?utf-8?B?UG9wMCtydVN3U2lTOU9TRjRHeTREeXRBZzVaQTdMUkFhbGZQVHM2UXlCa3Nt?=
 =?utf-8?B?enNBOTFOWFBkbUVRL2RFMUV5ZmpXaTRaNkNXODFYMXlRNzJQMGk4RmFLZzJp?=
 =?utf-8?B?OEdoeHFndFVjU3lKNkoxdjd4WlRaS3p1UXBodVFmeWdPdVcxZ1JjWHFSNmV4?=
 =?utf-8?B?c0FMTEJhUzBYTENDL25BZ1kzSVY2R1hHcFp3QllTeEZMSGt3L3lKOXBRb1RQ?=
 =?utf-8?B?NGUyTkM1WVphSDcyOEkxNnVSRm1QTHVFYzBTdExYb1JGZ0FnTU5RTmxGdXNQ?=
 =?utf-8?B?K1FweFJYcmtXQWFXZHlMSnZPU1ltWHF4eE1hQnFiNFpOQlQ1Mk4zU0FXWmRZ?=
 =?utf-8?B?cHpvaVpVemFwUEJlNENDNndpVGJFaEVhQXFjK0dCQzh0WlBMUHBrVHp5b1ZW?=
 =?utf-8?B?UC9Yb25xY3FlVVpJc3FhQ2RhQ25xNkVFc291SkgzeUZwV3FudnpZUSt0Ym1w?=
 =?utf-8?B?UDVLUG91UlIrV1E5TlFoZ0gycEc4cTFITm9jWGdjWVlMNjJNUGV5Zy80TEl5?=
 =?utf-8?B?RFBRTm52K2V2MGdOemVTbWJ4bDlRZ0NPMm9FdGhRTVVKNkMxNGlpZlJRUWR3?=
 =?utf-8?B?Z3Q3Z2w2VzdIMXVRRGNDTEs0UUY1c09jZlFsS010NW5RZkV2SFU3SnRqNkVK?=
 =?utf-8?B?RHhpdlljT0owTjZFYmk0bXA4WkcxK2s2c21pNERNeTZnMTg4TmNjeVdCbkhk?=
 =?utf-8?B?YXFGR2R3VmgyeldmamJ3UXRzM0NyUjdudEljcXhINXREOVVCZjlWWm12dlo5?=
 =?utf-8?B?WC9UMmJLeEo1MUNDcUN1amVqd3VONVNpS2N0b0ZOcFpQdUNZODc1Sk8rMHBP?=
 =?utf-8?B?bWFUaTF1Z2VVUFE4KzFKMkpyWE9DOW00THdBMXJrM21xZDBRZjlzZ2Z0bmVY?=
 =?utf-8?B?TlhsK1RaQjJwelhQMks4bURtU3duRUJVczJ5NXZxVzdjRHY4d1dHZU1kYlJH?=
 =?utf-8?B?Vjc5QlNCSWY4cE1FZnU0L3UwSlpoU2tRRWJ4SVBRZC9XaUJSVzlvT2lEaGxC?=
 =?utf-8?B?UTk0NW9qV0hRN3k2MkZQMGpJZFJBNlIzdmxUalZ6WFRrbFdDQW1vTzgzaHlC?=
 =?utf-8?Q?twNixn8pIpbEY49gkJVy/Y7y8PyKfQYiaAnUCHR?=
x-ms-exchange-transport-forked: True
Content-ID: <040A0D8E85A9E043A8FDA5E6AE4185F9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5a20e9-c3d1-4294-0b49-08d9277814d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 16:44:54.7158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KwT7Sg0D/guy9Q833Y+8aAAjbxAhvzi002WcUqkzDmeOi3OzTm974gguQAw71AzxfL4yppGaScAZqfNPxf+O1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_094503_643386_C4740EB5 
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

reassign 989453 package src:gcc-11
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
