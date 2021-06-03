Return-Path: <SRS0=tXg0=K5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B58C47082
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 20:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 246BD611C9
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 20:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 246BD611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fk9OoQcVxzKxv1rG1+3eTZPTg3p6+07rF4b+0NotcrA=; b=QihQp7csa1rd4vXpfViIAcMaTi
	lmUU99DmJd3pPNhshgoQAcokHF+lh3indVRqeX39cMxTOvCNLsNgdNXCP1I4pveSESsS7DHZSLDOF
	s3kxX7PuK2MNoub7XJ0Q+8cHqg0r2mkgGbAl3fTCjTlBYOvruE0GME5L5wi9vbgaCXbLDxToUGkPd
	SAJR8YmFDMbQeIGztKbs29BcCl1+rRJPm8wBl4jynSybBicHpXOb97dMQJalxujQY0QevdUi66HOG
	2Ud8aNz2ktn1N4aGuCO10azWAX3pmTIw9cAe+bD/SGbHQmpFQ14bDe0NPqDOwetdHarPKbyLlPN5t
	FrcRm39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lotfd-00ASME-Ma; Thu, 03 Jun 2021 20:10:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lotfZ-00ASHt-VZ
 for linux-snps-arc@lists.infradead.org; Thu, 03 Jun 2021 20:10:23 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14360C0828;
 Thu,  3 Jun 2021 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622751019; bh=j71HyayAqUNd/kEffEDOoACIb9zDFJzukuv2FeCnysc=;
 h=From:To:CC:Subject:Date:From;
 b=OF79lLsnH8lCXGZ7hieytyf0P98vDnvM0gbvK9xqmqss+hu8MJ5zBlC+YKJfZHvCc
 ymyhJXeHxw3rDXVf0/JlJIjCNXjgM9KHEWf7KkZXzygHPtt3wPjlkD0scaTeY0VMO/
 99rLENiXc3hdONRZ1NDOEwgjRHEYx1QnJZUyIpDz441U5UBbbfmbWvwMh+rzm82k0f
 ntoMtkY6Yvvu7/WG0uX2sZhBzqLvTffW9/SxtJsKmi9mUX757YTq63C6ylI2/lJs4h
 KehwYePmtMEKKqXP7trLuDevblB8AkPNwRjYbvSm0WhN/+87quOOVfPXblYcvXa5lO
 Dpj7lpPRB1mrw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3051EA00B6;
 Thu,  3 Jun 2021 20:10:16 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A6514802A4;
 Thu,  3 Jun 2021 20:10:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="OHi1wEq6";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk/rEraqOA/zPkZOT6WVg9cbX/BQCQxuaYAlOz63uJSPRlgHHJXX2x+mhLa62U8Zd04pJlF2Id6kDF7laUkQv/J/PS+UkPQWs05rmmtU2HM2dwNKCrZ+0FkgawpXAJI1hCcLUKrKwmYkk2FhWAktL3/etY+9T9JWvVVkT7Fxfu5mWb8TFII968eo37w/+wap2TugXc9vrI94rj+EH1kWsnWTmb6h/1rZ/6ssrDul3gJd0d/RXsRsonogcdY75Y+zNOzS8QoGYYy5mm31zD7J1sRFvXYH7W27+4STNv96gYiFtVMTuywxULNErnozD2a+OEqf6lH5Bemz9nWYJygGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhYcQdjqm48fufCW+fSX4nyH4tNh4wQsMl/oLeJFHHA=;
 b=lLZG0BsjMPFEBBmv37uIYY8LxO62B9LJgHkU98Qy6b2lwahteRZXH7HDgq/yeeO4En2/n3HuZKLLioRqSglVu74cXkXffuGkghkr4QTZVIbgNT7IQYoBlAWLaT1IHBCBqS/vbiy3MF7JcVYtfXzamN+/6UK4AkDwc3c6ykhIjFE6yq7QSQ5QSc+xxywJ7bHH6OKsmk2xowTlDezQbpHmlRLgl+poDIgGFqcqdLqe4g1ZKXyguEafwapUGSPsPK6Iq6hxl1retFt9F88xZ0TxbTyggNwzJ5E+hYQHMoEhe/SFn0x0uh2NILlTp+2ETTMEhM8FMnbdY/vbhrZRzHkmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhYcQdjqm48fufCW+fSX4nyH4tNh4wQsMl/oLeJFHHA=;
 b=OHi1wEq6eCgaKHAz7HtBdq8m61h35l21yIp/XJWmYiK72v9GXNxvzPRTJdMlE4j/lGnFbbiM9PFvg7HDTRUEd1ihhZd8L8iTocPISnXrUUQ1vYkaeupLhR0Vts1Y3BNmwAGU8Ou8rRZpuEmmX6Aig4brGIlrNB5RfOBfCOjgQY8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Thu, 3 Jun
 2021 20:10:10 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Thu, 3 Jun 2021
 20:10:10 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "bug-guile@gnu.org" <bug-guile@gnu.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
