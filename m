Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C54C47082
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 20:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89B8610A2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 20:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89B8610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXSqbqKoWq329y/aNlDYSEECiqO8gTFyn0827eLRfg8=; b=zFApqD0nj6kzci
	3XWA4ApN5oqZJ8NCoT+1trgv/8FltR1fCAQHwTFDJYXxSh32KavhfNiOGFkpnoKbuaCRK6C8qgEHQ
	ZSLr6WLJ3Z+U8msLxLGnH0YBmq9xshW2UWESCwTzAFYcYQ6fO4ZNGh6evAO4i9lRBmSB8btvnU8g4
	yHssQ8Iod2sh+MFK4UIQUkNbEwfvKZ2pRAxGU7F9tt23fHm5lMsL/pzyAorSI0GO1G7r82x6kO1Qp
	DN0uFaV6i0DG8fcXMog57HtU2XK4Ja0wo/3FSF18PpJH3vxDT2l7WYP3AfjoKCLpMqEexB8iK8z7b
	y7NlZlBDMgh8b0i3dndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqLa1-005Gys-9X; Mon, 07 Jun 2021 20:10:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqLZy-005Gx8-68
 for linux-snps-arc@lists.infradead.org; Mon, 07 Jun 2021 20:10:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E62E94016C;
 Mon,  7 Jun 2021 20:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623096630; bh=mg5jL6qzTZd8G2OIrgkHXCwfcAV2authcJkpv9TBY7c=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JcCx0UYPIpq52yRq9oxxnKYthNkHPaEJne5c8TKsvgMcu0I2D8esJU09A2VB15YBx
 CBOoC+QvVq+adNpt29eHU1TtBNOuOLqcMX1Z+CF77fzq66yNuKwb4y3fuBFbI8fe/k
 peYn4wZeaJS/MUDrCdXjdTUY+lnvQWnTH8S8luYgsjkadGpWNUYUwqT9DLRhfKTqBt
 juq2DMvmXSIp8hfoxdyGDFPJL8SaXwXmLZH9bVieVEILbWP0S3guXlnbQEfquq+fkh
 RGN1mvkoWPCzeCaJ/rMnrgVuP95RFwJZNhtUCmimG8Lrs5R+UKWAfyRjac0pFFKgKn
 PbIO19RA1X/+Q==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C27FEA005C;
 Mon,  7 Jun 2021 20:10:26 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2F9BD800C4;
 Mon,  7 Jun 2021 20:10:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="j4/OmtEv";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1un8zalkebU1xgRzweX//Sus5lr9L5jf3hvsrF4SCSezAANyQBO4NhgB1z2oG0t7s2iLcYGgu+q8pLZABL5dXkE/snqOMDCsS2KuXiAu3iYPE05ObxpAfcvIUlLff51nef89vBAFiNRc8FBNqQmPN9qvLW4Xt3c/e+wmSKBKNZYfTwPhb6A8XrXIsvV8LTy3xvz6Y2qh8XnlWM7tSDy5WRM+Qu/wSKZ2N6AL/xTqFfldyt4rOQvwxN+8dkRWVj9ykvIFdTFk4Sf+ab9HRbu39ozsroXFO7QYNE+cFgytXttrtGbdgWb0V47qRLq4aOZRfhGi4Aa2sNzOOpppfZoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg5jL6qzTZd8G2OIrgkHXCwfcAV2authcJkpv9TBY7c=;
 b=avhzKmBVWPqeIaJeeDEoOxZhroYMcJnN6cbzq9GofmQ1DI/GeCF0DXMSiCg2PljbH0z6Au1jklZJ1Ug8HjfuVyjBVNM30TRw9fe+ibmNM+CXzIuxM/Vi5iDd4qZ5OZnLs3MopE/7tBcWknB1pPZZpw0OCthw9NjldHOvJUqqtOAllwAHh2GRYXhbKltIUoo6E0dhyVlp8tWUa79oqX0vEEsXEI1K7/hmUWkEr1wERKbLlwSdTo8dIb748g2uKYBX5iwhIfAZeEeZdzqY8wI+xDHtsdlplfkw5fbdmzsu2bcdyADpA4SqHena+EUSmUrz7xShoHTq2QSQoZ831Do+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg5jL6qzTZd8G2OIrgkHXCwfcAV2authcJkpv9TBY7c=;
 b=j4/OmtEvH+nuLFUKJC+clH/AQvmLehlTmmUBClMMYk8TNmQSW7Z3cQ4crc+xvT0VM4Pet+YQ3wYF4s+kHSgtbN0qjjjzTf4MQqWwuv0owANi4J7uhmd+sGcyvO+0DnWqUq1ldaZ08kCvldcjfNai/ImAIrRTlu2TYpCugi+CZdc=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3253.namprd12.prod.outlook.com (2603:10b6:a03:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.30; Mon, 7 Jun
 2021 20:10:22 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:10:22 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Matthias Klose <doko@debian.org>, "989453@bugs.debian.org"
 <989453@bugs.debian.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
Subject: Re: Bug#989453: Debian: gcc: add support for ARC
Thread-Topic: Bug#989453: Debian: gcc: add support for ARC
Thread-Index: AQHXWfvJc8eW9m1BPE6euwCLTdYg/KsI/lGA
Date: Mon, 7 Jun 2021 20:10:21 +0000
Message-ID: <13636ec3-b734-3ae2-e04c-5487acc34023@synopsys.com>
References: <c975d326-fa6b-9fb7-6f7b-a30217bc136e@synopsys.com>
 <746063d5-762a-79bd-529c-c8f92848d043@debian.org>
In-Reply-To: <746063d5-762a-79bd-529c-c8f92848d043@debian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: debian.org; dkim=none (message not signed)
 header.d=none;debian.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74ff1f21-6b1b-41c2-5238-08d929f047ad
x-ms-traffictypediagnostic: BYAPR12MB3253:
x-microsoft-antispam-prvs: <BYAPR12MB3253D37088DC64FEDD8C14E2B6389@BYAPR12MB3253.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 41yEApouOAuSKjdMxwekqRg0h+SQjctkBVU1uNLV8nb97lRdWwSUiNxvanrePRIFgm8dB4w781jwi8wF2WEaA5uSHXwlypbPxAOoIz2Y713Lzc4JQxGA1zhH9QNZl9Dj596bYJ6bbix4Y6Qv3F/E+JkxeSi0CjJXRONEPA3k3c+V/7ZmuylHObunBt8pWsHtlIpMEuFz9ILApgohtCNmqHwURBgwT3I9WlSjFJO2JkBQ4gxwX2wQYAzWYxvrgZHkOxt9D3rncRaPuqOW/AE5yi9ZBR6WWbaCxdDFDJ8xq5wRdMCs0v3ACIl4yumARoEGrNXKScq/YtpmfZGIG2GcrF3mgw2t5UTvRcsnOi1V6Ih77YzAdN5NgRYJ/XWBvCJU8pGS0JZ9otzpdywGdAzInl+hx/qJqYF3DUtvISFpjeqgjaJoV0PTrMmWuJ/fJnhONpS3WcabrDhdocY5ry/DuSj3uVoUAnXLhM8HQLKe/zlKyuBCPXA/Hfwd26SHvL0VZiF8WkwyAgBifzr+K7Ya/9QC4Ga5ONLgfNw0VoFUiy2yqxU8sxPve5fq2+pGqBxSCLpnmxnvh7MU0tgNuZ+yXNFfX0BxlBSTb5/2U4nupDtSeRwhhzpHGl5JoukBY1if73S20/1C/iC0qDXlCvrSGGUz45Q8cRtXao8Z+dNfDsK8GD0bBAHFbfDUHbWIykBC4LvHS707y1dUwqsynRMyo991FGEYnNpie4MiXP4VZgwbOyuUD5iZ9tFrncGEMdD2Lj+J6hfw+eIgS4tZVrmV9l4laRGQhj3vmn4X9eg3/UyaAYxK9qfIzBuoINDm2cFe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39850400004)(346002)(366004)(5660300002)(86362001)(53546011)(6506007)(110136005)(966005)(54906003)(2616005)(316002)(36756003)(31696002)(66946007)(66476007)(66556008)(76116006)(64756008)(26005)(8936002)(31686004)(6512007)(6486002)(8676002)(122000001)(38100700002)(558084003)(71200400001)(2906002)(478600001)(186003)(66446008)(83380400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VncwYkF6SkYydHZ2WVlMVnBvcHdYeFpqMWhMSnpOY3V5ZWxjWFlNU0taUjMv?=
 =?utf-8?B?Q3BnVGNDNjBqL0xFYUZoRWlxZG1FZ1BaSWNXNDRSSmxFaTZsUzFrdFp2d0o0?=
 =?utf-8?B?YkZZOXVNR1hvVU1JdU0zV3pXcUxWK2daSVFzeE5pS0kveFhZKzNOQmtsOEdG?=
 =?utf-8?B?Z1dqdUZqVTY3QmJiQWExMWw5NjcrUkpUSnVoamxrcGVGZFhtay9yd2ovVnlC?=
 =?utf-8?B?VnFBaU1LbHNub2tHczNweURPTWhsYmkxY1pqZzdTZk5EMXRMYlJadUNSOXBG?=
 =?utf-8?B?K3dRMU9pZG1zZlhnSG5CbVU4ditjYTZoejhQa05HNlJWbnhscDI4QnY2cGpZ?=
 =?utf-8?B?STEzQTFvRnRkYmdEY0s2RWNJWjYyRzRDVUFrS0xUa1JMNks5bXE5ZkJLYXVi?=
 =?utf-8?B?RVdnZkZKNjNRVFdNVmdKU0Y5MVgyeVl0NHNFZkwxdXR5YjZWVENIV082dzJB?=
 =?utf-8?B?WnUwMk5pRFowMjZVVlBjSU0rVitLbllCTGhaTllBck8yYk8wTVZkdEl5ZkpK?=
 =?utf-8?B?ZGFvUjZFeTZ1V09JRlFCRVpjYlFTUHpuWDNEeDhqV2JCT3BwMDl3dWhrNzNz?=
 =?utf-8?B?S3Q3T09MWVpxWUx3T09lVVhuZFNTdzM4UzZheUZmeUNzMHdrRWEwWko5WVlJ?=
 =?utf-8?B?Q3NUTmt4a0hsa2NWbDg5Zy9vVXh6ekc5UE1iYmcyc2hyNkg5amxnbUc5UExL?=
 =?utf-8?B?VUdhTGxQWUZHaHJBWlFRS0FjQ29yaHVTN082YTJKNE12aXF6WkRlTDluRG85?=
 =?utf-8?B?SkRMN0VjUGVzN1FaN0NQTy9sK3IzNDhFSm9ub1YwMFkrUHdTK2dwWDY2Tm95?=
 =?utf-8?B?ci9MMUhhcUVvdzJSOVdOQjJaL0l0L1dxZlBrbjd0T0w1NUpvUzBJTVVnUWVp?=
 =?utf-8?B?c1M2N0RXVUF1QnRIOXZvYWlEdDlYNWNQMXBxZEdWZE5iVmZiL2hvRmVmNnk4?=
 =?utf-8?B?QVp2MlZBcHpHYXo4cFVLRzc0eUVWUzk5eVRxUE45UE5IbU5pUGVCbUM0dlRC?=
 =?utf-8?B?WitHSUhnVVRFSXZicW5ublVINDlTYzJRWnhGclprQ1hjV2RVZXV0T2JObDJn?=
 =?utf-8?B?VU9kS3Z0WU1WdUk4cUpaSVFmOWQzbzhWUkVsY0J4cDlMQmptTjJxRW1naTEv?=
 =?utf-8?B?NjRjeDk2ai9ESnZWQ1Y1VVVjNGYyU1pvRDFkQmVLUTdBbFk0WCtuS3pYT1ZO?=
 =?utf-8?B?b0V5MGQyZVBIYkRSVWR5aHVCc2w1TFlHdkgrbWwyV1d5M0ZjVHJzM3U3Y3ZY?=
 =?utf-8?B?SUFHd2plem9nOW5yR3Rsc0lvSStwcUR1UGxqc01IMmNHWUtQSVdPTWl6ekd1?=
 =?utf-8?B?YS81cXhGZEtCMmlla1kySFhyQXdrZ3Vvczl5alBWVmc3M1U5endvUmsxT0xW?=
 =?utf-8?B?eC9UMFNpSlJvbXJIVi9Mdk1jc0JOYkNFNjNGY0J3MTNIRG9sVHFDV0N5a2dN?=
 =?utf-8?B?MklCZHlBT0cwSFdPR1IwSkhDT3MrMG50aWw3SC90a1VHRlJpVy85dXM5MXhr?=
 =?utf-8?B?N0M3QW5WYng2dTJVcFVBd3VWN1VPeTl2WFNnQ1pVL2xFOS95S3dDVU1MNU5j?=
 =?utf-8?B?SGlrSnRGSFhtOUlyUUdnUzE0Zms4WG1MOTQzbDIxZnJsUzBTZDNhM2k2bytX?=
 =?utf-8?B?OW8xZmkzVTYxT1F6elRsQ1o2V2Zsb0NXcFl4SzlPZzNRR1dyL0FpdFl5Wlk3?=
 =?utf-8?B?Uzc2MzNWL3lOc2VvT3hiblRKVGs0by9IckhYODNaTWJ1LzZRTUo2RXV2OE9G?=
 =?utf-8?Q?H5jFw3ANeeH/XEJzOo=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <BFD3A622518D8D4F897D6B7B154AEFCE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ff1f21-6b1b-41c2-5238-08d929f047ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 20:10:21.9717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVBxh3CxBlt624+dakF0TUx21xNe6AjXh7LVOX4SZby6+ynshP8J6dt4pAZS3+RcK9eBIOkycgtMGSRNCLkfAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_131034_329512_2D6590DE 
X-CRM114-Status: GOOD (  10.62  )
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

On 6/5/21 4:12 AM, Matthias Klose wrote:
> Control: tags -1 + incomplete
> 
> These definitions have to go first to
> https://wiki.debian.org/Multiarch/Tuples
> 
> Please update.

Wiki page updated now.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
