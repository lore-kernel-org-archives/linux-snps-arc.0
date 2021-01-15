Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F144C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 17:11:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050172333E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050172333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+/CXLPw/IcETVdgRXaNAemgxMKaPE1nYtb42N3eRWYo=; b=nYsNVdNYPGxOoVrzBNsaeGCLY
	c2/qvURKc/NY34SvE1AQZYZiUOILm02i86SIYs5jKMnIppXelJwXHKdD3HuBJdMx4K1L0nClknSSG
	X31QwmfVv9Y7NAH1PlqFrt/yx7AtRYC6v8i/TkB3as9Pe+soRd8glUptQCqAvb41VKGlGQ/6I+DhP
	UeT3jo555SYwbokB6pvwdsm7eKvim5GzV8RybnA9WCAhhQqXo3SDNph/lox3tBdZSns1TiGZf8s2E
	JWmmRDY8HBneKDKrvJvz9/OGd9qjxUhXMRG0CfnDwJPECukJa0oz86kkjc7fosxFEYU/nZ87zRRyZ
	5mnwQFKNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Sdd-00022Q-8G; Fri, 15 Jan 2021 17:11:53 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SdZ-00021C-Kg
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 17:11:51 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E715DC0AE0;
 Fri, 15 Jan 2021 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730708; bh=imeNIWzsx85gbZSkZ/vAg54TMabwqaEC5iSIk8i0/As=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=XUDss0mKmGqb9noOAjAv6Kb8IaWRhQPrELCQ9r/PqEi7CiZDBTLrdzjqjtXLWR1Iw
 uiLR99ZBh2ut/Z+oSHL4DnW2dk7Bkk91oqE6ACtyBVbTVIbHAp3T3MUAr8iHuWgWKY
 FZ0iAXpgyLW3hy+/RZqGb2jFpOzphlxekjtZ/NjswR0Fuc30l+9TWNhtZ4g4Wd8Edn
 tX484Py3gcrihmY2eF5k3AGde5cSAkIW+1yQvM7LkfsBo3bRP+Ng3bdR4474oY7cpm
 F85+Z2GRgudfVCMjHsjLOlnhwxXa47uC1Erxtv/yyrHZ2MBbQ+QY6G9DZHuBaBljIM
 B5GWC4W3+PBaQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CF5C1A0081;
 Fri, 15 Jan 2021 17:11:46 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 28168400E5;
 Fri, 15 Jan 2021 17:11:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="PtyO60YO";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvopRVNeuUU97dyFzeJxcfJOOoEyjxEFm/vJZbcO+2v07AQMCogNzOaExTR4wrJkYfoxCyRS4ISjxbRpq13NtbbIP4Ee93WY/6B+KE1RojDRv9H+t5/cox2MbCHI+0C8CbG0oQ4dsdmC40omnfE/98wDBJLVUuiDty1EKH2B4sNkxl8CyUXswowoDmZhSPoY3jUu5HZ7pGMVrAZZ9nZc7Q5p1aw3zC/UfSgQIRBCRmsGYyN1F7DirdOJLJqOlQBpPoBXeU7eiIT/pXYOaMUl26B3J5KGlROT7qv+Ls6h7A9RJYv9W5zRlvCzIz/Wb9r6kddGIYU2yuV6YEZrXCyEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imeNIWzsx85gbZSkZ/vAg54TMabwqaEC5iSIk8i0/As=;
 b=NBxkAIbfJxdIWUUTzYzAeHgqghBmMfUDz2nBczGJc0Ivfp3s3JC41i2/FZSSXZgYWwLiC+c0/UYqNvxq+bAgPkbWY8Tj5HgWDAjwuCWlMe+TvuYFtT/f1l7s+Mn/72CFo++0ECj1d5tpoinNEKN04EzUlxJXljqimFqrYmiPgquJQ441P2a93Anhhr5pbfYQg/uKZMYDajjRx7zvSg9oM9zZfJea+06jsZ11MPXPp+z+1baszXmBiR++ISR6SfAe3fIKUjBv8pipd3JkTIM76xVplkqFDanHnsyw6DkSwsJhWMm7VjaQgIP7f/0FQGYDg/4/uOkRPSTxbc9ocx8M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imeNIWzsx85gbZSkZ/vAg54TMabwqaEC5iSIk8i0/As=;
 b=PtyO60YOg6XpSHhQWEkuRFnKRHIQrtbo3DeGt7dd1kBvrPlJ9aFS+uCbd+gilSOsC/ewr+eQypOgYkkyfgnqrWdmgZzxoMwktKWNv5Ak63f54XzRjKPdMtBMrhXobWItjxnBv18ZXwbkYqDJm74qPz1SPrfk6FfG+ELj/Fi1hw0=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:42 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:42 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
