Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015B2C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:29:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F92B239E5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F92B239E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xhtHGwdCelwDJ5ivflQC3a0l+xVAWxygqy042ApDtrs=; b=WCGLwD8QqAbOX+B4JGRiMpvYr
	bkat6xThOEVrTcDUAex4de+aWKZMyaos6TCj9IYiAJQ74ompFkTwPsKel3mxE8Xoyo+GDWQnf2/qN
	JDQc4Nsc4elaKkf3GT1TYq5KMK9Xn9CLmoVeSBv+0pXcNvaHK8lmqS1PsNh9r/R12cYXBZjgq4VsR
	FkXT2FEVLm8zHFQ8wz4mkT0oIDItfIjoWgEb6Nu7w6ujyF8UkQ3N9ivm8J80XehSi62pC6Eyg+TKW
	JTF2pd0h96uLnTtDrtKAHKdGvf/yjFlyQDXRZWt1Tm468mGOhpFBBap+MsNCbQP1N2Y8kGEqSNy7b
	rtSfxdhZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Wee-0004pQ-Oh; Fri, 15 Jan 2021 21:29:12 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Web-0004oz-4z
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 21:29:10 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A6756C03C8;
 Fri, 15 Jan 2021 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610746144; bh=VhJ1ecgdHe6TBRAHpVQ52cyjUW/CEHBx+dDoKLrHrt0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MkRsCSr5hBayipXQaKOyymAHv9ZdBzNdFyQlj/0ttqq1lEAr+/h3Yt3AgyyTvQGvt
 tF0eVcFHZeVeoqcyL2/s5IcqMOuADh+4Bi92idc6YwQOgfocXezeNXfRKfkQ8UgnJ0
 DxIpbOltpbZIKpY7cZ+scXkx8WuCdBaQSavf1SChMtOLb5KF9ZmNNqScBNKJE8Bhp7
 0vJEtsOj/ijgjLle3Fh415jaKl8S3ETp+D0uBpp1X0YoicY6xal9BSBcgZno7LCvh+
 j0DjAj+kuu9oAPyxLVzy4fVQ2zoPkcoRkyDW4RXQ5fsAOFBOcs0m0XFc81q1eP4Jq3
 29eHx5u6XqkDw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 09382A0083;
 Fri, 15 Jan 2021 21:29:02 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 63B984009D;
 Fri, 15 Jan 2021 21:29:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="m0JTNP7I";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0JVzUJj2bjiRoBHeyxX2cG5GQm4BzkPX5A8uQZWWWC1glC/I/GomxcvEnMfAg61rRLOfperPbpZUFgcogBEF2FnS69YUBKoUf4KCX683CdItt0vpg3prcbKPNF53f82m2DDyX7s9lt1hyDr0Mi3RwkYC/lve/A77MK1x1pAoeuyTozlPhd59By0kPgdRPtsN/3nZk9JlvGlX7rAHmrfefC0z58NlNxmcQbv4sTnKxo+flzc0NqQyqSXv9vNXch93Hd4T3z6CD17XdDiWjOon3aM4G+2ZvFH8ZDjmAHuZdynOTyh3DkPxGJPbQVhcQTWCgOvidf51BMPfEdiv7jPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhJ1ecgdHe6TBRAHpVQ52cyjUW/CEHBx+dDoKLrHrt0=;
 b=aJk9r9uGrHyvwVLJ8d4W9uGIX4u59vQgIt3BY2CkB7IbKVBuFH1fhEnyGLtB3qNblBvTZpPgzxPxoEP9zcnnh9IqRj0qVz8qm3ciwrsx/FZe4kofrwGbLHV7fvMaV1AKE+djtTCo8Wy7ys7TjlyCY6ZNq4I6l3kW51pbm/F1zqUwPBTLugN+CzZqW/cSVcc+ioixdfJuGP+u7TTeeGAfBmPKp1kAc/o+60JGixJ0xVEij6dHk26gWUYesdtsjtU/mOiUfAz2pjKQaQfXttHPKnAILDq2CrqwTjAMEkNLMJ6uGN1uXf/YZpeWE++RxOwxUqnv7/zprpjazAvathIv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhJ1ecgdHe6TBRAHpVQ52cyjUW/CEHBx+dDoKLrHrt0=;
 b=m0JTNP7I0wdI3vokNMO41XTOSBCo0VYHWSIAyxRFJTnuzwZ9Svt+l8L6IYDYI1gNVZDtL6ZWlDslY2UEWAX1eZgVw9s6UpADgsYbq8lHEFTq1JMp89ce3oMMms1hZX1TyqlqXwadFaTiG0ASJ911tbN3mlISCabIGA3RlLmRquk=
