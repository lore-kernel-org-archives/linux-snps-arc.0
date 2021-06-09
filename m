Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAB4C48BCD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 20:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34987613BC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 20:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34987613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xWN5KIeq30lPySmD8EnD9v5wvl+kBRp1CX6biSOizk=; b=JeCUR+qY6AwVr5
	aQYZwk4qea1VEGXRxIIa6/+zfsnwrb1lckkrujNU4te8qxws2i+T8xFmry0E3Z/wekTXG8w8fezp3
	Rv1l4OmwpidDEqwMzN/hYNTIWo3CzeLwHF47b2Bsr84KzRoFkacieGw6MxhkAFFReawM7lOdemriV
	24cCnKinHfqV+N6+0gZBVrANFpmVvBqbq04e/EhNsO6MYgem+vcedKRvLp2IGlKItMDvz6eaFozfj
	D936bxtwA6qQebfNVUFtiEpSwTq/TbMKEpycmkfhcXQsaebva/uCiAkBqe+rJBYux9wa4X0BoKDES
	HcIUvZH6TUGH+8kBXdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr4Nj-00FmI6-Ol; Wed, 09 Jun 2021 20:00:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr4Nh-00FmHJ-4L
 for linux-snps-arc@lists.infradead.org; Wed, 09 Jun 2021 20:00:54 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7272C407EB;
 Wed,  9 Jun 2021 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623268851; bh=FdBEYu9zli2no5/Dkamr6KBAxZFeC+R1Xt7WdhvGLTs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OjveeZXgzwi7AYWasSTZWtbMLIU1kSQfaj1o6qNlRvCIOl59R4ye6CuePh9pBCS3G
 znF/cQKPTwUCj2ETeWMURFGE4k6+k+9X8oeZLB/cG5cvM2lrS1LhcQKnCmnnjuW2Ow
 GuN5Wg6wGTzm4bo76FTQRbtsGSQSfWv/aK9efOhC2Jq2DX+mfYctuRZ5rJHavrAsw3
 KiyZqMB0l40xzO+3fYrkP8ua3Y8y+3NWVzVLV6+rqeL2/zLfYlgCAreCDnAwiF6V2B
 QU8KszsyaRLcmy0bxY78KV8Mmx+AxjZP4eCtioH23ySnlA/EO2fSKddF0rxthtORzT
 1sU+Efr84d2RA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C8E82A0081;
 Wed,  9 Jun 2021 20:00:49 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 62282400DF;
 Wed,  9 Jun 2021 20:00:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ib5ky+WH";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoA1zq0GoQGRuWCicFufaCxpsEk0IZLcDaEoxGDwvzWFAOqCjtmyJZjJ7t3/Gey25DCYx5TrQK1xN67HHqghWf1gkehm01xEMu/2L67rJv7BXrHnD7lqc8JmixDDprSsjMe2PGFYn+by1q+9j02fI5Sg/dZas8GjHpd2g1KoAZ5VsEGQspm5l0DaOjMRT4P9IOzgYltMPWCtZUiYqXHbj0SO9nOpWqVUBrvc8yGQUgNDAw+d3RcxKfkJTeOytkaVJ+752Lh0bxF6Rd19dcuS7ytMA6WZnN68ox0k6WHqpU5zwMOnIyZEeMEVtvoatemf+rDsf+deVVfnd0dj3PfIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdBEYu9zli2no5/Dkamr6KBAxZFeC+R1Xt7WdhvGLTs=;
 b=YV2SAmW/CanlgWp+K/1ejBx2wkrQ9JuhWCmXd1pcX/2w0x5VgWBSlZ5E61ioKEyDV8MOFURX4xSC0C6ldCda7w7S7xtNsFz2Xw4GgFIB+mzBTPvUM/VQZHqAFcesX/XENHhyqKSXQmxZg2ecLHzBGw5nYyEpn09CeaQ8VMqtwHdUz/KkcBtsiDgV0BmI9uGJys1NrSM3Nu0G1maRSL4HHnX1LDGy9o2m9Lrvapjya8dHQhax56+VNoe04/hd4Esa5DSB5lJWx+7uzwWPemu0mgXXb9AzKL5vVnQ1YdrVEtznXTaaKqUMoKm8VSZquI7QFIsCSJopbQ1dbohM0I+dDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdBEYu9zli2no5/Dkamr6KBAxZFeC+R1Xt7WdhvGLTs=;
 b=ib5ky+WHUm/s3bMtHxeM4793bMwqeY8yyovuI7ml9FzVbQMUK3cltRTVcDsK1Ef346lGSHgAeMjYDRuwWo4/oKCCqSM8q9ZsWw/lEMPkR7YzoaAKmZkzLfWbEVT497eNxKeDpSwVhRtCDeKmzA8L4IFvaUR9PqtfGEQ1NYFlgOM=
