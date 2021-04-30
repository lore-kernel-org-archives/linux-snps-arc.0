Return-Path: <SRS0=2M3J=J3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CFDC433B4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 20:46:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEB761090
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 20:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEB761090
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9QU60o8f774IZjnziWndmZn1/xqTxuiBXp/mcxJk5U=; b=mGimgqJlz5LPWI0+7MLFqyxClS
	9EM8kcXnZpUTovigxekhAGSLo1C6XrWHkRRzxSGNAO0HuonWWeLKGwPN2Gdk37BfL7GYaQ8Ur9hGL
	gAHqSodFdj2LsWxQF9nCFQvXweWr2iWyRpTWuHrRxjGWtk+rZ9dsA1GN9VErAjIm83sF4U4ifwmXv
	vSBQlDlBL6Wbfyc5yT4hEOLhhl67zFBj3AIfZ4Qvwm5zOlarTAAdQ+7FhMOymcsAZBrcPiBA0oZWN
	S7DCgXG3xejvo3Xyqr+u/0YU9UydjKZ9nFphld3LkHQkweaastMM1DePGQ82v1BdippS9otD4YTim
	4NWU6g0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lca1x-008ZsR-9t; Fri, 30 Apr 2021 20:46:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lca1t-008ZrX-Jw
 for linux-snps-arc@desiato.infradead.org; Fri, 30 Apr 2021 20:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-Description:In-Reply-To:References;
 bh=GbMIczPTnnRephqd+l3mI3WYBrJvTxGXKuKlWzS4Wsw=; b=csPFwxNSk/hWKWMn0Uo52g1AfC
 VAYDIxjSyvRqsgwDaBJHOpeOWunuK/UiqO7KHlxMcaiCnTUVpoQAbCmp1aFnyrBv1QkMQvGKHodKq
 GJDpD/dDHkc1/Jqt8TV0VK/ZWCp6TncdauZeqKuYubQ3Xv+3uMrGZORYonAExUDJ+yjyURZYZWlsK
 t1+OkRGCS/4INetzTTk0MrxBJTWB9xYzXuMJkOyBztbV4X5MWblzPY4phlcLl2zkPLX5yd0X1Y57m
 icANb2s9T0bBQmfm/LruEoZVHlCyDTlZtv+hQVdE4S26ccMmKDhVbV6BYO5wdqsQi0pW8JtcGMKMS
 ue1uA6tQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lca1q-001f6h-AO
 for linux-snps-arc@lists.infradead.org; Fri, 30 Apr 2021 20:46:27 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 546874043E;
 Fri, 30 Apr 2021 20:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619815583; bh=GbMIczPTnnRephqd+l3mI3WYBrJvTxGXKuKlWzS4Wsw=;
 h=From:To:CC:Subject:Date:From;
 b=AtqV5aaAXE4Y3WYEqXhblkBXoY/HSuPnE/lqXvWiv5nHoWNPHmcKsezac2qsCZPWR
 r7DQgIWYi1Ld8TzGUsdddHSqBw/GzDXMK7t8AasLQ1d/OPaYJl/U/vz3QhjD39FL66
 F5QIMbHSsEF94h4dBjqSpFoRLm3kZ62ym9djjUlKxsdDfkNuA8PHukq5cPSolY2iJr
 jZqoYTWSGBQZ76c0sXi2CikD/HvKXIAFreAdekp+JAUEegg49OpAD8PCxzc38c1Z9X
 KINSo3e1oxjc3n5p3gHGmdk6QWwJpv3awpRiOCXqGM+F1FBBNji7+wqOk2Ut/YC7Fj
 eBg+IWiEtl04g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B756BA005E;
 Fri, 30 Apr 2021 20:46:20 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 859D44061D;
 Fri, 30 Apr 2021 20:46:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="BrBuSWqN";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddTUClwdYcG9BlEw5cwTPgpvCD0KrUUxl9AjP0nzHtx4tN8s5bV0h4tV0fGlSqyx0SEyWpQuaK7YQRJkz+G1Uvrq4vdGiAMGI+VFy/kc8HFwb68Yz91aUOcOw09szYVh+IUw2oMQ8Ovzuu7q5+J+JoFbuRV/eVXsO8kO2JnR/rCnN9JrvxMe86ywQR4K8w7R7yh0EgA4x3tS4EkAqhBVuLHqfh6/YkmSLFTgBTNGZ78E6F7tLJUhQQIHCz/NSsLIncWgY+1xc7cjWwQv4xPCTT4ITI3HAp4Xet6vXJTG0DnRHiypviJEyaDx+VFyyjM3yShgx/VuoFQHNitwggq2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbMIczPTnnRephqd+l3mI3WYBrJvTxGXKuKlWzS4Wsw=;
 b=JdMiF3+YNWVZi4dq4uBSrcKUy1bFvW/cdJBYf57VgDEJwASFmEOXCQsGRdnoyYuecNg7Q4ni4RAZoye0vuCcVd6rVYikEvUhI0ZS26ZKAU+ojQgbk5Weqv81iMjl48o/wwJWhhGWK2AtvYHNZOWl6L9sBJlCy/T/4m6JuSbB5D/2KDVNiOw2RbLB/hEVrb8k+l5FYt57s5ruNrtQD7QRDcg41aJSZxsQRHMNQJ30INp/lFNd7fELOkABLYCp6Gmb1hRM10PIdiVoYZqrwMHhMDKHq3fOs58YL9sfCX797baa3orGVr1G1MU/vXcxlG6Kfq2pfKhak9iqqxiFPGQiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbMIczPTnnRephqd+l3mI3WYBrJvTxGXKuKlWzS4Wsw=;
 b=BrBuSWqN5//l3+TpqiVjECHuPGuydoVPlDJAA7YLZZjIP8MuzPZZW/uiGUWBGEXk2asQYEDfPAYCEKnihL3T4NyLq1PzSu56L2C8L4S37PV9qzBXqRc/BdH5S/3V4+97+B96KijFTCHEobtmKvanIZ8TYAspWAMPg4jUKPrlNvo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 30 Apr
 2021 20:46:17 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 20:46:16 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>