Thread-Topic: [PATCH 06/15] arc: TCG instruction definitions
Thread-Index: AQHW62F+62W6I5BiBE28WvxaANyyWg==
Date: Fri, 15 Jan 2021 17:11:42 +0000
Message-ID: <13d2fe20-35dc-a47b-c7bb-8ce049119e3b@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
In-Reply-To: <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e659cc71-26f8-41f4-8b2c-08d8b978a177
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4176F1AF90D24D6449E28A8AA8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Jrx31jv04k62nWZkPaQfIY0e5ypjcQ+qHzuUyaj6aRg8A0JsaE93Gr4RHBXQO2k3TJs21WPN+FfMjRSrvgaD3q0JkPao2RWikq1kGydvtqTeMEq3dmxXKVS209V0XMThQaijSW7VbNv6uUcUWMHguh9GKf/3JNICumBvA6UMEn1GTHFvWCjV2Ly10qoW12xUuIB53i8GJQEbeolfcEj9hTTF3Fm3FjrocsLwru1z5ipGMGC22yNslub4KzbeT9pwm7DXUrup418bskOzBJVqspiZVYH1FKGZFzhuvMjViCDgqg1iT+0ZTofYKzUbgJwq0YRC4gWt45QkVLS7DpAHai2RX9IHG/xJiByv0q2zPxAal29OGnA8J7vWnDAh8KTJ5ZkYc0k3K2jhOuG4Q+Bsebt51MEK2pg+XJX9KZBoLWDov4cUx3GkPlqPspNeozohuuJBTUYWm3EdW1D9/oBUemhqGrlaLFxsIwPCUOvgGrmqgKzc2zdDO5sspQ2QHvC8+dOjJD1hnO4OmjaxPXxLAP56kFMetRNtfMVtaxuNm3687J6qzjJ/8/67qYtpJVAuWCGpVoF5wThRKS4UMGRvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UG5LVGg2bUZUdkRHakRrWDlVZjd4UHpwRDRRNEF5NVdxWi82ZFlvL1hkekVj?=
 =?utf-8?B?TjFPemNSNlVPajY3bFdiS1FiOVN2TmFVMTJjMHJHanorWUtwdE03ZXhxMitx?=
 =?utf-8?B?d2tmb0Fid3Y5OGxRUGZXbU16UnZvSEcyNStuUFMrcGh4TWlYangxVnRadFNn?=
 =?utf-8?B?ZC92VUJ0K0h2M2Q3U212Z2Y4azdOWG9YcHpUdlZGSXRnRGVSTS9WRzF3c2RQ?=
 =?utf-8?B?MmMrNTVtTmt0U1F5WUFyenFyc1RFUWl4djJXWkZDSGkyZGp2QVRVeCtKUUNQ?=
 =?utf-8?B?cXU4a0g4NHVOOXRUVjU3dndDa2U5RzBtV1lZUGswbHVFQzdvRkU4akE1TU4x?=
 =?utf-8?B?aU9DQnhycGVKb0pGZ3lYOXlMd2djMW1MN2dJWWRxUWsyMk12bC9RQWNJL0k0?=
 =?utf-8?B?Rmh1UTJMV2lRelYwUDRBRFo5MjgyK2ZVYUpuZlpMZ0VaZ25RdFkyOGhkWjhB?=
 =?utf-8?B?d2QzRjhRZ1kyRnBudE5FYlZzNHh3QXlPZWtSVDA3SUFkaytDSzdwQnVlWDJh?=
 =?utf-8?B?UWRSREhFYUVRdjBKNkVKWEVCL2IwZVJpR0RjM0NBaGN1a2VJb2IrZnMxL0JH?=
 =?utf-8?B?eDR6WjQwUG1ycWF0aVYxSVc3VHFaUUdrWTJuVXphNW9BZUlxMTVKWHYxMm01?=
 =?utf-8?B?V3NEQTRVckpOOG9XTXFNeVN5Zkw0TnpLRURKYmdXUE1UVkYzSm1MREpYNVdN?=
 =?utf-8?B?TmhKd081MFdMOU14SGZUZWc5UHAxRU5CL1hlSmw0MG1acGdkRHlMMUx2MkVy?=
 =?utf-8?B?VUtXVnVjS0hqV0ZheGVYNVdpbU9vVDFzWGFMMWtLNitZUCt0eXNsRUlGVTBh?=
 =?utf-8?B?TTdDaVdncE5razhOQ1VzalBXRFJTelNzYXBWZGFoN3FvVnlvTlRUTHh6Vkhw?=
 =?utf-8?B?b2g2Z2tZSFpGSThQaFhTTGlKSUJIRWpCZTdWSWR6NG1zanVDaTVlU1V5M2tX?=
 =?utf-8?B?bWJnSnRYMXU2NDZrV1RZZFpUS0l5bmFmUHVZdCtWd3hhVENNa0hIbHhLRFdt?=
 =?utf-8?B?RTZMWHFGM2xDUFg3M2pBcUhsVzYyV1lxRlBRNkJVNDJQR3RLQWMwNEszUjFq?=
 =?utf-8?B?UXg3emZUTE12R3VwM1BiL292NnZFRmJET3dLQzNScG1OdVNJM0c2NkRadFdI?=
 =?utf-8?B?Zk1MaVFtWEJhTGNCRWJweTVwNEN2ZmxSTktKdS81R016NUN2aU5JeHo2VlVK?=
 =?utf-8?B?WEVOQStSSDhvRkJpbnIxd1ora3VBcEVTNUp1WGtCZXRpL1ZNc0ZqV2hDdm5R?=
 =?utf-8?B?dDBIZFd4Y2MwTGpBNm8vZGx3UEVrRTZQNTBkYXJjWnVZRHM0ZjVmRjdLNEEy?=
 =?utf-8?Q?iNkcJtgrcvOd4=3D?=
