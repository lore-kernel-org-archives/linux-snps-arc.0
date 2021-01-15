Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE74C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 17:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96412333E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 17:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B96412333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xcfe8AKbdJzbBzrWTbRTEwNtAdFk6wzrorDyPJpkmKY=; b=t8RELsVfY7CYulpwdIchq6NaG
	YUKhOzeDourdw4flKjcEtXsYUDYJ+KzS0M33hjiqtKYpCStlNnqo0Fpxmc3yUdTuUwIMyEJrKjwwI
	OnUiGU5UoBdKVJXBAYf57DV5EeARtb2JQaJglFQeTnp6FepZi7EMs/HzPCvT5ekFgRyZBadjI0rqj
	ukpqm/iVbdxPc2kewANoW+WQTQrslwuMZy2HX2sllv+7YiT+s7EhHzgdn7zlP4zEY+CUetQ5mb/Sy
	O3QusJC1zLojBvLxBoKv4MSrzI/RUit2VpYM6DlQSy553+8jo6NJGEX1kEVGV86upszJorq9Fn3OL
	ALOkt2cmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SdU-0001z5-F2; Fri, 15 Jan 2021 17:11:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SdO-0001uj-Cw
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 17:11:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9163A40762;
 Fri, 15 Jan 2021 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610730697; bh=S7P1mM4smKPsd20IN7ekYrzh/leEuBMW8yHr9LICgZE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OV9RWvx5/oLFOXzgWLvrjlfUTN+hwmsXNdUIAGFUruQ9oB/6IwHRSWb5Aiv2+PydI
 AfNbMqIYvVkSJQHGc8B7abS/xSgiAQ19lLUCSju8z/zxNh9JF7XB/fNk7HRKDFcI8s
 uzXx9gVxM7+WknVeX7ZJmB+J7ti/joniuKZ+YYg/zhh9lPkz8MYe3GXvJusTo+BmUg
 PPstDTilYdn3CylftcaWBCxM2N7aC8V1EribeJwL8aqA7SqIgtsytqLNcjV4PEJuuN
 7IBB5BiZFKOdCn/w8HZOXkmMvwghQAgJzxNschYDjm1/p1/jQfs2wHOoIr7hh5mD3R
 v6iPVynRpCt+w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 72891A0083;
 Fri, 15 Jan 2021 17:11:37 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EE5388154D;
 Fri, 15 Jan 2021 17:11:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="pHm+2vgq";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ekk53BuY7hEqaQQuJQWRxIxfx1VIjZ7pZclTYmfThdeRWp7I8cWpE3+hEVurisBl7CDIigmFVDSSuVb5Nv2Xf5LfpTYUt5tgB5VoLHx0jF4Hsbclq4OeNEWb157vBNAbT2LeY7oZZzs6D/2Xv/q9uh1S5QpbIsOoH1FTNf0nkiJkHvfpo8AphizKM1en4zXX/yAuSAjioHmOvWec5/SuTmhXwVro3mPZ53yyjzafepqmiapKCsGxgeEkS7FeDAvmU+rW0H2wFUgdmF/Ta7PD5bGvcEY8T3Uh/2WjzkuerditzjUz09Jv9wHrrlKN6pkGrbawX2HMTw/H7jpWKnwFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7P1mM4smKPsd20IN7ekYrzh/leEuBMW8yHr9LICgZE=;
 b=Wb5GCmLbKsTv6T32evA45bnxF56sn+7OLn4pm58WlHcCTp+3ilptCb1Z3SM6Nxl2h7owPvdfsmKlk2uDenvTRtdMqX9e50Blq1XAD3ctrTdeRchc4014UcgnaXmfa7ea+PcE+wMnKFhzPmi2WT73FOxtXXjg4Y70tXlordTIIx2MO9actP85w4DC50T+zY6aEOYShHPJBeH3pLaX6cA5nlUPTpLjKHADfd2JTyR+IkYn7Sh2ouIDkxBil9qqrStUsJyJGQvRvs4OsAJcODDWAbJ4JrILheb2CfiSdxdSih8d6bBdNqJAV1rVHzNX1zojbidfW25oOc0ixqFEtd9yLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7P1mM4smKPsd20IN7ekYrzh/leEuBMW8yHr9LICgZE=;
 b=pHm+2vgqhcNBv+uoFaN7HsraXkt6DMg4ydOr0wr1SLV0KL2g4oIfuCRuqOHrk0Z+jVJ+HFt3BQ+yiLLjNfT9fRSdCC7wQ2BITU2c1qPcW/Ax7QtdeOo1Ui/01F8APCvc1cOSQMNkpT6wIOryq0M6/kQZ//HzK7f/8G5Src/Li5E=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 17:11:35 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 17:11:35 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Topic: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
