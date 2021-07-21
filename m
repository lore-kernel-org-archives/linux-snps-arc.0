Return-Path: <SRS0=14cu=MN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5C2C6377B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Jul 2021 20:16:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB47E61241
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Jul 2021 20:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB47E61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsB84gYcDscOslsWYJsziMKrx+Hiwn37ZUibD1hSuBs=; b=cH4pH9In+r18J8
	eZ2Fpd4/4LxZbBxx399fi6Yjy+8GiK5rNhPgH9J+MT6CauBVSYt5k1W9+Xw/4TJ+11Qfs3y/OCHoP
	dzUDq6qzsNJAWcLWa+c3vBAvnC+7kOj/Ct3ggtPeg7Wq5roAjp5kL/Ug3yBRNtnXBuoGQaZWYCexw
	Rdp/bkgzq3XFbLL20DwVBS06UQSoOOY8NhuZrvFdeTGrpL4QxNis718ty7ZJxBN7e+Mfak5EpfZ8M
	+zGfUdf0GD21gkYR9/GxTW7l7q4cvCc6hdWKAsXETBs/KTsehM/40clWSRmhXiBleh8E5AqpHiNlW
	emocMTb3XERIA2N3zA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ie5-00H5zO-8p; Wed, 21 Jul 2021 20:16:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ie2-00H5yY-3z
 for linux-snps-arc@lists.infradead.org; Wed, 21 Jul 2021 20:16:43 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B4D9C37CE;
 Wed, 21 Jul 2021 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626898601; bh=apMq9BDm+WL7WJ1zZ8hlwxmhINAvqIehEO/3pHdMOXE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=NUQRD8OttNxf4rvn0dlS4X4y6PzEeAjIsa3qFIHcjwWKYFO3k7iUidmcFDOtDOQGr
 D3Ngu/LFqoA7u3kuFFE1GjpicBg7xR2BTqmHiWXZ9w6jrX1fN+6m0Nzjl4deRLYwjg
 IJ7awFw9MRu9T9nk3YQmnbNBEWUbg9JAewxpDHo9uAKcuMnOF0BMpMKCd1/Or8vBOP
 ZqLEmn/QYiMi9nglFXuhin4LFJJPxh/m0XRzg3OdkIGllUTJlAIn1WgXveBCcCIxH2
 9oC0JHRcJZaslHf2dN9m6wr9eJIUr4GWHJvuGPbBds//w6X9IJOrKA9Tgsvm6hWlwV
 BXLNs2WIMyqTA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4A226A0077;
 Wed, 21 Jul 2021 20:16:39 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 27709400F7;
 Wed, 21 Jul 2021 20:16:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MeVISDaz";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgVrMZeIrsPFEPef0uzSbAUxP2/v8AZFo8F8JhFspoQA5zrLesrmU4I+hLwNzA6tFtBCxCsxcCJRUZs5InqEz9BN5kYwtpcx/UfCz/IPxIO4stWLJIQn/xvkY2senX7sbhalgwsokF+9H9WA9QE8Fo4V6PIxRYH19IH6KFg4ZNsMVQO+8zphEL2zJDqrtn+zpIEI3+lnIFy1uTlf1beCdxQ3qvmvbcxhwpkjfTg//cVYmi7gW6DJTG5D4viTDahH/fE2wg5F24aleGOM2XRwZJwctUuFRkwdhMJqRuqikppVZZcXBlt4hhVrOYuwdfJ2e2aTVvg35eF2LLmX9yyT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apMq9BDm+WL7WJ1zZ8hlwxmhINAvqIehEO/3pHdMOXE=;
 b=dPl80lEe4xyPMXJ3Bm3LA6WwD3l0mVzHcTJvjEXrLg1aF9iE7NeuMNUgkk6Kr5mH29tlG3pD9QPEpHMt6UfQ0RZhJ5J0xB85JPgRJQvcXtM29j01m9chGLlJMJ/lGtpkqB230Pc3xMrAdqXxfIDSe+Bf0WCttZWVgWOojAcj5L4Fp3cT2UPmDxT6kULCFCK9e/+EjNCROKr02QqDKfGlzzh/NRDX8MxddkkPcfmg9NIqqmnEeUev23kbjDjE5aqpn+ECXDuED7wmpsHa7MVR1+H40FdTQ5qVA/BaLHTe1gAeUJaYNJ5bOlzIgK5Uy4ttAZQRg/lyL5DuB3wqnZ0Y+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apMq9BDm+WL7WJ1zZ8hlwxmhINAvqIehEO/3pHdMOXE=;
 b=MeVISDazO7daICeho11sx7qmJZXurW+kYD7Anm1tywZwGi6OK1cejTyRvHoUqPiznRkmfKo7A6xRs7qnjw/0lLVcsgp01OvSI1AMswEHCxg/zS8+7BrkV+A1TOnVWMqwMxFPn2w091CO0rE5yPJrzMXQP5mvMLxpdAcknEGpD48=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 20:16:36 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 20:16:36 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 1/2] ARC: fp: (micro)optimize FPU_STATUS read by eliding
 FWE bit clearing
