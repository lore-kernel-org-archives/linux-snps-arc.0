Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2ADC4332B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 17:11:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413D12333E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 17:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413D12333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dMl2aAI2RqEsrgHU2X0xyEG8wXqC0onhB+2D2f1WPLc=; b=EMn1gaH72Aq+TqAKwSTQctEHW
	K78paHcasfOSzutdhJZkGmOTl2fJjRr4viGip9SCmreRQCT9rzYNL0D5vV3FkJX5zyAqPEadqccrn
	8QB2at5ezGStr+LS7yJTZ5IgPlAb0tV5bHZzfFFf47MjXZi1fu9zVbFVskaKaSO/Hq+LHQS9XnUHT
	jL4bPjbmm9SEFZaKb/UdKhmSfbv30u6Z0BvFwSU7av5ka404oRXC365d1cqfUDVHeXMp6a6nrGcxt
	BIJeBot3gdHxsrPVodDkjsspHlxh96BPLRJlQnCto5m4A5p+NYNlnZaLoyXj6Ihb2rdpOM/OIButb
	UzDq16VnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SdS-0001xX-54; Fri, 15 Jan 2021 17:11:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SdO-0001uW-2R
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 17:11:39 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDA7DC0ADB;
 Fri, 15 Jan 2021 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730696; bh=j9B9XIXVF4vkjSmYxb5DJ+JBUNW6MyxSqjX/tNtMKo0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jVynRyDn4DrNd8NbvqrjRWo5n/55rtFFX7NfWTVzI9OKC+aKySOzkn1aOI5al6wH3
 40PfBq5nEtYsnThYqPSByBRh9uuKlByy3/Ztja9dmWIIKAqpdTQq+V90aZz91D3UYp
 iUtP+eCxazkyTQrhjbF5+l08dPe33YkiDJlSKyDtg+XwjheVILezC5J00katVhiGDV
 TYP2XJT/Wy1T2yg7SLuQM3ZhTFlGMxVrMbALIcGrVUkK7Bh/MZmI/KGVq9APnYjtoo
 7s/B4P+VywZOBv8f4lixipu83OYOWeEsrJVXNDKWdruPyRFo48euuZ3z04iuCf2AnH
 iUNEam/4ZjQwQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 72A43A006A;
 Fri, 15 Jan 2021 17:11:31 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D2FD8154D;
 Fri, 15 Jan 2021 17:11:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vxcS+x53";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThnrkhjZPUu6k5nHoCWtEqN3+dh8LtwJ0jIp89T8MKuIFarIHh3ZmuVqrvvVSxAl8L5GZUwZ6os4EPztiAs0j9MXFtEui7kXMbpTro9tSIlnZvwRPfCSO7jceQm+sx7fTijoYe1agQI11MLpaBwCmqKCEzG852wXTU/k5DHqdAR7Uo9UVDbN+LF7s4kcQ4/Ird2iIBaVeDLon89QOzdqqeu70kssPtuFPNvfZOFzyOlbNpF/B+dnanChagD2+UPcPjnIG8gcZLpsWffSql5Gl8dbzuU6pq84tgk7HieSlpjzCWtjiz2vybk1kf3fyX35+4FtCiZDBaZu4bwA9N9aPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9B9XIXVF4vkjSmYxb5DJ+JBUNW6MyxSqjX/tNtMKo0=;
 b=TiRUorHNqKUKemkcGOujVccnthkxMJeWVGkJrdKFWMWmXCr2ECMJInDrHnIoB6ESEva4nHmTGR/XudYSN7F/CdLDCL+BjPcGFL8gV/F/jx6tO+015R6TKrTerwnUnlFjWX66GpaIbkfUjhOfyJkFze+E5D0Dd3geiST8j7ujGsF6uh4SPxerXlrhCgcybB8qgx//djH97jqtpfIoIyuhtV8v10DXRQHybRoLZ5xe56SouytpvnUAO8EveUXajqNSo3l9hCdMkwxevze9wD7DzvUt/ODUwk09b/5g6Pi5UWOEpN+62342BC493YqAUBSp+g6f2AUFrgoMRqEX4/XZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9B9XIXVF4vkjSmYxb5DJ+JBUNW6MyxSqjX/tNtMKo0=;
 b=vxcS+x53GKfq5gbw3mlxvSIZkJSM9yiz6N90kkhtggQcoQqWR0CMZR8vETXgMUu4/u5afaUc3cqQuT5e6QV3zHQNyUleY63AQJyxDn134goVn8ZSGxiiQN18Y7xEgWZ2OKIr2AYKDHTtEfjJhaAvHqS8kAMu/gHT+f6HrUr47wc=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:27 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:27 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHW62F0vmOtZqCO7Uy4HrbUomKevA==