Thread-Index: AQHW62F5Yc1XOx1vqESeY83yqPhwtA==
Date: Fri, 15 Jan 2021 17:11:34 +0000
Message-ID: <9a9183ca-fd2c-9d57-b283-cf06dbac23cb@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-6-cupertinomiranda@gmail.com>
 <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
In-Reply-To: <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8c8b9f3-9e8a-441f-3aa1-08d8b9789cd6
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417645B841485B64445D68D3A8A70@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13GkcY0KDQAevKl/pXwyPgCizqzkSIEn14Hud+2xbOCy6b/2dxQCUMyV1OYkneMgpVB+5osC5vinASOj2DTNvpEQVa732/ouJeGaZ/yU3rv1vbMrLyZSY0dpBFF+hmLiaixnGqjEBjZ4d0JjFnbuuuXRcEEBfwDCDdQ4ENMJNQBP7zmo+LmM9DSkmqu7HEghFEfA/vv9NDz9ipEFE2Z6eL61nqoeSFtarPj8bD5NBOB1kdKThHGA5StW6yddTV5RIMlYIjOHbTEn+Jf64/kMu0QMZ+GmA72LVJOhm4K1ENNZUQre9OwWG746IMfXiwmhMeMGxj9NiU0AqECgHRB2qYdp5txtAK+t58CDOUMx9Ac6hdZjbiNEKq9sDGrqv6ox+i7KqchKOvjmrosSBYsCYxv3qdayo1l7i6VQowG65w3BZ8FWqPNMHzP7jQGxoInwQWI/+A1h3NF4LEajRPtNpcYbtAu4rH+ZuYAYLpQWVttJPsOs4dhi6Y2CeKpuz68nHI2nKYpqUghqChxe7JrbFbJ4/zdt4XnOCQSjTnc+oygqPaNRzqBCOcrjxLuC0Sd4lJybE1SlX8P6nKHEtP5b6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(86362001)(186003)(71200400001)(316002)(110136005)(6512007)(6486002)(31696002)(2906002)(2616005)(4326008)(36756003)(76116006)(53546011)(478600001)(8936002)(66556008)(107886003)(6506007)(66946007)(83380400001)(66476007)(31686004)(66446008)(91956017)(64756008)(26005)(5660300002)(8676002)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eEMxRzV6a0hzcGVuVmR5NGxsS1c2Zk8yMEpjdkVPV2FDREE2NnorZ0srdE9X?=
 =?utf-8?B?SDRRSmFaZG1Gc1pHWGJwRG1seWhmdWIzTENOZFhRaUFrejRCWkJuL21YSGU1?=
 =?utf-8?B?TFVDeXdnMVNPaCtFekc2ZmY2N2ZNcGlLY2Y5Rlc2Y2tyWG1PWnA4akpUcUJr?=
 =?utf-8?B?djJrQTIxMmMvS1hidzVqaVBCT0czRnJLN0wwV3F0c3pXaG0vTWtuVTlwZWRF?=
 =?utf-8?B?UjBPa1RSaml5dkNwcUlEWHh2YUNxMHh6bVN4VXJEK2VSOC9vMjd6aTRvUnZ1?=
 =?utf-8?B?YjJQek9vS0tmT3MzWXE4S20vamdOV1Z2VU5zL3BUOFFwT2toRTgyTUlpL3ZH?=
 =?utf-8?B?M2VNd2MrOE1ndGFKWGZUeDBucWs3ejY2TVFVRStrSHJaU3hrMHVtSG5zL2lJ?=
 =?utf-8?B?U0dUcVpvR2lITXNCYTUvSHgyYUxST3VJSFZGZmdrM2tRVFI0am9HZFBWQXhR?=
 =?utf-8?B?c3hkSElTY3pySGVRaGI2QmpBSzRmd0ZIZ2JtMGE0eUJnS2dvK0FqNGg1VWhl?=
 =?utf-8?B?L3dlNGdlZGp6blFkN0ZhZzVsR2g4cVp4UTkzbXlUK2FpKzNrbEFjbk5MRDZv?=
 =?utf-8?B?SlJLcFJpNGs5cjNYekYvVWpqWHRFK2tWek83dThqR0xzbG5GS2dwcFIway9T?=
 =?utf-8?B?b2VFVUc0bTVSWXFvSTVsUUZHLy90TTlyM3h4TTJ4LzFWaTZudGVwK2tObjJV?=
 =?utf-8?B?L2xpeTgvNEpvWDNoRXpwZ0FBcHl1TG5rOW5lMFAwUGtIWmx4V25hVzRKUTR0?=
 =?utf-8?B?R0NmMVQ0L05UMldnSnhUR3NKYnZxY0NuekQ5Mnpoc0QwRFFrMDBBU2ZKMDRC?=
 =?utf-8?B?Nzh0ZldzQWgvbCtZSE4rb1dLR3JzN2pFMEFxWmFkRFlQZ0Q1ejY2d2hLekxM?=
 =?utf-8?B?aEZxdG4yZ09BVXVEWUMxblB3bFN5R2JnK3l6dXhnVndzUUx2WUdRV3lwYlNY?=
 =?utf-8?B?RkZ0cHA3TUdrUStRWEpYUnZuQ01JZm5HK3IwYVVNbzJ6UkNvT1JMNUVzTnJh?=
 =?utf-8?B?YTBISmtESGFiR1FMWjE3bE00NDFvODZXT0cwUWF4eHQ4Zlg2OWs0QU1Sa1Rz?=
 =?utf-8?B?b0hyQ2VvZzY3N2dlc1VhQ0thM2xHa3ZjWG10Tjc2L1h6WnRrano1S1NicFlo?=
 =?utf-8?B?L1lTa0dXcTFReFM3MkdnUjZxdzY5YlJmSjJic3pyaEhHdGhXbFVSZ0NrN0Jz?=
 =?utf-8?B?MlI1aS82d204SnkrVDBlaWRDMTFKb21hUmhFSmZFbm9hSWpUcmRNL3pLdlpP?=
 =?utf-8?B?U21iWHR4MlpEVTFweVV0WjB3ZlpGNXNHemVXNU5DRzkwcjVZdTZPQUl6T2Zi?=
 =?utf-8?Q?SsXgWAugcDwPA=3D?=