CC: lkml <linux-kernel@vger.kernel.org>, arcml
 <linux-snps-arc@lists.infradead.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>
Subject: Heads up: gcc miscompiling initramfs zlib decompression code at -O3
Thread-Topic: Heads up: gcc miscompiling initramfs zlib decompression code at
 -O3
Thread-Index: AQHXPgHd1RlrjZ3rIE6wtN03PsVzsg==
Date: Fri, 30 Apr 2021 20:46:16 +0000
Message-ID: <75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f48d204-db90-486e-ca0d-08d90c190062
x-ms-traffictypediagnostic: BY5PR12MB4098:
x-microsoft-antispam-prvs: <BY5PR12MB409871071C90523DAD9AB324B65E9@BY5PR12MB4098.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0jEudJzTWMPdpVg7CrD3KUb9kPpYi7U5wqr00Wb/kj2AInt4QmRZIewWelT+gXvP32ccJ4VYtfeUZtbXSVSEE+tU0onVLJKa/uAikS/nGP4EEG2d9RLexi2sMGSKz4c2n7g6vupJTKugB2TkJd3pbch5a3R7mVzwenrA/JicL+htnHpSYOBhT0ioQMizqwJdrNoYOXZGU62MDX9m94xm4Us/Me/wpq1zJbUOLo20lIEv9gT2NsNcSd27TS3HnDeLU6c6u7m5A4xj4HcFxzZ74kqYcQqARnPtaueRYltRyp2uGvAZo7zmqHilcK4Yk0D9GJ35kDwQSnAShUbP9/ryibc2u36sXyGK/142JpOf2Bm6ZEoFVTD/w1edKxyQl8xKR7tCd1NYREwqxSXmZtU3nD7OERIbqaWPnjHlyqoP+eFf4xQesx2+Bsj8tonjlwBXDbG2cCyHaeXHAnwwGw8mfLnMhfzKBIKnnIlXC3o2MmC8SDUZqkfCovikt2+oDh1Un31Wjf2YMh8AshOrqu6c9X/+JMLg+5+DUI/793FGmNZLAwAYKBmw4estaNMMAQ+uocwszTTSWd+hAA0zDL9/XeNoogDxaNe3OOaB6DkJg+8hSkpM3ZGZG07042Cdw6zx3WkN3ZtEtbOCI3hqNksgPFhuzPKao135W5j2ao8k73aHf0oJ/0C7+CIh8BfwNzKqcbFFqiPLKQ6fHZ99qtr0snwDyxGa05KOlGMr8WeAb9koRs1OikCb/R/o+9HYdKDJ5UjYebtQaGO3zKBOY0JWNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(39850400004)(346002)(396003)(26005)(478600001)(186003)(8936002)(6512007)(54906003)(64756008)(38100700002)(6506007)(110136005)(2616005)(71200400001)(6486002)(966005)(36756003)(66476007)(4326008)(316002)(86362001)(83380400001)(31686004)(8676002)(2906002)(5660300002)(66556008)(122000001)(66946007)(66446008)(76116006)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UEpqTDVTdnJNa1kwYVUxTUFiZkxQR00xamk2Z0FtdmRMcDdFK2ZaTlorRXR6?=
 =?utf-8?B?QU11MVg4WFhxN0NzcXAzU1JEMkV5bC8vUXdQNmpyNTdlcmllTm92K1c0a3kr?=
 =?utf-8?B?akNoM3Vzbk1EUGNaM3lRZHNjejBuamVuekUyNkI2ajZ4STRnY3pVTm9qeDk5?=
 =?utf-8?B?WEFCYUM1M1p3UFFMOHVuOE5LcEk5L2VRUmxmUkNtTGEzL3Z3R1gxMDRVK2g0?=
 =?utf-8?B?NFZsNUR0SXdlR0ZUeUJ5Q1o0cHpUc3paaTR3eEE0UjhBYXVLYlZLRjA0ejNP?=
 =?utf-8?B?MGNPNVVTQkt5WURHN3pXdVBNNUtJZlBhYTN0NHU0NitEWC94QUlKOXJzS0t1?=
 =?utf-8?B?b21kWHYrdWovZWszVUFlQzZUWXdYYVM3Um5CdEFyZXA0OUYwdFQ4M2RGMGpo?=
 =?utf-8?B?YzBaeU9pRWkxQ29qWGJoY3d5SnNKRkpaN04vZmREZ0E0TExpYnd3SWd3akxM?=
 =?utf-8?B?UDNyNkk5SHpDbnB1cW0zcCtqRU5VdmUrbUtSKzA5WTBQOFNkdFU3YVdsR1h6?=
 =?utf-8?B?MVhSMXJpdmpnYk1qZHAwTkNoTTBIUEh4UHF4TSt1Z1JFL3dYdnczQkhlbnB4?=
 =?utf-8?B?c1dLM2tFNUlEME93V2NXMVh6ZW4yakVHVFpFc1hLVzlSczhaK0ltaG1DdUdi?=
 =?utf-8?B?VkYvQzZQUGFRYmNjTjVYdEpGU1l0YWpPRGMvV041RzVoMTdsOG9xNGg1bTZK?=
 =?utf-8?B?eW9VSUpyVGl3SnUxRmp1ME5vWWlVSUxPZW5BbVhxWko2YSswb0xhOHl2dkR5?=
 =?utf-8?B?UU95YU9aZmJDRXNKUGxRZWRjRk53d0V3UnVQckxHVGRXQjZhdmRuNVhCY1RT?=
 =?utf-8?B?QVFoNXZXalJ0bkRWcGpTOGhJd3N0NGZ6eUtqQVd2WlRlNG5wdkNpNTBid05q?=
 =?utf-8?B?UkNqZFZSajZJRExOakdRQm5zQTdsWG9LRkdGVmJjMWFrRkhBY2toS1NRQjh0?=
 =?utf-8?B?VlVldlRiZ0JiMkZxaGNGVE42MVBVYzZtTFF4eWZGR2l6QStUQk1xZzJSVktr?=
 =?utf-8?B?aURkZUN1MlFwTlJieUNXQlJNandvcG41U2dFcDEvSmQzZkRaK2kyWDRWbGY4?=
 =?utf-8?B?SFpUQjJVQ3ZuVklxNkF6b3RJaUlZMHR6dnQzSW1iQmR6RFRoSWU3U0htV2dn?=
 =?utf-8?B?MkVrT1dGVmhpbm13b05vZzNTLzRxZ1pDdU40NVJiR2JIcHc0QVVxYzd3TWhl?=
 =?utf-8?B?WDNoVTZiOHlUUE1xaldNYkljamIwdTFKRzd6VHpoSDRKdDdzanBQQ3RydFYw?=
 =?utf-8?B?Q2w5ZmNtblF3bFVYRExRMWVjTk5NZk5pM2FXUFA1L291RHpxNC82YlQwYVlq?=
 =?utf-8?B?S2NBWGJJVnFaYUFNOGE4d3kxamc5OVhqdnFrbmRTdndiTTdOeGxwbVBlZ0dh?=
 =?utf-8?B?VWhmS25CdzhIZ0xSSXVNUUk0c3BIN1g2Y3pYZ3VlTENTMUpHR0lkVUtSWkor?=
 =?utf-8?B?V0RvWGFseEZSUmd3NHl5VkNjV012NkNKajBCU040d0J6RTdPMllBZ0VNMjJo?=
 =?utf-8?B?dUZZUnMyY2tCTzlwWjBEV3d4bjNiWjVIMlB2QWhtMy9jRkpteXk4Y1J5R3E5?=
 =?utf-8?B?SXdBRW1wSWtFejNSSEErS2x2Um9wSDdBR096a3hna29SU1ZjQlBGL2VyWXpi?=
 =?utf-8?B?VWtnOHZnUmtoWDJoV3Z0c3Bka0tQdWlXRXdqQzRkYVNvNmlmRGpWMzkwMWI2?=
 =?utf-8?B?UjJIQlNDQ0t0bVh0WVpUZ3kwcHhnT2tFWGFFT1h0RXdrNzRPcXh0TGcxbzV0?=
 =?utf-8?Q?4MyTDsA0H4V4jdcLFA=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <74ED9ADC53D2A8419A08C9C5B00033D8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f48d204-db90-486e-ca0d-08d90c190062
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 20:46:16.8816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 96BnqSiMyOuvMw3OzEdNXKDpuNu3rxyse/KTO8pLOnYGrXzRfpIrkJwbCDU/smVi7crhbn11Plv8Z2bMVliRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_134626_384230_E825344F 
X-CRM114-Status: GOOD (  11.66  )
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