Subject: guile: add arc support
Thread-Topic: guile: add arc support
Thread-Index: AQHXWLR0ORPvhD9kgUma7JyaCMGI3w==
Date: Thu, 3 Jun 2021 20:10:10 +0000
Message-ID: <bcb437ee-6f9e-d7f2-631d-8451bec0a24b@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: gnu.org; dkim=none (message not signed)
 header.d=none;gnu.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 757e0711-effc-4be7-acbf-08d926cb9759
x-ms-traffictypediagnostic: BY5PR12MB4100:
x-microsoft-antispam-prvs: <BY5PR12MB410067BB43706715B799E423B63C9@BY5PR12MB4100.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QCMbKanSf3iJd1LhAW+QT41QhL+7tnt/7sv/7wItiwLwPvKdLLd9f78h8cVXlp08D+d/NwwbUgx0DbcChVraFpcr5W4XOSbZodgU8tgVSAjGJR5SAuIHB2SZVMrWefv4jzRs/b+D+aXS5hSUPMXVdw3YF5OKI2WllOxJ8THmqvGgxDQHsjGvalIuB7OKpJGJfFx3+bdg+kwNIu8RRilITg0c+QeSZYlRjL0dGskZY+zDvpaS1gsIEDE1l93WX0eenQwQGvKCmO6lxnu03/qkZ+VyUH+bDtRaJnjLF19A18BzBwA6D4SUbgbzJYuxGwsdIIHBOb+B+q3Gj6/3/qairJKuXdiWd/Nz4Dt05QmllWqcwqqXojvdmIYKnV5z6r72JKFklBjcOaTq/7HAm1jgdXhkeM8LwxXwThX1vmw2c3ZiG3WMzwFGesRH4FenLndic6jvfDQqAXgf9SQOH8OSLktNR6DL0PzJjp1EYY9nI1z5O+7ZSPpRibYWoDeOtXZHWItAoH+1DbAK0U4zs+GBZrSwvSHIyxZKAB0JN/ysSwzc0xgnbWYgf9PNYy2VhdnG+qgqoFuPvvt250myaXlZGVbSMFCGGVN374zFwLAsixI2OgzGGboCOm9SvJTzPakhzytoHQHzvucMCGlwqYlYTHvsf3RaosXBL07vyz5aT7mZqm4NQRUTSQRYLIdn5EBr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(346002)(376002)(39850400004)(38100700002)(54906003)(8676002)(558084003)(478600001)(2616005)(316002)(99936003)(5660300002)(71200400001)(36756003)(122000001)(6512007)(2906002)(66556008)(31696002)(66446008)(4326008)(31686004)(26005)(6486002)(8936002)(76116006)(186003)(66946007)(86362001)(6506007)(66616009)(64756008)(66476007)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bkNJeXJESXFzbFJPLzZiek5nYStEbnkwUENPWHFnTWVuVnhRYUZyV0RWeDZB?=
 =?utf-8?B?bm9XSEM5blZGaG9PWVU1TWN1bnd6Z1ZCbFJYU0N5ekFpVHgwSHZVbTV6OWlj?=
 =?utf-8?B?cU5jcHZFME53M214d1RJNm5iZlFRZk5oejNFcmV0U09UUnVSNlFzbDVnUm1U?=
 =?utf-8?B?QnF2aWpjVThQdGxReHFYQmZ5Y2g2T05HcmFaM0NDOWExZndidjlvUklyUEdz?=
 =?utf-8?B?YjAzaHVUdm5UY0RzSzYydVhacnNqcUpzWFUxdEpvbWhNSWQybUlXQkRLbTFY?=
 =?utf-8?B?bll6Q29lUCtMNldrSGZQM1lNYnpaQ3M3S2srMTNtM084SnJhR0N5QngvZWRO?=
 =?utf-8?B?WHUzZVgyc1dMRGdtdldwdTJhNE1mcy96UktLczYvV1FZMUxTenMwR2JzeUNC?=
 =?utf-8?B?QXpiUmdQWU5QeVNEVzN1c0kxV1B1Nk5mNzNnbHcrcy9ENkFFM1VYWC8xSS9X?=
 =?utf-8?B?cHpWYUhWTHh6U1ZXd3RqRElwaVZieUlpNWJWVzZ0TmptSFA0YmR3TkNERDg4?=
 =?utf-8?B?dmtEQ1AxZlo5NG1iUW82T2ZuUDdmRGlJUkxEekNNWEJ6eUxBZmhqZy9mdXVC?=
 =?utf-8?B?RS9xV3h6RWpmRGIwVXMxTEtrcmJjOFJ2QURuU2EzRzlnd0UzT3hsMDJrNCtp?=
 =?utf-8?B?Q2JUNTdYUndiQUN0UWlBV29zUWNUbExEUW9ZUkRvTS8zR0YzSmRsNkprNnBR?=
 =?utf-8?B?TVlsdUQ0dGdneDZRZVJSSUxkaGZ2Y3Vpc0VMalJUZ1JzUG9VV3VkUlIyTmF0?=
 =?utf-8?B?QU8yMCtPdExsdTYxUTRCcGxiTFpZQVZ3WDM4NzdscE9nWjhlR2lUaHpsNUNh?=
 =?utf-8?B?WW12M1JBVGNRMnRieUVBbS9vdmhWSFg3TjBVeW5HT3NQTFZDTEJobEo1S1dM?=
 =?utf-8?B?T1hyUGdjcmsvZVlyTEVESGg4VjVkTlVoRnVmZGxqU3FHT21Zd3cwK1BUQVRX?=
 =?utf-8?B?NHhvU012c0ZrU1Z1WXJ2UDVtK2FVZkp2V1plekFKWFZHaVk3N3Z5bVRRS3ZY?=
 =?utf-8?B?WXVoZElYZVE3RlZ6dGg1aWFZbVFTVk5LK2ZKQVVxRVQrenRSZkJySDZQWjg5?=
 =?utf-8?B?Q2E5QlJGRzV2bU00UXhFdFM5d0tEV2lRYlo2Sy85Unl2ZkxxdmM1Y3NKL2VD?=
 =?utf-8?B?VmZTMTlJSjQ0YnBMRzY3YnpkMUo5Y3hzUVZ3Z1BBWDNmenB0UlBwd3I5c2Fu?=
 =?utf-8?B?K2NBRFArRHJEa0kzZlJmdnpnQ24wQnJDY3ZDWnpPT2hMazUzMjJveis2RWFi?=
 =?utf-8?B?U240Qm5aK0svNXpnMEpYOEI2Wm53RXFjdkI5NDFVVXpqMDZ6ZmdnTEt1Zjlh?=
 =?utf-8?B?VFZiZE9BS0taUDVhaXM2bkdzMFczanZFa2E0S3FCZHU4N3Fnc3ZYV0hVTFVn?=
 =?utf-8?B?OUV1VEticlNMZktDUnpRVVRLWlNnTGgwOHM5bHZrbnFlRVhNa2dvSlhXL2pG?=
 =?utf-8?B?MFhhbFk4aWptM3RyWTdtS0swK0plZFQrZTR3MHE2Z1dZRkErcTlOUEwrVExW?=
 =?utf-8?B?Q1ZIZmlwVGp1dzZhKzhvSTVFNHBDWFd1cldiajJHUDlCcmMwZHI5VGZ1SHd6?=
 =?utf-8?B?VjI3MXFDY1RMeWZVTk0vcHNuOWN6T2U2cFB1OFhDb0Z0dmtVNTE0aFY4TXRy?=
 =?utf-8?B?di9scFdnOUU2MDdWaGdlaWhjWFpVaXF3R1Rsc09mYUJKZENRQ29YWmJYL3Vu?=
 =?utf-8?B?dmVkNXdac0FMZytTZzVrdFNiQmJReEdoRUJHWCtjcml4cGk4VWxLSEdjcnNC?=
 =?utf-8?Q?Sk4iapctHCL6IpD5j0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_bcb437ee6f9ed7f2631d8451bec0a24bsynopsyscom_"
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757e0711-effc-4be7-acbf-08d926cb9759
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 20:10:10.7180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIzlwb5n3rA4TbJZYjkBhOSBOL7wN6445X5EROu4KLrKecc0dJK6r/fxKDFJBF81MszRdFlN4n8A6O014V2BkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_131022_205583_CCDC0149 
X-CRM114-Status: GOOD (  15.41  )
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

