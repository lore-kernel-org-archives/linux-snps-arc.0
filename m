Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4B3C433E6
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:31:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6FE66146D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6FE66146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ImUZHufb1FRfoVft8RHr/dmBbVuYiZSSPJkgH57Tyfg=; b=ox9rT6xw1o1jTItR1YokftFLF
	u4xIb7/2iBgHnipxUQt9ezF/Ypo2aDdOd0XxbQb0H3d18XFm7xYRrMrHxUbGhzOOLYcbJ/Pl9c5Gx
	RZcp4d3fP+1zNmDjMMXNx3Y80VdiJlyrXyWGovMgID9VFQTg5hIXrP5k0xKV4cRuRFXE0aNC9jqsQ
	iwH5rfs4ZZSdlr0z0MX03S3x4/gJ8ptJriaxY5MIao5y0RKMjbmEViSR/YttvGCU2CYbKUQk5KId/
	n7rqKA8kflv72nNp2Eb5a1cP1HnmkVJ7uHHgfgEh+y5Ewwcas1lUss3PCtPc/lmCGiUNiLTz9qTCe
	NWoGowSEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHbtr-007ALq-NT; Thu, 04 Mar 2021 00:31:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHWf2-0066hT-K5
 for linux-snps-arc@desiato.infradead.org; Wed, 03 Mar 2021 18:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description;
 bh=xCRkpneIf/oLYVa2YljxcXQ8Hed3Sy95lVDm9TiZLF8=; b=lZhNQpTbEa2nTce6VKnL3JOm+X
 94wdW1pXf39StMeNZaVpvzerKkMvC7/d9c2C4bjyTrXxCvQPTBAeQK31LxFm43nwQ/u9UfagC/WO3
 xizOU+8uI2BzfeyFWIMZLPCzIccqKoEx+IcG51N9jBt+ckZ1g/Na16I1fdDacw1GbOCbV7GeV0n2T
 /53YAER5bwpegDGUUd8MDgjYw/1dsjZTEoOfaZYPZDHYYdvKDE97eLeQWdxZqqjhuOObUBqIce8pT
 45dvuTlVm7T+IAp8yp2Ubd0A3UzJ8Z7kw6dLbr5aN116OIR9NFYuhIWwW8GV60G7kU+lY3TSbytlo
 a6zNZRVg==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHWeq-003oZw-PU
 for linux-snps-arc@lists.infradead.org; Wed, 03 Mar 2021 18:55:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08783C03D2;
 Wed,  3 Mar 2021 18:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1614797719; bh=xCRkpneIf/oLYVa2YljxcXQ8Hed3Sy95lVDm9TiZLF8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JjGVO3BBKc53Wlc/u7QTuUqSUmGttmPKmUqJwnCHEu92EscQB6lgYTSVOmbf6dmZo
 P/kZIePQpzrNUpsIbiAlZX8WL1GXgkw9ZJWadnQSR1HvZ9nIFkqSbKu8TlbRgXiy8u
 w/ccm35Ji6j3EYpq9l7uGEXC1Y7IN0I2SJU7C5CFNC1BFZv/cWBqNHMgWr43nPld4X
 /mb0CtdqMmZxDUepLO7CGR2tE2rgE4N1nsk1CBjrf74cMgkXCFTFVu8bwOcjdnzUaz
 e4+siobjQL6IWTUyybAglGGdjLYlJpH4tXQT7hk5F24gTR29+fWFH+/buHDY0K1eLz
 wZRxVb0IrRcJg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 03BF8A0071;
 Wed,  3 Mar 2021 18:55:16 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 591E14009F;
 Wed,  3 Mar 2021 18:55:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vN3vQY4S";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFx1GxHJfpOrABDthq9FyeCOSCVUqnuk3DpRWv5JuuleX17SoFuLdVYew1+ll4CTZSYvF6P2svdImLbojynES9OdPLOujVddzyBVtgosHvJmoHgO7yASenuLKJ8RNHOB6WXuXhwD68oI+OZLY3AAgKj8Mlwtdg79CH5Ak5x96bczw1wfBq5oGJ1htaPg5A8VQTQ7fBz8wP477kLjna1teUgz0oQJZEttopl/eWgSxNqosrfw+ZyrunApWPBS5MWcNqdLbta2ihvxfyU2eIHb7alC2vzAoSK9ajCelGu/ny7/EvKfxKOztvJEUKeQ3PintZQeR00dgomvzG4vsgICGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCRkpneIf/oLYVa2YljxcXQ8Hed3Sy95lVDm9TiZLF8=;
 b=hwmBDI0HNetTxQXcM9zniaREmmc7hPY3R/YH1k9UrgkbtZFSal5doCWvAIkj/fgx8xKPVSpPa6SqnsRbRb5ragjAMtScQPCdNYV+mtskVkOuNRK+rsOGb+Z5/n9otRjxexGz8977YkB49WY76oPa22f5W5CUMkoCVqEoOJY4IBlO5QSNxjGerEDzOF5DsdnEVpfqODuARzHHLKbLSuV/WSDiEkJn5ioKqg1QlS6pwna9SSJJU97+HgJcnjE6f0FxE2gIcx1OOKfcSPfn8T4MCnY21Q78Eab28CMamCPYPs50XiGqfszRTSGw0fKVBrNgqVbNf6T0TvN3M34oljD9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCRkpneIf/oLYVa2YljxcXQ8Hed3Sy95lVDm9TiZLF8=;
 b=vN3vQY4SXr2EloBg9M1M/hK0BFNV27wEB4L1nYXICIfMmCGUc4M9EPNjSy1/3wJCUcVgj4SXcEhHF1qghenis6eK2yfLWqv3f+ZMBX4cevhtQ9Y4+HdbIvCPx+yAiEAK6aq3lXGT19dYj8VjGlUpMOSv4Ah918FTPlLKXiZ3PuQ=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 18:55:12 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.3912.018; Wed, 3 Mar 2021
 18:55:12 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "980963@bugs.debian.org" <980963@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Thread-Topic: Bug#980963: dpkg: Please add ARC architecture
