Return-Path: <SRS0=14cu=MN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E5AC6377A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Jul 2021 20:17:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7A661244
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Jul 2021 20:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E7A661244
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HLCjehwX0ssPa/glOtesFedTrV1S2pgfUF2C3V/I9Y=; b=hr1EXo30izvCmz
	ANXESfSD6hhQZGT/qL03GuCcUkxFZow9qlwhewRTt17fUOLsFQsPfK2wGOThFtO+UmQTCK7Tt7DoL
	JtnyAoUfTyWUxerrOUXqW5JezWjPyRg7wwlaOOi6NnzsCfTQVR4+0uGxgsVC1Et5QxyWxUs+2zhy3
	z3Mq7xDX0EWxSI3BN5vahAd1PMwmOdLX+YeBQYoXCwT4pqdrwr5YpPdEUNW2HBWbfrfYfnIHMiOk/
	9m34moXByWgl140MJSOlKysHzOR9qhmMkoyEoV9fKdc9DJ9zY6ncRldeUl7cEzeD076FIiiLsuz8j
	K+AWLuj61qoXK3fAkYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Iej-00H64X-N5; Wed, 21 Jul 2021 20:17:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ieg-00H63l-Kb
 for linux-snps-arc@lists.infradead.org; Wed, 21 Jul 2021 20:17:24 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D293E45F2E;
 Wed, 21 Jul 2021 20:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626898641; bh=+9HeP1tmGh0UVy0EHJw/xF60RtprFBtx+4TS6FkLnTc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=i2ZDkAnfM2hwxWu8ESmlPntKH/BBR53S9Lc1+AjVc/V8MioM4sCTA0MLPNMOhYpsF
 a7bE8PyJ3A862/3jigJkBN7uqRnO9qeOp8BM4D1HiBlGQQE2IdYtMJW9QOZoXylZfy
 mlSaahLWxhvOPf5N3SUd3tbHsH1XUDpSxLtq8n0PdhW+KWZGs657peV6kq7wEgS+bU
 s/1Xs0VK/HPWIz7u0m1h3tNLqcUKM5+tUPb5NsOVE0rXuaBvw9A1paoc9OljzCaAKc
 dxL9C2MGDmvKDbq+2bQ4oylUPDdw3xB0URWF1om7dtwC8kCmsrr0sxYZHAqjsUPxg5
 rZFrYL7uHPOKg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6A6BEA02AC;
 Wed, 21 Jul 2021 20:17:19 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9E0ED80025;
 Wed, 21 Jul 2021 20:17:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iXLupZvc";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2w8p8jSvN/ADt2+MBTilSstvuHhupDoa57QD9SG7DaOwdNtfLY1mHvV/+dC+yu5tBqCdve6QQymQ6UlcPfHKCTvTzXBbstDOv1haXUYuVuIpnwC7AJn7tofVY+64RJnAWJpZfqMJiN7cREIuFnxAghchpjf/uBODtJx2eiC7aZlPuNSxE+0Jf2Iv3zgXlWJeZHlSaP7C0J+j6UYNz0AmKcRQ7Na4jYeOcVxlBIOpRqpAuf04LbnFQqWfnpKa1nxWaFtPF4eOgjY08K8szjlaJWe2lIegaowN2cLiYXJ2NEl0lJWbHuthQvkVjbMBdjb/hOvAZkC4nFdEmtMSDP24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9HeP1tmGh0UVy0EHJw/xF60RtprFBtx+4TS6FkLnTc=;
 b=fqigi5b2J13DZF7tCTbaexQVslwzwpcJ9P4qLf/1XSi/N4n+zFYBcYl6z29FZplFfKsXsB14oylZ2h8pbh7K1TaMc5tKWyd6/d4HkInwLVg9lIRXAc6jqH/FOpXzmB6msjM189Bb+xxnoLNrCKldLAVY6yIrFq9LsZNcT5nlJeJeNNwW3SQ2blMGpD59oFjZCS80PYfA4Vo+9Xaj7xHHrocKNfMBHDH5Iq5l+T/8RIK5D9zVMI0eYBh7WMd3Nlv7u/zhcB+YKVn8kcF6h21nw2NsnXCrYJ840UyqK1fI9eimFplC59tXy1yVGBt42o7LiPfSm3dVQ/MOENHwkwuOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9HeP1tmGh0UVy0EHJw/xF60RtprFBtx+4TS6FkLnTc=;
 b=iXLupZvcgtxKOJdmlim/5ICyBMyZYmdH0+62vuyp4Q5WWs+hQzP3Nf0fKB/btmdSlS8wVJRtsi/BqX2R8Q7PjgFbZMZqhw0BC99pR+PYpammc2qdWJp/0a3ygzaZ7X7VgeygErPOIATnVbjfQhbxOAMZUS1sp2ZEnj7r0tG43OQ=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB4982.namprd12.prod.outlook.com (2603:10b6:a03:106::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 20:17:14 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 20:17:14 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 2/2] ARC: elf: make type safe
