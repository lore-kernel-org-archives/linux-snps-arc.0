Return-Path: <SRS0=BC9U=LF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5732C48BD1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 00:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40110613C3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 00:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40110613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bISq2KaKbQM9jfM19R4an+NUgi/HY6bYokwpBhAyEtE=; b=bxKcBZbbyR9HO2
	h7YxVmI6Rh3a9B3V3Q2WesKxCxFQXbk/KQk48i8y0Xhy3h0xFI9V09TOw2PK2BZ2mioGN2yZMHHU6
	W3uW9dYd21xeLWL/07IoiRAcwzllOrXYytad2VpywFBLmxBezTWRXsGyWRO4ymY93z7peop/Bwz2D
	W+jqpj+HMMoXlnMjlYo2srG0xYbAxL1R2+QWvzyu2cOGXbEV5+mkx+V5/sKgCk9mGJL8avrqC3+mk
	LAaNqv7t4thmdXybs77Fr8v/DRH5t0PmXTBltSpdZ/DAD/xpV7PnXUJ0xUvD1ALIrfJ+lpql4LYQ7
	VYM8ADSEdJDH4ibu9FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrV3W-0031uQ-Gj; Fri, 11 Jun 2021 00:29:50 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrV3T-0031tK-L5
 for linux-snps-arc@lists.infradead.org; Fri, 11 Jun 2021 00:29:49 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 23ED7C00B9;
 Fri, 11 Jun 2021 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623371386; bh=eg1ORYtoTQ/ukVv70L7z+xhUR9d46T2+tO4egiEo8VE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=G25rmFyPzF9AKkuZfrEi2IXGyfWbUvBMxva3duA67XxUb2sKyvLFi+e948Dl7V2lX
 UK1d6QvSdL0oJFn9A8KqlhR+Isym65enZW8k+YSdBX7rXcSWTEwlDjx3lFfR0bdGK8
 cez/VwLMnAEgY8snN5VLoGy+3zpsSCDiHhxXOIfo+Yz711gKhfAJ8r1u9NIzFqUNKN
 VdBRldgTwcUP+pkYfAZ1IIyCADgGZMQu/fAKx5TbGE6hKjMd75Sf7eQIVwzQk65Q2e
 scjLrptmr7fl6qRYIaGnBN6aMiNN7t5GbUw7e5jIa9dw0RTpvSijKPAmHRuuYLAarR
 yT2bQdvtT6uag==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0B6A3A005C;
 Fri, 11 Jun 2021 00:29:42 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D6DCC80095;
 Fri, 11 Jun 2021 00:29:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LO0GNJSW";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rt5TnR48YdW6ra8FCd4H/VoiPAzmKhlkLOydgpc9GcYQVZVfV/2WozYchtRNZnfLU4DnyJ0Wx67c+HmvpD8Gphrvtcw775+eGI6fUDAV1QWG3dJm5PQ63SY9tuCpd37fRWD6Bm70blkh6odmughN9PNxZpvQCg+eP8ys+IwRf9iepe3vGdyxP4d7lSaooHWl5X2UrzkvIeNljt8d3PyDL0r9XaWDKFeGfj184mfBt1WQVKihIbghL0ufrT7tnkoNuxabSpgSV2POygqy4fCFcvHdTYbU/13nEC/xbPlCxyuxkQZmT/jcQYSXTTkbPgRZyJglwI/vaf8fSmrDaTafHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg1ORYtoTQ/ukVv70L7z+xhUR9d46T2+tO4egiEo8VE=;
 b=RlrahvBg4nxHmQTRVmNGiwBSlqGWiHkE5I8zC5ZwryqnBG0pPZCWW/f47u5eGDwsUiDI+gzupvp8wHf3N1TW7nsN3GFGGxt6KaIiZ1k8oy/u1a71d33+hx3+qWcZjXDnxkJLhWSicstW+NSJmTn6fD17QenLQTX1FZwANn2W13Syy1fAFm4B4sG/Pj6jOpySwi0sAQUD9jC+WHjsrtrALhS8NDni2fJPAcEI9i3/Kq9IzIHeuLT00n5YS0K5iP1iRB57pGQR3+1FZYMLoshc54tD23/bBuEHf5tweDM5tXKO0WXl6tgwJijVgbVBfuRte2dnVEX/qU9fK/uPm3H7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg1ORYtoTQ/ukVv70L7z+xhUR9d46T2+tO4egiEo8VE=;
 b=LO0GNJSWyKB6OXAqZ3wJWk0iEYDvBAak8UMmcFl8gJNNHqk28qJHUD1Tl42nzzqjtoNO0YimiRvFsjqhOqXEjNJZYne9KF0QFQkebces+G/Lvo7vDWFkgXMzeDIpLAm8QlRuVjmP0Lyit/P7h6R51SYOSx/2Gya4/vap1BZTSAg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 00:29:38 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4195.030; Fri, 11 Jun 2021
 00:29:38 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Kees Cook <keescook@chromium.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Subject: Re: [PATCH] ARC: fix CONFIG_HARDENED_USERCOPY