Thread-Topic: [PATCH 1/2] ARC: fp: (micro)optimize FPU_STATUS read by eliding
 FWE bit clearing
Thread-Index: AQHXfan0THbrCKw+Y0qWMAKv0NMn4KtN30eA
Date: Wed, 21 Jul 2021 20:16:36 +0000
Message-ID: <a36903f4-a18b-a41d-6ae4-48779c253220@synopsys.com>
References: <20210720205800.1056218-1-vgupta@synopsys.com>
 <20210720205800.1056218-2-vgupta@synopsys.com>
In-Reply-To: <20210720205800.1056218-2-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: sourceware.org; dkim=none (message not signed)
 header.d=none;sourceware.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b7fddde-9b03-4f2d-85c6-08d94c8470d2
x-ms-traffictypediagnostic: BY5PR12MB4918:
x-microsoft-antispam-prvs: <BY5PR12MB491891A090F642F6FE4A56A2B6E39@BY5PR12MB4918.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4TMSTGNYis6DmCDTTIkge0zfAKrZunNQlxn4o5tztBK9T+xn1FddHVr5LlRtxPtTbfAsqB+H8kdKBSZQDIqdBSLnoudT5zRXSW+E9KrnDEjPhu5Q2JQbSwv+43XdK5Hx8E7qvBf8N+jXmIhOcHYs7gQbqjseW/KfGiwfg5CDOXwH3wtmv1Sm7bJIBRRnpTpsAnYsXWs4FlVqruCv6znZEXTK2xIZqN/3uy7JBdDwkUP+sHYwnVLOK/zlVuYgVQWb49Jj5VcjAr34nxfb1m5bTwvSzD+P05hgN52dLfHsbV5k+dEJoDcL/i9ZkPGldyvpQVQurT8iFOlPIJHLLLo47BF/d+LlDhAKgy4NuNwxSU79HhB2HqujE0pqYtcvdxtzkKgTlLIyhi2U3A8pqOga3d674sadkJImRd91vbjSfgMtiu1bgodD9zvKbi8VgTyKGzII/v3O6b5nTcAw/3bVw0zbLc47QrneRzzsLuVXoLKcjAGvOGvVAX/0HNGWdftSBYQ/ZQon5oTJCmp8FL2nx0KG4250lo8bHg75RuAaRyCuVaUcCQb/G+1SjIk520nG+RZjc3fC6c7ERDrf0ToNUIIwFfSLuJycPQsKx3/jSDx+t9Ar01YKOGhpL0lCu8n22pa/IIGLEOhPvC910FUj6W2FBMyO7VhhjqpkYYA4otAa2dzUuAkhjvWHKsBQwDc5ZRZguz3w+v9r7B2jFtjFoIVD1ELa02jrJT5x+ggWFczp1+xsu0yMxYc7veDCBdTcdBzOv/+Vb2WwHcp2ZpfVouFcX8BUQ81GNuhd5hTHWT7ULHfZThWjrF9G1uSRJmx6F6aa9bHCphxJy/rsX69fRbjvda8p+A6uVQIGFW6dV4c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(346002)(39860400002)(396003)(478600001)(36756003)(4326008)(66446008)(64756008)(6512007)(6506007)(66946007)(66556008)(8676002)(2616005)(966005)(8936002)(316002)(122000001)(76116006)(6916009)(31696002)(26005)(86362001)(38100700002)(66476007)(6486002)(31686004)(2906002)(5660300002)(53546011)(83380400001)(186003)(71200400001)(45980500001)(38070700004)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dERkRk03R0NFL0pjZlBWLzh2dnBLeUx3WnZtK1R1cUN0MzFLb085VjE4MzNQ?=
 =?utf-8?B?VXpmMmNRK3BJK0MrZSt0eDZXbmlsdVJxMzRxTmtnWXlOaW5sRGo5MVJTbFNj?=
 =?utf-8?B?NHJuTFlCVmMvdHAvMklLQW80WW5EeUpyYnBSVDFxM1hxa0I5WTRxZ3pyaDRO?=
 =?utf-8?B?S2p2SFBSazVvQzV1MkRVVEQzOWdpMmNLRkw1ZVp4dHBPZWczZ3NlM1IwKzMv?=
 =?utf-8?B?enJNYUFFVFZ4S0MwOGgzU1hxcFBvb1BWTTREOFBKamp3eWpaVDlqZkFPVG5T?=
 =?utf-8?B?OGZIN0xUdTBUV1NmekNLUFdLMGczMGFORVVTb2ZONlc0WEZrRkZVTmdZWmF1?=
 =?utf-8?B?NnYrQWo3YWJiMEMzd1p2ZEpQUVRWdmpxZ2l1SkNucGxFQURLYVpkTkYvdXJa?=
 =?utf-8?B?LzV3MzJmb3FSTy91Szc1bTVKam1vQ2hwNVI0NEtIMDJHdk5qcXVZUEZwc1FB?=
 =?utf-8?B?ZW5rcDZKVE1PS203L2R0UlFEMG9BYjAwME5Va281VFdxU1VhdlJHeHhvMEtS?=
 =?utf-8?B?djNuY3pZOGxOVGpzUzVzbStkMmo2Wk9neEpldXlsUW5CZE1zOG1LVkRPSUND?=
 =?utf-8?B?ZE4ySkdEM1VWVm5WSGFSWnByenYxM1lsZ1ZsWTArQ3NCNDB1UEY2REp6azVp?=
 =?utf-8?B?WCt6MklidmJGWkRDcUw5a0hnRCsxUGFIakkxRU4yVmFTMUdHd0VGQ2VvbzNY?=
 =?utf-8?B?SVlUTVRQaVYzUVN3Qkp4M0N6eXk0S0ZJbDdBTERSZmM4YVV4bjMwczJaUS8y?=
 =?utf-8?B?RE52VmRpN0pJZGVJU2o1WjAwNmhMeWJPM3FHTE1ZQnlHbjZ5d09iMUtxY2hP?=
 =?utf-8?B?MXc0eGZhZEgzQjJlVFMyTHBXNHhrMFkxMTJaK0VVUVhMdWlRZDl3Ulp0MVBk?=
 =?utf-8?B?TStUajJhUWlhRmM1ck1nZmhlMHZscnlrL01IWWhnZnoxSmdtanQzRlNsSVZ2?=
 =?utf-8?B?MnJMMGxPMys3SitlUVRzdUhhbEs2a0poTVFlQWQxMmQ5SVdUOWV4M1RWYXJx?=
 =?utf-8?B?R2tjZVlpOGhzZ2hnS1F6RzVRSjNBRkN6eGNZNldXN2NBZkQxMkRpY2tTL0lQ?=
 =?utf-8?B?K0lqYnNXZnlKSTB3YWFwYjZyTi9TSzJMd3UxOFo2MnBRY2NYWVFsYzl1V09P?=
 =?utf-8?B?SEQ1Tm1HeERpM3lReVYrdXlQcWxROVB6TmkzdmovT3pvanNNZ0tTVUdiMitp?=
 =?utf-8?B?NmpsZFBuRDVIenBLZHFRd09NNVozZng1eks0NEU0OUhjQU1XS1kyb3B6Nno1?=
 =?utf-8?B?M3VEaTc1RUgyR0Zhak5ieWhyMFJZQ3V4WFZoODZTTi8wUGErdXhaY1RWeXMy?=
 =?utf-8?B?aU1XRDlwQi9WS3RKVmZ5bEtzditxb0ZVRUxLcGFMZkxJMkI5QmNzNG95S3hm?=
 =?utf-8?B?a29rdE1JclJnd3hJd2JOaUxHYmxGeDQrMGNBdFVuQjB6TlJ2L2dhcjRFbVp0?=
 =?utf-8?B?Z0J0aE5MeGNrQ0dGM3BzWkZRMWFoYjMzY2ZRbVFUVjNTNWdDd0lhVzdCM3Bq?=
 =?utf-8?B?TSswSHFjaDJkaDNaZTBlQUZzL21CMGhxdmk3anF1VW5xME9UZzVoenVxY093?=
 =?utf-8?B?NWpvNlZ1d0IwazgvSEUzRi9tck1iL3Eza3Y4L2VzUjlCcjk0MmJFUjhTMzVw?=
 =?utf-8?B?Q3ZJOUt1bGJCMmtUbEhKUlVlakczZ1Btd2w3RFRPTDBKSGcycENDTFh6STZ5?=
 =?utf-8?B?Y0hoYlZKRWZ0R2FGeitpVTk1VWduWU9pMkt6VXRNc1VEMDVnM2FCUThOeUVJ?=
 =?utf-8?Q?Zubcw8SO7ph81Ips1o=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <A6AFF922A5D70043B86E3F19DFC51735@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7fddde-9b03-4f2d-85c6-08d94c8470d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 20:16:36.1075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9fO/UhLHIk0+iEHrycJmhJtjkHLsuD4YFzHq51D1yTgYL2BpbeSir8K1KLI4mXgslJwXShOEW01CHnY7HcQ+1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_131642_385464_FED44B06 