Content-ID: <16147CE4BDEA534BA9B106F1C132B302@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c8b9f3-9e8a-441f-3aa1-08d8b9789cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 17:11:34.9822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nj39ERGUHHyjk9AOfiIkQij+2e7Yw+Q6M79jNXxef1y5NJx9Qz0GEV3AySWCbEq+mOgTo5XGw/GqAPidL6SvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_121138_727830_35B19061 
X-CRM114-Status: GOOD (  21.80  )
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

> On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
>> +/*
>> + * The macro to add boiler plate code for conditional execution.
>> + * It will add tcg_gen codes only if there is a condition to
>> + * be checked (ctx->insn.cc != 0). This macro assumes that there
>> + * is a "ctx" variable of type "DisasCtxt *" in context. Remember
>> + * to pair it with CC_EPILOGUE macro.
>> + */
>> +#define CC_PROLOGUE                                   \
>> +  TCGv cc = tcg_temp_local_new();                     \
>> +  TCGLabel *done = gen_new_label();                   \
>> +  do {                                                \
>> +    if (ctx->insn.cc) {                               \
>> +        arc_gen_verifyCCFlag(ctx, cc);                \
>> +        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done); \
>> +    }                                                 \
>> +  } while (0)
>> +
>> +/*
>> + * The finishing counter part of CC_PROLUGE. This is supposed
>> + * to be put at the end of the function using it.
>> + */
>> +#define CC_EPILOGUE          \
>> +    if (ctx->insn.cc) {      \
>> +        gen_set_label(done); \
>> +    }                        \
>> +    tcg_temp_free(cc)
> 
> Why would this need to be boiler-plate?  Why would this not simply exist in
> exactly one location?
> 
> You don't need a tcg_temp_local_new, because the cc value is not used past the
> branch.  You should free the temp immediately after the branch.
> 

I wonder if what you thought was to move those macros to functions and 
call it when CC_PROLOGUE and CC_EPILOGUE are used.
I think the macros were choosen due to the sharing of the 'cc' and 
'done' variables in both CC_PROLOGUE AND CC_EPILOGUE.