Received: from CY4PR12MB1575.namprd12.prod.outlook.com (2603:10b6:910:f::23)
 by CY4PR12MB1879.namprd12.prod.outlook.com (2603:10b6:903:125::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 21:28:59 +0000
Received: from CY4PR12MB1575.namprd12.prod.outlook.com
 ([fe80::e91b:5623:997:85ce]) by CY4PR12MB1575.namprd12.prod.outlook.com
 ([fe80::e91b:5623:997:85ce%8]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 21:28:58 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHWuEZD0FxPtP+NfEObzHmOxTgva6ni4y6AgEa3PoA=
Date: Fri, 15 Jan 2021 21:28:58 +0000
Message-ID: <c1e9d63a-ee10-5a85-57d2-3c4ad2a86980@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
In-Reply-To: <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [62.195.180.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64035f50-f3e9-4a7a-5137-08d8b99c9211
x-ms-traffictypediagnostic: CY4PR12MB1879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB187929C4173C69D5164D3DC3A6A70@CY4PR12MB1879.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qglTaHxhoeQZ4yFWpQ/LED2k5og8HipAQgROFkHld4TWAv+E0Dy7lO7i/tBJxajnG8G9LxT97PdcuX2hyKJWg14N8P5eI1B4ONa/xZe8+m+LbTarIdZYFHJzLB+D3Ux2oKhoUVO/A7MeK9awzXJT2qIDAOR+FmczBTG5uJaLvie5MCAqFhkirnJ3hggmOjWI/Q0vH/0FMVRxqy2FktD7wa5FRP0YAlj4s9l6Uug9RzeYUpSSQt7Ejkms0bXno2pkDe1YU99InfO96P4vJ0i+987tCFfFjzrKt+3+KhAvPCe0O6CRjfZHQjyPpPApy7rrcYR3tIZmcXLA/exmhfzjj8VrBQaXs8+OPNSaOhgAYgHA/UjJUM0ZBRRHd3z+mrJL4qdV9hN+7FX32UYX5qUHUIR/dgOruBNAxXWZfLpavxbEjqXp5+GBjghFBEae5FbqnNZ/iujV0FmpywAt0wqZQOXoVSqFLS7WUGO7nuXzCAIUqaJf8uyQcglUDcFFUeAiaX7cphIoqm/9QFzokqHSJvnZwbi2+Cz0gzMyllTBPkW93Tc4BzPg/V/6RyFfld59hjFXBxwqx58+Az9PZFfUgfXaNISGFa8ks5mOOKpa9VUBC9aj/Cg64ZQDafGpajB4UpLyPU+KCUCwNIkJecDTVN6kfeFw7IBzViUUAKI9PFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1575.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(136003)(39860400002)(376002)(8676002)(66446008)(31696002)(6486002)(110136005)(2616005)(8936002)(64756008)(86362001)(107886003)(71200400001)(76116006)(66946007)(31686004)(5660300002)(91956017)(966005)(66556008)(186003)(2906002)(26005)(478600001)(4326008)(6512007)(316002)(36756003)(66476007)(53546011)(6506007)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y2I1cnhKTU1TaTVjUXFHMjgzSWF6d0ZYNzNIV0YrdXBnQmI1enlJRGt5Y2FR?=
 =?utf-8?B?V2Y4RUVJaHlwZkRZd04rSERQcFNIR0o0RFFYQzZYK2tsS2U5Q3QrWU1TVnhY?=
 =?utf-8?B?aFNRNlZ1OWVaYWU5b3Q2aVJUbjBFbnAwR1J5amhPamxvWS8zSUdIS01maksy?=
 =?utf-8?B?cTBBUkdrYzZoZFM5bjJVN01GdTUzZkdLUGhYaStIZXhwZUF0NWhjajFadGNC?=
 =?utf-8?B?dnBpT0owYkhSaWo5azl5amtVOFZ1Nm1jUlJnOEppT2gvQ2pjVWZuYzFzZzNY?=
 =?utf-8?B?Q1VuSXphbWcvZ1F6b2U1aHdmeDZWME9tdUhpMDhBeHk0UGVYS0JKSnM5Tm5m?=
 =?utf-8?B?TTFmVVlFSTVaS2FUa29tQkxqV3hMSVJrZmR0dGdwQ2d4dmdrL05VOGFoRkJI?=
 =?utf-8?B?Mk56eEIyU3ZzcjJ1OUc5UEVrSUNicHhGZHBxdFJrRkdYYjd1dkxrK3pFZXpP?=
 =?utf-8?B?NTBLRlhBYyttdHhBeUtMWnQzbVJmTlRUcWQvdWlBZWJsLzZUV3AxWmZTT0JK?=
 =?utf-8?B?S1dFU0RuRWRKdlNRaFdLL1Awa1pPRFl3b0gzRHpDcUJDNlkrcENsakRpNUc2?=
 =?utf-8?B?Qk9OL1ZhTGhoZ05JOHJLV0ttb0lnYlROcVRSb0xTR0cvUnhyeWxYSFMweUZG?=
 =?utf-8?B?dFNpMHNqUmNIWHljWE44Y2JDdXRyYmFuc2o3WUtibktvN04vREczYVNEYTdj?=
 =?utf-8?B?U2RuM3JTNTNYSHpIRENleERBQmpBK25UOTM5K3BtaG84RG5KVUt3UnQvRUNX?=
 =?utf-8?B?UWFPUzd0a25EMlFXUklpSEgybXlHZ211NVRPOUxZdjVMWlFrMUk1WnJXMFZE?=
 =?utf-8?B?dmVmakN4aGs2ZXM0dGJMRDkxU3BuYVNHdk5SbmxHUDh5VkJ5clRuSlZSNGFF?=
 =?utf-8?B?S3MzYzB1blV0b2gxTExrUFhLMEl3KzZuSzBVa1A3amNXbXNYbk1ROXJzdExJ?=
 =?utf-8?B?Z28vZjFUS0ZRbGc4NGV0dzZPeWh2NiswdzN0dklWRm5kRldvUkpQdW4xZXNh?=
 =?utf-8?B?aWNqbFBQTDBsMlRZL0U3TmYyRHowK0tJZFppZXhMbm04VFl6QTRLUWJ1ajU4?=
 =?utf-8?B?VkxJcjUvU1VrVy9HOTlmOG9iaXQ1YXdlb1VybjJaQXdZZ2RsdHREbG5aMFBl?=
 =?utf-8?B?SkJMaXE0S1NyU2RlN3VReW8rSUt1QVBwUnpPYkF3aVJ3ZmQxczRsbE54aGli?=
 =?utf-8?B?WWF2dVF1OVZUL3p3VFdPZjBCLzdhR3N5T0ZYWTJIampGS0FSYXppR1E5d2oz?=
 =?utf-8?B?ZFNnb25ZcXNkSTZ6c0Q3K2Q3cGM3WExTOURhQU9YK2RKSnlQcUJUK2g4RWFl?=
 =?utf-8?Q?lwzOQFZBq6qWY=3D?=
Content-ID: <91B64891FDD7854B94C2E2D5808699A0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64035f50-f3e9-4a7a-5137-08d8b99c9211
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 21:28:58.8600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hu5L2JS3jyst3jkGb7JN4npGuNEuYiRio8Wqr9TZonbNlb5tj6IUlmR+BkSjhHBl/LRDcEND/IVGWQJL7jpBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_162909_687035_63D422D0 
X-CRM114-Status: GOOD (  21.34  )
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
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Richard,

On 12/1/20 10:35 PM, Richard Henderson wrote:
> On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
>> From: Cupertino Miranda <cmiranda@synopsys.com>
>> +void helper_enter(CPUARCState *env, uint32_t u6)
>> +{
>> +    /* nothing to do? then bye-bye! */
>> +    if (!u6) {
>> +        return;
>> +    }
>> +
>> +    uint8_t regs       = u6 & 0x0f; /* u[3:0] determines registers to save */
>> +    bool    save_fp    = u6 & 0x10; /* u[4] indicates if fp must be saved  */
>> +    bool    save_blink = u6 & 0x20; /* u[5] indicates saving of blink      */
>> +    uint8_t stack_size = 4 * (regs + save_fp + save_blink);
>> +
>> +    /* number of regs to be saved must be sane */
>> +    check_enter_leave_nr_regs(env, regs, GETPC());
> 
> Both of these checks could be translate time.
> 
>> +    /* this cannot be executed in a delay/execution slot */
>> +    check_delay_or_execution_slot(env, GETPC());
> 
> As could this.
> 
>> +    /* stack must be a multiple of 4 (32 bit aligned) */
>> +    check_addr_is_word_aligned(env, CPU_SP(env) - stack_size, GETPC());
>> +
>> +    uint32_t tmp_sp = CPU_SP(env);
>> +
>> +    if (save_fp) {
>> +        tmp_sp -= 4;
>> +        cpu_stl_data(env, tmp_sp, CPU_FP(env));
>> +    }
> 
> And what if these stores raise an exception?  I doubt you're going to get an
> exception at the correct pc.

I've added a few bad-weather test cases [1] and they work as expected. Indeed,
none of those tests trigger an exception during the "cpu_stl_data()". Could you
elaborate why you think the PC might be incorrect? Then I can add the corresponding
tests and fix the behavior.

[1]
https://github.com/foss-for-synopsys-dwc-arc-processors/qemu/blob/master/tests/tcg/arc/check_enter_leave.S#L227

> 5-10 tcg opcodes is the rule of thumb.  A conditional exception (requiring a
> branch) is a good reason to put the whole thing out of line.
> 
> In the case of enter or leave, this is one load/store plus one addition,
> followed by a branch.  All of which is encoded as fields in the instruction.
> Extremely simple.

You're suggesting that "enter/leave" should use TCG opcodes instead of helpers? If yes,
do you really think it is possible to implement each with ~10 opcodes?

-- 
Shahab
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