Date: Fri, 15 Jan 2021 17:11:27 +0000
Message-ID: <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
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
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f535b25-6e29-4197-b74d-08d8b9789831
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417603BC07DF8C9A0F087DA8A8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oh1dMHUEdKGBeXKOcC2aySUAMhxm4nxOjMY+qFARfoOyd2DGqu1gSNzb2HwdhgCFH6TNxb6eJ2vOR3es7nF+/M+uxjDu5bsQe48zMHjmpN/Fg1oditTVYFzOgS1hNzjgtWo4DeLJgwltZhs2LuhiVEswv40K7eZw0BYyAVYpNQtwLByRbrFp6lBzuH9WJU9P0GsAyLbtRleEjB2LzMdWI325d8mXjuFnJsf2eGGBU91yW4dvZmnj8EK8fSxFmiDkpDk/LJxgaxW0rLWvYRKXnXtlDDk+1ihy8aEHVhx15Q4qBaYkiEsbXsqfZhaKwwMQ1CY2C84/5s/HvWC0EIEUCyJhKBoij4kU5teDdlFJ2QnSRxUjSKx7tVyqJ5NAxxQv6pPs/5ySx+9eGgucFru4CavBTljC3UxGjBkpjjZ50RHoE8pvtSHNcxqiVowDa+v+TuZSsOA6Ur09/WnwrBJw4sceHpRrItPDsus4i1/o/eTI+pW3PzEK4tyu8K9xHEPfaLbZfrDT0hHVGzg4DAGIWEFVUuX3s1dsjTC/0rskd1KODM7IF8mx8mSJFU170TY0ECcIWYLRiBmjvjGwCv66Cw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QWthV3pEYnlSMm1SVWlWb2d1NnMrUDl3dzQzN1VUOWlwZ1RmVThoa01KbTdn?=
 =?utf-8?B?MVdiWTJndFFaZ2tROW5Hd1pKcm1HY25pOXJTMTNOSDJIWXQ2b05YbzJvUXlu?=
 =?utf-8?B?VGJsVDhJREYzWCtCcmhTU1NUQmxBS2JCd2IwVWZoVHFsU3BIZk1FV0FNNlFr?=
 =?utf-8?B?QndJN3l2L2YrS1JTeFQrZC8zZGVieWhod1M5MllpWXpaaVZwT25obldmeHo5?=
 =?utf-8?B?WlNsamlaNnVNdWNoK0w3eWlzRlZiODF3enkyb1dPN1lQZVFwelhJSTJPMWNU?=
 =?utf-8?B?ekZJWk5NZWVRbjhDcUMwN0JHYWx4UlZJOVZLMHNadkRFdGNRS2ZpdkhwVG9L?=
 =?utf-8?B?aVlqY0VOR2JRSVB2TXowUHIwZVZWOEswb1prcjFrM3RZcjlReE1CUU1rSXBk?=
 =?utf-8?B?TG9ZQzdoeVlkZk9zc3FzQTZYcXRlbGkzY3VRakoxQTI0UUYzall1ODJsZUdN?=
 =?utf-8?B?eUJOb2ozcFNOTUFWd3laMG5GQzNMQnYyZjUyUmNBSzNVQmovVVJuTGlIUS9M?=
 =?utf-8?B?cTFxalhxNXhZRkR4bmxUcnRQYVV3Rms3SVV0bFl4ZjZ1aWxWSWlNN2lFWlVj?=
 =?utf-8?B?M1NLNE45SnJET1UwQk04Rm9jVWhaOStrYmNPcDMxN1NkamtkWENKY25EWitJ?=
 =?utf-8?B?ZzRsMS9oQml2Y2hmMVdjeFBicXVkMVlJanRzYTgwZmlHM01ya0tzSkFGQ3Zy?=
 =?utf-8?B?ak84ZFhUbmtwSzlSOEZHTGlNN04xc21teldqb0ZYajNma1JmcGlJUTZjUVp1?=
 =?utf-8?B?TTdKQStwYXdKK29uc0RiR1hPOXdLaWYvMXpUM1Vuam5EbUlyenVxTDZIN2JB?=
 =?utf-8?B?TFBqNm1PcXVFNWYrNmhMWU92QmVCOS9tOUk3RXJkbStsTHJqaTgwV1d2RjNT?=
 =?utf-8?B?WWV0WkljalFPVnk5YjNPMGJFanA5WGp1SkxPUE44eVR1SjdUL1Ria2FkUnYv?=
 =?utf-8?B?c0IrdnhQSncxR1dFbXVsanAvT1R5M2pCczNXc2JCTUJHenc3ZnREVE15T1FS?=
 =?utf-8?B?V3lzcU9BM25Pc1ByWFdkVlhiaHdjbnlybFhnbnBDRDdZSlJRdk5UUmdBcWph?=
 =?utf-8?B?bTBxWTd4OWt0aEl5OU1VbU82eTdzbmNLaWdpMmIrZXlFb0FJaU5WUE4rNFNP?=
 =?utf-8?B?T0Y0ekJOcndENlB4djRNT2ZGUzIrSHpHRlBRR0RmL3UrSjBBS2FLbzNTWW13?=
 =?utf-8?B?MG5MZ1kybE8rc0FmY2M3Y0lZZjJXTjBmSnFsdDIyelF4KzY4UEpBUGRXZFlD?=
 =?utf-8?B?VGgvcmhkeit6M21VZndKYTlSYjVTSE1yUkpUc3ExMFc4cURaZ2tuV25GenZ2?=
 =?utf-8?Q?foGXiTkjniDYI=3D?=