Thread-Topic: [PATCH 2/2] ARC: elf: make type safe
Thread-Index: AQHXfan18ipdNQ4ct0mqss/0EloQqKtN33UA
Date: Wed, 21 Jul 2021 20:17:14 +0000
Message-ID: <9bd1f509-9078-266e-fd52-49ffd6c12689@synopsys.com>
References: <20210720205800.1056218-1-vgupta@synopsys.com>
 <20210720205800.1056218-3-vgupta@synopsys.com>
In-Reply-To: <20210720205800.1056218-3-vgupta@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 36f9442c-0aff-4818-36b9-08d94c8487f3
x-ms-traffictypediagnostic: BYAPR12MB4982:
x-microsoft-antispam-prvs: <BYAPR12MB49827726D92C1C29643EBEA5B6E39@BYAPR12MB4982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bl58kqvmcOLf+N1+W8QZoQZGJC6E1oZoP+sfDywBkxMZayNg0AtB/Z0sVZBLTQZosAhH03AD2lje9Nz7JYsyvAkT/HfeeoV8g7rLyDGa9PzuHuAEic6yQ6nxLRAFw+60VbZ+CFFc2M4b+GDPqFW7Q96vKkPIFpirvekNkG3drF5UpQq7wO7XHWHEvQKjNvZOe4r9e5mwdUH4e1bZTIvPvRZCxSKA8rllGsLpkzQOxiFwS9un9MCq++ryP2JBbVu5oj/5a1BKHagGf/LAD+jrYH6fhqnhRKMrOs+xo+1E6pQsdONaEBTm4uEQy0KFLi4i8ob3p+D1MKvWu8S1PRJ0OLSrT5IvCWniTQ2BilPNjXi+iLS2kv1UxCHRQT0O6dGPqCPL1u0d/wK5bissbdUgEfl59i/OgNdxSTouDZVikAemEA3T1h3cSXl1Iy9MIaNjCHiL8nOsM6oPtNluz11cD+9nSZ7zVXXxPe/Wg4AI6z1aRLrF2SZZv3bns210b8r7SAhFi75EusWD9ZVzueIc7MvSs6pzC/Wh4XOSrjitwKLOh93IXWuBPuNJ49y0gUpl+gKyiR/33uByEm088Y7qW7vrEWzXVPtDHl18yqTdSiLaV6Tdr3ErvyB0xx+lrZ3tcTMnyZqJM9BA0OEdY+rWTtECl7uX/3nZ1KAWq5E8j912yPEmbY1maEdZleCNj8pdKyBUHskaTiZjRH7Gx5BZ2nSoLrreVxqjfccFez3AswztjIiWMk1MJl1H9D5o3DWOSrSsM9YrN1xaSW1jeZaIAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(508600001)(83380400001)(53546011)(2616005)(66476007)(31686004)(66556008)(26005)(66946007)(64756008)(31696002)(66446008)(6916009)(5660300002)(186003)(76116006)(316002)(6512007)(2906002)(8936002)(38100700002)(4326008)(6506007)(122000001)(36756003)(86362001)(8676002)(6486002)(38070700004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGZTYUNwQlVOeVRuVGdOZnNOMndyYk9VeEJjRlBHQ2hGU1pJVmd4RWJuTC81?=
 =?utf-8?B?dnZic3BPZTFjSnQ4QkZDYXVDcXpFOFBaMXoxdStaOXR2c3BUTUtoNWpkMHFG?=
 =?utf-8?B?YTU0NTN6NjI5cXlzNGluU3NMcmI2VlpVUVJacmFRRlJOZnlxSjlTeHJFZ2l3?=
 =?utf-8?B?Wm1xSjlEMzN0Sjl5Z3h0aUw5SjZ1NlpyMXB2OGljbzIyR0xtQmdLNHhCRW44?=
 =?utf-8?B?MGNNUnp6SnJ1ZDdHOUFQOWt5Z0t6Ylc3ZjhOVkxZZkZNNHdYVU9rNUN2MXZJ?=
 =?utf-8?B?TllPZGZEQm1xT3JNMFVqN2NyVjZBOEZCZm1VSkNSQm5DVFV2T0puMWYzUjJq?=
 =?utf-8?B?bDF0c244ekl1aHdtNzJtWDFaemgwbm9qY3dtcXFGeHkrVzNEVTZ1cHVaaXpm?=
 =?utf-8?B?RXZ0MUNKa1pVUmVtd2w3QUtjVmpoMXBKRmo2V2dwQUxmWThkamxUSTEyOFNN?=
 =?utf-8?B?aFBkTDlJVEVPd2t3WEYzOUdLbXRIb1JSSDJYRjNTZzY0L3p3dzBjYm1FU0Ft?=
 =?utf-8?B?dTdPcU9rRFNrSzh1NFBKWHBrbUxkTXY0UXpuaHo3Nld0NmFGQUVKRHlRVzFI?=
 =?utf-8?B?MFM3WkhrdkM3VnR6WktKUXJZcW53UzlIdGZ0OWY2SzNJcU5KdmNFTGthU2Za?=
 =?utf-8?B?UE1MKzI3VXNaNGV5bmtUdlhrQU9SOUFDQ2p0SFhqVFladVdwMEIvaGF1K21x?=
 =?utf-8?B?UnhvSlVIVTJ1Qm56Q2Rhanh1R21Dc0dOaUNqT3ZRLzV3SzdSTHQzQXRlSFJn?=
 =?utf-8?B?Y1JSeU5vd1ZLVEgzMHNkVmtEU1Y5b3dqb1d6TnNVUXhRRVFudWIyVjc3SVZE?=
 =?utf-8?B?dGQwMnBoTmM0ajY0RUNWZUpQRFI4NGJqaHBQOUFnTG4zeTh5OS8weXJTMkpH?=
 =?utf-8?B?QWJndXFuZjE3NjQ2VkJOSTRIaU8rWGhpcTRGc0tRTDk2LzQyVUw3RHc4TjFK?=
 =?utf-8?B?NktPbjFFUFlDUm1Qck1BNlJhYy9IR0tueDY1N3pweEY3RDBIV2tHVmpqS25r?=
 =?utf-8?B?K3V4MWVkS3pvZ2wrT2lCQUM4SndzWE43U2E5dlJZU1d1VmhSMjVvYXZrTDNO?=
 =?utf-8?B?dW9Ea1hmZFpKeDNKUnF1RTM1WWdZMEhIbEVUTWxab0Z2L01IWUx4MWNSNm00?=
 =?utf-8?B?TjE2ZmNsZjdNcjg1QXludjBmeXc2N08zY1l0a0gzUm50NjBMTThsakpVZG51?=
 =?utf-8?B?ZkRPWXpGQmxBNWVaNzRPTyt4MkpmUVRBQWw5ZnJoQWxBK3JIOFp6bkZTMW9W?=
 =?utf-8?B?WXFBZC9oSW9NN3A2bUZPSWRVVGg5dTNKMzFxL3VCOEJYQjluSGpiRGdLbndX?=
 =?utf-8?B?cC8wUjNnZkZYZmxvVFppTUZ4SkMzdE00d0Z4c3NXc29ENDNzVTlwc2dueEpL?=
 =?utf-8?B?N1NoV2c2a3dTNm5walNCWG03dWNYOGlZaUNrdFBpYjc2dUJ3MlZFdG5CZThn?=
 =?utf-8?B?NEZDL1NXRWxiMFdIb01TRXRVOUtSQXNpT25MM04xQXNrTVhjQi9WbVBBdkVS?=
 =?utf-8?B?V1lQYm1wSDB3RDdVci9jNUlUOHFWVjVhTld0ak9TS2YxSTdzdG82cXhoeFkv?=
 =?utf-8?B?MVpBS0tIUUQ0cXp1a0REVVhPVitRMlB5WEVMTmNSby9SeXRQeGlWOGVaTGpm?=
 =?utf-8?B?SHlOTnA1SW1JL0tOSmhpQmZMb25WZDBmcUppc1JYRHd1OXNlR0FtVHYxRWtU?=
 =?utf-8?B?djkwbE9QaXJUcWp0b0l4NzR2RENBVEF4SmlXMEJkbFBvSjRLVXdUNkZLV1l0?=
 =?utf-8?Q?0MEvfROV3Rl9GXxiMc=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <D6220D0ACE7EE9459D3D34A44B57A0BF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f9442c-0aff-4818-36b9-08d94c8487f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 20:17:14.7844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /l1rKMJFzZBsNKrYTwkBqCuf4SpEXHnY0HBA7hUsYj42AcPey3tgqOMF3Pu+p6M9xw+5WKsVVggkbHY41fijNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_131722_738515_5CDDC622 
X-CRM114-Status: GOOD (  21.10  )
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

On 7/20/21 1:58 PM, Vineet Gupta via Libc-alpha wrote:
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Committed !

> ---
>   sysdeps/arc/dl-machine.h | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
> index 60b49af0d5ca..e6ce7f0ff6d9 100644
> --- a/sysdeps/arc/dl-machine.h
> +++ b/sysdeps/arc/dl-machine.h
> @@ -86,7 +86,7 @@
>   
>   /* Return nonzero iff ELF header is compatible with the running host.  */
>   static inline int
> -elf_machine_matches_host (const Elf32_Ehdr *ehdr)
> +elf_machine_matches_host (const ElfW(Ehdr) *ehdr)
>   {
>     return (ehdr->e_machine == EM_ARCV2		 /* ARC HS.  */
>   	  || ehdr->e_machine == EM_ARC_COMPACT); /* ARC 700.  */
> @@ -124,7 +124,7 @@ static inline int
>   __attribute__ ((always_inline))
>   elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
>   {
> -  extern void _dl_runtime_resolve (Elf32_Word);
> +  extern void _dl_runtime_resolve (void);
>   
>     if (l->l_info[DT_JMPREL] && lazy)
>       {
> @@ -202,7 +202,7 @@ __start:								\n\
>   /* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
>   #define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
>   
> -/* ARC uses Elf32_Rela relocations.  */
> +/* ARC uses Rela relocations.  */
>   #define ELF_MACHINE_NO_REL 1
>   #define ELF_MACHINE_NO_RELA 0
>   
> @@ -211,19 +211,14 @@ __start:								\n\
>   static inline ElfW(Addr)
>   elf_machine_fixup_plt (struct link_map *map, lookup_t t,
>   		       const ElfW(Sym) *refsym, const ElfW(Sym) *sym,
> -		       const Elf32_Rela *reloc,
> +		       const ElfW(Rela) *reloc,
>   		       ElfW(Addr) *reloc_addr, ElfW(Addr) value)
>   {
>     return *reloc_addr = value;
>   }
>   
>   /* Return the final value of a plt relocation.  */
> -static inline ElfW(Addr)
> -elf_machine_plt_value (struct link_map *map, const Elf32_Rela *reloc,
> -                       ElfW(Addr) value)
> -{
> -  return value;
> -}
> +#define elf_machine_plt_value(map, reloc, value) (value)
>   
>   /* Names of the architecture-specific auditing callback functions.  */
>   #define ARCH_LA_PLTENTER arc_gnu_pltenter
> @@ -239,8 +234,9 @@ elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
>                     const ElfW(Sym) *sym, const struct r_found_version *version,
>                     void *const reloc_addr_arg, int skip_ifunc)
>   {
> +  ElfW(Addr) r_info = reloc->r_info;
> +  const unsigned long int r_type = ELFW (R_TYPE) (r_info);
>     ElfW(Addr) *const reloc_addr = reloc_addr_arg;
> -  const unsigned int r_type = ELF32_R_TYPE (reloc->r_info);
>   
>     if (__glibc_unlikely (r_type == R_ARC_RELATIVE))
>       *reloc_addr += map->l_addr;
> @@ -334,11 +330,12 @@ elf_machine_lazy_rel (struct link_map *map, ElfW(Addr) l_addr,
>                         const ElfW(Rela) *reloc, int skip_ifunc)
>   {
>     ElfW(Addr) *const reloc_addr = (void *) (l_addr + reloc->r_offset);
> +  const unsigned int r_type = ELFW (R_TYPE) (reloc->r_info);
>   
> -  if (ELF32_R_TYPE (reloc->r_info) == R_ARC_JUMP_SLOT)
> +  if (r_type == R_ARC_JUMP_SLOT)
>       *reloc_addr += l_addr;
>     else
> -    _dl_reloc_bad_type (map, ELF32_R_TYPE (reloc->r_info), 1);
> +    _dl_reloc_bad_type (map, r_type, 1);
>   }
>   
>   #endif /* RESOLVE_MAP */
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
