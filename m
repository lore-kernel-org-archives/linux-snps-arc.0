Return-Path: <SRS0=hLvF=MF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1602C07E95
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jul 2021 19:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88066611AC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jul 2021 19:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88066611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOWHB7PBrj3pBd/FUchHF377sRGOjSmZAgEfu2/VeJ0=; b=ytH8PKfbn896bs
	N0yx3wI0QnuR1VmGiMsC7KexwqwbDLpLIhMV82PMR+Dm+sGpBcfA1p080skbj+YrO+BkZ9lkwIqPK
	cY4KBPmx/Y4px8jF+3dmjT9LZ3oRu+DKpuopNetjfB5a6k+HPgida4ajDjgaguTQI5/9miZEDfy6p
	pU24DPQ89prpjxF+SIJiesadjB0laxIqTDTRp5rmukvWIjsJdxSxFOxH/vD5pOLCwBAKwpS6/Tljv
	aTSWYajYWv+0K28KOwpwCWNyHAhwRcO/p6dZ7uti2mvakDsr2JgNuRyP2TApvRzaPFw3gddcT3FuG
	OZaJrwd7DiGbk2QaJ3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3OLg-00BG7A-Uo; Tue, 13 Jul 2021 19:45:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3OLd-00BG6A-PG
 for linux-snps-arc@lists.infradead.org; Tue, 13 Jul 2021 19:45:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5015840FD7;
 Tue, 13 Jul 2021 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626205538; bh=6mxuezYYbd2/TEaPZoQg7fxYO0FnRFedQVTatGqGipQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ch2wJtFdfwgZal/dGcwbQ/UkCshHjKEJhTWHZmv5tVbwPu2oqxDw89ww468S97VSw
 1+EiZZJfjtTMfTL3yoGcWdw7UwZf+Izib3qivI7RD99hkrurRRwBwNlrJSBOFGZRvq
 hhqpVto6mMhlSd5Z9WmeNAmXboyzfNQOlqq2jM+KKbspGXUucbLQXNfEzY/4Xqhpe7
 PFdReK3dSJs/hP0qRX9g2ZT7ay6Tg8nEWa/VuC5HMYFtMBx9D9O5evA4kynkIHrqVu
 0xCmsPs4uh1q+4hFmlbiAk0Wob8qOz7LssxisUuGYrGr9fXXLkjbQDhXtmU+aG8NaG
 jx6mFsyk5JypQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 04405A0071;
 Tue, 13 Jul 2021 19:45:35 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1F3CD8012F;
 Tue, 13 Jul 2021 19:45:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="umiYL8v1";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jERvOsmtVIRQWaVcP5jP9zh5YQCekB31EGyd43aF5MYCx2cjuFDQE68IRbF5gdobORfGoSyGqv2Bn0wTDp0VmR5OFv+vWVgatR3MUMFr5veTDyUCGXr4qhE6kpDG4iNsz6oI8gUWPWShgjC7oJy1jxCOBPwh8lFDMgUhpAB0n+wb4Ijm34tc8/E7tUiOmTCTiwjETDb8I0r10XM3x2B+kktO+2xnyz7l+Us95uOE6uX21GqGFHcpS0aWi35mkj0lOyrHWwx6Wlm/tqWLEFbOyaX/sGvW1aboXDeaj7+Hf73FyZFmFvHNGO8PQehrip00rNjVg2QN8HUE5+r0/osdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mxuezYYbd2/TEaPZoQg7fxYO0FnRFedQVTatGqGipQ=;
 b=bVsf+KrTJuIaZUPk9Kh4l4JrEXVnA9ZG+WWJUBSQ7Iv59PZ84QqSZ3P5B4rRmRjz9syuIZswsNo6s0cWHKTGTjpzG5UiGGfQ6uwaXs+efBjHT4fd3EC/VfNNGoHeZIuHxWZBvwQBqsR3E2dplMaxS4popOUKC3+oTiIOJCBSvpIcgkMZopclr+6KfBHx19D5lTXITUcV8tvM7tMSRt0TbaGw0cJ+q4s7LHCKzdWJ0ub/ugBze7Js15K4VCt02jepSkQtcCDv8CP1q5xfBg84PL+RiESpjQ1Um97JdIUEvk+vCtoXOhbIsRFbnJI/wuzzjoNmssiOUyD/fJYeTS8xfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mxuezYYbd2/TEaPZoQg7fxYO0FnRFedQVTatGqGipQ=;
 b=umiYL8v1LDhALQcO5qO+KfmU/uGCs4D4HuqhrNa9ZzWwm3gVXWnu0o9tpZNgfntA/ZHf3OXfPIwi41/plwCPLHT9hFQqQXTQdnSX55J1jysumtwIOQkBSVkjWCJcuY2Q3j+Ze0lCGgQ5KihBe+tdDQB0Wzkl4vFSVbbXXbafsZ8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 19:45:30 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 19:45:30 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARC: Fix CONFIG_STACKDEPOT
