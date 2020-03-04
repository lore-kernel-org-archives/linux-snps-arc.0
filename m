Return-Path: <SRS0=fm4X=4V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F78BC3F2CE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2020 17:58:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C9E24654
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2020 17:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efQMJOZo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GoRtYlVU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HHKo60Wm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49C9E24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeoM0BY2QNSGhkSbGxtMdfpi+ZY0fFxSlVEHekLuV0c=; b=efQMJOZokaN7W9
	JRcH42rUdQ/6XBP2wa0PACc1uSN1sWrwHhizBUEW6LuNExeHaZlU8Km+xdHUUWVEUwUES1AXgXQKK
	NXhUIcJI/c0fOhVsUxwxAdp0+12egFKZZfPgyi7coyo54mCG8DSaD3ltyKUrjCRwXs2oVF0BHtwJY
	959kjAoANvbtOQ8J67f9aH2FzA5QJ97b1cxnos6gsfFxjpQbAldiVIPdxpq1uJvgUkHkkcU0Ha7Zd
	lcdlxElpLoTf8IxK/gas3jq8GJOEu9VD2dxF21NwwVdrqoVAkzYuvUSmqzkrMngmpQ3kkaR6ijs5O
	EZwDfQuA1mm7gd7iSmqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9YHp-0003WI-6N; Wed, 04 Mar 2020 17:58:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9YHl-0003VU-O9
 for linux-snps-arc@lists.infradead.org; Wed, 04 Mar 2020 17:58:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 37EE8C0F5D;
 Wed,  4 Mar 2020 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583344698; bh=//qSpTdmMsKXyA8ral7/gdacuF+bngrYZrDtzideAhE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GoRtYlVUYIycu4OEkypmcRNqhBc1k42K4yZy47g+3QH/DlFsoUB1oq4BpmcJ2ig1v
 ipYSAdHx68M1wnVnBG3qxUaJqRxBILhqaj3bPEyALK1b6RyGz7aHlvjFj1PP94Q+aV
 h+leyiaBRquoEA5p+cO0NPWw4tDgQpJdAs+YYTFWlK9xLzQjRx9ALt8ysxK/VUXVPH
 nYu0q/7E2Fkz7njwxMvjn2T//G2DBWom8rk/BcQ3uLcus9QEVrO8QuQnhwh1NzWYfR
 7b0ZmPuH85o+LXO5bnu6MCFhSRleCS+MkZtn8TxmPJQNLfwMv7TJrbFkUybqNTtbRA
 0/kS3uqSLXVHw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 69AECA0071;
 Wed,  4 Mar 2020 17:58:15 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Mar 2020 09:58:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 4 Mar 2020 09:58:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZQKbieuCEPQRXtSJC5xn9mPAztXP5C3XXEZlkGAVE/tla44vweIItTZgNojV0187959z2YuxY1CoBcg8mlhoQMsq27J6qFd61TsPU0Wr5a+Anmxl75owv7w1RUPtqytbqaQmEDXYEH/W94usfRmX5WmYxj0SB4jideuMOepfBoCJ9XdQgngeQt5Ve8Znnsrq6sRRf6uvFhMX80DuV7ZVqNdLj6GSXfXd84zthwnYOO883C0aJh0sbATXq4KKUz3PoW3aqI7k5NeAqvw09RM8kiuLS3OjM+sBm6GOOvhXnTgeRwpM4U3+GEF1fC+w8kw0AP2aOUjTrelcqCLeGnmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//qSpTdmMsKXyA8ral7/gdacuF+bngrYZrDtzideAhE=;
 b=inHD1QsST4wV9ZfrCpKjYiwUmHBzITzJIDuAQABGujMth1zlG+EFkOUV4qZeDpp4w+d3tsDVicNKEbAnfUj5Q0xZJ/1kRJoHDhVmXKYstiBDxj1Q6wYGl6nytb4GxDxupfdAJEa2cmqmYsZgGjIU+3ZCVrKdroe10Sr8ubnNEpQXihzCHrmdOqokMiH6w7oR/rIKo0jmND6Tubsd1d0qO7+BpAx1YdIUVBIxupWT5w9ZEy1fqsI1QtfG4QY5cWQ6L8X1BSdHJY17WGvEOCxdmlPntrlQ/FnlOWpdOt1uORup1leW5QWCLfwayhHu7fmnkvcJhitq7qu+lOB846rwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//qSpTdmMsKXyA8ral7/gdacuF+bngrYZrDtzideAhE=;
 b=HHKo60Wm1XIMjn5zrQCttNY1+CIPfFiv1ZX4E2RJfn84cw3BSzGvdvPDm8vSaUuQJzHCE4jT2fERB5ojbbe9iScIVs2DId4zl1nbNHutlMmQhM7NFSmKZ78W6Ge/KlyCWlucqRbpY617V+YN7Vvhs7UhjMtK3PYbG3LllTlYOq8=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3222.namprd12.prod.outlook.com (2603:10b6:a03:12c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Wed, 4 Mar
 2020 17:58:04 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 17:58:04 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 4/5] ARC: add support for DSP-enabled userspace
 applications
