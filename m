Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1525C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:48:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BD5239EE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BD5239EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dF6yWTp34Y4qHx2USxGhWZrQnqGL9JY4OeI2cQFAV8s=; b=b4t47twPjbW3G3KQ7eSBbBVlS
	SIknbgneDTtV6EdFCCat1bc+vxFCSaohTsvDXZ5i3u1sGTl4jOyCQR+f8fOObpGdEoKHT3mzxgcY5
	5yzlMgnMAfhdZKbvWPFOZQrgvS979VsLXY0IctutgbYIPAcs/wy+GThO0sJX9EHI5n7QMHbPFKkXc
	KUbaFUzgHvbAGbquS2/IzgkyMJxytZATTEwwzezu096fubqT1h4A3rwlawDwFNrJpxkfZoA8No50y
	gtwFI+VXBOkpDlfC4e2I8LyvxGpVdYBTsB6kvdPqrfcvK7kJDhaklU3szKIA9E8wbR4IGVJDYZ1Fz
	5RdyoxruQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Wxg-000655-JU; Fri, 15 Jan 2021 21:48:52 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Wxd-00064f-Q3
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 21:48:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 923174045D;
 Fri, 15 Jan 2021 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610747326; bh=DBks7NHGiL7arzIHfkLrL6W8hsAQH/hWBVmZiKqaGyI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hyZRBF6SafX5839S7N5bVqlK4RMkB1WBP7c+Jv5q6v3iLplDeNXpL0xmtijrUEoK+
 8XfM1rfUxOLom6ISbBwRrHnlAFO3e+9EnHGYEps+ppXt1NURPqp1jLLUVB9injPnPF
 F8fJjyM9hZjNiFJj8wOVnZIsZXa7hvgnfBPfWmhyJ5lIQ18l+vJVgNBilB2z95OvZg
 5wTwzDP/P4WyVG5JwGN2b7vbm7njS3WzBjgxYpYQssl24IGCHWwfcloMcjcYjdH44F
 zFrfuzaUQMOTnbeIUU7kyidWrHa2tozgZ/qixt0uEVIi9SY+G0hrOrTQ9o86icHr+Z
 141yKdKwWBLdw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8080CA006A;
 Fri, 15 Jan 2021 21:48:41 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 45BE9800C8;
 Fri, 15 Jan 2021 21:48:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="nRH1Im39";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHpPHoHGurigtEbbm8Q0uRJZzGNe12X4bJ6YFZOAWQ6anX6qOGUiNj7EXXUZF6hLmhh4ganSuhPZh0kehvoGgSNUcSk2mT3Oyuc/M6o7Q/jdbDKDTF8FhyojQ2PPdWfX0ekQ668VecvXBLmDCXR1YpOeMCANQS+ZeCAbaxoE8N91Upui2VKWKBcBil4pKPTWMay9XsJdAv5AcYKWS2h16GuSO9ppgqHDB3fuFB4GCoedpQPWvdFX8yRvuUuZRdIp7W+BXlRTXV6JbK6PBZdsJ8Oczzg9g8WTe6k2CXPlCFLrwu0zMUskphxCb6q2AE6iTjWv2+5R6CxlaWpSGR/bQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBks7NHGiL7arzIHfkLrL6W8hsAQH/hWBVmZiKqaGyI=;
 b=VwjvPLlItd2oue3KHwzH0s0eB3IzidGnl9TJgMQ8WpoFKRGP8YEaazBChAELQqK0HLkWKSHjjtW1cvHA8YG8NxeI9xCAPs+shYazuzUKP1/vhcZTXE8lCyt+PqQKWmwzGU8A/ydSiCOKacPUXtBQvYoMSD0hUMqiDrmDuerzhDsbhNgAlHi3iZTMO6vjSFg7Llypi8upzJiyyU8Xeee3e9CK6NO/SlMfIFuYyGW87y/q01llUjPN39WBfTpIkMelXJlSseysT18Qy4oSTrqzPcKrdRlK/X71maFFsq+rhgx6xij5+atSchnESYrd3Pu4e/JVchXWmwjMZqsRQFxZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBks7NHGiL7arzIHfkLrL6W8hsAQH/hWBVmZiKqaGyI=;
 b=nRH1Im39RE5L3FNl2fHIv8oz46qEkua7Rdo+Az1UDrVHQ6BBagAw0Au/GWuLCQVdrBYUvNtjr7fppEuRwT3hwLJ2EMwsuWwDrKu9/r+QKrx37S7OM89pfy6U8tDG7uxNMvh/qdvECkJYXOXXBvau78KPLfTQEK4A1b7ujXXQRTE=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by BL0PR12MB4993.namprd12.prod.outlook.com (2603:10b6:208:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 21:48:38 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 21:48:38 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHW62F0vmOtZqCO7Uy4HrbUomKevA==
Date: Fri, 15 Jan 2021 21:48:37 +0000
Message-ID: <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
 <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
In-Reply-To: <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc545b74-57ae-4c8c-5f12-08d8b99f50df
x-ms-traffictypediagnostic: BL0PR12MB4993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB49935D1060F64C202C782ADDA8A70@BL0PR12MB4993.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +aBH6iPMfdOrIc5JzDapmLEjDR0Bo1KHUcqkNAUTTvzBkU4FqEWaI0UAB0pjOUFNlTSApt9z4Dz6tN/jo3/imwGCIHrxaAaUksCwM26osIJKIe/5rKG66rLOBMnBMiHh1R+zqpzOPyKJuGRp6T/jJTY1xWApvz0CRs+TfvSnmhTIpV0HIPnW7q3PX7ZMn8dOFg0WEq6SfsvmxusCcJCKG4eAvjpb6vBrpOIlP2ipcqHEoowqypIS8tEa64rLSUkVhslzCjQh/Qjtnb2oWQ7rU9qgTuGYCbatHdm/BJItH+VsMB7/D/ExLHW0MaU+wK2a82EP8vej01DtAhz4JBV9FC/XGLSm6DXwUIIL140zrJU23uewbx5U+6ZGTp927lCHCTCOh2zhQKf1oo7BNcXb55VGElPvsKrpdVJf+2l1uaVK1x1nfQjgiKdXDqnqn4rB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(346002)(366004)(376002)(54906003)(316002)(478600001)(110136005)(53546011)(83380400001)(26005)(31696002)(8936002)(66476007)(2616005)(31686004)(86362001)(66446008)(36756003)(8676002)(66946007)(76116006)(4326008)(107886003)(64756008)(6486002)(5660300002)(66556008)(91956017)(6512007)(71200400001)(6506007)(2906002)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eGxwQUQzL0drUTdqbGxHQVFqNDZselhtaCtiallmNjdiRlcvWnZtQU1qSUds?=
 =?utf-8?B?cElUODMycSszbzErVUFmMmlrNFBFUFpKTElRUVZlK0xQUzN0UHQ5YUZNWkVp?=
 =?utf-8?B?NXBSeGRqZm1ST2ZhSzcwRzZYcHR5RDJ2Z1ZsTlRweWFxQ1hBYS9YTzNhTEVB?=
 =?utf-8?B?R3hFRGtCVlFKWFZUeHIvaXhkUm9BbnBqSWtTbWsyZGNHYWFZbTR2aUtBbGhJ?=
 =?utf-8?B?YVgwUUxoVUxDbUp0OVAyYUovUjltZXlpTnZkU2trTEhmeXVzaTJoa0EzRDlB?=
 =?utf-8?B?bHFqbVdnNVBXemJQNmNyZUVFVUVoWmpCdXpKemNZNFdyNCtIWEViVzA4dFBD?=
 =?utf-8?B?V0FnT3VOYnorL1FPUkpOdjN2WlVHeHNpYzZFdnlVYnhINko5L0NrT1BWNU51?=
 =?utf-8?B?QlFqNUtsR0dVZUJjU0hPYmlBRmljTlFLR3hZSDBGZUN6eTUzU200dTVYeXRM?=
 =?utf-8?B?RzhiQXJ6eklQUDZPMlFqd3cyRy9qRzVTNmVZZENoYmtTZFdVQ2tBdDdjS3hL?=
 =?utf-8?B?NzVDb1o2U0dic1R3UVhXVkVwemJ0RHA0WlVMYjV5cGhGV0JKVkJKN2JQREc5?=
 =?utf-8?B?TzhhUlB3YzE1UWlCZWcvRnpHZkk3SXBlbGRPQXRvYW1lR1ZkdkNYYlJ2ZFVD?=
 =?utf-8?B?UjhNa0JDMzRIdWw5U0IrSmNzdGtTY2ZyanpxUzhxRmZKUG9CMWhpU3c4dE82?=
 =?utf-8?B?LzZxWWpMN1haMmVwVTVYMjlmeDVDOWo2T3JSWGFWMWx5NkN1UndOb3hJa1g5?=
 =?utf-8?B?VkZsN3k4a3ZHMk9scTBMa0dNRVZrdmJSMUwxRnRUUzdjVUFyUkxYYjJLTDF6?=
 =?utf-8?B?Vm0vL0FZM3JmNk1UbWxsaC9Pc3ZJUFNwMk8vVXhSZEtoZ3l5bXpieUJuVnFx?=
 =?utf-8?B?NkZ4elQ2NWtTa05ITVRoRFB5MVgwYzRWNk41TFU3Q1RoNCtHRE5tcGhzZ3Iy?=
 =?utf-8?B?ejkySmIwQkg1YVp2NjdOYmZvTVZlLzQ4SGVOYjV1MCsvVkZkb3hTZjZNNlp3?=
 =?utf-8?B?eUVnTk96UTZNbVpoeTh2ckRNODhRQXBhVE1SbjdrUDVVWmt6Q0NYVTEwY2Fv?=
 =?utf-8?B?aXBmKzh0WXBScURrRkVBdnNtdE5uc1ZyZW1HT3VrSW14UnZodHNZV3ZKQ29O?=
 =?utf-8?B?UTZwcVR3WVJGZ0ZGTFNzYmxqanhNeGt4ZVhnRXZ0N1U2ZlNPT1F6WlZDK3Vy?=
 =?utf-8?B?REVBTlFiNFJucmR2NGRBQVd4dTRrQUVYU0NaTzdFZ3JoSWYwVWFNem1wcExj?=
 =?utf-8?B?WkhQbS9LNGtVWFRpMUN2MmxTQk9vQytWam52VG9nYmZLRVI4VExDUFNwa25L?=
 =?utf-8?Q?cQtyJPUvK64Hc=3D?=
Content-ID: <36EF7D95E3679A4699D68755948B0743@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc545b74-57ae-4c8c-5f12-08d8b99f50df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 21:48:37.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nirxcUUbbt2yCezn3GXXt1qPwZz9XiViC9GVcT8Qqu4N1L2+FX6Mp38Qt6dvR/53Bm1pQMI1AKc64Y5TTLgNag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_164850_237073_126A9E81 
X-CRM114-Status: GOOD (  25.70  )
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



On 1/15/21 8:31 PM, Richard Henderson wrote:
> On 1/15/21 7:11 AM, Cupertino Miranda wrote:
>>> Similarly.  I think that both of these could be implemented entirely in
>>> translate, which is what
>>>
>>>> +    bool restore_fp    = u7 & 0x10; /* u[4] indicates if fp must be saved  */
>>>> +    bool restore_blink = u7 & 0x20; /* u[5] indicates saving of blink      */
>>>> +    bool jump_to_blink = u7 & 0x40; /* u[6] should we jump to blink?       */
>>>
>>> these bits strongly imply.
>>>
>>
>> For lack of knowing better, it is unclear to me where to draw the line
>> when choosing between a translate time (tcg) or helper implementation.
>> Your suggestions for carry/overflow computation are sharp and we should
>> have never used an helper, however I wonder what would be the benefit of
>> implementing enter and leave through TCG.
>>
>> We have dealt with those exception issues by just changing SP in the end
>> of the instruction implementation, when no exceptions can happen.
> 
> 5-10 tcg opcodes is the rule of thumb.  A conditional exception (requiring a
> branch) is a good reason to put the whole thing out of line.
> 
> In the case of enter or leave, this is one load/store plus one addition,
> followed by a branch.  All of which is encoded as fields in the instruction.
> Extremely simple.

So your recommendation is leave the conditional exception triggering of 
enter and leave in a helper and move the loads/stores to tcg ?

> 
>> As far as I understand when an exception happens in the middle of the
>> helper or even on a TCG implementation, it jumps out of that TB
>> execution to deal with the exception. On rtie instead of it returning to
>> the same tcg_ld or tcg_st where it actually triggered the exception it
>> will re-decode the same instruction which triggered the exception, and
>> re-attempts to execute it.
>> Is that the case in current TCG implementation, or did it improved and
>> it is now able to return to previous execution flow (i.e translation
>> block) ?
> 
> I think I don't understand your question.
> 
> An exception leaves the TB, via longjmp.  Before the longjmp, there is normally
> an "unwind" or "restore" operation, to sync the cpu state with the middle of
> the TB.  This happens in restore_state_to_opc().
> 
> When processing of the exception is complete, execution will continue with the
> appropriate cpu state.  Which will probably be a new TB that (logically)
> partially overlaps the previous TB.
> 
> I.e. everything will work as you'd expect.
> 
> So... what's the question?
> 
You answered the question. That is exactly how I understand it works.

> 
> r~
> 
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