--_002_bcb437ee6f9ed7f2631d8451bec0a24bsynopsyscom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <04DF6500FE09AB499A63C1183E4C6843@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCkknbSB0cnlpbmcgdG8gYm9vdHN0cmFwIERlYmlhbiBvbiBBUkMgYW5kIG5lZWQgYXJj
IHN1cHBvcnQgaW4NCmd1aWxlIDIueCBhbmQgMy54LiBQYXRjaCBhdHRhY2hlZC4NCg0KVGh4LA0K
LVZpbmVldA0K

--_002_bcb437ee6f9ed7f2631d8451bec0a24bsynopsyscom_
Content-Type: text/x-patch; name="0001-add-support-for-arc.patch"
Content-Description: 0001-add-support-for-arc.patch
Content-Disposition: attachment; filename="0001-add-support-for-arc.patch";
	size=1543; creation-date="Thu, 03 Jun 2021 20:10:10 GMT";
	modification-date="Thu, 03 Jun 2021 20:10:10 GMT"
Content-ID: <3F20CBC5758F0C448581B31A379C6901@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBkNzIyOWQzODRlNTAzZDdhMzg5M2UxM2U3MWZlMGFkMTZjMmU4MDAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogVHVlLCA2IEFwciAyMDIxIDE1OjAzOjA3IC0wNzAwDQpTdWJqZWN0OiBbUEFUQ0hdIGFk
ZCBzdXBwb3J0IGZvciBhcmMNCg0KU2lnbmVkLW9mZi1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdGFA
c3lub3BzeXMuY29tPg0KLS0tDQogbW9kdWxlL3N5c3RlbS9iYXNlL3RhcmdldC5zY20gfCA0ICsr
LS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvbW9kdWxlL3N5c3RlbS9iYXNlL3RhcmdldC5zY20gYi9tb2R1bGUvc3lzdGVt
L2Jhc2UvdGFyZ2V0LnNjbQ0KaW5kZXggMjA4OGNkODY2OTdhLi44YmRjZDY2MDM5ZTQgMTAwNjQ0
DQotLS0gYS9tb2R1bGUvc3lzdGVtL2Jhc2UvdGFyZ2V0LnNjbQ0KKysrIGIvbW9kdWxlL3N5c3Rl
bS9iYXNlL3RhcmdldC5zY20NCkBAIC03Nyw3ICs3Nyw3IEBADQogICAgICAgKGNvbmQgKChzdHJp
bmctbWF0Y2ggIl5pWzAtOV04NiQiIGNwdSkNCiAgICAgICAgICAgICAgKGVuZGlhbm5lc3MgbGl0
dGxlKSkNCiAgICAgICAgICAgICAoKG1lbWJlciBjcHUgJygieDg2XzY0IiAiaWE2NCINCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAicG93ZXJwY2xlIiAicG93ZXJwYzY0bGUiICJtaXBzZWwi
ICJtaXBzNjRlbCIgIm5pb3MyIiAic2gzIiAic2g0IiAiYWxwaGEiKSkNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAicG93ZXJwY2xlIiAicG93ZXJwYzY0bGUiICJtaXBzZWwiICJtaXBzNjRl
bCIgIm5pb3MyIiAic2gzIiAic2g0IiAiYWxwaGEiICJhcmMiKSkNCiAgICAgICAgICAgICAgKGVu
ZGlhbm5lc3MgbGl0dGxlKSkNCiAgICAgICAgICAgICAoKG1lbWJlciBjcHUgJygic3BhcmMiICJz
cGFyYzY0IiAicG93ZXJwYyIgInBvd2VycGM2NCIgInNwdSINCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAibWlwcyIgIm1pcHM2NCIgIm02OGsiICJzMzkweCIpKQ0KQEAgLTExOCw3ICsxMTgs
NyBAQA0KIA0KICAgICAgICAgICAoKHN0cmluZy1tYXRjaCAiNjQkIiBjcHUpIDgpDQogICAgICAg
ICAgICgoc3RyaW5nLW1hdGNoICI2NF8/W2xiZV1bbGJlXSQiIGNwdSkgOCkNCi0gICAgICAgICAg
KChtZW1iZXIgY3B1ICcoInNwYXJjIiAicG93ZXJwYyIgIm1pcHMiICJtaXBzZWwiICJuaW9zMiIg
Im02OGsiICJzaDMiICJzaDQiKSkgNCkNCisgICAgICAgICAgKChtZW1iZXIgY3B1ICcoInNwYXJj
IiAicG93ZXJwYyIgIm1pcHMiICJtaXBzZWwiICJuaW9zMiIgIm02OGsiICJzaDMiICJzaDQiICJh
cmMiKSkgNCkNCiAgICAgICAgICAgKChtZW1iZXIgY3B1ICcoInMzOTB4IiAiYWxwaGEiKSkgOCkN
CiAgICAgICAgICAgKChzdHJpbmctbWF0Y2ggIl5hcm0uKiIgY3B1KSA0KQ0KICAgICAgICAgICAo
ZWxzZSAoZXJyb3IgInVua25vd24gQ1BVIHdvcmQgc2l6ZSIgY3B1KSkpKSkNCi0tIA0KMi4yNS4x
DQoNCg==

--_002_bcb437ee6f9ed7f2631d8451bec0a24bsynopsyscom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--_002_bcb437ee6f9ed7f2631d8451bec0a24bsynopsyscom_--