Received: from DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24)
 by DM6PR12MB2969.namprd12.prod.outlook.com (2603:10b6:5:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 20:00:46 +0000
Received: from DM6PR12MB4877.namprd12.prod.outlook.com
 ([fe80::2409:edc4:60b9:72d6]) by DM6PR12MB4877.namprd12.prod.outlook.com
 ([fe80::2409:edc4:60b9:72d6%9]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 20:00:45 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>
Subject: Re: QEmu ARC port - decoder implementation feedback
Thread-Topic: QEmu ARC port - decoder implementation feedback
Thread-Index: AQHXXRYCp0g4uHxJwUSWGu/ANfQZ7w==
Date: Wed, 9 Jun 2021 20:00:45 +0000
Message-ID: <0a58c2fd-41a8-d496-6aa0-f1a7296bc15b@synopsys.com>
References: <a882003d-4949-06ac-d111-8f41cb2d54b9@synopsys.com>
 <0c90a8c4-0977-b11b-b543-9eef4d4d14c3@linaro.org>
In-Reply-To: <0c90a8c4-0977-b11b-b543-9eef4d4d14c3@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.80.51.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6afb68b-700e-4790-1832-08d92b814511
x-ms-traffictypediagnostic: DM6PR12MB2969:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2969B64E9FCC9690C8ABE146A8369@DM6PR12MB2969.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2ggRtvClhmagzYNpQFDTBN5PedqHaEKQXFBtOMJGp8wcC95hfga7iGctlVzyo/Viv78GpawXrbB46tVtd/H05HZ9DwTWYxgAmRlFyqT0dQNXnteRb7ZKIJDBbj3r5EdreEn6nUzW+ulqcTwsEgMYunhS+ozI0xYg+JSfhawanrdPvMwO8//FVYAVsVCl9wtHnllgOkKQ7OxyG87NWp+oZBPZellSmFtHQ59XRb6u8hyMmxMUaSXj/ZbDiOzynRpbB0a//JN5p3Icnlx46Xv+vZpWlBTW1xcdRfvYFll7qa1UapbTdjDMSvUVZ9Fj9mlgXKd1Q1yJFK06WCDyppHH2layocA8YSJ8kGpGcJIT+JXlkj1MGgMsUbhaDAkMlg9E3nzNL+/nptzB2fjphUL3oXzKtlKNNSeeNaQxbXA9iaZbSNq4Vy//TRx6d8+NNJNdyZSVE83uB3lfeFjg7x+z2ERZOjA3EUmzQtkW7g1gAg/KQPlRfeuqKbpf3czYbGBN2m1ifDROvfBJP71T3ojktf6bWof4RIY1Y4XJTgCeirZThhzYfiWoPp2oC1BPjio56un+L3lr7cmT8E5Ko9c3ZJupgPfEk/cpH/mhd+43k+yhR7Kv3aYPAC8i6QCLR+SFZtebzEf/3XtFsFTUfrrXX7fHO6+ygntxYLPgc/It6o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4877.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(136003)(39860400002)(64756008)(4326008)(86362001)(8676002)(71200400001)(66556008)(66446008)(66476007)(110136005)(31696002)(26005)(2906002)(2616005)(31686004)(186003)(66946007)(316002)(83380400001)(38100700002)(54906003)(5660300002)(6486002)(6512007)(478600001)(76116006)(122000001)(91956017)(6506007)(8936002)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YyswM2ptRmVQVTVPVi91UVVRVS9JNTBmRXRCTkVubEwzMVdldVpzazk1NzY4?=
 =?utf-8?B?TUNaMUJWOHcrK2lJS20vUytSWkNzamxrckRxWXJXcUNLSG1pdFRGWTZFRmJs?=
 =?utf-8?B?cEpQZndOUGxGYmNab2pYTklLZEZXeHQvY09ic09nNFZJZjBud0ZUK04vZDB0?=
 =?utf-8?B?ZkwrM2c5emxmODcvbDNHKzFRKzZGYXhjNlVpNk93ZjgxZFM4NERkdDJ6dlRp?=
 =?utf-8?B?aloyYVl5MnN2V05ISVVRRkkxbmZzWXpoaDZXeVhCbXo4ZFhjZjVoa2RFbjNi?=
 =?utf-8?B?L0lISjhmYTZTb3FaWTVxTXpRMGZtc0F0L1hTUjFyT0kzdDM1RG1GMkFZYmNl?=
 =?utf-8?B?RjJFK3BlcExXYnp2YnVSUkV2WldJTzRrUmlrWGZsSzkvZHdyNFYyd1RZcktU?=
 =?utf-8?B?NlhJZHBmSXpVNWZGRjRUYmNLQ1FFaXJLL0VGaVpETzExM1Z1TlovYmxJSkls?=
 =?utf-8?B?SnBjeVJEbjVsZG5DYXZzbVFRWTR1aUJkQjdRbXZkbUpUazlqTU4vT3cyYXkx?=
 =?utf-8?B?NTZUY2FvYkVJME5LUjRwKy9hWjNDVFN2MldmS0NqMmtrVEs1VHBWT1NabnBv?=
 =?utf-8?B?aGt1ZUhIb1ZVMkQ5YTFsSUE5WnFyY3ZJYVhaSUxMYytpbDc4U1ZFUGVFVEJp?=
 =?utf-8?B?VGxkb21oczliSnhXQ1hLRlRCalcyTlN1R2NGeEY5RGFIYkxGWHNON2N1NlFu?=
 =?utf-8?B?VlYrUzl3NTVTam9xckloZEZZUDdMVlFzSXB6bTRhVStPZ05QeVliandrWGFM?=
 =?utf-8?B?c3FDdlpiaWwyL3lmdDZXZEdPNnNvRFRVZzZ2V2FDOXA5bTV5ZWRucERlSklk?=
 =?utf-8?B?WWZ2YVB2WmZWUE0yT3V0Qjl4U0xjZ2hoN2x3SDlyZ1JINnhaUjZoUnJZVCtU?=
 =?utf-8?B?THNXOWwvaktuVlFTcVFrUk1ycjVQMjJDTUYxVXFheFVvZnJRZlcraE80TG05?=
 =?utf-8?B?WHA1UENjNVBFT091NjIyaWkwSE1YOXAwQjBvdFhIS3pnejE3cU5DamN4SlBF?=
 =?utf-8?B?VEZTRXhoVXhhaHFjbTJ1TXRTbENYTXdPZkZXSTNMNS92ajNEMlFyUUtocmY5?=
 =?utf-8?B?bDh4T2RJSEV4NGtTWCtFcXZTSndLUHZ1cFhyYng4MGRZUzBXQzJ0ZU5BWkFx?=
 =?utf-8?B?cmQwNzZRR3RVOTN5Z2hZd0ZscjNENmx3eGhhWlEwdXpKL1pObTBMTnlBTFZt?=
 =?utf-8?B?ekZNYXhMSjRyN1F6U2UzYU50dmZ1WHpiUjdTbkNGSVc3eUl0Y2xpOFRKSTBV?=
 =?utf-8?B?QTFGMW8vSTVUVWJsc1lKLzdlVTZkQ09jS1VFZFRtSnNDYW5kYjExWkJuMk8x?=
 =?utf-8?B?TVlsNUNmUWlDWkVDQlFpdHVNRjlsdi9TMWo4cUs0MGczTTJ5dWJFS2hUYjRD?=
 =?utf-8?B?ekxWYURhN3lFRHhSNkZjaEtGdTVjUWV0NFFrSnZNUWhiWE1IeE9TeGY0LzMy?=
 =?utf-8?B?ZG4vYUFsYXVKUDBnU1VrSWsyS1IweEwvcUFVQlhrYWYra0o0bDM3MzZvQVl2?=
 =?utf-8?B?TFRpMmUyRUxsUURWaGJXTVZCckM2ZUtreGg3b0ptT2FUbWJaa1ltaGxMU2hG?=
 =?utf-8?B?SXh6SndDT0RaTFZPT2NDSWI0THdiWnNMaC8xZE1qdDJBUTkyUENHOUt0Wk12?=
 =?utf-8?B?ZFM0ZmtjNVV3WnMyNzBsbTdxczZmekw3SEFsSGZwV0Rha3BYM0NoQzZiOE90?=
 =?utf-8?B?c1h4VmhpbzQxZXlZWEN0aVhhR2l6WlcwbE5EZ09wVUJpdnJIUXlqTWYwcFBj?=
 =?utf-8?Q?SaIoPhJE33RjFz9ss0=3D?=
Content-ID: <5EADC9A32694BE44A81185B0C3DCB510@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4877.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6afb68b-700e-4790-1832-08d92b814511
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 20:00:45.7905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKj7W/tFlN3SiIrRFbY4RLI/+au/i7++8QUbdBLTO4jtuDqOAihdApob/K27st5WLo23RI9lKXIDhvoQmFUr1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_130053_262326_FDB315D9 
X-CRM114-Status: GOOD (  17.94  )
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

SGkgUmljaGFyZA0KDQo+IFdoeSB3b3VsZCB5b3UgYmUgbWFpbnRhaW5pbmcgYW5vdGhlciBkZXNj
cmlwdGlvbj/CoCBZb3VyIGFwcHJvYWNoIGJlbG93IA0KPiB3aXRoIHRoZSBzaW1wbGUgcmVjdXJz
aXZlIGFsZ29yaXRobSBhcHBlYXJzIHRvIGJlIG5vIGRpZmZlcmVudC4NCg0KV2UgaW5pdGlhbGx5
IGNvbnNpZGVyZWQgdG8gZHJvcCBvdXIgdGFibGVzIGNvbXBsZXRlbHkgcmVwbGFjaW5nIGl0IGJ5
IA0KZGVjb2RldHJlZS4NCg0KPg0KPj4gQWxzbyB0aGF0IGRlY29kZXRyZWUgYWxvbmUgd291bGQg
bm90IGFsbG93IHVzIHRvIHByb3Blcmx5IGRpc2Fzc2VtYmx5DQo+PiBjb2RlLCBzdGlsbCByZXF1
aXJpbmcgdG8ga2VlcCB0aGUgaW5pdGlhbCBzdHJ1Y3R1cmUuDQo+DQo+IFdoeSBpcyB0aGF0Pw0K
DQpCeSBkaXNhc3NlbWJseSBJIGFtIHJlZmVycmluZyB0byB0aGUgcHJldHR5LXByaW50IG9mIHRo
ZSBpbnN0cnVjdGlvbnMgDQp3aGVuIHVzaW5nICItZCBpbl9hc20iLiBPdXIgdGFibGVzIGNvbnRh
aW4gaW5mb3JtYXRpb24gZm9yIHByaW50aW5nIGFzIA0KdGhleSBhcmUgdGhlIG9uZXMgdXNlZCBi
eSBiaW50dXRpbHMgYXNzZW1ibGVyLg0KDQo+DQo+IFRoZSBjdXJyZW50IHVzZXMgb2YgZGVjb2Rl
dHJlZSBhcmUgcXVpdGUgY29tcGxleCwgc28gSSBzaW5jZXJlbHkgZG91YnQgDQo+IHRoYXQgaXQg
Y2Fubm90IGRvIHRoZSBqb2IuwqAgWW91J3ZlIGFza2VkIG5vIHF1ZXN0aW9ucywgbm9yIGhhdmUg
eW91IA0KPiBkZXNjcmliZWQgYW55IHByb2JsZW1zIHlvdSBoYXZlIGVuY291bnRlcmVkLg0KDQpU
aGVyZSB3aGVyZSBubyBwcm9ibGVtcyBmcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZiB1bmRlcnN0YW5k
aW5nIHdoYXQgaXQgDQpkaWQgb3IgaG93IHRvIHVzZSBpdC4NCkl0IHdhcyBqdXN0IHRoYXQgYXV0
byBnZW5lcmF0aW5nIG9mIHRoZSBkZWNvZGV0cmVlIHNlZW1lZCBtb3JlIHRoZW4gYSANCnNpbXBs
ZSB0YXNrIGJ1dCBhIHJhdGhlciBlbGFib3JhdGVkIG9uZSwgc2luY2Ugd2UgbmVlZGVkIHRvIGlk
ZW50aWZ5IA0KY29tbW9uIG9wZXJhbmQgc3R5bGUgaW5zdHJ1Y3Rpb25zLCBncm91cCBzaW1pbGFy
IGluc3RydWN0aW9uIGNvbmZsaWN0aW5nIA0KZW5jb2RpbmdzLCBldGMuIEFuZCB3aGVuIGNvbXBh
cmluZyB0byB0aGUgZWFzZSBvZiBhdXRvbWF0aW5nIHRoZSANCmNyZWF0aW9uIG9mIHRoZSBkZWNv
ZGluZyB0cmVlcywgc2VlbWVkIG11Y2ggbW9yZSBjb21wbGV4Lg0KDQo+DQo+IFRoZSBleGFtcGxl
IGlzIG5vdCBlc3BlY2lhbGx5IGVubGlnaHRlbmluZyBiZWNhdXNlIHlvdSBkb24ndCBzaG93IHRo
ZSANCj4gbWFjcm8gZGVmaW5pdGlvbnMsIG9yIHRoZSBleHBhbnNpb24uwqAgSGF2ZSB5b3UgYSBs
aW5rIHRvIGEgZ2l0IHJlcG8gDQo+IHRoYXQgeW91IGNhbiBzaGFyZT8NCkkgZG8gaGF2ZS4gUGxl
YXNlIGFsbG93IG1lIGEgZmV3IGRheXMgdG8gcHJvcGVybHkgY2xlYW4gaXQuIENvbnNpZGVyaW5n
LCANCkkgd2FudGVkIHRvIGdldCB5b3VyIG9waW5pb24gYmVmb3JlIG9mIGEgZ3JlYXRlciBjb21t
aXRtZW50IHRvIHRoZSANCnNvbHV0aW9uLCBpdCBpcyBzdGlsbCBpbiBhIHByb3RvdHlwZSBzdGFn
ZS4NCg0KQ3VwZXJ0aW5vDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