Hi,

I've hit a mainline gcc 10.2 (also gcc 9.3) bug which triggers at -O3 
causing wrong codegen.

  Config needs to have initramfs + gzip compressed.

	CONFIG_HAVE_KERNEL_GZIP=y
	CONFIG_KERNEL_GZIP=y
	CONFIG_DECOMPRESS_GZIP=y
	CONFIG_INITRAMFS_COMPRESSION_GZIP=y

  lib/zlib_inflate/inffast.c

     if (dist > 2) {
	unsigned short *sfrom;

	sfrom = (unsigned short *)(from);
	loops = len >> 1;
	do
	    *sout++ = *sfrom++;
              ^^^^^^    ^^^^^^^^
	while (--loops);
	out = (unsigned char *)sout;
	from = (unsigned char *)sfrom;
     }
     ...

The gist of issue is that despite use of unsigned short pointers, gcc is 
generating wider load/stores (8-byte LDD/STD on arcv2 and 16-byte on 
aarch64) causing extraneous bytes to copied into inflated gzip binaries
manifesting later as corrupted fragments in the binaries.

I've opened a gcc bug at:
   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100363

The workaround is to build lib/zlib_inflate/inffast.c with -O2, although 
I reckon not many arches build with -O3 as default. I'll be proposing an 
ARC only patch to build this file with -O2, unless people think it needs 
to be generalized.

Also problem originally seen on 5.6 kernel, although I confirm it shows 
on latest mainline as well.

Unraveling this pretty fun, gory details for those interested at:

 
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/372


Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