Content-ID: <E9069DDC3E418F41A828893B2FD582D7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f535b25-6e29-4197-b74d-08d8b9789831
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:27.1627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73LtRw5Xvj5fvTJCJvlw6lfdzplZ76JrgCiRfWWDALi5r9qVBQsPTYksi0d6Z7TZO+nYBCzPx/LAzkmUU+P8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_121138_342542_5C31D140 
X-CRM114-Status: GOOD (  25.37  )
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

>> +void QEMU_NORETURN helper_halt(CPUARCState *env, uint32_t npc)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    if (env->stat.Uf) {
>> +        cs->exception_index = EXCP_PRIVILEGEV;
>> +        env->causecode = 0;
>> +        env->param = 0;
>> +         /* Restore PC such that we point at the faulty instruction.  */
>> +        env->eret = env->pc;
> 
> Any reason not to handle Uf at translate time?  Or at least create a single
> helper function for that here.  But it seems like translate will have to do a
> lot of priv checking anyway and will already have that handy.

Since we needed a helper anyway to deal with causecode and param, we 
thought it would be reasonable to do all in the helper.
We did not made a TCG access for causecode and param enviroment values.

> 
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
> 
>> +void helper_leave(CPUARCState *env, uint32_t u7)
> 
> Similarly.  I think that both of these could be implemented entirely in
> translate, which is what
> 
>> +    bool restore_fp    = u7 & 0x10; /* u[4] indicates if fp must be saved  */
>> +    bool restore_blink = u7 & 0x20; /* u[5] indicates saving of blink      */
>> +    bool jump_to_blink = u7 & 0x40; /* u[6] should we jump to blink?       */
> 
> these bits strongly imply.
> 

For lack of knowing better, it is unclear to me where to draw the line 
when choosing between a translate time (tcg) or helper implementation.
Your suggestions for carry/overflow computation are sharp and we should 
have never used an helper, however I wonder what would be the benefit of 
implementing enter and leave through TCG.

We have dealt with those exception issues by just changing SP in the end 
of the instruction implementation, when no exceptions can happen.

As far as I understand when an exception happens in the middle of the 
helper or even on a TCG implementation, it jumps out of that TB 
execution to deal with the exception. On rtie instead of it returning to 
the same tcg_ld or tcg_st where it actually triggered the exception it 
will re-decode the same instruction which triggered the exception, and 
re-attempts to execute it.
Is that the case in current TCG implementation, or did it improved and 
it is now able to return to previous execution flow (i.e translation 
block) ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