Thread-Topic: [PATCH] ARC: Fix CONFIG_STACKDEPOT
Thread-Index: AQHXdZr18hop2IraWkCh+g8U6EsDj6tBVA6A
Date: Tue, 13 Jul 2021 19:45:30 +0000
Message-ID: <bce70759-4734-7df7-3801-95de9db769be@synopsys.com>
References: <20210710145033.2804047-1-linux@roeck-us.net>
In-Reply-To: <20210710145033.2804047-1-linux@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56486969-2963-4c15-c680-08d94636c562
x-ms-traffictypediagnostic: BYAPR12MB2901:
x-microsoft-antispam-prvs: <BYAPR12MB2901898FE2B3321BCFA3CC01B6149@BYAPR12MB2901.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ne2lzcPuEmz97eUG9vqmC9SUnacQSNo/WsAvOhmZKDWdiLrqYvgjhZnsD92gotNJ6a2SvvljKkRsogmVcmrHBZ0GxE6/nXbJwUifx3VxLVGM/1V55hK3PiIAufAhSMdvk4+1sZVeiqbgPRuLVHCks5vTQutn2FTNuNqtSAmU6XJX5KweYi+gs8ZQ1fsGiEi9CrfLGJ33nD+pC5C2dfcE51aCp6atSFfslMHYCrXEL+r0laEwgTiTmUIs0nof5tS0bAEKs9UVlUpkenPYt0LiVbdgyvtQTEOnlfAQLBL3nNRdKg/Q9nszlS+9Vm6j+/7wG/pR9cg72dFsZsNgqbUaQWiTYllwLHCTCRaVVwidbrBgoxXAKUraoaA/Xdv+VXQWXfie1fkISKSPpA8CfcazUpbQgrSGjS4qbUW6t9dRlYxjCDxo97WGYbK8hF9q6zTnPFXvEd3IwZn34WVAjjoSGYPhyl+p2zdgNpiUNe2rqQ/Q0XBGX/jnkGz2Y/dpQzW12KR9SBe2OJVQqedy75u8278gZqWoqpR2my3kACUvoVQJEt36YsVzksytcA6KfDsv6eNd8QXlBVaWl0BAvTwtbejP4HXMttI2V2JaPeY+qAjgGaUcWCpCPV5Tbd+R+8t1GrCvrXcWhkXvZNSNQZ0dKgVu42mOqcyRPAPZiie5+ERbwDbaZLzTXvX4HUVQXc9sHY1akhRSxswfpufGviSoXsruRgOV+AVa8JHu/geGoM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(366004)(396003)(346002)(38100700002)(6916009)(71200400001)(6512007)(31696002)(31686004)(2906002)(2616005)(4326008)(478600001)(316002)(76116006)(6486002)(8676002)(54906003)(66556008)(64756008)(6506007)(26005)(8936002)(5660300002)(186003)(86362001)(66476007)(53546011)(66446008)(66946007)(36756003)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QURjdVNCMmFkQXU0a0JNRzloelpEREV2bVFjMmtQWE1IU0ZxTDc3eGdkMWV3?=
 =?utf-8?B?K2dEcEpnWndoaGFmemVkUzRadjFpbFc3RlM2dVZzazF4QWt0N1NHYlduWG1I?=
 =?utf-8?B?OHlmei81Z0VzWEtyakFiS09NL3JIQU81NHdXMTlmWXZrM3cvV2V4TFkzMmM2?=
 =?utf-8?B?bFpRdFJyb1pkUHJOemgrbmNpMytIVW1ybWhMeUdjV0krZkl3K0I5Sk1xUzhH?=
 =?utf-8?B?U0psVkczMWpZY0M3aVUrM0VUUUg4eW01UEdvTXhUQWl3NUF6KzBJM3NpK0o1?=
 =?utf-8?B?Z1gwbkxaWWJmejdQdENqQzQ5SjZtdGlycVE0V3NmaCs3QmtobURHeXBIcFVs?=
 =?utf-8?B?d1NoaGxIUEdSSWxESlN2dENtM0dMbFpkdy9Id040M1hBTEZjSml0bnB4dWdp?=
 =?utf-8?B?YXQ3cC9ackpwMmdaUE85WTBJbCthWGV3aGFlUmcwQmxxRFZGMmlWdHlaWFly?=
 =?utf-8?B?NVl6MmlPbzVVMVZaQURydlh6N0Z2OHV1WU5obllzVElldUNhNG1NMktyRk9y?=
 =?utf-8?B?Q1dJNys4ZXdxT1NYdEprTFloUmJlV2FzN1pVY1hpV2wzclpGdGR3YlR3b25u?=
 =?utf-8?B?LzFVWDF0MUZpdlVRdFREakh3YzRlVmFNK0doekZEWnVTUEZSbEE1QUpqQXNJ?=
 =?utf-8?B?d3M5VW9QbGpYYTJPTXJGK0J0L20zQ0NSd2dGVk1XblpDa3lSWGk3R1hPeklt?=
 =?utf-8?B?RWdvUHdNTDF5QjlIZGVKZzhTZHhMVVZMcmFvYkxjQ1RvS00yQjk3TjBqczYz?=
 =?utf-8?B?QW9sMGV5bHdsd0RVWEI2dUl5R29KNC96cGtKWnFiRHQ3NW9MMEE0cWtSdTBX?=
 =?utf-8?B?MyticHorQ0NCeXVua0p4ZHhIckRCWjhhZW9ROHA1YlR0TWhXNjJvUE40dktV?=
 =?utf-8?B?QWFtWmZDeWwxelhwejZOTnhocHFoYVNOUzBrNEVVeEZEUHRabE9GN1N2Wnlp?=
 =?utf-8?B?MTVSeENKdXhMYVlia3BBSmlIcGRqcmREUXAwQTRzSnJsbUdCNkc3TDA0SlV4?=
 =?utf-8?B?dXJIVXRDQXlrRm5oanMxNk4zUzRoT3E0c0xrVzJJUUIzYU4vRnF1bDJkUjM4?=
 =?utf-8?B?clcvSTl5OXozTzJBQVBzQW5qQ0R1QVZWMUh5SFpyQlh6R1BCRUFCaElvNENz?=
 =?utf-8?B?cFZTSThvaG1iRmRJSzB2UjRaUnl3SGlvYktRLy9TSW5Ed0lMTWk2TGJqMFFI?=
 =?utf-8?B?cWJPYnpqZ25EaktTREJmekhJSjRteHE5M2h2QmlJNGVUdkZNNmNBaTIvM0R0?=
 =?utf-8?B?OWRrOUJBMXNGZk5WTGJOakNON1Y1NDg1NzhiSUVvRFN5aXdyTllNVzc1aFFL?=
 =?utf-8?B?eW1FaGd1dlR2OVQ2WUVscmgvd0V0WEMxbWh0T29nOHZidVg2QnQ2TW1sMUNz?=
 =?utf-8?B?R0w5b09mWm1jN25uQUxKalhNbkpSSFBGNXRhUCs5KzZIR0Iva2dFRHk5WTBY?=
 =?utf-8?B?WGhOVmJyVTdNbXRyYzlkcGltZkZNeVRMNTZXWFZmL3ZjdElpRCtjdCtyQnU1?=
 =?utf-8?B?SUFDVDdUcmJldXVwMHFaL1k1NlZ5OUFsYjk0bHNkRUYrQ0VCNThKekNockwv?=
 =?utf-8?B?R1ZsUHU5YkVmNnhPeGlEWDkyakFQbXJYUXdkOERHSXlMbWhudkRKL3laVE1G?=
 =?utf-8?B?aUg5WFlBaWVUOXl6Qkl1WUNqY0JFelJSMFNnK05sM2ExNXhRazdFeXhyZzdI?=
 =?utf-8?B?Z25Vb2N6RzhuZVJPUjRWQzRYVUZwZTdKMGFRaFVtbU53RzRXZTZVeGlpOXRC?=
 =?utf-8?Q?yt6XxGfZEi7k9kbv/0=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <D32778D4D21B4E49B8BAFFFF7EB90B35@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56486969-2963-4c15-c680-08d94636c562
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 19:45:30.1729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrvO3aXQB13XTcf0tqLgddRXYyPt9KCcYOPAwirvNYSX6171xXqv/TiIkS077On+bOCgzze/ul3hH3m3zprKHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_124541_872887_DC622DD0 
X-CRM114-Status: GOOD (  12.37  )
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

On 7/10/21 7:50 AM, Guenter Roeck wrote:
> Enabling CONFIG_STACKDEPOT results in the following build error.
>
> arc-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
> stackdepot.c:(.text+0x456): undefined reference to `__irqentry_text_start'
> arc-elf-ld: stackdepot.c:(.text+0x456): undefined reference to `__irqentry_text_start'
> arc-elf-ld: stackdepot.c:(.text+0x476): undefined reference to `__irqentry_text_end'
> arc-elf-ld: stackdepot.c:(.text+0x476): undefined reference to `__irqentry_text_end'
> arc-elf-ld: stackdepot.c:(.text+0x484): undefined reference to `__softirqentry_text_start'
> arc-elf-ld: stackdepot.c:(.text+0x484): undefined reference to `__softirqentry_text_start'
> arc-elf-ld: stackdepot.c:(.text+0x48c): undefined reference to `__softirqentry_text_end'
> arc-elf-ld: stackdepot.c:(.text+0x48c): undefined reference to `__softirqentry_text_end'
>
> Other architectures address this problem by adding IRQENTRY_TEXT and
> SOFTIRQENTRY_TEXT to the text segment, so do the same here.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thx for the fix. Added to for-curr

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
