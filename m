Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3DAC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF86239EE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF86239EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fx++REYkQQEU03U9rxVdgf6EpykYUn98E9u6Cte331Q=; b=K9/F4sgwg4Oh9VuFzEvnSZlgp
	f+07GL0t0cFKESlDyE43SF9WHp88hiB8jhBZTElPMO2lJhadTpuBP6Mr1kN/xUoONFg+9YNZYhkf2
	iuv2x9E8+C/YEk4OfkwaHVD9X026CJBiahTHVEoXaXjGCHTyjxJOjjpTnpvAFeeDcsUIIHpTcy7km
	xSWP9z2CX8YvOre755QzWsM5dsjxIeL1u9DKGKuP7Yu4V7Sajry+Zz05LvYzlw2b+13Lm8cr+rgAg
	m3RByEkbKNY9HWUlmho8/T+d7Sr51DLDyUy3QmUabzPC3cXrWAXLrGaGYGTRGrhKmmC8ApsCqMoe+
	khpgI4oxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0WnX-0005OF-M9; Fri, 15 Jan 2021 21:38:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0WnU-0005NJ-UY
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 21:38:22 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 51CBAC03CB;
 Fri, 15 Jan 2021 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610746699; bh=MbHmtCDszqs5W9HQILHMv0m1kG+rkLAUniyBRDkJsZs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RzkPeDhwjZQHDZOar1Hcnz/hqtGrS7mPIbthC3d4v//R3imvaK7jLbHl+HsH7P8si
 RL3EJMfHv459zE/YDK47SxoeC2cF8l1aUqT8G2O0baOk2+xAS/YmhYkLwpM5Rhx7R/
 UxsP1rkyknIViT83AxvV8tvmCvtY24uxkCXcT4w5Hh8lFQlI81wDIeONgNBICHJj7a
 PbrzJWwKoQLuax2MvMnHDROUk4s2PHZJjBAUUsxcuYe3Rl92kX6zixfh+KzPdbNdrG
 EevB1d/wmvsmoCTvSRf+RsNFzL2+w99bwHvWsUApFlcP3m4LfEuYqY/5Q0ka5wZugt
 6kFTyqJoId+Dg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 80183A006F;
 Fri, 15 Jan 2021 21:38:17 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2059.outbound.protection.outlook.com [104.47.46.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A46484004A;
 Fri, 15 Jan 2021 21:38:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mvdg3Qxs";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzZ3v959/TXRat3G3Ydxax1bWy9f8JWltFlQTjSifgOqyRhhe+1FxkzdvNw/tHK4tB0DZuXDfmfoOlBsMFEZNBGpN0qX4kpGBywDy3sl0WM2bG2YOqZIIZe61uNgQsZjj7HS8U7WO4HzP8gj9nWkoFXUceMxvNFKBJZurReFbjw0YWxWBJWg3RnwevzYsW5kTXbelG5oqpKBmjHccVPSv8Wmj6BLaAIOctz8daSP9CFv6691xONB3ySb8TypwexB+ktewrpbYDkRLf8lfXSbk7/J/ONPrTMt8AszBqTJIBI+lJrKFyPAEycObMFf3zox5FZ6mfYcxSoVnxq7EOYvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbHmtCDszqs5W9HQILHMv0m1kG+rkLAUniyBRDkJsZs=;
 b=l+GugoPJuc7OlZ9wIZ7WS7rQEP19Quh/x8ER28yLIkXEmAQAn3OCd/+7NSGYKaa1two7sz3+z/o2lmmKGDdWBmN4xMb1w9t64ADCmDPVkrM9iddXZEEro1SLcu2ugT640ka5UgfRk6JE6YsapcMdv6OinUm+3fLVfc11zvxTktUwwb8izm3u+pVvKMKpWRExTsOVTDNopfMoHNoPOPTvgI+FyZSHzWgF0L3T4MMIwC1Zfahuw9xOFgU0hXSd4qesxVgzwCZH87PnP5yUYEd0SrEz33sx/j5CYszE0wJ3K1N2WosYZ/b9pATp3gXU8yEBmu2i2u/+UYi91777+v1EBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbHmtCDszqs5W9HQILHMv0m1kG+rkLAUniyBRDkJsZs=;
 b=mvdg3Qxs7h6RDgseN7LxatG/Gi9EhNYWkowa5U+DNoo0QGp/PC2zXPxEvYxhV7iHxT0/2Kzxc/mktCl85inDu4tDHWsiHfIxAzaRbyPOhrTMvWTN1BcxP7k3xm0+Ow3gkrCEVULHV21ylruaAVZDzblNJ6clMQyRv13c3PV9h/A=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Fri, 15 Jan
 2021 21:38:13 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 21:38:13 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Topic: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Index: AQHW62F5Yc1XOx1vqESeY83yqPhwtA==
Date: Fri, 15 Jan 2021 21:38:13 +0000
Message-ID: <55f04719-98f2-aef8-e4c7-10e162d79fd7@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-6-cupertinomiranda@gmail.com>
 <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
 <9a9183ca-fd2c-9d57-b283-cf06dbac23cb@synopsys.com>
 <983f948f-dcf8-74f7-71b8-b613b8490fc7@linaro.org>
In-Reply-To: <983f948f-dcf8-74f7-71b8-b613b8490fc7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e51850f-409f-434f-4ac8-08d8b99ddc85
x-ms-traffictypediagnostic: MN2PR12MB4582:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4582E86CD55774D13BF44D1EA8A70@MN2PR12MB4582.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zXinXHID6nocd1PoGhMO/y+PGhMKALKHaw9K2VT8F+/jutrsmrdeHD2e4tBMKPd+rfTb9P+K8Qz/c2sMkCGU1Q8sp42PhmeWxOftxyE3wd+pROeO6ty9Xj5Pbe/L8oib3zDRxaU3mezwWTkalHTq6WK5cxbtg0BoXxvEbTLdmq0fKLFG9dSMvPekXB9NMatSWwDx+S5lCiCJLvBTupzipl3IkY+6ESJgBo50/JWPnLSrsJOxDndTAKJMwpoFnq6OsaPWAtL1p3Tqoy0xzwZ/2Qisms7vcb6W/cHThXGuwlO6M8u0/MLfWjV3OsG2toYUrFq0GvKUNsQIuIZdVM9xLgmFD8mTk5hMgMGZ8NLNpZx7iG7lTa/oP/fMiP1u3fDQ5SEZ0F/LJ9NH8xDYo3O0GdUSRRWU/sQY1UtE+HpbiAoKoOoIFvlfifjH7GnHxpBfx3agGKTUvXgjQPrFpExjwxKxz3EsgheGNaMXbtJ48saUg3LMfBp82wry4t6mbjjajduV0S3sjgPVmUoxHmFEGdUGgsZJkJ6sfAjxrkssMaPCy2II+gsdHvx3Pvsh6pECExKTuNN6G7kxZvlbN67xqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(346002)(376002)(396003)(366004)(64756008)(26005)(107886003)(4326008)(36756003)(186003)(66446008)(6512007)(66556008)(53546011)(2906002)(66946007)(110136005)(2616005)(91956017)(478600001)(8936002)(5660300002)(76116006)(31686004)(83380400001)(66476007)(6486002)(71200400001)(54906003)(8676002)(316002)(6506007)(31696002)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZURJRDZNZzg1N0xiRlhhOC9nVC9TNENZZGpaUHVLSVBPYU5wL2U3Q25PaENH?=
 =?utf-8?B?aCtzYTczSEk0dERGQWI5TE16dTFwbkZWTW52ZVNZekdNajRaWGh4Q1BUWmpk?=
 =?utf-8?B?S3BVVjdINFc1Lyt5cThYeFM3L01Rcld5Z2RiR082c2ZObkprc2ovZEpta2FG?=
 =?utf-8?B?Z2xhS3NWSTV0c0dNRXlKV0tucWJKVGx1SkRlRFhDZzRTSXVMOXR3WG9UcW5a?=
 =?utf-8?B?bkMwd3NmL3NxUnhvVjJUYkhtNjBiTlQ4L2JsWlFnaHNXUW9hZXlOL1ZYL1J0?=
 =?utf-8?B?enBxVTlwNEZhZGxJSFdZNTRaZTBPZklCUGlMWERkZk1KSk5DZEFEZGw5NGt4?=
 =?utf-8?B?NFJvVENzVlhnbW1KL1EyWFdKdERtcTJPN1FvZXV5VGxVbzA0dG9jR0psUmpI?=
 =?utf-8?B?Vld5dTh2eHIzL1R3TnJUL3NQVTQvRnlXdlU3RFZRV2tkR3dxbjhnSXp2aFVz?=
 =?utf-8?B?cTVROWg0YjltZ0FtTGZvUVpIdWliVVlpZFdSNEtIMnBWY3VyV3JwVE5aeGFY?=
 =?utf-8?B?SGZDTFUySHlwa2JYdi83UzFNODJWZTVXZW1uNDNIR3BWNFpiZHhzaFN6SkVv?=
 =?utf-8?B?d2xSRzRCQU1pTFhyYU5ZZ010WTdKY0dWbnJhek1CbUdBcXNJVFo1ZkdRdzdq?=
 =?utf-8?B?cEtlRVdsNXpkanBRV3JwOW44WnJEYlJSZ1FEVjRLUmVJYjd2eHNtNGpLQWxW?=
 =?utf-8?B?aXVHSDZDRkYzNGR5ZnNJSEE5K29rSllLU2RvWm11ZTVHTzNMUEdWMFZrTE9r?=
 =?utf-8?B?MFdQQjEraGZEdEFOb1ZPYTR5S3lvZ0FmYVZ1ZGRQdVVpRUVIWVpRTzE2NUxi?=
 =?utf-8?B?NTJFQmd4cis2eHdET3VmQVRYeWRCM2dyUVBJVkcrL0Y3eE02MndhL2FZZ01u?=
 =?utf-8?B?azc0M241Ujg4bFVpNDd6dERXYmZodW95bG5LZU1SV2piUFhZQ2s3eGs4OG12?=
 =?utf-8?B?VkU5QmFTYmpNSFF6MDVhNzhKdVBXWCtOaXdWQ2IzQnVKVDVSZ0ZTU3RRNEMr?=
 =?utf-8?B?eS9mZUFRL1IrM3VjaFo1M1hOQnVFM3NhcFc1Ni9YWGJxeGJZK3FnbkQ3ZkFk?=
 =?utf-8?B?QUwwZ281OWNDSUMvSzJqT1VCbUpLWCs1Mm1ZZnNKdFlPeDhSY0k4OXZ1SHdY?=
 =?utf-8?B?RzA3VXdaZUNuRGdUY1ZnalJqejJhNTI4WUZCMENDcS8xaW1JK09QQXo3aVFv?=
 =?utf-8?B?Qkc3K2tQcjhIaUdKSFFHaUw2aTRJTzh4TlBBMmU2MVhIRG55bWl1Z3Mxdmpn?=
 =?utf-8?B?MU5MMG9WU3JZTFFxZ3krNm81K0Y2SlI5eCs3NmZUV0NIZGR2WjY3UmJTTlpC?=
 =?utf-8?Q?8mN2sGxWLmLHs=3D?=
Content-ID: <B442F9A57960AF48B1805D7DCCE9E26D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e51850f-409f-434f-4ac8-08d8b99ddc85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 21:38:13.3003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bs7xBgJQje1VbUQwR0g1mcmJusOdmHLpQJ6p5qUaKHK3nNwOUB1TuLgxH4r1V210Xa1yJpYOUVsCDEE7im+I+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_163821_394487_C3B720A3 
X-CRM114-Status: GOOD (  26.13  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Thanks for your quick reply.

On 1/15/21 8:17 PM, Richard Henderson wrote:
> On 1/15/21 7:11 AM, Cupertino Miranda wrote:
>>> On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
>>>> +/*
>>>> + * The macro to add boiler plate code for conditional execution.
>>>> + * It will add tcg_gen codes only if there is a condition to
>>>> + * be checked (ctx->insn.cc != 0). This macro assumes that there
>>>> + * is a "ctx" variable of type "DisasCtxt *" in context. Remember
>>>> + * to pair it with CC_EPILOGUE macro.
>>>> + */
>>>> +#define CC_PROLOGUE                                   \
>>>> +  TCGv cc = tcg_temp_local_new();                     \
>>>> +  TCGLabel *done = gen_new_label();                   \
>>>> +  do {                                                \
>>>> +    if (ctx->insn.cc) {                               \
>>>> +        arc_gen_verifyCCFlag(ctx, cc);                \
>>>> +        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done); \
>>>> +    }                                                 \
>>>> +  } while (0)
>>>> +
>>>> +/*
>>>> + * The finishing counter part of CC_PROLUGE. This is supposed
>>>> + * to be put at the end of the function using it.
>>>> + */
>>>> +#define CC_EPILOGUE          \
>>>> +    if (ctx->insn.cc) {      \
>>>> +        gen_set_label(done); \
>>>> +    }                        \
>>>> +    tcg_temp_free(cc)
>>>
>>> Why would this need to be boiler-plate?  Why would this not simply exist in
>>> exactly one location?
>>>
>>> You don't need a tcg_temp_local_new, because the cc value is not used past the
>>> branch.  You should free the temp immediately after the branch.
>>>
>>
>> I wonder if what you thought was to move those macros to functions and
>> call it when CC_PROLOGUE and CC_EPILOGUE are used.
>> I think the macros were choosen due to the sharing of the 'cc' and
>> 'done' variables in both CC_PROLOGUE AND CC_EPILOGUE.
> 
> I meant that the checking of ctx->insn.cc could be done at a higher level, so
> that this code existed in exactly one place, not scattered between all of the
> different instructions.
> 
> But if that isn't possible for some reason, you can certainly put "done" into
> the DisasContext so that you can have to functions cc_prologue(ctx) and
> cc_epilogue(ctx).
> 
> 
>>>> +void gen_goto_tb(DisasContext *ctx, int n, TCGv dest)
>>>> +{
>>>> +    tcg_gen_mov_tl(cpu_pc, dest);
>>>> +    tcg_gen_andi_tl(cpu_pcl, dest, 0xfffffffc);
>>>> +    if (ctx->base.singlestep_enabled) {
>>>> +        gen_helper_debug(cpu_env);
>>>> +    }
>>>> +    tcg_gen_exit_tb(NULL, 0);
>>>
>>> Missing else.  This is dead code for single-step.
>> Goes a little above my knowledge of QEMU internals to be honest.
>> Do you have a recommendation what we should be doing here ?
> 
> Both of these actions end the TB, so:
> 
>    if (ctx->base.singlestep_enabled) {
>      gen_helper_debug(cpu_env);
>    } else {
>      tcg_gen_exit_tb(NULL, 0);
>    }
> 
Clear !!! :-)

>>> You could put all of these into a const static table.
>> What do you mean, can we make the effect of tcg_global_mem_new_i32 as
>> constant ?
> 
> No, I mean all of the data that is passed to tcg_global_mem_new.  See for
> instance target/sparc/translate.c, sparc_tcg_init().
Clear.
> 
> 
>>>> +static void init_constants(void)
>>>> +{
>>>> +#define SEMANTIC_FUNCTION(...)
>>>> +#define MAPPING(...)
>>>> +#define CONSTANT(NAME, MNEMONIC, OP_NUM, VALUE) \
>>>> +  add_constant_operand(MAP_##MNEMONIC##_##NAME, OP_NUM, VALUE);
>>>> +#include "target/arc/semfunc_mapping.def"
>>>> +#include "target/arc/extra_mapping.def"
>>>> +#undef MAPPING
>>>> +#undef CONSTANT
>>>> +#undef SEMANTIC_FUNCTION
>>>> +}
>>>
>>> Ew.  Yet another thing that can be done at build time.
>> As far as I remember it, there was no way I could generate this table
>> using the C pre-processor. Do you suggest to make this table using an
>> external tool ?
> 
> I assumed that you could just as easily generate a table using the c
> preprocessor as this function.  I guess I'd like to know more about why you
> can't...

To be fair, it would be possible but not so economical.
This would actually be a 2 dimensional table of size ((NAME * MNEMONIC) 
x (3)). 3 is the assumed maximum operand size.

In order to minimize wasted space the second dimension was implemented 
as a linked list.
Considering also this the entries in the table would also need to be of 
type struct, as we needed to mark somehow the entries that did not 
define a CONSTANT.

Please notice there are only 16 entries of this CONSTANT macro, making 
this initialization negligible.

> 
>>>> +            int32_t limm = operand.value;
>>>> +            if (operand.type & ARC_OPERAND_LIMM) {
>>>> +                limm = ctx->insn.limm;
>>>> +                tcg_gen_movi_tl(cpu_limm, limm);
>>>> +                ret = cpu_r[62];
>>>> +            } else {
>>>> +                ret = tcg_const_local_i32(limm);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +  return ret;
>>>
>>> Why are you using locals for everything?  Is it because you have no proper
>>> control over your use of branching?
>>
>> Initially we though locals the good way to define temporaries. :-(
>> What should be the best ? We will need to change a lot of code for this.
> 
> TCG is a poor optimizer.  If you can at all avoid branches, while implementing
> a single instruction, do so.  Because this means that you can use
> tcg_temp_new_i32 (et al) which are "normal" temps, and are not spilled to the
> stack at the end of the BB.
> 
> This does not necessarily apply to conditional execution (cc_prologue, et al)
> because you can think of those as "outside" of the instruction, merely wrapping
> them.  The actual live temps will be "inside" and not live past the done label.

Maybe I will need to make my tcg code generator aware of this in order 
to properly create temps.

>>>> +/* Return from exception. */
>>>> +static void gen_rtie(DisasContext *ctx)
>>>> +{
>>>> +    tcg_gen_movi_tl(cpu_pc, ctx->cpc);
>>>> +    gen_helper_rtie(cpu_env);
>>>> +    tcg_gen_mov_tl(cpu_pc, cpu_pcl);
>>>> +    gen_goto_tb(ctx, 1, cpu_pc);
>>>> +}
>>>
>>> You must return to the main loop here, not goto_tb.  You must return to the
>>> main loop every time your interrupt mask changes, so that pending interrupts
>>> may be accepted.
>>>
>> "gen_goto_tb" calls in the end "tcg_gen_exit_tb(NULL, 0)", is it not the
>> same ?
> 
> No.  Because gen_goto_tb uses tcg_gen_goto_tb, which ends the TB right there.
> Another instance of the "else" bug above.
> 
>> We need to investigate this implementation further. A quick change to
>> gen_rtie broke linux booting.
>> Can you recomend some target that implements the loop exit on rtie as
>> you suggest ?
> 
> target/riscv/ -- see trans_mret() and exit_tb().
Clear.
> 
> 
> r~
> 
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