X-CRM114-Status: GOOD (  25.39  )
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

On 7/20/21 1:57 PM, Vineet Gupta via Libc-alpha wrote:
> Any FPU_STATUS write needs setting the FWE bit (31) whcih just provides
> a "control signal" to enable explicit write (vs. the side-effect of FPU
> instructions).  However this bit is RAZ and write-only, thus effectively
> never stored in FPU_STATUS register. Thus when reading the register
> there is no need to clear it. This shaves off a BCLR instruction from
> the fe*exceptino family of functions and while no big deal still makes
> sense to do.
> 
> This came up when debugging a race in math/test-fenv-tls [1]
> 
> [1]: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/54
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Committed !

> ---
>   sysdeps/arc/fpu_control.h | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/sysdeps/arc/fpu_control.h b/sysdeps/arc/fpu_control.h
> index c7d101e7838f..ae4348321c16 100644
> --- a/sysdeps/arc/fpu_control.h
> +++ b/sysdeps/arc/fpu_control.h
> @@ -81,21 +81,20 @@ typedef unsigned int fpu_control_t;
>   #  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
>   
>   /*  Macros for accessing the hardware status word.
> -    FWE bit is special as it controls if actual status bits could be wrritten
> -    explicitly (other than FPU instructions). We handle it here to keep the
> -    callers agnostic of it:
> -      - clear it out when reporting status bits
> -      - always set it when changing status bits.  */
> +    Writing to FPU_STATUS requires a "control" bit FWE to be able to set the
> +    exception flags directly (as opposed to side-effects of FP instructions).
> +    That is done in the macro here to keeps callers agnostic of this detail.
> +    And given FWE is write-only and RAZ, no need to "clear" it in _FPU_GETS
> +    macro.  */
>   #  define _FPU_GETS(cw)				\
>       __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
> -                      "bclr %0, %0, 31	\r\n" 	\
>                         : "=r" (cw))
>   
>   #  define _FPU_SETS(cw)				\
>       do {					\
> -      unsigned int __tmp = 0x80000000 | (cw);	\
> +      unsigned int __fwe = 0x80000000 | (cw);	\
>         __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
> -                        : : "r" (__tmp));	\
> +                        : : "r" (__fwe));	\
>       } while (0)
>   
>   /* Default control word set at startup.  */
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