Thread-Topic: [PATCH] ARC: fix CONFIG_HARDENED_USERCOPY
Thread-Index: AQHXXXyCf5WMbw9WXk6TXeQTkLP8BasNeb0AgAAgA4CAAFPIgIAACTaA
Date: Fri, 11 Jun 2021 00:29:38 +0000
Message-ID: <8519812d-b2b5-ec2a-17d5-856c62538810@synopsys.com>
References: <20210609221211.2457203-1-vgupta@synopsys.com>
 <202106101001.C736237@keescook>
 <53daee07-9c5b-9cf9-f08a-524afaee762a@synopsys.com>
 <202106101656.C79AEC493@keescook>
In-Reply-To: <202106101656.C79AEC493@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 109c8548-924b-4cbc-c6e9-08d92c6fff54
x-ms-traffictypediagnostic: BY5PR12MB4257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4257C8F60A0147CD61D06CD3B6349@BY5PR12MB4257.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4i24D9+ERSDQBJqXPf8WbRI4dCkja+L6PzwWHbTxZMCH+7KOaVNMGAYkfZaa9ACqJtxFc/zZFDdGE1dHo2rM466d2C9+JqtsYfrA7C1A0IECGj63Ml5GDHRLG8efar31g9Uj8X+Fu0IM93Y1KlrgS49lIi3H4Hq7Oqg/eZnZBT98YGIhQ+d9XaiiZZb92/kytQuKN0IopPHouRB7BQamHKwMsQHZz06imnBE5D+Ekmu6YP0jMa7AyvB1H0PgAoyp7sEi4GF31N8ouCD7iwmA7hqx2kxAua1TPTe9II1to1I6HSogbXC3EtbU4xzXkuHA7aL1veNb4ygsRrBre2kbPN5y0hwyFQox6m/2RGuZi3O+w4z9lTgtdWpqSZApLg7v6Hy8GmD1RsBuGsIlSswUkUD/nPEyXKVFdTX5a+nSy/6ppdQirERwDAcy6k87sdTTEpbuQEJsfQMHWp1spz3OnWHXff9XUTYKEglY69pb/Eo5tczIN3xaxtzKbwQJyPEjXbDaZSA0wfmExIXvJgdAs/Uwe9Y1YC09T16zh/TT+BQesxoOPuOOBl7tdvYD6gjZaEaNGTpwuAQoX8NQRowBbnM2c+CRIYItTSaCfv7nYd+T7kyg3Zduh2fQZhaNfpyAREEtdwPdKqt1XfSvjfZePovnp/8N8UPFPNHRSKpKVS12i/pJRc+Fyi8nF+VPJQ6Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(396003)(136003)(6916009)(38100700002)(8936002)(8676002)(66446008)(478600001)(122000001)(54906003)(71200400001)(6486002)(5660300002)(36756003)(31686004)(53546011)(6506007)(76116006)(86362001)(66476007)(66556008)(6512007)(66946007)(31696002)(2906002)(4326008)(2616005)(64756008)(316002)(186003)(107886003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDdadnN2NlhKNTV5N2dlN2NwaVNRMjhucnJTVnRKSnY1eWYvQnA0K1o4bWZq?=
 =?utf-8?B?MXJhYlVNSG9kcXNSK1RlMGpaVEpLMVJ2UTJSQk1Ja2NkNjYxdWt2czRPYllV?=
 =?utf-8?B?RThndlcrRmpDWGRLU2RLekQrcWtySmgrcWFYZU5IWHVTSWZBZHlXbXhPRUw4?=
 =?utf-8?B?YXRSR1BiUTR6QkEvaVk4UTYwcTREcVRWaFZidVlRbnRHSlBLRVRUaFBYN3FR?=
 =?utf-8?B?R2hoT2piSzY1eEpNcC9sNUVHWDdLRDhuSHFTZDdmTFpIaXJ6U0xqT0h4Q3pX?=
 =?utf-8?B?YmlRbHhlRmZCKy9pSy81dFl1UzVrendnaEg0YUZ3SnVWV0YxWmt4cmo5V1J2?=
 =?utf-8?B?UXNYNGovTmpKSUNTaGQ5TXJzSklHcE8vb0EvOWJiVUhadEV2RVU0bkhMSlJy?=
 =?utf-8?B?WFJ2c3F3RzlOWHdOMzdLaE4rZUY1MVB5bHlvcUFOUDA2dlhoVmkrNkhBbmJz?=
 =?utf-8?B?OFUwNFBDakpvVENzZ1RPcGRTTWhLRUlNS2p0bzQrMGtMK095b1IvUmlNaEJP?=
 =?utf-8?B?Z2xjaFk0QXA1SGZ0ZEhlVnBWUjFESHZndHJwNjZiVkN2N0MrQzA0Yk5YN0xo?=
 =?utf-8?B?MjBtNUxRNW5mTkV1amhPSzdWZ3ArZE0vbDRKdUcrczBsNC9NQXQ3a1JoUE1B?=
 =?utf-8?B?QXErQTE2UnJIRE13clJBaXRWU1o0bndGSDJpOUNRQm5KRlliS0lWNlV6R1Rr?=
 =?utf-8?B?K0I2ZjVVeE03WTQ4VE9haEdITzBQU3pDMlhlVXIwWGRBN2NHaWtORlJzby90?=
 =?utf-8?B?MFd2alpXNHNWNitSZnZKaXpkTGJaM0taZjZiK2ZOVmQ1b1RZZk1ic05wR3p4?=
 =?utf-8?B?YWMwaHJnQjREWmdmN2ZBbHNJT1l4TGV4OTdzUlpsRlIrbmdmWlhxNlMraGpv?=
 =?utf-8?B?SENxa0ovUTA0MGhhUXVkT3lwNnBPVzBFclpMRzZKME13TGpOZTdqOGFsM1F1?=
 =?utf-8?B?a2FYSWZmS1VKeDhtL25tTHRldXNvUHJpZ2VkdXhSU1UwQ2U0SXNkdXIyODFZ?=
 =?utf-8?B?byt3YmVtcEhpd3hjNVo3RWxnTVFBQ25oanZkZjdDWkZ3cmcxVmd1dDR4dnFx?=
 =?utf-8?B?WUUwMDAzalh5S0FvRFljN1NpTGNPdjJPaG5VVXJxVXp0SjRKcFl3NEtNa2Ur?=
 =?utf-8?B?cFRhVmtQcWI1YTVNOFdMbHlBTmZkcStKMUhGeVd4aHdxOXl5SjhGUTFEMGQ4?=
 =?utf-8?B?aURNVEhzazkrcVJuSXUyYm14ZDlZRmNIUkF3YkdZVDRQUU04SnFhazlzNlRm?=
 =?utf-8?B?NFRhUi9BUk1BMGIrMmxVVnphcUFORHVVMGpFNEFGb0dObjRnOGZuUXc0ZGtR?=
 =?utf-8?B?VDYrQVE0bHhhKzliK203R0RYd0hVaTdEaVBEZDVpVGsxUVJMdmNWdmZVOU5v?=
 =?utf-8?B?dVB1QTE1WFNEY29VZVR4TUNzem92U3NPK2xyUmhsQXFjTzlTNWd6emxVVGVD?=
 =?utf-8?B?RG10ZW5Mb3NKSXlWbHV4cGVkV1Y0ekxCYTdOanhIY0xiQmxLTVVFWVdWV0Fz?=
 =?utf-8?B?OW1KS3NmWFFaWnhtTHFxZHNXOTZrNENUSlhsY2F0LzlVUkh0Q25qSTdsbnUx?=
 =?utf-8?B?SWZuMFpRbURPNzZkbDgyY3EzUE9yKzNPNXN4ZG8xSmtaMEZySWg2ZEFkZVk5?=
 =?utf-8?B?LzNDV05mdW5sdTI5U0JuVUorM2x1SlNseFg1QzVjUk9rR0w5d251bjF5YzJP?=
 =?utf-8?B?RnlwQkFDcVVHZWlJUUVLY2taak5HRTd2ZzJYaGZjdUdsYzZpZFUwOCsyVTFH?=
 =?utf-8?Q?YhSEwGa5kXGHmI3bUY=3D?=
Content-ID: <A3C47F6DA0958B4390ED7EE2792CEDF1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109c8548-924b-4cbc-c6e9-08d92c6fff54
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 00:29:38.5034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4XmdPx5mvxy672yaNZEFAtfjwtEbw8jID5uUTLJUP7JxkOe7QQRxW9WhRcrGPVvRsDDGdDaKESvCK+mvnufxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_172947_845866_4DE01AE8 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gNi8xMC8yMSA0OjU2IFBNLCBLZWVzIENvb2sgd3JvdGU6DQo+Pj4+IHxTdGFjayBUcmFjZToN
Cj4+Pj4gfCBtZW1mZF9mY250bCsweDAvMHg0NzANCj4+Pj4gfCB1c2VyY29weV9hYm9ydCsweDhh
LzB4OGMNCj4+Pj4gfCBfX2NoZWNrX29iamVjdF9zaXplKzB4MTBlLzB4MTM4DQo+Pj4+IHwgY29w
eV9zdHJpbmdzKzB4MWY0LzB4MzhjDQo+Pj4+IHwgX19kb19leGVjdmVfZmlsZSsweDM1Mi8weDg0
OA0KPj4+PiB8IEVWX1RyYXArMHhjYy8weGQwDQo+Pj4gV2hhdCB3YXMgdGhlIHJvb3QgY2F1c2Ug
aGVyZT8gV2FzIGl0IHRoYXQgdGhlIGluaXQgc2VjdGlvbiBnZXRzIGZyZWVkDQo+Pj4gYW5kIHJl
dXNlZCBmb3Iga21hbGxvYz8NCj4+IFJpZ2h0LiBBUkMgX3N0ZXh0IHdhcyBlbmNvbXBhc3Npbmcg
dGhlIGluaXQgc2VjdGlvbiAodG8gY292ZXIgdGhlIGluaXQNCj4+IGNvZGUpIHNvIHdoZW4gaW5p
dCBnZXRzIGZyZWVkIGFuZCB1c2VkIGJ5IGttYWxsb2MsDQo+PiBjaGVja19rZXJuZWxfdGV4dF9v
YmplY3QoKSB0cmlwcyBhcyBpdCB0aGlua3MgdGhlIGFsbG9jYXRlZCBwb2ludGVyIGlzDQo+PiBp
biBrZXJuZWwgLnRleHQuIEFjdHVhbGx5IEkgc2hvdWxkIGhhdmUgYWRkZWQgdGhpcyB0byBjaGFu
Z2Vsb2cuDQo+IEdyZWF0ISBZZWFoLCBpZiB5b3UgcmVzcGluIGl0IHdpdGggdGhhdCBhZGRlZCwg
cGxlYXNlIGNvbnNpZGVyIGl0Og0KPg0KPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29v
a0BjaHJvbWl1bS5vcmc+DQoNClRoeC4gSSBhZGRlZCB0aGlzIGFuZCBwdXNoZWQgdG8gQVJDIGZv
ci1jdXJyDQoNCi0tLT4NCiDCoMKgwqAgVGhlIGlzc3VlIGlzIHRyaWdnZXJlZCBieSBhbiBhbGxv
Y2F0aW9uIGluICJpbml0IHJlY2xhaW1lZCIgcmVnaW9uLg0KIMKgwqDCoCBBUkMgX3N0ZXh0IGVt
Y29tcGFzc2VzIHRoZSBpbml0IHJlZ2lvbiAoZm9yIGhpc3RvcmljYWwgcmVhc29ucyB3ZSANCndh
bnRlZA0KIMKgwqDCoCB0aGUgaW5pdC50ZXh0IHRvIGJlIHVuZGVyIC50ZXh0IGFzIHdlbGwpLiBU
aGlzIGhvd2V2ZXIgdHJpcHMgdXANCiDCoMKgwqAgX19jaGVja19vYmplY3Rfc2l6ZSgpLT5jaGVj
a19rZXJuZWxfdGV4dF9vYmplY3QoKSB3aGljaCB0cmVhdHMgdGhpcyBhcw0KIMKgwqDCoCBvYmpl
Y3QgYmxlZWRpZ24gaW50byBrZXJuZWwgdGV4dC4NCg0KIMKgwqDCoCBGaXggdGhhdCBieSByZXpv
bmluZyBfc3RleHQgdG8gc3RhcnQgZnJvbSByZWd1bGFyIGtlcm5lbCAudGV4dCBhbmQgDQpsZWF2
ZQ0KIMKgwqDCoCBvdXQgLmluaXQgYWx0b2dldGhlci4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