Thread-Index: AQHXEFe8SQjOwbumRUqr9NokPIUoGapynMmA
Date: Wed, 3 Mar 2021 18:55:12 +0000
Message-ID: <f43a9c2e-f0a3-d346-b0ab-069aed16c8d1@synopsys.com>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <BN8PR12MB333028A46C2A7A80690DDB76A1B19@BN8PR12MB3330.namprd12.prod.outlook.com>
 <YD/PtMrNdGYmBY3/@alf.mars> <YD/PtMrNdGYmBY3/@alf.mars>
In-Reply-To: <YD/PtMrNdGYmBY3/@alf.mars>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85f66f4d-1c2b-4965-134f-08d8de75e00c
x-ms-traffictypediagnostic: BY5PR12MB4067:
x-microsoft-antispam-prvs: <BY5PR12MB406731EA11281D6520BBFC1FB6989@BY5PR12MB4067.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XXuMq7QHsjpbFRRKWWseBjKZjKVwT+uN5xdeNLhsIrJfpUDfHQNArkjhpuV92Q1xFHYq03UAVdNLldz6aBQqGKtQloOjptCxxqTBiwdzMuWrxj9TBd1nshVytC3T8vXHdLcMg0PrdVHLyYdMokMCc09vS5ax4ZKiGMnwwU/L5qvyNUoAg3SMLezyHIt5IqYLviiz6mvhve+ribGFIZS847kNkJkBboZEc52s2s+PaDukIDKd4zBkvmbVGmx+FCSiZtlqxuGEVPft5ulou9qCOyPIboFiqQya2pZfrl2qTnVDtW0roEN78sSehlHuXXxiDQOaydwa8BVogw+rV+BqpdoJq+gP7UEQm/UaPBp97rAkNki9iC5iP0BfXzLtv9CLPdbg6QI1K+C1DFJjjxi9ZdaqmbZKghkcQFq8/Xw1ivLO7tt+tw53WQYrCBkNGJsPDM6EwyoS/wDlN48IZKLfn2sd0xQYqC0rglsSoVRhucI6ASPi/tswKwaJKaYnaF4bnaUi3OCrLi6kSjjiMpwFxpC2QYFe6a+IZJi5bmEDThX9NsquT9xvnc/hpp/m3ymAUVl42SWxFB9V4UhcNcfplbU6u+L4NNT/y2ZNkGIQ9jX10+Yg0pLtoCx4Q58zsAMOfo4tCN8fHAD82hY5te2cT4HbE83e8cATSPRzOVN+KQpBiyq1iH/tzJ3yAsU4Nk7K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(376002)(346002)(136003)(4326008)(478600001)(186003)(76116006)(26005)(66556008)(86362001)(8936002)(6486002)(31696002)(71200400001)(66946007)(31686004)(83380400001)(2616005)(966005)(66446008)(6506007)(6916009)(5660300002)(2906002)(66476007)(6512007)(316002)(36756003)(64756008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TU95b3c2VDBhTUpCRGM5dGpvZldORlFpbmJSRHk0cEROTk5WK3lXUkl1bjRN?=
 =?utf-8?B?cVZoRlZpWi8yeE1ZVVZGUzNqSEcrVnNPb2g3Q1RuOFpxNklnbUs0N3pnWUFI?=
 =?utf-8?B?Wlk2aExQSGF0b3Q3cFYrTENsbmFGR1lQZDVzRzRtUkJhZk5qR2tjb1JtcTlE?=
 =?utf-8?B?NE83VXVTWHhVSFBpTFVMYnFXOXVOSjdzL1dKY0pFQVVUTFdDU2lqWTVZZ2Fw?=
 =?utf-8?B?SHhmakl0a3ZmL2RyeksyWC9TalpsSzlPV3BhQ2VxeS9QVklJaHBFQ0hSVCtB?=
 =?utf-8?B?UlRUU1JxSGlaV0ovRXRXMTJ0QUZXWW5VcmhzSG1QcWR0SUxKRW9EMzcvYWVu?=
 =?utf-8?B?dEo3ZDhmV3VCZlY4Y09TVHRtcE9RSVFiY1QrOCtkY1JtWmJsakRKTTR2MlA1?=
 =?utf-8?B?ZU40VUdXRnp0RlZiODJYcGNtcWtWdlRId0ZPbUJrYTcwNllHT21IQ3Myc2tq?=
 =?utf-8?B?SlljcG9TSm5SbWZqRDk4L2JmelVRVzVIZUVvWjFLbEZVenIrNjQvUkVBTWl1?=
 =?utf-8?B?VDdMN29BV0taVndodmJYWVRUcWVwMVliTm1BU1MrbUVPY3FzOERMbFZZNFpB?=
 =?utf-8?B?U3Jqais4YmJWdnM0RW1Zdllua1BQTU1tcTRCQUtZdGhEcXpyYlF0K2xnM1hk?=
 =?utf-8?B?NlN1eXhHenl3M2F0WlREalpzdnpQVTRhYlcyUG5sdkJOUVNPcGZQbEtmYXh0?=
 =?utf-8?B?QVQ2UDRsTm1seWJ4c1R4RTl1N1JjN21ZT0JYRitFN3FCdG1iaVpHb0wydEg2?=
 =?utf-8?B?b2JiUXhzTXlmSTJDa2p3OWlZODl5TEtxZmp3VXZvcmJTOVk0ZmFReTB2RHZG?=
 =?utf-8?B?NGh5YXdVODhEOVRzYVhSUC83VHh0ZE9yU2FRRTFVUVczZ1hubkJMMEY2Lzdm?=
 =?utf-8?B?cGljMHIvSitFSDFMYnBWZTVNc3pkVElQa0ZiZ0RjZlFDVXBoZlNYeit5VS9Y?=
 =?utf-8?B?eHdPdDE5Nno3eWd5UGZPbS9RTHFTUzZFb2hEN3VuZk5xOW9PelJKL29xZjVt?=
 =?utf-8?B?Y0dUU2dXdkV6YU9FUnc5ZllYUTZaRUJiTGh5dkQxd3NkSitFcmR1VGdCcVNS?=
 =?utf-8?B?VGpyOXRvVitENCt5QjN4cTRjRCtFMkl6TVcyNnZtK2I1aWtoQk1qYUNvV1h1?=
 =?utf-8?B?akNpelR4Yk83N2ZUdWNpOWN6YzNKUDRYb1FQVmJQNklHZjh1VCtMNXdIVlR2?=
 =?utf-8?B?YkZXbFRuRWk1dmVBUVdSQVJIVitCOTZKSkxPc0RZWFUvOW9XU3dldk0wSVBW?=
 =?utf-8?B?dzNZRVlLZXBPcE9JMzJmRmhKRkRIeHNINW9WZ0hzdUlRZzFhb1pGM2RKYUVO?=
 =?utf-8?B?enZqT0ZIRW5SdmFJU0FsSVJsd3FYU2w1NXIvbHJGZnh5SERSOGVoK1gvU1Fh?=
 =?utf-8?B?Qm01bmpNM0FKTzBobDdGczFZVGYyY3MxZ1pkeVRkVGtpMWxHTkVUKzlRSUlO?=
 =?utf-8?B?RjNnWkVEY0UzNHdmK1dreUZNSkM4WnhvVkpBUkIxeTBZVlNINjlXVE9UVmN2?=
 =?utf-8?B?Ly9rUkdJczd6L3VMNGhPRUJDNVMzNUk0MTZENDd2MmdEeDIxSWhWRkg5TDdl?=
 =?utf-8?B?RWRsUkRTb3RpUFV5SVU4ek5QTjBiVEphT1dDMWRaL0VvYXp6bWV3UWNNdTF5?=
 =?utf-8?B?MkpKaDh1N0ZTSllwdE14Zi9PS2ZRdFFSeUcxTVAxeWxUL1MwdzJFUHBJNk1h?=
 =?utf-8?B?eFV2aUdLT3ZCNys4eGt2OHpVaXVpeUkxUUJQbVlRdURjWm9sVUNLWDFSY3hs?=
 =?utf-8?Q?BDdoGu8S1ttPaU/WH4=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E05C1380154AA0428CCCC56A38C27350@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f66f4d-1c2b-4965-134f-08d8de75e00c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 18:55:12.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lh1NRRtmBkzcwuhdvJbtQJ7vD99M+MJirkqQLZ6+IZ0lOcN1/BkCaoqhQcf+JW7wGUm/zCW6DT4+utWUVRIBwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_185543_868736_A50764B4 
X-CRM114-Status: GOOD (  15.18  )
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

On Wed, 3 Mar 2021 19:04:36 +0100 Helmut Grohne <helmut@subdivi.de> wrote:
 > On Sat, Feb 06, 2021 at 07:25:35PM +0000, Alexey Brodkin wrote:
 > > Any chances to get updates on this one some time soon?
 >
 > No. The triplet cannot be changed once added. Therefore, the addition is
 > often deferred. The absence of the triplet can easily be worked around.
 > A bootstrap can be prototyped already. A major missing piece though is
 > glibc 2.32 being packaged in Debian. That likely is a prerequisite for
 > resolving this bug.
 >
 > Things that often need architecture-specific support for a new
 > architecture include:
 > * guile-X.Y (cross support)
 > * libgc
 > * libxcrypt (symbols)
 > * nspr
 > * openssl (packaging)
 >
 > Are any of these fixed or confirmed working for arc?
 >
 > I suggest that you coordinate with Vineet Gupta as he is already working
 > on this.

The current WIP is at

https://github.com/foss-for-synopsys-dwc-arc-processors/rebootstrap.git

The deal breaker is glibc support since debian is at 2.31 while ARC port was merged in 2.32. So here we patch in the entire ARC port :-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