Content-ID: <E098002DA498E94DA70CED151960590E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e659cc71-26f8-41f4-8b2c-08d8b978a177
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:42.7847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hvrSWpZ/QSbNxi2piw37pQhIpFVpDG7nBUOra+SEFh9Wb3quOJ8uVFZc+FqhiYIrFdAD3bg1+LSOpcPOmCfWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_121149_956205_7E8E3B7A 
X-CRM114-Status: GOOD (  24.80  )
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

>> +
>> +    assert(ctx->insn.limm_p == 0 && !in_delay_slot);
>> +
>> +    if (ctx->insn.limm_p == 0 && !in_delay_slot) {
>> +        in_delay_slot = true;
>> +        uint32_t cpc = ctx->cpc;
>> +        uint32_t pcl = ctx->pcl;
>> +        insn_t insn = ctx->insn;
>> +
>> +        ctx->cpc = ctx->npc;
>> +        ctx->pcl = ctx->cpc & 0xfffffffc;
>> +
>> +        ++ctx->ds;
>> +
>> +        TCGLabel *do_not_set_bta_and_de = gen_new_label();
>> +        tcg_gen_brcondi_i32(TCG_COND_NE, take_branch, 1, do_not_set_bta_and_de);
>> +        /*
>> +         * In case an exception should be raised during the execution
>> +         * of delay slot, bta value is used to set erbta.
>> +         */
>> +        tcg_gen_mov_tl(cpu_bta, bta);
>> +        /* We are in a delay slot */
>> +        tcg_gen_mov_tl(cpu_DEf, take_branch);
>> +        gen_set_label(do_not_set_bta_and_de);
>> +
>> +        tcg_gen_movi_tl(cpu_is_delay_slot_instruction, 1);
>> +
>> +        /* Set the pc to the next pc */
>> +        tcg_gen_movi_tl(cpu_pc, ctx->npc);
>> +        /* Necessary for the likely call to restore_state_to_opc() */
>> +        tcg_gen_insn_start(ctx->npc);
> 
> Wow, this looks wrong.
> 
> It doesn't work with icount or single-stepping.  You need to be able to begin a
> TB at any instruction, including a delay slot.
> 
> You should have a look at some of the other targets that handle this, e.g.
> openrisc or sparc.  Since you've got NPC already, for looping, sparc is
> probably the better match.
> 
> There should be no reason why you'd need to emit insn_start outside of
> arc_tr_insn_start.
> 

We are also able to start TB at any instruction, that is not what is 
being validated here. It is just verifying if a delayslot instruction 
does not have the delayslot flag set, and that the delayslot instruction 
does not have a limm.

The way we encode delayslot instructions is a little peculiar. When some 
instruction defines a delayslot, it calls this function and the 
instruction is decoded inline.
As far as I remember the change of instruction context, with 
tcg_gen_insns_start, allowed us to properly make gdb jump from branch 
instruction to delay slot instruction and then back.

The asser was used to guarantee that those conditions where never broken 
internally. The condition becomes irrelevant.


>> + ***************************************
>> + * Statically inferred return function *
>> + ***************************************
>> + */
>> +
>> +TCGv arc_gen_next_reg(const DisasCtxt *ctx, TCGv reg)
>> +{
>> +    int i;
>> +    for (i = 0; i < 64; i += 2) {
>> +        if (reg == cpu_r[i]) {
>> +            return cpu_r[i + 1];
>> +        }
>> +    }
>> +    /* Check if REG is an odd register. */
>> +    for (i = 1; i < 64; i += 2) {
>> +        /* If so, that is unsanctioned. */
>> +        if (reg == cpu_r[i]) {
>> +            arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
>> +            return NULL;
>> +        }
>> +    }
> 
> Wow, really?  Can't you grab this directly from the operand decoding?  Where
> surely we have already ensured that the relevant regnos are not odd.

Indeed, we can grab it from operand decoding. Please allow us to do this 
change once we rework binutils code.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