>> +void gen_goto_tb(DisasContext *ctx, int n, TCGv dest)
>> +{
>> +    tcg_gen_mov_tl(cpu_pc, dest);
>> +    tcg_gen_andi_tl(cpu_pcl, dest, 0xfffffffc);
>> +    if (ctx->base.singlestep_enabled) {
>> +        gen_helper_debug(cpu_env);
>> +    }
>> +    tcg_gen_exit_tb(NULL, 0);
> 
> Missing else.  This is dead code for single-step.
Goes a little above my knowledge of QEMU internals to be honest.
Do you have a recommendation what we should be doing here ?

> 
>> +void arc_translate_init(void)
>> +{
>> +    int i;
>> +    static int init_not_done = 1;
>> +
>> +    if (init_not_done == 0) {
>> +        return;
>> +    }
> 
> Useless.  This will only be called once.
> 
>> +#define ARC_REG_OFFS(x) offsetof(CPUARCState, x)
>> +
>> +#define NEW_ARC_REG(x) \
>> +        tcg_global_mem_new_i32(cpu_env, offsetof(CPUARCState, x), #x)
>> +
>> +    cpu_S1f = NEW_ARC_REG(macmod.S1);
>> +    cpu_S2f = NEW_ARC_REG(macmod.S2);
>> +    cpu_CSf = NEW_ARC_REG(macmod.CS);
>> +
>> +    cpu_Zf  = NEW_ARC_REG(stat.Zf);
>> +    cpu_Lf  = NEW_ARC_REG(stat.Lf);
>> +    cpu_Nf  = NEW_ARC_REG(stat.Nf);
>> +    cpu_Cf  = NEW_ARC_REG(stat.Cf);
>> +    cpu_Vf  = NEW_ARC_REG(stat.Vf);
>> +    cpu_Uf  = NEW_ARC_REG(stat.Uf);
>> +    cpu_DEf = NEW_ARC_REG(stat.DEf);
>> +    cpu_ESf = NEW_ARC_REG(stat.ESf);
>> +    cpu_AEf = NEW_ARC_REG(stat.AEf);
>> +    cpu_Hf  = NEW_ARC_REG(stat.Hf);
>> +    cpu_IEf = NEW_ARC_REG(stat.IEf);
>> +    cpu_Ef  = NEW_ARC_REG(stat.Ef);
>> +
>> +    cpu_is_delay_slot_instruction = NEW_ARC_REG(stat.is_delay_slot_instruction);
>> +
>> +    cpu_l1_Zf = NEW_ARC_REG(stat_l1.Zf);
>> +    cpu_l1_Lf = NEW_ARC_REG(stat_l1.Lf);
>> +    cpu_l1_Nf = NEW_ARC_REG(stat_l1.Nf);
>> +    cpu_l1_Cf = NEW_ARC_REG(stat_l1.Cf);
>> +    cpu_l1_Vf = NEW_ARC_REG(stat_l1.Vf);
>> +    cpu_l1_Uf = NEW_ARC_REG(stat_l1.Uf);
>> +    cpu_l1_DEf = NEW_ARC_REG(stat_l1.DEf);
>> +    cpu_l1_AEf = NEW_ARC_REG(stat_l1.AEf);
>> +    cpu_l1_Hf = NEW_ARC_REG(stat_l1.Hf);
>> +
>> +    cpu_er_Zf = NEW_ARC_REG(stat_er.Zf);
>> +    cpu_er_Lf = NEW_ARC_REG(stat_er.Lf);
>> +    cpu_er_Nf = NEW_ARC_REG(stat_er.Nf);
>> +    cpu_er_Cf = NEW_ARC_REG(stat_er.Cf);
>> +    cpu_er_Vf = NEW_ARC_REG(stat_er.Vf);
>> +    cpu_er_Uf = NEW_ARC_REG(stat_er.Uf);
>> +    cpu_er_DEf = NEW_ARC_REG(stat_er.DEf);
>> +    cpu_er_AEf = NEW_ARC_REG(stat_er.AEf);
>> +    cpu_er_Hf = NEW_ARC_REG(stat_er.Hf);
>> +
>> +    cpu_eret = NEW_ARC_REG(eret);
>> +    cpu_erbta = NEW_ARC_REG(erbta);
>> +    cpu_ecr = NEW_ARC_REG(ecr);
>> +    cpu_efa = NEW_ARC_REG(efa);
>> +    cpu_bta = NEW_ARC_REG(bta);
>> +    cpu_lps = NEW_ARC_REG(lps);
>> +    cpu_lpe = NEW_ARC_REG(lpe);
>> +    cpu_pc = NEW_ARC_REG(pc);
>> +    cpu_npc = NEW_ARC_REG(npc);
>> +
>> +    cpu_bta_l1 = NEW_ARC_REG(bta_l1);
>> +    cpu_bta_l2 = NEW_ARC_REG(bta_l2);
>> +
>> +    cpu_intvec = NEW_ARC_REG(intvec);
>> +
>> +    for (i = 0; i < 64; i++) {
>> +        char name[16];
>> +
>> +        sprintf(name, "r[%d]", i);
>> +
>> +        cpu_r[i] = tcg_global_mem_new_i32(cpu_env,
>> +                                          ARC_REG_OFFS(r[i]),
>> +                                          strdup(name));
>> +    }
>> +
>> +    cpu_gp     = cpu_r[26];
>> +    cpu_fp     = cpu_r[27];
>> +    cpu_sp     = cpu_r[28];
>> +    cpu_ilink1 = cpu_r[29];
>> +    cpu_ilink2 = cpu_r[30];
>> +    cpu_blink  = cpu_r[31];
>> +    cpu_acclo  = cpu_r[58];
>> +    cpu_acchi  = cpu_r[59];
>> +    cpu_lpc    = cpu_r[60];
>> +    cpu_limm   = cpu_r[62];
>> +    cpu_pcl    = cpu_r[63];
> 
> You shouldn't need two pointers to these.  Either use cpu_r[PCL] (preferred) or
> #define cpu_pcl cpu_r[63].
I will change it to macros instead, if you don't mind.
> You could put all of these into a const static table.
What do you mean, can we make the effect of tcg_global_mem_new_i32 as 
constant ?

>> +static void init_constants(void)
>> +{
>> +#define SEMANTIC_FUNCTION(...)
>> +#define MAPPING(...)
>> +#define CONSTANT(NAME, MNEMONIC, OP_NUM, VALUE) \
>> +  add_constant_operand(MAP_##MNEMONIC##_##NAME, OP_NUM, VALUE);
>> +#include "target/arc/semfunc_mapping.def"
>> +#include "target/arc/extra_mapping.def"
>> +#undef MAPPING
>> +#undef CONSTANT
>> +#undef SEMANTIC_FUNCTION
>> +}
> 
> Ew.  Yet another thing that can be done at build time.
As far as I remember it, there was no way I could generate this table 
using the C pre-processor. Do you suggest to make this table using an 
external tool ?


> 
>> +            int32_t limm = operand.value;
>> +            if (operand.type & ARC_OPERAND_LIMM) {
>> +                limm = ctx->insn.limm;
>> +                tcg_gen_movi_tl(cpu_limm, limm);
>> +                ret = cpu_r[62];
>> +            } else {
>> +                ret = tcg_const_local_i32(limm);
>> +            }
>> +        }
>> +    }
>> +
>> +  return ret;
> 
> Why are you using locals for everything?  Is it because you have no proper
> control over your use of branching?

Initially we though locals the good way to define temporaries. :-(
What should be the best ? We will need to change a lot of code for this.

> 
>> +    qemu_log_mask(CPU_LOG_TB_IN_ASM,
>> +                  "CPU in sleep mode, waiting for an IRQ.\n");
> 
> Incorrect level at which to log this.
> 
> You wanted the logging at runtime, not translate. Which suggests you'd be
> better off moving this entire function to a helper.
> 
>> +/* Return from exception. */
>> +static void gen_rtie(DisasContext *ctx)
>> +{
>> +    tcg_gen_movi_tl(cpu_pc, ctx->cpc);
>> +    gen_helper_rtie(cpu_env);
>> +    tcg_gen_mov_tl(cpu_pc, cpu_pcl);
>> +    gen_goto_tb(ctx, 1, cpu_pc);
>> +}
> 
> You must return to the main loop here, not goto_tb.  You must return to the
> main loop every time your interrupt mask changes, so that pending interrupts
> may be accepted.
> 
"gen_goto_tb" calls in the end "tcg_gen_exit_tb(NULL, 0)", is it not the 
same ?
We need to investigate this implementation further. A quick change to 
gen_rtie broke linux booting.
Can you recomend some target that implements the loop exit on rtie as 
you suggest ?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