Thread-Topic: [PATCH 4/5] ARC: add support for DSP-enabled userspace
 applications
Thread-Index: AQHVvOALEgJG1jhHKUKrXAMj7igcXqfflg6AgFkkVq+AAGjCgA==
Date: Wed, 4 Mar 2020 17:58:04 +0000
Message-ID: <8f5af6bd-af31-8f2f-9565-f1f505e6ba11@synopsys.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
 <20191227180347.3579-5-Eugeniy.Paltsev@synopsys.com>
 <a3890ccb-e948-6ad6-c2ea-5b77b9d3a289@synopsys.com>
 <BY5PR12MB4034D0D8EDD029E90642012EDEE50@BY5PR12MB4034.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4034D0D8EDD029E90642012EDEE50@BY5PR12MB4034.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55049197-d510-46b4-3e9f-08d7c0659674
x-ms-traffictypediagnostic: BYAPR12MB3222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB32222FE61AEBA46A3A8109D8B6E50@BYAPR12MB3222.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(81166006)(6512007)(2906002)(86362001)(66946007)(4326008)(66556008)(64756008)(4744005)(31696002)(8676002)(81156014)(478600001)(8936002)(110136005)(66446008)(54906003)(6506007)(76116006)(31686004)(53546011)(5660300002)(66476007)(107886003)(316002)(6486002)(26005)(36756003)(71200400001)(186003)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3222;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lX+soZC1ZjlLA1z16uLePq4QHSHO4tp5D+YXXG9mk9dAc6l8uc1Taukc7OPfrkyP1YqVz2TGxCyfmlbW0Y4oGEpun1mfYLpe0vI5RvP9jGaQAwBkQc0C+jl5tSBTqPoXubaHRXD/AgcbgBG653BIdCXATYfVaAm7ArwB6BZ4qmXvAGIuhUWcH3yUbtwxtR42m+B0XbHeXOnrmWQdWfDQR9EwPnNZ2TfCyGSmA3X3GsnB5+/2IBqVL8CGZWCW9U8zGMaHB9i6Hi83wfHfKdoLk6Wb6HHZyeCYFd8F1tV5ON11X1m3BifRyB7+u/iMZ6tyTuDVze+AVaKHSQ1YS7BhLVOsH0kH4OHABJTMHJtGOPAuT2ndF4VXC4+GgRPgzPBReeVstkdAkhFy6H/Wuar1R0Ar474DrCVM8Y3KvzA7ga+dSqLa4MLbU1R+ZMPn7zDD
x-ms-exchange-antispam-messagedata: pvyU+hik1gAT1jL1BaqE9XPdIoOrR87/OGCk4yBz0wPL+S1EzhId18RsePy9WcFLEAQ7ivgRDG/1P5izuMYmblZ+bFFU+sn9lfxKcjd3LU+C2PSEy0CxmSlF+K3ecOgcc02nNnh2PM36teXIlqeIcA==
Content-ID: <E9379F4BD0EB094CACB682C035E771C9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 55049197-d510-46b4-3e9f-08d7c0659674
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 17:58:04.2776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6MI6dx0k2BFkg4k2+96mTHFU5W8FJR84GyTRFY7jFKHD9e7/9hEpcNmdsDbSQAoGdjRJRxwDHJ97n+r0JeGaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3222
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_095821_918162_8D72CA4D 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/4/20 3:51 AM, Eugeniy Paltsev wrote:
>>> +                "r" (_saveto),                                       \
>>> +                "r" (_readfrom),                                     \
>>> +                "I" (_aux),                                          \
>>> +                "I" (_offt)                                          \
>>> +             :                                                       \
>>
>> AEX with "I" constraint will likely be an 8 byte instructions always. Best to give
>> compiler wiggle room with "Ir"
>
> Could you please explain how "Ir" will work in this case?
> Does this mean that compiler can pass the value either as constant ('I') or
> via register ('r')?

Right. If the same compile-time const is used multiple times, say SR of same value
to a reg, if can decide to hoist the value in a register, if you provide it "r" or
"Ir", leading to shorter overall code.

-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
